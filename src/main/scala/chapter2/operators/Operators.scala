package chapter2.data_types

import chisel3._
import chisel3.util._ 


class DataTypes extends Module {
    val io = IO (new Bundle {
        val a = Input(UInt(5.W))
        val b = Input(UInt(5.W))
        val div = Output(UInt(5.W))
        val mul = Output(UInt(5.W))
        val and = Output(UInt(1.W))
        
    })
    val temp_a = io.a 
    val temp_b = io.a 
    io.div := temp_a / temp_b
    io.mul := temp_a * temp_b 
    io.and := temp_a & temp_b 

    printf("Print during simulation: Input is %d\n", io.a)
    printf(p"Print during simulation: IO is $io\n")

    println(s"Print during generation: Input is ${io.a}")
}

object DataTypesMain extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DataTypes(), Array("--target-dir", "generated"))
}