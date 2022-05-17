package chapter2

import chisel3._

class Operators(val w: Int) extends Module {
  val io = IO(new Bundle {
    val in0 = Input(UInt(w.W))
    val in1 = Input(UInt(w.W))
    val add = Output(UInt(w.W))
    val mul = Output(UInt(w.W))
    val and = Output(UInt(w.W))     
  })

  io.add := io.in0 + io.in1
  io.mul := io.in0 * io.in1
  io.and := io.in0 & io.in1
}

// Generate the Verilog code
object OperatorsMain extends App {
  println("Generating the hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new Operators(16), Array("--target-dir", "generated"))
}