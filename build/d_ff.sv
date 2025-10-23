module d_ff(d,clk,rst,q,qbar);
  input wire d;
  input wire clk;
  input wire rst;
  output reg q;
  output wire qbar;
  always @(posedge clk) begin
    if(rst) begin
      q <= 1'b00;
      end
    else
      begin
        q <= d;
      end
  end
  assign qbar = ~q;
endmodule
        