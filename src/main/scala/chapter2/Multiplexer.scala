package chapter2

import chisel3._

class Multiplexer(val w: Int) extends Module {
    val io = IO(new Bundle {
        val in0 = Input(UInt(w.W))
        val in1 = Input(UInt(w.W))
        val sel = Input(Bool())
        val result = Output(UInt(8.W))
    })
    
    io.result := Mux(io.sel, io.in0, io.in1)
}

// Generate the Verilog code
object MultiplexerMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Multiplexer(16), Array("--target-dir", "generated"))
}