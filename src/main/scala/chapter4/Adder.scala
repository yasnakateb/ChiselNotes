package chapter4

import chisel3._

class Adder extends Module {
    val io = IO(new Bundle {
        val in0 = Input(UInt(32.W))
        val in1 = Input(UInt(32.W))
        val out = Output(UInt(32.W))

    })

    io.out := io.in0 + io.in1
}