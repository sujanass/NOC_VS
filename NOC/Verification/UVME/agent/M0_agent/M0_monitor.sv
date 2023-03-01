class M0_monitor extends uvm_monitor;

    virtual M0_inf M0_intf;    //interface handle
    
    uvm_analysis_port #(M0_seq_item) item_collect_port;  // uvm_analysis port
    //factory regestration
    `uvm_component_utils (M0_monitor)
    //seq_item handle
    M0_seq_item mon_item;
    
    //default constructor
    function new(string name = "M0_monitor", uvm_component parent = null);
        super.new(name, parent);
        //creating the analysis port using new
        item_collect_port = new("item_collect_port", this);
    endfunction
      
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //config db get method for interface
        if(!uvm_config_db#(virtual M0_inf) :: get(this, "", "M0_inf", M0_intf))
            `uvm_fatal(get_type_name(), "Not set at top level");
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
            
            M0_seq_item mon_item;
            mon_item = M0_seq_item::type_id::create("mon_item"); 
            @(posedge M0_intf.ACLK);
            
            //collecting the address channel data
            mon_item.M0_AWVALID = M0_intf.M0_AWVALID;
            mon_item.M0_WVALID = M0_intf.M0_WVALID;
            
            if (M0_intf.M0_AWVALID)
                begin
                    if (M0_intf.M0_AWREADY)
                    begin    
                        mon_item.M0_AWREADY = M0_intf.M0_AWREADY;
                        mon_item.M0_AWADDR = M0_intf.M0_AWADDR;
                        mon_item.M0_AWSIZE = M0_intf.M0_AWSIZE;
                        mon_item.M0_AWLEN = M0_intf.M0_AWLEN;
                        mon_item.M0_AWBURST = M0_intf.M0_AWBURST;
                    end    
                end
                
                // collecting the wdata
             if (M0_intf.M0_WVALID)
             begin
                if ( M0_intf.M0_WREADY)
                   begin
                       mon_item.M0_WREADY = M0_intf.M0_WREADY;
                       mon_item.M0_WDATA = M0_intf.M0_WDATA;
                       mon_item.M0_WSTRB = M0_intf.M0_WSTRB;
                       mon_item.M0_WLAST = M0_intf.M0_WLAST;
                       
                   end
              end     
                // write response
               if (M0_intf.M0_BVALID && M0_intf.M0_BREADY)
    
                   begin
                       mon_item.M0_BVALID = M0_intf.M0_BVALID;  
                       mon_item.M0_BREADY = M0_intf.M0_BREADY;  
                       mon_item.M0_BRESP = M0_intf.M0_BRESP;  
    
                   end 
            if (M0_intf.M0_ARVALID && M0_intf.M0_ARREADY) 
                    begin                      
                        mon_item.M0_MID = M0_intf.M0_MID;
                        mon_item.M0_ARVALID = M0_intf.M0_ARVALID;
                        mon_item.M0_ARREADY = M0_intf.M0_ARREADY;
                        mon_item.M0_ARADDR = M0_intf.M0_ARADDR;
                        mon_item.M0_ARSIZE = M0_intf.M0_ARSIZE;
                        mon_item.M0_ARLEN = M0_intf.M0_ARLEN;
                        mon_item.M0_ARBURST = M0_intf.M0_ARBURST;
             
                    end
                
            // collecting the wdata    
            if (M0_intf.M0_RVALID && M0_intf.M0_RREADY)
                    begin
                        mon_item.M0_RVALID = M0_intf.M0_RVALID;
                        mon_item.M0_RREADY = M0_intf.M0_RREADY;
                        mon_item.M0_RDATA = M0_intf.M0_RDATA;
                        mon_item.M0_RRESP = M0_intf.M0_RRESP;
                    //  mon_item.M0_RLAST = M0_intf.M0_RLAST;
                    end
/*
`uvm_info("NOC_MONITOR", $sformatf(
                    "Time: %0t | M0_AWVALID: %0d, M0_AWREADY: %0d, M0_AWADDR: %0h, M0_AWSIZE: %0h, M0_AWLEN: %0d, M0_AWBURST: %0d, M0_WVALID: %0d, M0_WREADY: %0d, M0_WDATA:%0h, M0_WSTRB: %0d, M0_WLAST: %0d, M0_BREADY: %0d, M0_BVALID: %0d, M0_BRESP: %0d, M0_ARVALID: %0d, M0_ARREADY: %0b, M0_ARADDR: %0b",
                    $realtime, mon_item.M0_AWVALID, mon_item.M0_AWREADY, mon_item.M0_AWADDR, mon_item.M0_AWSIZE, mon_item.M0_AWLEN,mon_item.M0_AWBURST, mon_item.M0_WVALID, mon_item.M0_WREADY, mon_item.M0_WDATA, mon_item.M0_WSTRB, mon_item.M0_WLAST, mon_item.M0_BREADY, mon_item.M0_BVALID, mon_item.M0_BRESP, mon_item.M0_ARVALID, mon_item.M0_ARREADY, mon_item.M0_ARADDR), UVM_LOW);
*/          
  //           `uvm_info(get_full_name,$sformatf("End of Monitor"),UVM_MEDIUM)

                item_collect_port.write(mon_item);
               // `uvm_info ("MASTER_1",$sformatf("printing from master monitor \n%s",mon_item.sprint()),UVM_LOW)
                                

        end
    endtask
             
    
endclass
 
