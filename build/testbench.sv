`include "d_ff.sv"
`include "interface.sv"
`include "test.sv"
module testbench;
  intf intff();
  test t(intff);
  d_ff fi(.d(intff.d),
          .rst(intff.rst),
          .q(intff.q), 
          .clk(intff.clk),
          .qbar(intff.qbar)
          );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish();
  end
endmodule
  