class M1_monitor extends uvm_monitor;

    virtual M1_inf M1_intf;    //interface handle
    
    uvm_analysis_port #(M1_seq_item) item_collect_port;  // uvm_analysis port
    //factory registration 
    `uvm_component_utils (M1_monitor)
    //seq_item handle
    M1_seq_item mon_item;
    
    //default constructor
    function new(string name = "M1_monitor", uvm_component parent = null);
       super.new(name, parent);
       //create for analysis port
       item_collect_port = new("item_collect_port", this);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       //confid db get method
       if(!uvm_config_db#(virtual M1_inf) :: get(this, "", "M1_inf", M1_intf))
       `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
    
    task run_phase (uvm_phase phase);
        forever begin
            fork
                write_transactions();
                read_transaction();
            join
        end
    endtask
    
    task write_transactions ();
        begin
            mon_item = M1_seq_item::type_id::create("mon_item"); 
            @(posedge M1_intf.ACLK);
    
            //collecting the address channel data
            if (M1_intf.M1_AWVALID && M1_intf.M1_AWREADY) 
            begin 
    
                mon_item.M1_MID = M1_intf.M1_MID;
                mon_item.M1_AWVALID = M1_intf.M1_AWVALID;
                mon_item.M1_AWREADY = M1_intf.M1_AWREADY;
                mon_item.M1_AWADDR = M1_intf.M1_AWADDR;
                mon_item.M1_AWSIZE = M1_intf.M1_AWSIZE;
                mon_item.M1_AWLEN = M1_intf.M1_AWLEN;
                mon_item.M1_AWBURST = M1_intf.M1_AWBURST;
            end
    
            // collecting the wdata    
            if (M1_intf.M1_WVALID && M1_intf.M1_WREADY)
            begin
                mon_item.M1_WVALID= M1_intf.M1_WVALID;
                mon_item.M1_WREADY= M1_intf.M1_WREADY;
                mon_item.M1_WDATA = M1_intf.M1_WDATA;
                mon_item.M1_WSTRB = M1_intf.M1_WSTRB;
                mon_item.M1_WLAST = M1_intf.M1_WLAST;
    
            end
            // write response
            if (M1_intf.M1_BVALID && M1_intf.M1_BREADY)
            begin
                mon_item.M1_BVALID = M1_intf.M1_BVALID;  
                mon_item.M1_BREADY = M1_intf.M1_BREADY;  
                mon_item.M1_BRESP = M1_intf.M1_BRESP;  
    
            end  
            //write method
            item_collect_port.write(mon_item);
            //mon_item.print();
    
       end
    endtask
    
    task read_transaction();
        //collecting the address channel data
        if (M1_intf.M1_ARVALID && M1_intf.M1_ARREADY) 
            begin                  
                mon_item.M1_MID = M1_intf.M1_MID;
                mon_item.M1_ARVALID = M1_intf.M1_ARVALID;
                mon_item.M1_ARREADY = M1_intf.M1_ARREADY;
                mon_item.M1_ARADDR = M1_intf.M1_ARADDR;
                mon_item.M1_ARSIZE = M1_intf.M1_ARSIZE;
                mon_item.M1_ARLEN = M1_intf.M1_ARLEN;
                mon_item.M1_ARBURST = M1_intf.M1_ARBURST;
    
            end
    
        // collecting the wdata    
        if (M1_intf.M1_RVALID && M1_intf.M1_RREADY)
            begin
                mon_item.M1_RVALID = M1_intf.M1_RVALID;
                mon_item.M1_RREADY = M1_intf.M1_RREADY;
                mon_item.M1_RDATA = M1_intf.M1_RDATA;
                mon_item.M1_RRESP = M1_intf.M1_RRESP;
                //  mon_item.M1_RLAST = M1_intf.M1_RLAST;
            end
    
        item_collect_port.write(mon_item);
    endtask

endclass

