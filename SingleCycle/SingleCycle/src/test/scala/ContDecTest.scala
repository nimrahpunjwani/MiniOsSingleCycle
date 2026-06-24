package SingleCycle
import chisel3._
import chiseltest._
import org.scalatest._

class ContDecTest extends FreeSpec with ChiselScalatestTester {
  "Control Decoder Test" in {
    test(new ContDec) { c =>

      // R-Type
      c.io.opcode.poke("b0110011".U)
      c.clock.step(1)
      c.io.RegWrite.expect(true.B)
      c.io.ALUOp.expect("b10".U)

      // I-Type (ADDI)
      c.io.opcode.poke("b0010011".U)
      c.clock.step(1)
      c.io.ALUSrc.expect(true.B)

      // Load (LW)
      c.io.opcode.poke("b0000011".U)
      c.clock.step(1)
      c.io.MemRead.expect(true.B)
      c.io.MemToReg.expect(true.B)

      // Store (SW)
      c.io.opcode.poke("b0100011".U)
      c.clock.step(1)
      c.io.MemWrite.expect(true.B)

      // Branch (BEQ)
      c.io.opcode.poke("b1100011".U)
      c.clock.step(1)
      c.io.Branch.expect(true.B)

      // Jump (JAL)
      c.io.opcode.poke("b1101111".U)
      c.clock.step(1)
      c.io.Jump.expect(true.B)
    }
  }
}
