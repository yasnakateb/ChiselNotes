package chapter7

import chisel3._
import chisel3.util._

class DebouncingCircuit(fac: Int = 100000000/100) extends Module {
    val io = IO(new Bundle {
        val btnU = Input(Bool())
        val led = Output(UInt(8.W))
    })

    val btn = io.btnU
    val btnSync = RegNext(RegNext(btn))

    val FAC = fac

    //- start input_debounce
    val btnDebReg = Reg(Bool())

    val cntReg = RegInit(0.U(32.W))
    val tick = cntReg === (fac-1).U

    cntReg := cntReg + 1.U
    when (tick) {
        cntReg := 0.U
        btnDebReg := btnSync
    }
    
    val shiftReg = RegInit(0.U(3.W))
    when (tick) {
        // shift left and input in LSB
        shiftReg := shiftReg(1, 0) ## btnDebReg
    }
    val btnClean = (shiftReg(2) & shiftReg(1)) | (shiftReg(2) & shiftReg(0)) | (shiftReg(1) & shiftReg(0))
    val risingEdge = btnClean & !RegNext(btnClean)
    val reg = RegInit(0.U(8.W))
    when (risingEdge) {
        reg := reg + 1.U
    }

    io.led := reg
}

// Generate the Verilog code
object DebouncingCircuitMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DebouncingCircuit(), Array("--target-dir", "generated"))
}