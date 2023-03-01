class S3_agent extends uvm_agent;
    //factory regestration
    `uvm_component_utils(S3_agent)
    //component handels
    S3_driver drv;
    S3_sequencer seqr;
    S3_monitor mon;
    //default constructor
    function new(string name = "S3_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    
        drv = S3_driver::type_id::create("drv", this);
        seqr = S3_sequencer::type_id::create("seqr", this);
        mon = S3_monitor::type_id::create("mon", this);
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass

