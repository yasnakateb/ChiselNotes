circuit DebouncingCircuit :
  module DebouncingCircuit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip btnU : UInt<1>, led : UInt<8>}

    reg btnSync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync_REG) @[DebouncingCircuit.scala 15:34]
    btnSync_REG <= io.btnU @[DebouncingCircuit.scala 15:34]
    reg btnSync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync) @[DebouncingCircuit.scala 15:26]
    btnSync <= btnSync_REG @[DebouncingCircuit.scala 15:26]
    reg btnDebReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnDebReg) @[DebouncingCircuit.scala 27:24]
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[DebouncingCircuit.scala 29:25]
    node tick = eq(cntReg, UInt<20>("hf423f")) @[DebouncingCircuit.scala 30:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[DebouncingCircuit.scala 32:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[DebouncingCircuit.scala 32:22]
    cntReg <= _cntReg_T_1 @[DebouncingCircuit.scala 32:12]
    when tick : @[DebouncingCircuit.scala 33:17]
      cntReg <= UInt<1>("h0") @[DebouncingCircuit.scala 34:16]
      btnDebReg <= btnSync @[DebouncingCircuit.scala 35:19]
    reg shiftReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[DebouncingCircuit.scala 40:27]
    when tick : @[DebouncingCircuit.scala 41:17]
      node _shiftReg_T = bits(shiftReg, 1, 0) @[DebouncingCircuit.scala 43:29]
      node _shiftReg_T_1 = cat(_shiftReg_T, btnDebReg) @[DebouncingCircuit.scala 43:36]
      shiftReg <= _shiftReg_T_1 @[DebouncingCircuit.scala 43:18]
    node _btnClean_T = bits(shiftReg, 2, 2) @[DebouncingCircuit.scala 46:29]
    node _btnClean_T_1 = bits(shiftReg, 1, 1) @[DebouncingCircuit.scala 46:43]
    node _btnClean_T_2 = and(_btnClean_T, _btnClean_T_1) @[DebouncingCircuit.scala 46:33]
    node _btnClean_T_3 = bits(shiftReg, 2, 2) @[DebouncingCircuit.scala 46:59]
    node _btnClean_T_4 = bits(shiftReg, 0, 0) @[DebouncingCircuit.scala 46:73]
    node _btnClean_T_5 = and(_btnClean_T_3, _btnClean_T_4) @[DebouncingCircuit.scala 46:63]
    node _btnClean_T_6 = or(_btnClean_T_2, _btnClean_T_5) @[DebouncingCircuit.scala 46:48]
    node _btnClean_T_7 = bits(shiftReg, 1, 1) @[DebouncingCircuit.scala 46:89]
    node _btnClean_T_8 = bits(shiftReg, 0, 0) @[DebouncingCircuit.scala 46:103]
    node _btnClean_T_9 = and(_btnClean_T_7, _btnClean_T_8) @[DebouncingCircuit.scala 46:93]
    node btnClean = or(_btnClean_T_6, _btnClean_T_9) @[DebouncingCircuit.scala 46:78]
    reg risingEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), risingEdge_REG) @[DebouncingCircuit.scala 50:41]
    risingEdge_REG <= btnClean @[DebouncingCircuit.scala 50:41]
    node _risingEdge_T = eq(risingEdge_REG, UInt<1>("h0")) @[DebouncingCircuit.scala 50:33]
    node risingEdge = and(btnClean, _risingEdge_T) @[DebouncingCircuit.scala 50:31]
    reg reg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[DebouncingCircuit.scala 54:22]
    when risingEdge : @[DebouncingCircuit.scala 55:23]
      node _reg_T = add(reg, UInt<1>("h1")) @[DebouncingCircuit.scala 56:20]
      node _reg_T_1 = tail(_reg_T, 1) @[DebouncingCircuit.scala 56:20]
      reg <= _reg_T_1 @[DebouncingCircuit.scala 56:13]
    io.led <= reg @[DebouncingCircuit.scala 60:12]

