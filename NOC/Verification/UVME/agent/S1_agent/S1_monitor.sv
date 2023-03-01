class S1_monitor extends uvm_monitor;
    //virtual interface
    virtual S1_inf S1_intf;
    //analysis port
    uvm_analysis_port #(S1_seq_item) item_collect_port;
    //seq_item handle
    S1_seq_item mon_item;
    //factory regestration
    `uvm_component_utils(S1_monitor)
    //default constructor
    function new(string name = "S1_monitor", uvm_component parent = null);
        super.new(name, parent);
        //new method
        item_collect_port = new("item_collect_port", this);
        mon_item = new();
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //config db get method
        if(!uvm_config_db#(virtual S1_inf) :: get(this, "", "S1_inf", S1_intf))
        `uvm_fatal(get_type_name(), "slave1 interface Not set at top level");
    endfunction
    
    //runphase
    task run_phase (uvm_phase phase);
        forever begin
            fork
                collect_data();
            join
        end
    endtask

    task collect_data();
        begin
            mon_item = S1_seq_item::type_id::create("mon_item");      
            @(posedge S1_intf.ACLK);
        
            //collecting the address channel data
            if (S1_intf.S1_awvalid && S1_intf.S1_AWREADY) 
            begin                  
                mon_item.S1_AWREADY = S1_intf.S1_AWREADY;
                mon_item.S1_awvalid = S1_intf.S1_awvalid;
                mon_item.S1_AWADDR = S1_intf.S1_AWADDR;
                mon_item.S1_AWSIZE = S1_intf.S1_AWSIZE;
                mon_item.S1_awlen = S1_intf.S1_awlen;
                mon_item.S1_AWBURST = S1_intf.S1_AWBURST;
            end
            
            // collecting the wdata    
            if (S1_intf.S1_wvalid && S1_intf.S1_WREADY)
                begin
                    mon_item.S1_wvalid = S1_intf.S1_wvalid;
                    mon_item.S1_WREADY = S1_intf.S1_WREADY;
                    mon_item.S1_WDATA = S1_intf.S1_WDATA;
                    mon_item.S1_WSTRB = S1_intf.S1_WSTRB;
                    mon_item.S1_WLAST = S1_intf.S1_WLAST;              
                end 
            // write response
            if (S1_intf.S1_BVALID && S1_intf.S1_bready)
                begin
                    mon_item.S1_BID = S1_intf.S1_BID;  
                    mon_item.S1_BVALID = S1_intf.S1_BVALID;  
                    mon_item.S1_bready = S1_intf.S1_bready;  
                    mon_item.S1_BRESP = S1_intf.S1_BRESP;  
                end 


            //collecting the address channel data
            if (S1_intf.S1_arvalid && S1_intf.S1_ARREADY) 
                begin                  
                    mon_item.S1_arvalid = S1_intf.S1_arvalid;
                    mon_item.S1_ARREADY = S1_intf.S1_ARREADY;
                    mon_item.S1_ARADDR = S1_intf.S1_ARADDR;
                    mon_item.S1_ARSIZE = S1_intf.S1_ARSIZE;
                    mon_item.S1_arlen = S1_intf.S1_arlen;
                    mon_item.S1_ARBURST = S1_intf.S1_ARBURST;
             
                end 
                
            // collecting the wdata    
            if (S1_intf.S1_RVALID && S1_intf.S1_RREADY)
                begin
                    mon_item.S1_RID = S1_intf.S1_RID;
                    mon_item.S1_RVALID = S1_intf.S1_RVALID;
                    mon_item.S1_RREADY = S1_intf.S1_RREADY;
                    mon_item.S1_RDATA = S1_intf.S1_RDATA;
                    mon_item.S1_RRESP = S1_intf.S1_RRESP;
                    mon_item.S1_RLAST = S1_intf.S1_RLAST;
                end

            item_collect_port.write(mon_item);
            //`uvm_info ("SLAVE_1 ",$sformatf("slv1 MONITOR data \n %0s",mon_item.sprint()),UVM_LOW); 
           
        end
    endtask
   endclass
