package chapter5

import chisel3._
import chisel3.util._

class Decoder extends Module {
    val io = IO(new Bundle {
    val a0 = Input(UInt (8.W))
    val a1 = Input(UInt (8.W))
    val result = Output (UInt (8.W))
    })

    io.result := 0.U
    val sel = Cat(io.a1,io.a0)
    switch (sel) {
        is (0.U) { io.result := 1.U}
        is (1.U) { io.result := 2.U}
        is (2.U) { io.result := 4.U}
        is (3.U) { io.result := 8.U}
    }
}

// Generate the Verilog code
object DecoderMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Decoder(), Array("--target-dir", "generated"))
}