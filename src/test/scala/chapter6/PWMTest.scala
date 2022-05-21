package chapter6

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PWMTest extends AnyFlatSpec with ChiselScalatestTester {

    "PWMTest test" should "pass" in {
        test(new PWM()) { dut =>
            val din = 5.U
            dut.io.din.poke(din)
            for (a <- 0 until 100){
                dut.clock.step(1)
            }
        }
    } 
}