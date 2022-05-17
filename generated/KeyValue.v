module KeyValue(
  input         clock,
  input         reset,
  input  [4:0]  io_key,
  input  [31:0] io_value,
  output [4:0]  io_struct_key,
  output [31:0] io_struct_value
);
  assign io_struct_key = io_key; // @[KeyValue.scala 18:18 19:12]
  assign io_struct_value = io_value; // @[KeyValue.scala 18:18 20:14]
endmodule
