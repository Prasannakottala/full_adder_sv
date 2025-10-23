class generator;
  transaction tr;
  mailbox gen2drv;
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  task main;
    repeat(5) begin
      tr = new();
      tr.d = $random;
      tr.rst = $random;
      gen2drv.put(tr);
      tr.display("generator class signals");
    end
  endtask
endclass