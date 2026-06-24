package SingleCycle

import chisel3._
import chiseltest._
import org.scalatest._

class ImmGenTest extends FreeSpec with ChiselScalatestTester {
  "Immediate Generator Test" in {
    test(new ImmGen) { c =>

      // -------- I-Type Test --------
      // 0x00F50793 -> ADDI x15, x10, 15
      c.io.inst.poke("b00000000111101010000011110010011".U)
      c.io.sel.poke("b000".U)
      c.clock.step(1)
      c.io.imm.expect("b00000000000000000000000000001111".U) // 15

      // -------- S-Type Test --------
      // 0x00A5A023 -> SW x10, 0(x11)
      c.io.inst.poke("b00000000101001011010000000100011".U) 
      c.io.sel.poke("b001".U)
      c.clock.step(1)
      c.io.imm.expect("b00000000000000000000000000000000".U) // 0

      // -------- B-Type Test --------
      // 0xFEA59AE3 -> BEQ x11, x10, -12
      c.io.inst.poke("b11111110101001011001101011100011".U)
      c.io.sel.poke("b010".U)
      c.clock.step(1)
      c.io.imm.expect("b11111111111111111111111111110100".U) // -12

      // -------- U-Type Test --------
      // 0x00004537 -> LUI x10, 0x45
      c.io.inst.poke("b00000000000001000101000000110111".U) // ✅ Correct LUI binary
      c.io.sel.poke("b011".U)
      c.clock.step(1)
      c.io.imm.expect("b00000000000001000101000000000000".U) // 0x45000

      // -------- J-Type Test --------
      // 0x004000EF -> JAL x1, 4
      c.io.inst.poke("b00000000010000000000000011101111".U)
      c.io.sel.poke("b100".U)
      c.clock.step(1)
      c.io.imm.expect("b00000000000000000000000000000100".U) // 4

    }
  }
}
