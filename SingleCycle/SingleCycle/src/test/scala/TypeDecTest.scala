package SingleCycle
import chisel3._
import chiseltest._
import org.scalatest._

class TypeDecTest extends FreeSpec with ChiselScalatestTester {
  "Type Decoder Test" in {
    test(new TypeDec) { c =>

      // R-Type-rhode kindaaa
      c.io.opcode.poke("b0110011".U)
      c.clock.step(1)
      c.io.rType.expect(true.B)
      c.io.immSel.expect("b000".U)

      // I-Type (ADDI)-impulsiveee
      c.io.opcode.poke("b0010011".U)
      c.clock.step(1)
      c.io.iType.expect(true.B)
      c.io.immSel.expect("b000".U)

      // Load (I-Type)-lost
      c.io.opcode.poke("b0000011".U)
      c.clock.step(1)
      c.io.iType.expect(true.B)
      c.io.immSel.expect("b000".U)

      // Store (S-Type)-sassy
      c.io.opcode.poke("b0100011".U)
      c.clock.step(1)
      c.io.sType.expect(true.B)
      c.io.immSel.expect("b001".U)

      // Branch (B-Type)-barbieee
      c.io.opcode.poke("b1100011".U)
      c.clock.step(1)
      c.io.bType.expect(true.B)
      c.io.immSel.expect("b010".U)

      // AUIPC
      c.io.opcode.poke("b0010111".U)
      c.clock.step(1)
      c.io.auipc.expect(true.B)
      c.io.immSel.expect("b011".U)

      // LUI
      c.io.opcode.poke("b0110111".U)
      c.clock.step(1)
      c.io.lui.expect(true.B)
      c.io.immSel.expect("b011".U)

      // JAL (J-Type)-jail that im stuck innn
      c.io.opcode.poke("b1101111".U)
      c.clock.step(1)
      c.io.jType.expect(true.B)
      c.io.immSel.expect("b100".U)
    }
  }
}
