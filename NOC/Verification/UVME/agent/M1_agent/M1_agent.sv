class M1_agent extends uvm_agent;

    //component handels
    M1_driver    M1_drv;
    M1_monitor   M1_mon;
    M1_sequencer M1_sqr;
    //factory regestration
    `uvm_component_utils (M1_agent)
    
    //deafult construction
    function new (string name = "M1_agent",uvm_component parent = null);
        super.new (name,parent);
    endfunction
    
    //build phase
    function void build_phase (uvm_phase phase );
        super.build_phase(phase);
    
      //create the components
      M1_drv = M1_driver::type_id::create   ("M1_drv",this);
      M1_sqr = M1_sequencer::type_id::create("M1_sqr",this);    
      M1_mon = M1_monitor::type_id::create  ("M1_mon",this);
    endfunction
    
    //connect phase
    function void connect_phase (uvm_phase phase);
        //driver & sequencer connection
        M1_drv.seq_item_port.connect(M1_sqr.seq_item_export);
    
    endfunction

endclass
