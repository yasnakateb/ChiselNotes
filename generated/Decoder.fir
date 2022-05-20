circuit Decoder :
  module Decoder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a0 : UInt<8>, flip a1 : UInt<8>, result : UInt<8>}

    io.result <= UInt<1>("h0") @[Decoder.scala 13:15]
    node sel = cat(io.a1, io.a0) @[Cat.scala 31:58]
    node _T = eq(UInt<1>("h0"), sel) @[Decoder.scala 15:18]
    when _T : @[Decoder.scala 15:18]
      io.result <= UInt<1>("h1") @[Decoder.scala 16:30]
    else :
      node _T_1 = eq(UInt<1>("h1"), sel) @[Decoder.scala 15:18]
      when _T_1 : @[Decoder.scala 15:18]
        io.result <= UInt<2>("h2") @[Decoder.scala 17:30]
      else :
        node _T_2 = eq(UInt<2>("h2"), sel) @[Decoder.scala 15:18]
        when _T_2 : @[Decoder.scala 15:18]
          io.result <= UInt<3>("h4") @[Decoder.scala 18:30]
        else :
          node _T_3 = eq(UInt<2>("h3"), sel) @[Decoder.scala 15:18]
          when _T_3 : @[Decoder.scala 15:18]
            io.result <= UInt<4>("h8") @[Decoder.scala 19:30]

