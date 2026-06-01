package SingleCycle
import chisel3._
import chisel3.util._

class ContDec extends Module {
  val io = IO(new Bundle {
    val opcode  = Input(UInt(7.W))

    val RegWrite = Output(Bool())
    val ALUSrc   = Output(Bool())
    val ALUOp    = Output(UInt(2.W)) // e.g. 00=ADD, 01=SUB/BRANCH, 10=R-type
    val MemRead  = Output(Bool())
    val MemWrite = Output(Bool())
    val MemToReg = Output(Bool())
    val Branch   = Output(Bool())
    val Jump     = Output(Bool())
  })

  // Default values (for safety)
  io.RegWrite := false.B
  io.ALUSrc   := false.B
  io.ALUOp    := "b00".U
  io.MemRead  := false.B
  io.MemWrite := false.B
  io.MemToReg := false.B
  io.Branch   := false.B
  io.Jump     := false.B

  switch(io.opcode) {
    is("b0110011".U) { // R-type
      io.RegWrite := true.B
      io.ALUOp    := "b10".U
    }
    is("b0010011".U) { // I-type ALU (ADDI)
      io.RegWrite := true.B
      io.ALUSrc   := true.B
      io.ALUOp    := "b00".U
    }
    is("b0000011".U) { // LW
      io.RegWrite := true.B
      io.ALUSrc   := true.B
      io.MemRead  := true.B
      io.MemToReg := true.B
      io.ALUOp    := "b00".U
    }
    is("b0100011".U) { // SW
      io.ALUSrc   := true.B
      io.MemWrite := true.B
      io.ALUOp    := "b00".U
    }
    is("b1100011".U) { // BEQ
      io.Branch   := true.B
      io.ALUOp    := "b01".U
    }
    is("b1100111".U) { // JALR
      io.RegWrite := true.B
      io.ALUSrc   := true.B
      io.Jump     := true.B
      io.ALUOp    := "b00".U
    }
    is("b1101111".U) { // JAL
      io.RegWrite := true.B
      io.Jump     := true.B
    }
    is("b0110111".U) { // LUI
      io.RegWrite := true.B
      io.ALUSrc   := true.B
      io.ALUOp    := "b00".U
    }
    is("b0010111".U) { // AUIPC
      io.RegWrite := true.B
      io.ALUSrc   := true.B
      io.ALUOp    := "b00".U
    }
    is("b1110011".U) { // SYSTEM (ecall / mret handled in Main)
      io.ALUOp    := "b00".U
    }
  }
}
