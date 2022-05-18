package chapter4

import chisel3._

class Count100 extends Module {
    val io = IO(new Bundle {
        val out = Output(UInt(32.W))
    })

    val adder = Module(new Adder())
    val register = Module(new Register())

    val count = register.io.out 
    adder.io.in0 := 1.U
    adder.io.in1 := count

    val result = adder.io.out 
    val next = Mux(count === 99.U, 0.U, result )
    register.io.in := next
    io.out := count
}

// Generate the Verilog code
object Count100Main extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Count100(), Array("--target-dir", "generated"))
}