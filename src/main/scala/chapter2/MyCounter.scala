package chapter2

import chisel3._
import chisel3.util._ 

class MyCounter(n: Int) extends Module {
    val io = IO(new Bundle {
        val enable = Input(Bool())
        val reset = Input(Bool())
        val maximum = Input(UInt(log2Ceil(n + 1).W))
        val wrap = Output(Bool())
        val value = Output(UInt(log2Ceil(n).W))
    })

    val value = RegInit(0.U(n.W))
    io.value := value
    when (io.enable) { 
        value := value + 1.U 
    }
    io.wrap := value === (io.maximum - 1.U)
    when (io.reset || io.wrap) { 
        value := 0.U 
    }
}

// Generate the Verilog code
object MyCounterMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new MyCounter(16), Array("--target-dir", "generated"))
}
