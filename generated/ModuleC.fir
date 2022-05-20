circuit ModuleC :
  module ModuleA :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, x : UInt<8>, y : UInt<8>}

    io.x <= UInt<1>("h1") @[ModuleC.scala 13:10]
    io.y <= UInt<1>("h1") @[ModuleC.scala 14:10]

  module ModuleB :
    input clock : Clock
    input reset : Reset
    output io : { flip in1 : UInt<8>, flip in2 : UInt<8>, out : UInt<8>}

    io.out <= UInt<1>("h1") @[ModuleC.scala 24:12]

  module ModuleC :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<8>, flip in_b : UInt<8>, flip in_c : UInt<8>, out_x : UInt<8>, out_y : UInt<8>}

    inst compA of ModuleA @[ModuleC.scala 37:24]
    compA.clock <= clock
    compA.reset <= reset
    inst compB of ModuleB @[ModuleC.scala 38:24]
    compB.clock <= clock
    compB.reset <= reset
    compA.io.a <= io.in_a @[ModuleC.scala 40:16]
    compA.io.b <= io.in_b @[ModuleC.scala 41:16]
    io.out_x <= compA.io.x @[ModuleC.scala 42:14]
    compB.io.in1 <= compA.io.y @[ModuleC.scala 44:18]
    compB.io.in2 <= io.in_c @[ModuleC.scala 45:18]
    io.out_y <= compB.io.out @[ModuleC.scala 46:15]

