package chapter2

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class MyCounterTest extends AnyFlatSpec with ChiselScalatestTester {

    "MyCounterTest test" should "pass" in {
        test(new MyCounter(16)) { dut =>
            val enable = true
            val reset = false 
            val maximum = 15
            dut.io.enable.poke(enable.B)
            dut.io.reset.poke(reset.B)
            dut.io.maximum.poke(maximum.U)
            for (a <- 0 until 20) {
                dut.clock.step ()
            }
        }
    }
}