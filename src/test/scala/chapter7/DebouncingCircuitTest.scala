// ***************************************************
// ***************************************************
// ***************************************************
// Todo: Check the test
// ***************************************************
// ***************************************************
// ***************************************************

package chapter7

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class DebouncingCircuitTest extends AnyFlatSpec with ChiselScalatestTester {

    "DebouncingCircuitTest test" should "pass" in {
        test(new DebouncingCircuit()) { dut =>
            val btnU = true.B
            dut.io.btnU.poke(btnU)
            for (a <- 0 until 100){
                dut.clock.step(1)
            }
        }
    } 
}