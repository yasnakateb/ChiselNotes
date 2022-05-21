module PWM(
  input        clock,
  input        reset,
  input  [9:0] io_din,
  output [9:0] io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] io_dout_cntReg; // @[PWM.scala 13:30]
  wire [3:0] _io_dout_cntReg_T_2 = io_dout_cntReg + 4'h1; // @[PWM.scala 14:64]
  wire [9:0] _GEN_0 = {{6'd0}, io_dout_cntReg}; // @[PWM.scala 15:13]
  wire  _io_dout_T = io_din > _GEN_0; // @[PWM.scala 15:13]
  assign io_dout = {{9'd0}, _io_dout_T}; // @[PWM.scala 18:13]
  always @(posedge clock) begin
    if (reset) begin // @[PWM.scala 13:30]
      io_dout_cntReg <= 4'h0; // @[PWM.scala 13:30]
    end else if (io_dout_cntReg == 4'h9) begin // @[PWM.scala 14:22]
      io_dout_cntReg <= 4'h0;
    end else begin
      io_dout_cntReg <= _io_dout_cntReg_T_2;
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
  io_dout_cntReg = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
