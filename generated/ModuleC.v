module ModuleC(
  input        clock,
  input        reset,
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  input  [7:0] io_in_c,
  output [7:0] io_out_x,
  output [7:0] io_out_y
);
  assign io_out_x = 8'h1; // @[ModuleC.scala 42:14]
  assign io_out_y = 8'h1; // @[ModuleC.scala 46:15]
endmodule
