module MyCounter(
  input        clock,
  input        reset,
  input        io_enable,
  input        io_reset,
  input  [4:0] io_maximum,
  output       io_wrap,
  output [3:0] io_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] value; // @[MyCounter.scala 14:24]
  wire [15:0] _value_T_1 = value + 16'h1; // @[MyCounter.scala 17:24]
  wire [4:0] _io_wrap_T_1 = io_maximum - 5'h1; // @[MyCounter.scala 19:38]
  wire [15:0] _GEN_2 = {{11'd0}, _io_wrap_T_1}; // @[MyCounter.scala 19:22]
  assign io_wrap = value == _GEN_2; // @[MyCounter.scala 19:22]
  assign io_value = value[3:0]; // @[MyCounter.scala 15:14]
  always @(posedge clock) begin
    if (reset) begin // @[MyCounter.scala 14:24]
      value <= 16'h0; // @[MyCounter.scala 14:24]
    end else if (io_reset | io_wrap) begin // @[MyCounter.scala 20:32]
      value <= 16'h0; // @[MyCounter.scala 21:15]
    end else if (io_enable) begin // @[MyCounter.scala 16:22]
      value <= _value_T_1; // @[MyCounter.scala 17:15]
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
  value = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
