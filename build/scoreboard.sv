class scoreboard;
  mailbox mon2scd;
  bit d;
  bit q;
  bit qbar;
  bit clk;
  bit rst;
  function new(mailbox mon2scd);
    this.mon2scd = mon2scd;
  endfunction
  task main;
    repeat(5)begin
      transaction tr;
      tr =new();
      mon2scd.get(tr);
      tr.display("scoreboard class signals");
      if(rst) begin
        q <= 0;
      $display("pass ");
      end
      else  
        begin
          qbar <= d; 
        end
    end
  endtask
endclass