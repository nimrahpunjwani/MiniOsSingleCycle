package SingleCycle

import chisel3._
import chisel3.util._

class register extends Module {   
  val io = IO(new Bundle {
    val clr       = Input(Bool())
    val readReg1  = Input(UInt(5.W))
    val readReg2  = Input(UInt(5.W))
    val writeReg  = Input(UInt(5.W))
    val writeData = Input(UInt(32.W))
    val regWrite  = Input(Bool())
    val readData1 = Output(UInt(32.W))
    val readData2 = Output(UInt(32.W))
  })

  val regs = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

  // ★ Make sure registers appear in VCD
  dontTouch(regs)
  dontTouch(io)

  regs(0) := 0.U

  when(io.clr) {
    for (i <- 1 until 32) {
      regs(i) := 0.U
    }
  }.elsewhen(io.regWrite && io.writeReg =/= 0.U) {
    regs(io.writeReg) := io.writeData
  }

  io.readData1 := regs(io.readReg1)
  io.readData2 := regs(io.readReg2)
}
