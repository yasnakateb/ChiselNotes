module DebouncingCircuit(
  input        clock,
  input        reset,
  input        io_btnU,
  output [7:0] io_led
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  btnSync_REG; // @[DebouncingCircuit.scala 15:34]
  reg  btnSync; // @[DebouncingCircuit.scala 15:26]
  reg  btnDebReg; // @[DebouncingCircuit.scala 27:24]
  reg [31:0] cntReg; // @[DebouncingCircuit.scala 29:25]
  wire  tick = cntReg == 32'hf423f; // @[DebouncingCircuit.scala 30:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[DebouncingCircuit.scala 32:22]
  reg [2:0] shiftReg; // @[DebouncingCircuit.scala 40:27]
  wire [2:0] _shiftReg_T_1 = {shiftReg[1:0],btnDebReg}; // @[DebouncingCircuit.scala 43:36]
  wire  btnClean = shiftReg[2] & shiftReg[1] | shiftReg[2] & shiftReg[0] | shiftReg[1] & shiftReg[0]; // @[DebouncingCircuit.scala 46:78]
  reg  risingEdge_REG; // @[DebouncingCircuit.scala 50:41]
  wire  risingEdge = btnClean & ~risingEdge_REG; // @[DebouncingCircuit.scala 50:31]
  reg [7:0] reg_; // @[DebouncingCircuit.scala 54:22]
  wire [7:0] _reg_T_1 = reg_ + 8'h1; // @[DebouncingCircuit.scala 56:20]
  assign io_led = reg_; // @[DebouncingCircuit.scala 60:12]
  always @(posedge clock) begin
    btnSync_REG <= io_btnU; // @[DebouncingCircuit.scala 15:34]
    btnSync <= btnSync_REG; // @[DebouncingCircuit.scala 15:26]
    if (tick) begin // @[DebouncingCircuit.scala 33:17]
      btnDebReg <= btnSync; // @[DebouncingCircuit.scala 35:19]
    end
    if (reset) begin // @[DebouncingCircuit.scala 29:25]
      cntReg <= 32'h0; // @[DebouncingCircuit.scala 29:25]
    end else if (tick) begin // @[DebouncingCircuit.scala 33:17]
      cntReg <= 32'h0; // @[DebouncingCircuit.scala 34:16]
    end else begin
      cntReg <= _cntReg_T_1; // @[DebouncingCircuit.scala 32:12]
    end
    if (reset) begin // @[DebouncingCircuit.scala 40:27]
      shiftReg <= 3'h0; // @[DebouncingCircuit.scala 40:27]
    end else if (tick) begin // @[DebouncingCircuit.scala 41:17]
      shiftReg <= _shiftReg_T_1; // @[DebouncingCircuit.scala 43:18]
    end
    risingEdge_REG <= shiftReg[2] & shiftReg[1] | shiftReg[2] & shiftReg[0] | shiftReg[1] & shiftReg[0]; // @[DebouncingCircuit.scala 46:78]
    if (reset) begin // @[DebouncingCircuit.scala 54:22]
      reg_ <= 8'h0; // @[DebouncingCircuit.scala 54:22]
    end else if (risingEdge) begin // @[DebouncingCircuit.scala 55:23]
      reg_ <= _reg_T_1; // @[DebouncingCircuit.scala 56:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  btnSync_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  btnSync = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  btnDebReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  shiftReg = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  risingEdge_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  reg_ = _RAND_6[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
