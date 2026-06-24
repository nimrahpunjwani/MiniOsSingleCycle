package SingleCycle
import chisel3._
import chiseltest._
import org.scalatest._

class DataMemTest extends FreeSpec with ChiselScalatestTester {
  "Data Memory Test" in {
    test(new DataMem) { c =>
      c.io.uartRxLoad.poke(false.B)
      c.io.uartRxByte.poke(0.U)
      val ram0 = "h80000000".U

      // ---------------------------
      // WRITE 42 @ RAM word 0
      // ---------------------------
      c.io.address.poke(ram0)
      c.io.writeData.poke(42.U)
      c.io.memWrite.poke(true.B)
      c.io.memRead.poke(false.B)
      c.clock.step(1)

      // ---------------------------
      // READ 42 @ address 0
      // ---------------------------
      c.io.memWrite.poke(false.B)
      c.io.memRead.poke(true.B)
      c.io.address.poke(ram0)
      c.clock.step(1)   // wait for sync read
      c.io.readData.expect(42.U)

      // ---------------------------
      // WRITE 99 @ RAM word 1
      // ---------------------------
      c.io.address.poke(ram0 + 4.U)
      c.io.writeData.poke(99.U)
      c.io.memWrite.poke(true.B)
      c.io.memRead.poke(false.B)
      c.clock.step(1)

      // ---------------------------
      // READ 99 @ address 1
      // ---------------------------
      c.io.memWrite.poke(false.B)
      c.io.memRead.poke(true.B)
      c.io.address.poke(ram0 + 4.U)
      c.clock.step(1)
      c.io.readData.expect(99.U)

      // ---------------------------
      // WRITE 1234 @ RAM word 2
      // ---------------------------
      c.io.address.poke(ram0 + 8.U)
      c.io.writeData.poke(1234.U)
      c.io.memWrite.poke(true.B)
      c.io.memRead.poke(false.B)
      c.clock.step(1)

      // ---------------------------
      // READ 1234 @ address 2
      // ---------------------------
      c.io.memWrite.poke(false.B)
      c.io.memRead.poke(true.B)
      c.io.address.poke(ram0 + 8.U)
      c.clock.step(1)
      c.io.readData.expect(1234.U)

      // ---------------------------
      // READ from UNWRITTEN RAM word 3 → default 0
      // ---------------------------
      c.io.memWrite.poke(false.B)
      c.io.memRead.poke(true.B)
      c.io.address.poke(ram0 + 12.U)
      c.clock.step(1)
      c.io.readData.expect(0.U)

      // ---------------------------
      // MMIO console write @ 0x10000000
      // ---------------------------
      c.io.memRead.poke(false.B)
      c.io.address.poke("h10000000".U)
      c.io.writeData.poke("h00000048".U) // 'H'
      c.io.memWrite.poke(true.B)
      c.clock.step(1)
      c.io.memWrite.poke(false.B)
      c.clock.step(1)
      c.io.consoleValid.expect(true.B)
      c.io.consoleByte.expect("h48".U)
    }
  }
}
