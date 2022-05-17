module Multiplexer(
  input         clock,
  input         reset,
  input  [15:0] io_in0,
  input  [15:0] io_in1,
  input         io_sel,
  output [7:0]  io_result
);
  wire [15:0] _io_result_T = io_sel ? io_in0 : io_in1; // @[Multiplexer.scala 12:19]
  assign io_result = _io_result_T[7:0]; // @[Multiplexer.scala 12:13]
endmodule
