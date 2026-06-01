package SingleCycle
import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    val inst    = Input(UInt(32.W))
    val a       = Input(UInt(32.W))
    val b       = Input(UInt(32.W))
    val aluCtrl = Input(UInt(5.W))   // <-- added
    val out     = Output(UInt(32.W))
  })

  //------------------------------------------------
  // Decode from instruction (when aluCtrl = "invalid")
  //------------------------------------------------

  val opcode = io.inst(6,0)
  val funct3 = io.inst(14,12)
  val funct7 = io.inst(31,25)

  val decodedCtrl = Wire(UInt(5.W))
  decodedCtrl := 0.U

  // R-type
  val isADD  = opcode === "b0110011".U && funct3 === 0.U && funct7 === "b0000000".U
  val isSUB  = opcode === "b0110011".U && funct3 === 0.U && funct7 === "b0100000".U
  val isAND  = opcode === "b0110011".U && funct3 === 7.U
  val isOR   = opcode === "b0110011".U && funct3 === 6.U
  val isXOR  = opcode === "b0110011".U && funct3 === 4.U
  val isSLL  = opcode === "b0110011".U && funct3 === 1.U
  val isSRL  = opcode === "b0110011".U && funct3 === 5.U && funct7 === 0.U
  val isSRA  = opcode === "b0110011".U && funct3 === 5.U && funct7 === "b0100000".U
  val isSLT  = opcode === "b0110011".U && funct3 === 2.U
  val isSLTU = opcode === "b0110011".U && funct3 === 3.U

  // I-type
  val isADDI  = opcode === "b0010011".U && funct3 === 0.U
  val isSLTI  = opcode === "b0010011".U && funct3 === 2.U
  val isSLTIU = opcode === "b0010011".U && funct3 === 3.U
  val isXORI  = opcode === "b0010011".U && funct3 === 4.U
  val isORI   = opcode === "b0010011".U && funct3 === 6.U
  val isANDI  = opcode === "b0010011".U && funct3 === 7.U
  val isSLLI  = opcode === "b0010011".U && funct3 === 1.U
  val isSRLI  = opcode === "b0010011".U && funct3 === 5.U && funct7 === 0.U
  val isSRAI  = opcode === "b0010011".U && funct3 === 5.U && funct7 === "b0100000".U

  val isADDpath =
    opcode === "b0000011".U || // LOAD
    opcode === "b0100011".U || // STORE
    opcode === "b1100111".U || // JALR
    opcode === "b0010111".U    // AUIPC

  val isSUBpath = opcode === "b1100011".U // branch

  // Decode
  decodedCtrl := Mux1H(Seq(
    (isADD  || isADDI  || isADDpath) -> "b00000".U,
    (isSUB  || isSUBpath)            -> "b00001".U,
    (isAND  || isANDI)               -> "b00010".U,
    (isOR   || isORI)                -> "b00011".U,
    (isXOR  || isXORI)               -> "b00100".U,
    (isSLL  || isSLLI)               -> "b00101".U,
    (isSRL  || isSRLI)               -> "b00110".U,
    (isSRA  || isSRAI)               -> "b00111".U,
    (isSLT  || isSLTI)               -> "b01000".U,
    (isSLTU || isSLTIU)              -> "b01001".U
  ))

  //------------------------------------------------
  // FINAL ALU CONTROL
  //------------------------------------------------

  val finalCtrl = Mux(io.aluCtrl === 31.U, decodedCtrl, io.aluCtrl)

  //------------------------------------------------
  // ALU operation
  //------------------------------------------------

  val shamt = io.b(4,0)

  io.out := MuxLookup(finalCtrl, 0.U, Seq(
    0.U -> (io.a + io.b),
    1.U -> (io.a - io.b),
    2.U -> (io.a & io.b),
    3.U -> (io.a | io.b),
    4.U -> (io.a ^ io.b),
    5.U -> (io.a << shamt),
    6.U -> (io.a >> shamt),
    7.U -> (io.a.asSInt >> shamt).asUInt,
    8.U -> (io.a.asSInt < io.b.asSInt).asUInt,
    9.U -> (io.a < io.b).asUInt
  ))
}
