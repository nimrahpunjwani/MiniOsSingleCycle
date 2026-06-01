package SingleCycle

import chisel3._
import chiseltest._
import org.scalatest._

class RunKernelTest extends FreeSpec with ChiselScalatestTester {
  "Run kernel and capture console" in {
    // Path from this project dir (SingleCycle/SingleCycle) to kernel.hex at project root
    val kernelPath = "../../kernel.hex"

    test(new Main(kernelPath)) { c =>
      var cycles = 0
      val maxCycles = 300
      while(cycles < maxCycles) {
        // DataMem now prints console bytes via printf in simulation
        c.clock.step(1)
        cycles += 1
      }
    }
  }
}
