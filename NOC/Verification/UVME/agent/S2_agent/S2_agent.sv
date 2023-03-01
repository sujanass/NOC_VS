class S2_agent extends uvm_agent;
    //uvm_factory regestration
    `uvm_component_utils(S2_agent)
    //component handels
    S2_driver drv;
    S2_sequencer seqr;
    S2_monitor mon;
    //default constructor
    function new(string name = "S2_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        drv = S2_driver::type_id::create("drv", this);
        seqr = S2_sequencer::type_id::create("seqr", this);
        mon = S2_monitor::type_id::create("mon", this);
    endfunction
    //connect phase
    function void connect_phase(uvm_phase phase);
        //driver sequencer connection
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass

