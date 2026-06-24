package SingleCycle
import chisel3._
import chisel3.util._

class ImmGen extends Module {
  val io = IO(new Bundle {
    val inst = Input(UInt(32.W))
    val sel  = Input(UInt(3.W))  // 000 I, 001 S, 010 B, 011 U, 100 J
    val imm  = Output(UInt(32.W))
  })

  val inst = io.inst

  // ------------ I TYPE ------------
  val immI = Cat(Fill(20, inst(31)), inst(31,20))

  // ------------ S TYPE ------------
  val immS = Cat(Fill(20, inst(31)), inst(31,25), inst(11,7))

  // ------------ B TYPE ------------
  val immB = Cat(
    Fill(19, inst(31)),          // sign
    inst(31),                    // imm[12]
    inst(7),                     // imm[11]
    inst(30,25),                 // imm[10:5]
    inst(11,8),                  // imm[4:1]
    0.U(1.W)                     // imm[0]
  )

  // ------------ U TYPE ------------
  val immU = Cat(inst(31,12), Fill(12, 0.U))

  // ------------ J TYPE (FIXED!) ------------
  // imm[20|10:1|11|19:12|0]
  val immJ = Cat(
    Fill(11, inst(31)),          // sign
    inst(31),                    // imm[20]
    inst(19,12),                 // imm[19:12]
    inst(20),                    // imm[11]
    inst(30,21),                 // imm[10:1]
    0.U(1.W)                     // imm[0]
  )

  io.imm := MuxLookup(io.sel, 0.U, Seq(
    "b000".U -> immI,
    "b001".U -> immS,
    "b010".U -> immB,
    "b011".U -> immU,
    "b100".U -> immJ
  ))
}
