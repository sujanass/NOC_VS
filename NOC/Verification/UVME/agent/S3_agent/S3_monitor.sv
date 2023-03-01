class S3_monitor extends uvm_monitor;
    //virtual interface
    virtual S3_inf S3_intf;
    //analysis port
    uvm_analysis_port #(S3_seq_item) item_collect_port;
    //seq_item handle
    S3_seq_item mon_item;
    //factory regestration
    `uvm_component_utils(S3_monitor)
  
    function new(string name = "S3_monitor", uvm_component parent = null);
        super.new(name, parent);
        item_collect_port = new("item_collect_port", this);

    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual S3_inf) :: get(this, "", "S3_inf", S3_intf))
        `uvm_fatal(get_type_name(), "slave2 interface Not set at top level");
    endfunction
  
    task run_phase (uvm_phase phase);
            mon_item = S3_seq_item::type_id::create("mon_item");      
    
        forever begin
            @(posedge S3_intf.ACLK);
       
            if(S3_intf.S3_PSEL )
            begin
                mon_item.S3_PSEL = S3_intf.S3_PSEL;
                mon_item.S3_PENABLE = S3_intf.S3_PENABLE;
                mon_item.S3_PWRITE = S3_intf.S3_PWRITE;
                mon_item.S3_PREADY = S3_intf.S3_PREADY;
                mon_item.S3_PADDR = S3_intf.S3_PADDR;
                if (mon_item.S3_PWRITE) 
                begin
                    wait (S3_intf.S3_PREADY);
                    mon_item.S3_PDATA = S3_intf.S3_PDATA;
                    mon_item.S3_PSTRB = S3_intf.S3_PSTRB;
                    mon_item.S3_PSLVERR = S3_intf.S3_PSLVERR;
                end
                else
                begin
                    wait (S3_intf.S3_PREADY);
                    mon_item.S3_PRDATA = S3_intf.S3_PRDATA;
                    mon_item.S3_PSLVERR = S3_intf.S3_PSLVERR;
                end
            end
          
            item_collect_port.write(mon_item);
        end
    endtask
endclass

