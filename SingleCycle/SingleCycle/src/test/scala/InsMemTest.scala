package SingleCycle

import chisel3._
import chiseltest._
import org.scalatest._
import java.nio.file.{Files, Paths}

/** InsMemTest:
  * - Reads INS.hex from src/main/resources
  * - Instantiates InsMem and verifies instructions for PC=0,4,8,...
  */
class InsMemTest extends FreeSpec with ChiselScalatestTester {

  "InsMem should load instructions from INS.hex and present them on inst output" in {
    // Path to INS.hex (relative to project root)
    val insPath = "src/main/resources/INS.hex"

    // Make sure file exists
    assert(Files.exists(Paths.get(insPath)), s"$insPath does not exist! Put INS.hex in src/main/resources/")

    // Read the instructions from INS.hex for verification
    val sample: Seq[String] = scala.io.Source.fromFile(insPath)
      .getLines()
      .map(_.split("#").head.trim)   // Remove comments
      .filter(_.nonEmpty)
      .toSeq

    // Instantiate InsMem with absolute path
    test(new InsMem(insPath)) { c =>
      for (i <- sample.indices) {
        val pcBytes = i * 4
        c.io.pc.poke(pcBytes.U)
        val expected = BigInt(sample(i), 16)
        c.io.inst.expect((expected & BigInt("FFFFFFFF", 16)).U)
      }
    }
  }
}
