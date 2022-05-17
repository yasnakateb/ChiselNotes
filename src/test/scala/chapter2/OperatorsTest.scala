package chapter2

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class OperatorsTest extends AnyFlatSpec with ChiselScalatestTester {

  "OperatorsTest test" should "pass" in {
    test(new Operators(16)) { dut =>
      val in0 = 7
      val in1 = 7
      val add_result = in0 + in1
      val mul_result = in0 * in1
      val and_result = in0 & in1
      dut.io.in0.poke(in0.U)
      dut.io.in1.poke(in1.U)
      dut.clock.step(1)
      println("Add => Result is: " + dut.io.add.peek().toString)
      println("Mul => Result is: " + dut.io.mul.peek().toString)
      println("And => Result is: " + dut.io.and.peek().toString)
      dut.io.add.expect(add_result.U)
      dut.io.mul.expect(mul_result.U)
      dut.io.and.expect(and_result.U)
    }
  }
}