circuit PWM :
  module PWM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<10>, dout : UInt<10>}

    reg io_dout_cntReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[PWM.scala 13:30]
    node _io_dout_cntReg_T = eq(io_dout_cntReg, UInt<4>("h9")) @[PWM.scala 14:31]
    node _io_dout_cntReg_T_1 = add(io_dout_cntReg, UInt<1>("h1")) @[PWM.scala 14:64]
    node _io_dout_cntReg_T_2 = tail(_io_dout_cntReg_T_1, 1) @[PWM.scala 14:64]
    node _io_dout_cntReg_T_3 = mux(_io_dout_cntReg_T, UInt<1>("h0"), _io_dout_cntReg_T_2) @[PWM.scala 14:22]
    io_dout_cntReg <= _io_dout_cntReg_T_3 @[PWM.scala 14:16]
    node _io_dout_T = gt(io.din, io_dout_cntReg) @[PWM.scala 15:13]
    io.dout <= _io_dout_T @[PWM.scala 18:13]

