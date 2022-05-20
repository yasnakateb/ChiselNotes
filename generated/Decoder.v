module Decoder(
  input        clock,
  input        reset,
  input  [7:0] io_a0,
  input  [7:0] io_a1,
  output [7:0] io_result
);
  wire [15:0] sel = {io_a1,io_a0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_0 = 16'h3 == sel ? 4'h8 : 4'h0; // @[Decoder.scala 13:15 15:18 19:30]
  wire [3:0] _GEN_1 = 16'h2 == sel ? 4'h4 : _GEN_0; // @[Decoder.scala 15:18 18:30]
  wire [3:0] _GEN_2 = 16'h1 == sel ? 4'h2 : _GEN_1; // @[Decoder.scala 15:18 17:30]
  wire [3:0] _GEN_3 = 16'h0 == sel ? 4'h1 : _GEN_2; // @[Decoder.scala 15:18 16:30]
  assign io_result = {{4'd0}, _GEN_3};
endmodule
