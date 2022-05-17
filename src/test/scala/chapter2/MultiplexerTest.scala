package chapter2

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class MultiplexerTest extends AnyFlatSpec with ChiselScalatestTester {

  "MultiplexerTest test" should "pass" in {
    test(new Multiplexer(16)) { dut =>
      val in0 = 7
      val in1 = 8
      val sel = false
      val result = 8
      dut.io.in0.poke(in0.U)
      dut.io.in1.poke(in1.U)
      dut.io.sel.poke(sel.B)
      dut.clock.step(1)
      println("Result is: " + dut.io.result.peek().toString)
      dut.io.result.expect(result.U)
    }
  }
}