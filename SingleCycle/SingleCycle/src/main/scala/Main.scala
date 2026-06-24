package SingleCycle
import chisel3._
import chisel3.util._

class Main(programFile: String = "INS.hex") extends Module {
  val io = IO(new Bundle {
    val pcOut    = Output(UInt(32.W))
    val instOut  = Output(UInt(32.W))
    val dmemOut  = Output(UInt(32.W))
    val consoleValid = Output(Bool())
    val consoleByte  = Output(UInt(8.W))
    val uartRxLoad   = Input(Bool())
    val uartRxByte   = Input(UInt(8.W))
  })

  // ---------------- PC ----------------
  val pc = RegInit(0.U(32.W))
  val mepc = RegInit(0.U(32.W))
  val pcPlus4 = pc + 4.U
  io.pcOut := pc
  val trapVector = "h00001000".U(32.W)

  // ------------- Instruction Memory ----------------
  val imem = Module(new InsMem(programFile))       // reads instructions from INS.hex or kernel hex
  imem.io.pc := pc
  val inst = imem.io.inst
  io.instOut := inst                     // expose to testbench

  // ---------------- Decode ----------------
  val dec  = Module(new InsDec)
  dec.io.inst := inst

  val ctrl = Module(new ContDec)
  ctrl.io.opcode := dec.io.opcode

  val tdec = Module(new TypeDec)
  tdec.io.opcode := dec.io.opcode

  val imm = Module(new ImmGen)
  imm.io.inst := inst
  imm.io.sel := tdec.io.immSel

  // ---------------- Register File ----------------
  val rf = Module(new register)
  rf.io.clr := false.B
  rf.io.readReg1 := dec.io.rs1
  rf.io.readReg2 := dec.io.rs2
  rf.io.writeReg := dec.io.rd
  rf.io.regWrite := ctrl.io.RegWrite

  // ---------------- ALU (Merged ALU + ALUControl) ----------------
  val alu = Module(new ALU)
  alu.io.inst := inst
  val isAuipc = dec.io.opcode === "b0010111".U
  val isLui   = dec.io.opcode === "b0110111".U
  alu.io.a    := Mux(isAuipc, pc, rf.io.readData1)
  alu.io.b    := Mux(ctrl.io.ALUSrc, imm.io.imm, rf.io.readData2)

  // FIX THAT REMOVES THE ERROR 
  // CPU MODE uses decode → 31.U means "use inst decoding"
  alu.io.aluCtrl := 31.U
  // END FIX 

  val aluOut  = alu.io.out

  // ---------------- Branch Unit ----------------
  val br = Module(new ALU_Branch)
  br.io.opcode := dec.io.opcode
  br.io.funct3 := dec.io.funct3

  val branchTaken = MuxLookup(br.io.branchCtrl, false.B, Seq(
    1.U -> (aluOut === 0.U),                                     // BEQ
    2.U -> (aluOut =/= 0.U),                                     // BNE
    3.U -> (rf.io.readData1.asSInt <  rf.io.readData2.asSInt),   // BLT
    4.U -> (rf.io.readData1.asSInt >= rf.io.readData2.asSInt),   // BGE
    5.U -> (rf.io.readData1 <  rf.io.readData2),                 // BLTU
    6.U -> (rf.io.readData1 >= rf.io.readData2)                  // BGEU
  ))

  val branchTarget = pc + imm.io.imm
  val jalTarget    = pc + imm.io.imm
  val jalrTarget   = (rf.io.readData1 + imm.io.imm) & (~1.U(32.W))   // JALR must clear LSB

  // ---------------- Data Memory ----------------
  val dmem = Module(new DataMem(programFile))
  dmem.io.address   := aluOut
  dmem.io.writeData := rf.io.readData2
  dmem.io.memWrite  := ctrl.io.MemWrite
  dmem.io.memRead   := ctrl.io.MemRead
  dmem.io.uartRxLoad := io.uartRxLoad
  dmem.io.uartRxByte := io.uartRxByte

  val loadOff = aluOut(1, 0)
  val loadByte = (dmem.io.readData >> (loadOff << 3))(7, 0)
  val memReadData = MuxLookup(dec.io.funct3, dmem.io.readData, Seq(
    "b000".U -> Cat(Fill(24, loadByte(7)), loadByte),                 // LB
    "b001".U -> Cat(Fill(16, (dmem.io.readData >> (loadOff << 3))(15, 15)), (dmem.io.readData >> (loadOff << 3))(15, 0)), // LH
    "b010".U -> dmem.io.readData,                                      // LW
    "b100".U -> Cat(0.U(24.W), loadByte),                              // LBU
    "b101".U -> Cat(0.U(16.W), (dmem.io.readData >> (loadOff << 3))(15, 0)) // LHU
  ))

  io.dmemOut := memReadData
  io.consoleValid := dmem.io.consoleValid
  io.consoleByte  := dmem.io.consoleByte

  // ---------------- Writeback ----------------
  rf.io.writeData := MuxCase(Mux(ctrl.io.MemToReg, memReadData, aluOut), Seq(
    ctrl.io.Jump -> pcPlus4,
    isAuipc -> aluOut,
    isLui -> imm.io.imm
  ))

  // ---------------- Traps / Returns ----------------
  val isSystem = dec.io.opcode === "b1110011".U
  val isEcall  = isSystem && inst(31, 20) === 0.U
  val isMret   = isSystem && inst(31, 20) === "h302".U

  when(isEcall) {
    mepc := pcPlus4
  }

  val nextPC = MuxCase(pcPlus4, Seq(
    isMret -> mepc,
    isEcall -> trapVector,
    (ctrl.io.Branch && branchTaken) -> branchTarget,
    (dec.io.opcode === "b1100111".U) -> jalrTarget,
    (dec.io.opcode === "b1101111".U) -> jalTarget
  ))

  pc := nextPC
}
