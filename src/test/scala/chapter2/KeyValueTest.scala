package chapter2

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class KeyValueTest extends AnyFlatSpec with ChiselScalatestTester {

    "KeyValueTest test" should "pass" in {
        test(new KeyValue()) { dut =>
            val key = 7
            val value = 8
            dut.io.key.poke(key.U)
            dut.io.value.poke(value.U)
            dut.clock.step(1)
            println("Key is: " + dut.io.struct_key.peek().toString)
            println("Value is: " + dut.io.struct_value.peek().toString)
        }
    } 
}