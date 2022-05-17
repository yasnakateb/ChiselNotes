package chapter3

import chisel3._
import chisel3.util._ 

class Printf extends Module {
    val io = IO(new Bundle {
        val a = Input(UInt (2.W))
        val b = Input(UInt (2.W))
        val out = Output (UInt (2.W))
    })

    io.out := io.a & io.b
    printf ("dut: %d %d %d\n", io.a, io.b, io.out)
}

// Generate the Verilog code
object PrintfMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Printf(), Array("--target-dir", "generated"))
}
