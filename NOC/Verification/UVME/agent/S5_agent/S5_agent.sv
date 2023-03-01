class S5_agent extends uvm_agent;
    `uvm_component_utils(S5_agent)
  
    S5_driver drv;
    S5_sequencer seqr;
    S5_monitor mon;
  
    function new(string name = "S5_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);    
        drv = S5_driver::type_id::create("drv", this);
        seqr = S5_sequencer::type_id::create("seqr", this);    
        mon = S5_monitor::type_id::create("mon", this);
    endfunction
  
    function void connect_phase(uvm_phase phase);
      //driver sequencer connection 
      drv.seq_item_port.connect(seqr.seq_item_export);
   
    endfunction
endclass
