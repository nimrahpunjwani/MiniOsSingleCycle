package SingleCycle

import chisel3._
import chisel3.util._
import scala.io.Source
import java.io.FileInputStream

object InsMem {
  /** Helper: read lines from resources or absolute path and return Seq[UInt(32.W)].
    * Supports hex (8 chars) or binary (32 chars) formats.
    * Ignores comments after #.
    * Removes "0x" prefix, underscores, extra spaces, and handles empty files.
    */
  def loadHexFileToUInts(filePath: String): Seq[UInt] = {
    try {
      // Load as resource first, fallback to absolute path
      val stream = Option(getClass.getClassLoader.getResourceAsStream(filePath))
        .getOrElse(new FileInputStream(filePath))

      val lines = Source.fromInputStream(stream).getLines()
        .map(_.split("#").head.trim)      // Remove comments
        .filter(_.nonEmpty)

      if (lines.isEmpty) Seq(0.U(32.W))
      else {
        lines.map { s =>
          val clean = s.replaceAll("0x","").replaceAll("_","").trim.toUpperCase
          val parsed = if (clean.length == 32 && clean.forall(c => c == '0' || c == '1')) {
            BigInt(clean, 2)
          } else {
            BigInt(clean, 16)
          }
          parsed.U(32.W)
        }.toSeq
      }
    } catch {
      case _: Exception =>
        Seq(0.U(32.W))
    }
  }
}

/** Instruction Memory Module */
class InsMem(filePath: String = "INS.hex") extends Module {
  val io = IO(new Bundle {
    val pc   = Input(UInt(32.W))
    val inst = Output(UInt(32.W))
  })

  // Load instructions at elaboration time
  private val instrSeq: Seq[UInt] = InsMem.loadHexFileToUInts(filePath)

  // Create ROM Vec from loaded instructions
  private val rom = VecInit(instrSeq)

  // Word index = pc >> 2 (bits [31:2])
  val index = io.pc(31, 2)

  // Safe access: if index >= rom.size, return 0.U
  io.inst := Mux(index < rom.length.U, rom(index), 0.U)
}
