class S5_monitor extends uvm_monitor;
    
    virtual S5_inf S5_intf;
  
    uvm_analysis_port #(S5_seq_item) item_collect_port;
  
    S5_seq_item mon_item;
    
    `uvm_component_utils(S5_monitor)
  
    function new(string name = "S5_monitor", uvm_component parent = null);
        super.new(name, parent);
        item_collect_port = new("item_collect_port", this);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual S5_inf) :: get(this, "", "S5_inf", S5_intf))
            `uvm_fatal(get_type_name(), "slave5 interface Not set at top level");
    endfunction
  
    task run_phase (uvm_phase phase);
            mon_item = S5_seq_item::type_id::create("mon_item");      
    
        forever begin
            @(posedge S5_intf.ACLK);
       
            if(S5_intf.S5_PSEL )
            begin
                mon_item.S5_PSEL = S5_intf.S5_PSEL;
                mon_item.S5_PWRITE = S5_intf.S5_PWRITE;
                mon_item.S5_PENABLE = S5_intf.S5_PENABLE;
                mon_item.S5_PREADY = S5_intf.S5_PREADY;
                mon_item.S5_PADDR = S5_intf.S5_PADDR;
                
                if (mon_item.S5_PWRITE) 
                begin
                    wait (S5_intf.S5_PREADY);
                    mon_item.S5_PDATA = S5_intf.S5_PDATA;
                    mon_item.S5_PSTRB = S5_intf.S5_PSTRB;
                    mon_item.S5_PSLVERR = S5_intf.S5_PSLVERR;
                end
                else
                begin
                    wait (S5_intf.S5_PREADY);
                    mon_item.S5_PSLVERR = S5_intf.S5_PSLVERR;          
                    mon_item.S5_PRDATA = S5_intf.S5_PRDATA;
                end

            end   
          
        item_collect_port.write(mon_item);
 
        end 
    endtask
endclass

