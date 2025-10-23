class driver;
  mailbox gen2drv;
  virtual intf vif;
  function new(virtual intf vif, mailbox gen2drv);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
    task main;
     #1; vif.clk =0; 
     #1; vif.rst =0; 
     #1; vif.rst = 1;
     #1; vif.d =0;
     #1; vif.d =1;
      repeat(5) begin
        transaction tr;
        fork 
         forever #5 vif.clk = ~vif.clk;
        join_none
      gen2drv.get(tr);
      @(posedge vif.clk);
      vif.d  <= tr.d;
      vif.rst  <= tr.rst;
      tr.display("....driver class signals....");
        #2;
    end
  endtask
endclass