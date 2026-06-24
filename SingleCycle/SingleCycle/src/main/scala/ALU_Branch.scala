package SingleCycle
import chisel3._
import chisel3.util._

class ALU_Branch extends Module {
  val io = IO(new Bundle {
    val opcode     = Input(UInt(7.W))
    val funct3     = Input(UInt(3.W))
    val branchCtrl = Output(UInt(4.W))  // one-hot 4-bit output
  })

  // Default
  io.branchCtrl := 0.U

  // One-hot encoded values
  val BEQ  = "b0001".U
  val BNE  = "b0010".U
  val BLT  = "b0011".U
  val BGE  = "b0100".U
  val BLTU = "b0101".U
  val BGEU = "b0110".U

  val isBranch = io.opcode === "b1100011".U

  io.branchCtrl := Mux(isBranch, MuxLookup(io.funct3, 0.U, Seq(
    "b000".U -> BEQ,
    "b001".U -> BNE,
    "b100".U -> BLT,
    "b101".U -> BGE,
    "b110".U -> BLTU,
    "b111".U -> BGEU
  )), 0.U)
}
