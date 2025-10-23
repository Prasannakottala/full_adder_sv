class monitor;
  mailbox mon2scd;
  virtual intf vif;
  function new(virtual intf vif,mailbox mon2scd);
    this.vif = vif;
    this.mon2scd = mon2scd;
  endfunction
  task main;
    repeat(5)begin
      transaction tr;
      tr = new();
      #15;
      tr.d = vif.d;
      tr.clk = vif.clk;
      tr.rst = vif.rst;
      tr.q = vif.q;
      tr.qbar = vif.qbar;
      mon2scd.put(tr);
      tr.display("....monitor class signals...");
    end
  endtask
endclass