circuit Printf :
  module Printf :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<2>, flip b : UInt<2>, out : UInt<2>}

    node _io_out_T = and(io.a, io.b) @[Printf.scala 13:20]
    io.out <= _io_out_T @[Printf.scala 13:12]
    node _T = bits(reset, 0, 0) @[Printf.scala 14:12]
    node _T_1 = eq(_T, UInt<1>("h0")) @[Printf.scala 14:12]
    when _T_1 : @[Printf.scala 14:12]
      printf(clock, UInt<1>("h1"), "dut: %d %d %d\n", io.a, io.b, io.out) : printf @[Printf.scala 14:12]

