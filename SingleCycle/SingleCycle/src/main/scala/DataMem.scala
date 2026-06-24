package SingleCycle
import chisel3._
import chisel3.util._

class DataMem(programFile: String = "INS.hex") extends Module {
  val io = IO(new Bundle {
    val address   = Input(UInt(32.W))
    val writeData = Input(UInt(32.W))
    val memWrite  = Input(Bool())
    val memRead   = Input(Bool())       // enable for read
    val readData  = Output(UInt(32.W))
    val consoleValid = Output(Bool())
    val consoleByte  = Output(UInt(8.W))
    val uartRxLoad   = Input(Bool())
    val uartRxByte   = Input(UInt(8.W))
  })

  // RAM model for the kernel. Low addresses keep the old 4-word test behavior;
  // 0x8000_0000-based addresses map into real RAM.
  val mem = Mem(65536, UInt(32.W))
  private val progRom = VecInit(InsMem.loadHexFileToUInts(programFile))
  val ramBase = "h80000000".U(32.W)
  val progIndex = io.address(31, 2)
  val inProgRom = progIndex < progRom.length.U
  val consoleAddr = "h10000000".U(32.W)
  val inputAddr   = "h10000004".U(32.W)
  val ramIndex = (io.address - ramBase)(17, 2)
  val tinyIndex = io.address(1, 0)
  val wordIndex = Mux(io.address >= ramBase, ramIndex, tinyIndex)
  val isConsole = io.address === consoleAddr
  val isInput   = io.address === inputAddr
  val rxHold    = RegInit(0.U(8.W))
  val rxValid   = RegInit(false.B)
  when(io.uartRxLoad) {
    rxHold  := io.uartRxByte
    rxValid := true.B
  }

  // ----------------------------
  // DEFAULT OUTPUT (VERY IMPORTANT)
  // ----------------------------
  io.readData := 0.U    // prevents FIRRTL "uninitialized" error
  io.consoleValid := RegNext(io.memWrite && isConsole, false.B)
  io.consoleByte  := RegNext(io.writeData(7, 0), 0.U)

  // ----------------------------
  // WRITE
  // ----------------------------
  when(io.memWrite && !isConsole) {
    mem.write(wordIndex, io.writeData)
  }

  // ----------------------------
  // READ (async)
  // ----------------------------
  when(io.memRead) {
    when(isInput) {
      io.readData := Mux(rxValid, rxHold, 0.U)
      when(rxValid) { rxValid := false.B }
    }.elsewhen(io.address >= ramBase) {
      io.readData := mem.read(ramIndex)
    }.elsewhen(inProgRom) {
      io.readData := progRom(progIndex)
    }.otherwise {
      io.readData := mem.read(tinyIndex)
    }
  }
}
