package chapter6

import chisel3._
import chisel3.util._

class PWM extends Module {
    val io = IO(new Bundle {
    val din = Input(UInt(10.W))
    val dout = Output(UInt(10.W))
    })

    def pwm( nrCycles : Int , din: UInt) = {
        val cntReg = RegInit (0.U( unsignedBitLength (nrCycles -1).W))
        cntReg := Mux( cntReg === (nrCycles -1).U, 0.U, cntReg + 1.U)
        din > cntReg
    }
    
    io.dout := pwm(10, io.din)
}

// Generate the Verilog code
object PWMMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new PWM(), Array("--target-dir", "generated"))
}