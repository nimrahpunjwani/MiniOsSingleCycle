package SingleCycle

import chisel3._
import chiseltest._
import org.scalatest._

class RunKernelTest extends FreeSpec with ChiselScalatestTester {
  private def runMiniOS(script: String, maxCycles: Int, firstInject: Int, injectGap: Int): Unit = {
    val kernelPath = "../../kernel.hex"

    test(new Main(kernelPath)) { c =>
      c.clock.setTimeout(0) // kernel polls UART; long stretches without pokes are normal
      c.io.uartRxLoad.poke(false.B)
      c.io.uartRxByte.poke(0.U)

      var cycles = 0
      var scriptPos = 0
      var nextInject = firstInject
      var prevConsoleValid = false
      var sawPrompt = false
      var typingStarted = false

      println("\n=== MiniOS output (simulated UART) ===")

      while (cycles < maxCycles) {
        if (!typingStarted && sawPrompt) {
          typingStarted = true
          nextInject = cycles + 2000
        }

        if (typingStarted && cycles == nextInject && scriptPos < script.length) {
          c.io.uartRxByte.poke(script(scriptPos).toInt.U)
          c.io.uartRxLoad.poke(true.B)
          scriptPos += 1
          nextInject += injectGap
        } else {
          c.io.uartRxLoad.poke(false.B)
        }

        c.clock.step(1)
        cycles += 1

        val valid = c.io.consoleValid.peek().litToBoolean
        if (valid && !prevConsoleValid) {
          val b = c.io.consoleByte.peek().litValue.toInt
          if (b == '>'.toInt) sawPrompt = true
          if (b != 0) print(b.toChar)
        }
        prevConsoleValid = valid
      }

      println("\n=== end (ran %d cycles, typed %d/%d chars) ==="
        .format(cycles, scriptPos, script.length))
    }
  }

  "Run kernel and capture console" in {
    val script = sys.env.getOrElse("MINIOS_CMD", "help\n")
    val maxCycles =
      if (script.contains("run")) 2500000
      else if (script.contains("exit")) 200000
      else 400000
    val firstInject = if (script.contains("run")) 180000 else 0
    runMiniOS(script, maxCycles, firstInject, injectGap = 4000)
  }
}
