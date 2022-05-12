import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class LEDTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "LED"
        it should "pass" in {
            test(new chapter1.LED) { c =>
                c.clock.setTimeout(0)
                var ledStatus = BigInt(-1)
                println("Start the blinking LED")
                for (_ <- 0 until 100) {
                    c.clock.step(10000)
                    val ledNow = c.io.led.peek().litValue
                    val s = if (ledNow == 0) "o" else "*"
                    if (ledStatus != ledNow) {
                        System.out.println(s)
                        ledStatus = ledNow
                    }
                }
                println("\nEnd the blinking LED")
            }
        }
}