package chapter2

import chisel3._

class MyStruct () extends Bundle {
    val key = UInt (5.W)
    val value = UInt (32.W)
}

class KeyValue extends Module {
    val io = IO(new Bundle {
        val key = Input(UInt(5.W))
        val value = Input(UInt(32.W))
        val struct_key = Output(UInt(5.W))
        val struct_value = Output(UInt(32.W))
    })

    val ms = Wire(new MyStruct ())
    ms.key := io.key
    ms.value := io.value
    io.struct_key := ms.key 
    io.struct_value := ms.value
}

// Generate the Verilog code
object KeyValueMain extends App {
  println("Generating the hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new KeyValue(), Array("--target-dir", "generated"))
}