class M0_agent extends uvm_agent;
   
    // components handels
    M0_driver   M0_drv;
    M0_monitor  M0_mon;
    M0_sequencer    M0_sqr;
    //factory regestration
    `uvm_component_utils (M0_agent)
    //default constructor
    function new (string name = "M0_agent",uvm_component parent = null);
        super.new (name,parent);
    endfunction
    //build phase
    function void build_phase (uvm_phase phase );
        super.build_phase(phase);
        //create the driver,sequencer,monitor
        M0_drv = M0_driver::type_id::create  ("M0_drv",this);
        M0_sqr = M0_sequencer::type_id::create   ("M0_sqr",this);    
        M0_mon = M0_monitor::type_id::create ("M0_mon",this);
    
     endfunction
     //connect phase
     function void connect_phase (uvm_phase phase);
         M0_drv.seq_item_port.connect(M0_sqr.seq_item_export);
     endfunction
    
endclass
