class S0_agent extends uvm_agent;
    //factory regestration
    `uvm_component_utils(S0_agent)
    //component handels
    S0_driver drv;
    S0_sequencer seqr;
    S0_monitor mon;
    //default constructor
    function new(string name = "S0_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //create method
        drv = S0_driver::type_id::create("drv", this);
        seqr = S0_sequencer::type_id::create("seqr", this);      
        mon = S0_monitor::type_id::create("mon", this);
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);    
    endfunction
endclass

