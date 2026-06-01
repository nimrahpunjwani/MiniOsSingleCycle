package SingleCycle
import chisel3._
import chisel3.util._

class TypeDec extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))

    val rType = Output(Bool())
    val iType = Output(Bool())
    val sType = Output(Bool())
    val bType = Output(Bool())
    val auipc = Output(Bool())
    val jType = Output(Bool())
    val lui   = Output(Bool())

    val T0 = Output(Bool())
    val T1 = Output(Bool())
    val T2 = Output(Bool())

    val immSel = Output(UInt(3.W))
  })

  // default
  io.rType := false.B
  io.iType := false.B
  io.sType := false.B
  io.bType := false.B
  io.auipc := false.B
  io.jType := false.B
  io.lui   := false.B

  io.immSel := "b000".U

  switch(io.opcode) {

    is("b0110011".U) {            // R-Type
      io.rType := true.B
      io.immSel := "b000".U
    }

    is("b0010011".U) {            // I-Type (ADDI)
      io.iType := true.B
      io.immSel := "b001".U
    }

    is("b0000011".U) {            // LOAD (I-Type)
      io.iType := true.B
      io.immSel := "b001".U
    }

    is("b1100111".U) {            // JALR (I-Type)
      io.iType := true.B
      io.immSel := "b001".U
    }

    is("b0100011".U) {            // S-Type
      io.sType := true.B
      io.immSel := "b010".U
    }

    is("b1100011".U) {            // B-Type
      io.bType := true.B
      io.immSel := "b011".U
    }

    is("b0110111".U) {            // LUI (U-Type)
      io.lui := true.B
      io.immSel := "b100".U
    }

    is("b0010111".U) {            // AUIPC (U-Type)
      io.auipc := true.B
      io.immSel := "b100".U
    }

    is("b1101111".U) {            // JAL (J-Type)
      io.jType := true.B
      io.immSel := "b101".U
    }
  }

  io.T0 := io.immSel(0)
  io.T1 := io.immSel(1)
  io.T2 := io.immSel(2)
}
