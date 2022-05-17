circuit KeyValue :
  module KeyValue :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip key : UInt<5>, flip value : UInt<32>, struct_key : UInt<5>, struct_value : UInt<32>}

    wire ms : { key : UInt<5>, value : UInt<32>} @[KeyValue.scala 18:18]
    ms.key <= io.key @[KeyValue.scala 19:12]
    ms.value <= io.value @[KeyValue.scala 20:14]
    io.struct_key <= ms.key @[KeyValue.scala 21:19]
    io.struct_value <= ms.value @[KeyValue.scala 22:21]

