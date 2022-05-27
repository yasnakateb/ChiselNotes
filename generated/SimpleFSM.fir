circuit SimpleFSM :
  module SimpleFSM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<1>, risingEdge : UInt<1>}

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[SimpleFSM.scala 14:28]
    io.risingEdge <= UInt<1>("h0") @[SimpleFSM.scala 16:20]
    node _T = eq(UInt<1>("h0"), stateReg) @[SimpleFSM.scala 18:25]
    when _T : @[SimpleFSM.scala 18:25]
      when io.din : @[SimpleFSM.scala 20:26]
        stateReg <= UInt<1>("h1") @[SimpleFSM.scala 21:26]
        io.risingEdge <= UInt<1>("h1") @[SimpleFSM.scala 22:32]
    else :
      node _T_1 = eq(UInt<1>("h1"), stateReg) @[SimpleFSM.scala 18:25]
      when _T_1 : @[SimpleFSM.scala 18:25]
        node _T_2 = eq(io.din, UInt<1>("h0")) @[SimpleFSM.scala 26:19]
        when _T_2 : @[SimpleFSM.scala 26:29]
          stateReg <= UInt<1>("h0") @[SimpleFSM.scala 27:26]

