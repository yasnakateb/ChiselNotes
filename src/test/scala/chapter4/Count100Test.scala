package chapter4

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class Count100Test extends AnyFlatSpec with ChiselScalatestTester {

    "Count100Test test" should "pass" in {
        test(new Count100()) { dut =>
            for(a <- 0 until 100) {
                dut.clock.step(1)
            }   
        }
    } 
}