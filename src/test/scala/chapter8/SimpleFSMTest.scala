package chapter8

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SimpleFSMTest extends AnyFlatSpec with ChiselScalatestTester {

    "SimpleFSMTest test" should "pass" in {
        test(new SimpleFSM()) { dut =>
            val din = false.B
            dut.io.din.poke(din)
            for (a <- 0 until 5){
                dut.clock.step(1)
            }
            dut.io.din.poke(true.B)
            for (a <- 0 until 5){
                dut.clock.step(1)
            }
            dut.io.din.poke(din)
            for (a <- 0 until 5){
                dut.clock.step(1)
            }
            dut.io.din.poke(true.B)
            for (a <- 0 until 5){
                dut.clock.step(1)
            }
        }
    } 
}