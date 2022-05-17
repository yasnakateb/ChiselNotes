import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.iotesters.{PeekPokeTester, Driver, ChiselFlatSpec}


class DataTypesTester(c: chapter2.data_types.DataTypes) extends PeekPokeTester(c) {
    for (n <- 0 until 64) {
    val a      = 6
    val b      = 3 
    val div = ((a/b) & 0xF) - 1
    val mul = ((a*b) & 0xF)
    val and = ((a|b) & 0xF)
    poke(c.io.a, a)
    poke(c.io.b, b)
    step(1)
    expect(c.io.div, div)
    expect(c.io.mul, mul)
    expect(c.io.and, and)
    }
}

class DataTypesTest extends ChiselFlatSpec {
    behavior of "DataTypes"
    backends foreach {backend =>
    it should s"perform correct math operation on dynamic operand in $backend" in {
      Driver(() => new chapter2.data_types.DataTypes, backend)((c) => new DataTypesTester(c)) should be (true)
    }
  }
}