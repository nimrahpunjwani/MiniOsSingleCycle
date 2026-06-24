package SingleCycle

import chisel3._
import chiseltest._
import org.scalatest._

class registertest extends FreeSpec with ChiselScalatestTester {
  "Register File Test" in {
    test(new register) { c =>
      c.io.clr.poke(true.B)
      c.clock.step(1)
      c.io.clr.poke(false.B)

      c.io.regWrite.poke(true.B)
      c.io.writeReg.poke(5.U)
      c.io.writeData.poke(42.U)
      c.clock.step(1)

      c.io.readReg1.poke(5.U)
      c.io.readReg2.poke(0.U)
      c.io.regWrite.poke(false.B)
      c.clock.step(1)

      c.io.readData1.expect(42.U)
      c.io.readData2.expect(0.U)
    }
  }
}
