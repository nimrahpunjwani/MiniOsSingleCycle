package SingleCycle

import chisel3._
import chiseltest._
import org.scalatest._

class ALU_BranchTest extends FreeSpec with ChiselScalatestTester {
  "ALU Branch Test" in {
    test(new ALU_Branch) { c =>

      def check(op: String, f3: String, expected: Int) = {
        c.io.opcode.poke(op.U)
        c.io.funct3.poke(f3.U)
        c.clock.step(1)
        c.io.branchCtrl.expect(expected.U)
      }

      // 1100011 = branch opcode(atleast someone understands them)
      check("b1100011", "b000", 1)  // BEQ
      check("b1100011", "b001", 2)  // BNE
      check("b1100011", "b100", 3)  // BLT
      check("b1100011", "b101", 4)  // BGE
      check("b1100011", "b110", 5)  // BLTU
      check("b1100011", "b111", 6)  // BGEU
    }
  }
}
