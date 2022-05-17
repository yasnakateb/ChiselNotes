module Operators(
  input         clock,
  input         reset,
  input  [15:0] io_in0,
  input  [15:0] io_in1,
  output [15:0] io_add,
  output [15:0] io_mul,
  output [15:0] io_and
);
  wire [31:0] _io_mul_T = io_in0 * io_in1; // @[Operators.scala 16:20]
  assign io_add = io_in0 + io_in1; // @[Operators.scala 15:20]
  assign io_mul = _io_mul_T[15:0]; // @[Operators.scala 16:10]
  assign io_and = io_in0 & io_in1; // @[Operators.scala 17:20]
endmodule
