`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scd;
  mailbox gen2drv;
  mailbox mon2scd;
  virtual intf vif;
  function new(virtual intf vif);
    this.vif = vif;
    gen2drv = new();
    mon2scd = new();
    gen = new(gen2drv);
    drv = new(vif,gen2drv);
    mon = new(vif,mon2scd);
    scd = new(mon2scd);
  endfunction
  task run;
    repeat(5)begin
      transaction tr;
      tr = new();
      fork
        gen.main;
        drv.main;
        mon.main;
        scd.main;
      join
    end
  endtask
endclass
    
  