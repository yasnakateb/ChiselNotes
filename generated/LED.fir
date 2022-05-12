circuit LED :
  module LED :
    input clock : Clock
    input reset : UInt<1>
    output io : { led : UInt<1>}

    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[LED.scala 13:26]
    reg blkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[LED.scala 14:26]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[LED.scala 16:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[LED.scala 16:22]
    cntReg <= _cntReg_T_1 @[LED.scala 16:12]
    node _T = eq(cntReg, UInt<25>("h17d783f")) @[LED.scala 17:18]
    when _T : @[LED.scala 17:32]
      cntReg <= UInt<1>("h0") @[LED.scala 19:16]
      node _blkReg_T = not(blkReg) @[LED.scala 20:20]
      blkReg <= _blkReg_T @[LED.scala 20:16]
    io.led <= blkReg @[LED.scala 22:12]

