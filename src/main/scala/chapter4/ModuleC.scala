package chapter4

import chisel3._

class ModuleA extends Module {
    val io = IO(new Bundle {
    val a = Input(UInt (8.W))
    val b = Input(UInt (8.W))
    val x = Output (UInt (8.W))
    val y = Output (UInt (8.W))
    })

    io.x := 1.U
    io.y := 1.U
}

class ModuleB extends Module {
    val io = IO(new Bundle {
    val in1 = Input(UInt (8.W))
    val in2 = Input(UInt (8.W))
    val out = Output (UInt (8.W))
    })

    io.out := 1.U  
}

class ModuleC extends Module {
    val io = IO(new Bundle {
    val in_a = Input(UInt (8.W))
    val in_b = Input(UInt (8.W))
    val in_c = Input(UInt (8.W))
    val out_x = Output (UInt (8.W))
    val out_y = Output (UInt (8.W))
    })

    // create components A and B
    val compA = Module (new ModuleA ())
    val compB = Module (new ModuleB ())
    // connect A
    compA.io.a := io.in_a
    compA.io.b := io.in_b
    io.out_x := compA.io.x
    // connect B
    compB.io.in1 := compA.io.y
    compB.io.in2 := io.in_c
    io. out_y := compB.io.out
}

// Generate the Verilog code
object ModuleCMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ModuleC(), Array("--target-dir", "generated"))
}