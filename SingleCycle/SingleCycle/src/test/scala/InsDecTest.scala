package SingleCycle
import chisel3._
import chiseltest._
import org.scalatest._

class InsDecTest extends FreeSpec with ChiselScalatestTester {
  "Instruction Decoder Test" in {
    test(new InsDec) { c =>

     
      c.io.inst.poke("b00000000010101010000010100110011".U)
      c.clock.step(1)

      c.io.opcode.expect("b0110011".U)
      c.io.rd.expect("b01010".U)    
      c.io.funct3.expect("b000".U)
      c.io.rs1.expect("b01010".U)   
      c.io.rs2.expect("b00101".U)    
      c.io.funct7.expect("b0000000".U)
    }
  }
}
