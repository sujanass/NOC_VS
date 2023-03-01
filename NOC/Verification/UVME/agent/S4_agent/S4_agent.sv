class S4_agent extends uvm_agent;
    //factory regestration
    `uvm_component_utils(S4_agent)
    //seq_item handle 
    S4_driver drv;
    S4_sequencer seqr;
    S4_monitor mon;
    //default constructor
    function new(string name = "S4_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);    
        drv = S4_driver::type_id::create("drv", this);
        seqr = S4_sequencer::type_id::create("seqr", this);    
        mon = S4_monitor::type_id::create("mon", this);
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        //driver_sequncer connection
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass
