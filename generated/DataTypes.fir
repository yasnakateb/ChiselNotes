circuit DataTypes :
  module DataTypes :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<5>, flip b : UInt<5>, div : UInt<5>, mul : UInt<5>, and : UInt<1>}

    node _io_div_T = div(io.a, io.a) @[DataTypes.scala 18:22]
    io.div <= _io_div_T @[DataTypes.scala 18:12]
    node _io_mul_T = mul(io.a, io.a) @[DataTypes.scala 19:22]
    io.mul <= _io_mul_T @[DataTypes.scala 19:12]
    node _io_and_T = and(io.a, io.a) @[DataTypes.scala 20:22]
    io.and <= _io_and_T @[DataTypes.scala 20:12]
    node _T = bits(reset, 0, 0) @[DataTypes.scala 22:11]
    node _T_1 = eq(_T, UInt<1>("h0")) @[DataTypes.scala 22:11]
    when _T_1 : @[DataTypes.scala 22:11]
      printf(clock, UInt<1>("h1"), "Print during simulation: Input is %d\n", io.a) : printf @[DataTypes.scala 22:11]
    node _T_2 = bits(reset, 0, 0) @[DataTypes.scala 23:11]
    node _T_3 = eq(_T_2, UInt<1>("h0")) @[DataTypes.scala 23:11]
    when _T_3 : @[DataTypes.scala 23:11]
      printf(clock, UInt<1>("h1"), "Print during simulation: IO is AnonymousBundle(a -> %d, b -> %d, div -> %d, mul -> %d, and -> %d)\n", io.a, io.b, io.div, io.mul, io.and) : printf_1 @[DataTypes.scala 23:11]

