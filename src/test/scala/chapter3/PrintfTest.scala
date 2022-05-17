package chapter3

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PrintfTest extends AnyFlatSpec with ChiselScalatestTester {

    "PrintfTestTest test" should "pass" in {
        test(new Printf()) { dut =>
            val a = 0
            val b = 3
            dut.io.a.poke(a.U)
            dut.io.b.poke(b.U)
            dut.clock.step(1)
        }
    } 
}