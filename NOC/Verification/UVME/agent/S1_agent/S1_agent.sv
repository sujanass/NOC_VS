class S1_agent extends uvm_agent;
    
    //factory regestration
    `uvm_component_utils(S1_agent)
    //component handels
    S1_driver drv;
    S1_sequencer seqr;
    S1_monitor mon;
    //default constructor
    function new(string name = "S1_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //create method
        drv = S1_driver::type_id::create("drv", this);
        seqr = S1_sequencer::type_id::create("seqr", this);    
        mon = S1_monitor::type_id::create("mon", this);
    endfunction
  
    function void connect_phase(uvm_phase phase);
      drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass

