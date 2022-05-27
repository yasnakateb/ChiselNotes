module SimpleFSM(
  input   clock,
  input   reset,
  input   io_din,
  output  io_risingEdge
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[SimpleFSM.scala 14:28]
  wire  _GEN_0 = io_din | stateReg; // @[SimpleFSM.scala 20:26 21:26 14:28]
  assign io_risingEdge = ~stateReg & io_din; // @[SimpleFSM.scala 16:20 18:25]
  always @(posedge clock) begin
    if (reset) begin // @[SimpleFSM.scala 14:28]
      stateReg <= 1'h0; // @[SimpleFSM.scala 14:28]
    end else if (~stateReg) begin // @[SimpleFSM.scala 18:25]
      stateReg <= _GEN_0;
    end else if (stateReg) begin // @[SimpleFSM.scala 18:25]
      if (~io_din) begin // @[SimpleFSM.scala 26:29]
        stateReg <= 1'h0; // @[SimpleFSM.scala 27:26]
      end
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
  stateReg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
