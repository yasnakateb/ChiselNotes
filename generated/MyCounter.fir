circuit MyCounter :
  module MyCounter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enable : UInt<1>, flip reset : UInt<1>, flip maximum : UInt<5>, wrap : UInt<1>, value : UInt<4>}

    reg value : UInt<16>, clock with :
      reset => (reset, UInt<16>("h0")) @[MyCounter.scala 14:24]
    io.value <= value @[MyCounter.scala 15:14]
    when io.enable : @[MyCounter.scala 16:22]
      node _value_T = add(value, UInt<1>("h1")) @[MyCounter.scala 17:24]
      node _value_T_1 = tail(_value_T, 1) @[MyCounter.scala 17:24]
      value <= _value_T_1 @[MyCounter.scala 17:15]
    node _io_wrap_T = sub(io.maximum, UInt<1>("h1")) @[MyCounter.scala 19:38]
    node _io_wrap_T_1 = tail(_io_wrap_T, 1) @[MyCounter.scala 19:38]
    node _io_wrap_T_2 = eq(value, _io_wrap_T_1) @[MyCounter.scala 19:22]
    io.wrap <= _io_wrap_T_2 @[MyCounter.scala 19:13]
    node _T = or(io.reset, io.wrap) @[MyCounter.scala 20:20]
    when _T : @[MyCounter.scala 20:32]
      value <= UInt<1>("h0") @[MyCounter.scala 21:15]

