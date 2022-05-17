circuit Multiplexer :
  module Multiplexer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in0 : UInt<16>, flip in1 : UInt<16>, flip sel : UInt<1>, result : UInt<8>}

    node _io_result_T = mux(io.sel, io.in0, io.in1) @[Multiplexer.scala 12:19]
    io.result <= _io_result_T @[Multiplexer.scala 12:13]

