package SingleCycle
import chisel3._
import chisel3.util._

class DataMem extends Module {
  val io = IO(new Bundle {
    val address   = Input(UInt(32.W))
    val writeData = Input(UInt(32.W))
    val memWrite  = Input(Bool())
    val memRead   = Input(Bool())       // enable for read
    val readData  = Output(UInt(32.W))
    val consoleValid = Output(Bool())
    val consoleByte  = Output(UInt(8.W))
  })

  // RAM model for the kernel. Low addresses keep the old 4-word test behavior;
  // 0x8000_0000-based addresses map into real RAM.
  val mem = Mem(65536, UInt(32.W))
  val ramBase = "h80000000".U(32.W)
  val consoleAddr = "h10000000".U(32.W)
  val ramIndex = (io.address - ramBase)(17, 2)
  val tinyIndex = io.address(1, 0)
  val wordIndex = Mux(io.address >= ramBase, ramIndex, tinyIndex)
  val isConsole = io.address === consoleAddr

  // ----------------------------
  // DEFAULT OUTPUT (VERY IMPORTANT)
  // ----------------------------
  io.readData := 0.U    // prevents FIRRTL "uninitialized" error
  io.consoleValid := false.B
  io.consoleByte := 0.U

  // ----------------------------
  // WRITE
  // ----------------------------
  when(io.memWrite) {
    when(isConsole) {
      io.consoleValid := true.B
      io.consoleByte := io.writeData(7, 0)
      // Print the byte to the simulator stdout for visibility during tests
      printf("%c", io.writeData(7,0))
    }.otherwise {
      mem.write(wordIndex, io.writeData)
    }
  }

  // ----------------------------
  // READ (async)
  // ----------------------------
  when(io.memRead && !isConsole) {
    io.readData := mem.read(wordIndex)
  }
}
