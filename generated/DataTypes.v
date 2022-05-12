module DataTypes(
  input        clock,
  input        reset,
  input  [4:0] io_a,
  input  [4:0] io_b,
  output [4:0] io_div,
  output [4:0] io_mul,
  output       io_and
);
  wire [9:0] _io_mul_T = io_a * io_a; // @[DataTypes.scala 19:22]
  wire  _T_1 = ~reset; // @[DataTypes.scala 22:11]
  assign io_div = 5'h1; // @[DataTypes.scala 18:22]
  assign io_mul = _io_mul_T[4:0]; // @[DataTypes.scala 19:12]
  assign io_and = io_a[0]; // @[DataTypes.scala 20:12]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"Print during simulation: Input is %d\n",io_a); // @[DataTypes.scala 22:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,
            "Print during simulation: IO is AnonymousBundle(a -> %d, b -> %d, div -> %d, mul -> %d, and -> %d)\n",io_a,
            io_b,io_div,io_mul,io_and); // @[DataTypes.scala 23:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
