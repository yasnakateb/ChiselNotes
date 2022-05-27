package chapter8

import chisel3 ._
import chisel3 .util._

class SimpleFSM extends Module {
    val io = IO(new Bundle {
        val din = Input(Bool ())
        val risingEdge = Output (Bool ())
    })

    // The two states
    val zero :: one :: Nil = Enum (2)
    val stateReg = RegInit (zero)
    
    io. risingEdge := false.B
    
    switch ( stateReg ) {
        is(zero) {
            when(io.din) {
                stateReg := one
                io. risingEdge := true.B
            }
        }
        is(one) {
            when (! io.din) {
                stateReg := zero
            }
        }
    }
} 

// Generate the Verilog code
object SimpleFSMMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new SimpleFSM(), Array("--target-dir", "generated"))
}