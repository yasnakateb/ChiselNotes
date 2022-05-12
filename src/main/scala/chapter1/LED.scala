package chapter1

import chisel3._
import chisel3.util._

class LED extends Module {
    val io = IO(new Bundle {
    val led = Output (UInt (1.W))
    })
    //  A counter to derive timing in the Hz range
    val CNT_MAX = (50000000 / 2 - 1).U

    val cntReg = RegInit (0.U(32.W))
    val blkReg = RegInit (0.U(1.W))
    
    cntReg := cntReg + 1.U
    when( cntReg === CNT_MAX ) {
        // Reset the counter
        cntReg := 0.U
        blkReg :=  ~blkReg
    }
    io.led := blkReg
}

object LEDMain extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new LED(), Array("--target-dir", "generated"))
}