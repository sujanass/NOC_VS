class S0_monitor extends uvm_monitor;
    //virtual interface
    virtual S0_inf S0_intf;
    //uvm_analysis port
    uvm_analysis_port #(S0_seq_item) item_collect_port;
    //seq_item handel
    S0_seq_item mon_item;
    //factory regestration
    `uvm_component_utils(S0_monitor)
    //default constructor
    function new(string name = "S0_monitor", uvm_component parent = null);
        super.new(name, parent);
        item_collect_port = new("item_collect_port", this);
    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //config db get method
        if(!uvm_config_db#(virtual S0_inf) :: get(this, "", "S0_inf", S0_intf))
        `uvm_fatal(get_type_name(), "slave0 interface Not set at top level");
    endfunction
    
    
    task run_phase (uvm_phase phase);
        forever begin
            fork
                collect_data();
            join
        end
    endtask
    
    task collect_data ();
        begin
            mon_item = S0_seq_item::type_id::create("mon_item");
            @(posedge S0_intf.ACLK);
            //collecting the address channel data
            if (S0_intf.s0_awvalid && S0_intf.S0_AWREADY) 
                begin
                    mon_item.s0_awvalid = S0_intf.s0_awvalid;
                    mon_item.S0_AWREADY = S0_intf.S0_AWREADY;
                    mon_item.S0_AWADDR = S0_intf.S0_AWADDR;
                    mon_item.S0_AWSIZE = S0_intf.S0_AWSIZE;
                    mon_item.s0_awlen = S0_intf.s0_awlen;
                    mon_item.S0_AWBURST = S0_intf.S0_AWBURST;
                end
    
                // collecting the wdata    
                if (S0_intf.s0_wvalid && S0_intf.S0_WREADY)
                begin
                    mon_item.s0_wvalid = S0_intf.s0_wvalid;
                    mon_item.S0_WREADY = S0_intf.S0_WREADY;
                    mon_item.S0_WDATA = S0_intf.S0_WDATA;
                    mon_item.S0_WSTRB = S0_intf.S0_WSTRB;
                    mon_item.S0_WLAST = S0_intf.S0_WLAST;
    
                end 
                // write response
                if (S0_intf.S0_BVALID && S0_intf.s0_bready)
                begin
                    mon_item.S0_BID = S0_intf.S0_BID;
                    mon_item.S0_BVALID = S0_intf.S0_BVALID;  
                    mon_item.s0_bready = S0_intf.s0_bready;  
                    mon_item.S0_BRESP = S0_intf.S0_BRESP;  
    
                end 

            if (S0_intf.s0_arvalid && S0_intf.S0_ARREADY) 
            begin 
    
                mon_item.s0_arvalid = S0_intf.s0_arvalid;
                mon_item.S0_ARREADY = S0_intf.S0_ARREADY;
                mon_item.S0_ARADDR = S0_intf.S0_ARADDR;
                mon_item.S0_ARSIZE = S0_intf.S0_ARSIZE;
                mon_item.s0_arlen = S0_intf.s0_arlen;
                mon_item.S0_ARBURST = S0_intf.S0_ARBURST;
            end 
    
            // collecting the wdata    
            if (S0_intf.S0_RVALID && S0_intf.S0_RREADY)
            begin
                mon_item.S0_RID = S0_intf.S0_RID;
                mon_item.S0_RVALID = S0_intf.S0_RVALID;
                mon_item.S0_RREADY = S0_intf.S0_RREADY;
                mon_item.S0_RDATA = S0_intf.S0_RDATA;
                mon_item.S0_RRESP = S0_intf.S0_RRESP;
                mon_item.S0_RLAST = S0_intf.S0_RLAST;
            end
    
            //  mon_item.print();
            item_collect_port.write(mon_item);
           // `uvm_info ("SLAVE_0 ",$sformatf("slv0 MONITOR data \n %0s",mon_item.sprint()),UVM_LOW); 
         end
    endtask
    
endclass
