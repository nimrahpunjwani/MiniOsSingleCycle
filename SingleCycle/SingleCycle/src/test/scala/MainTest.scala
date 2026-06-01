package SingleCycle
import chisel3._
import chiseltest._
import org.scalatest._

class MainTest extends FreeSpec with ChiselScalatestTester {

  "Wowwie Nimsss your Single Cycle is slayingg" in {
    test(new Main) { c =>
      c.clock.step(200)   
    }
  }

}
