circuit LED :
  module LED :
    input clock : Clock
    input reset : UInt<1>
    output io_led : UInt<1>

    reg cntReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[LED.scala 13:26]
    reg blkReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), blkReg) @[LED.scala 14:26]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[LED.scala 16:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[LED.scala 16:22]
    node _T = eq(cntReg, UInt<25>("h17d783f")) @[LED.scala 17:18]
    node _blkReg_T = not(blkReg) @[LED.scala 20:20]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _cntReg_T_1) @[LED.scala 16:12 17:32 19:16]
    node _GEN_1 = mux(_T, _blkReg_T, blkReg) @[LED.scala 17:32 20:16 14:26]
    io_led <= blkReg @[LED.scala 22:12]
    cntReg <= mux(reset, UInt<32>("h0"), _GEN_0) @[LED.scala 13:{26,26}]
    blkReg <= mux(reset, UInt<1>("h0"), _GEN_1) @[LED.scala 14:{26,26}]
