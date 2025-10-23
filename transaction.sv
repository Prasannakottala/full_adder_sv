class transaction;
  randc bit[1:0] d;
  randc bit rst;
  bit clk;
  bit q,qbar;
  function void display(string name);
    $display("%0s",name);
    $display(" d = %0d, clk = %0d, rst =%0d, q =%0d,qbar=%0d",d,clk,rst,q,qbar); 
  endfunction
endclass
  