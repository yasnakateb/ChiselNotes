circuit Count100 :
  module Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip in0 : UInt<32>, flip in1 : UInt<32>, out : UInt<32>}

    node _io_out_T = add(io.in0, io.in1) @[Adder.scala 13:22]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Adder.scala 13:22]
    io.out <= _io_out_T_1 @[Adder.scala 13:12]

  module Register :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Register.scala 11:23]
    reg <= io.in @[Register.scala 12:9]
    io.out <= reg @[Register.scala 13:12]

  module Count100 :
    input clock : Clock
    input reset : UInt<1>
    output io : { out : UInt<32>}

    inst adder of Adder @[Count100.scala 10:23]
    adder.clock <= clock
    adder.reset <= reset
    inst register of Register @[Count100.scala 11:26]
    register.clock <= clock
    register.reset <= reset
    adder.io.in0 <= UInt<1>("h1") @[Count100.scala 14:18]
    adder.io.in1 <= register.io.out @[Count100.scala 15:18]
    node _next_T = eq(register.io.out, UInt<7>("h63")) @[Count100.scala 18:26]
    node next = mux(_next_T, UInt<1>("h0"), adder.io.out) @[Count100.scala 18:19]
    register.io.in <= next @[Count100.scala 19:20]
    io.out <= register.io.out @[Count100.scala 20:12]

