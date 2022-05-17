circuit Operators :
  module Operators :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in0 : UInt<16>, flip in1 : UInt<16>, add : UInt<16>, mul : UInt<16>, and : UInt<16>}

    node _io_add_T = add(io.in0, io.in1) @[Operators.scala 15:20]
    node _io_add_T_1 = tail(_io_add_T, 1) @[Operators.scala 15:20]
    io.add <= _io_add_T_1 @[Operators.scala 15:10]
    node _io_mul_T = mul(io.in0, io.in1) @[Operators.scala 16:20]
    io.mul <= _io_mul_T @[Operators.scala 16:10]
    node _io_and_T = and(io.in0, io.in1) @[Operators.scala 17:20]
    io.and <= _io_and_T @[Operators.scala 17:10]

