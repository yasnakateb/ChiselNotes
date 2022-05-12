module LED(
  input   clock,
  input   reset,
  output  io_led
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cntReg; // @[LED.scala 13:26]
  reg  blkReg; // @[LED.scala 14:26]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[LED.scala 16:22]
  assign io_led = blkReg; // @[LED.scala 22:12]
  always @(posedge clock) begin
    if (reset) begin // @[LED.scala 13:26]
      cntReg <= 32'h0; // @[LED.scala 13:26]
    end else if (cntReg == 32'h17d783f) begin // @[LED.scala 17:32]
      cntReg <= 32'h0; // @[LED.scala 19:16]
    end else begin
      cntReg <= _cntReg_T_1; // @[LED.scala 16:12]
    end
    if (reset) begin // @[LED.scala 14:26]
      blkReg <= 1'h0; // @[LED.scala 14:26]
    end else if (cntReg == 32'h17d783f) begin // @[LED.scala 17:32]
      blkReg <= ~blkReg; // @[LED.scala 20:16]
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
  cntReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  blkReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
