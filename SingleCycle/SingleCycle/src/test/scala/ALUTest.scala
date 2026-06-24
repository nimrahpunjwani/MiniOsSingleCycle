package SingleCycle
import chisel3._
import chiseltest._
import org.scalatest._

class ALUTest extends FreeSpec with ChiselScalatestTester {
  "ALU should execute all ALU operations correctly" in {
    test(new ALU) { c =>

      def runOp(a: Int, b: Int, op: String): Unit = {
        val ctrl = op match {
          case "ADD"  => 0.U
          case "SUB"  => 1.U
          case "AND"  => 2.U
          case "OR"   => 3.U
          case "XOR"  => 4.U
          case "SLL"  => 5.U
          case "SRL"  => 6.U
          case "SRA"  => 7.U
          case "SLT"  => 8.U
          case "SLTU" => 9.U
        }

        // Expected software result
        val expected = op match {
          case "ADD"  => a + b
          case "SUB"  => a - b
          case "AND"  => a & b
          case "OR"   => a | b
          case "XOR"  => a ^ b
          case "SLL"  => a << (b & 0x1F)
          case "SRL"  => (a >>> (b & 0x1F))
          case "SRA"  => (a >> (b & 0x1F))
          case "SLT"  => if (a < b) 1 else 0
          case "SLTU" =>
            val ua = a & 0xFFFFFFFFL
            val ub = b & 0xFFFFFFFFL
            if (ua < ub) 1 else 0
        }

        // poke ALU inputs
        c.io.a.poke(a.U)
        c.io.b.poke(b.U)

        // testIN TEST MODE → force ALU control directly-okay pookie
        c.io.aluCtrl.poke(ctrl)

        // inst ignored in test mode
        c.io.inst.poke("hFFFFFFFF".U)

        c.clock.step(1)

        c.io.out.expect(expected.U, s"Failed on operation $op")
      }

      // --------------------------
      // RUN ALL ALU OPERATIONS
      // --------------------------
      runOp(5, 7, "ADD")
      runOp(12, 7, "SUB")
      runOp(6, 3, "AND")
      runOp(6, 3, "OR")
      runOp(6, 3, "XOR")
      runOp(3, 1, "SLL")
      runOp(6, 1, "SRL")
      runOp(6, 1, "SRA")
      runOp(3, 5, "SLT")
      runOp(3, 5, "SLTU")
    }
  }
}
