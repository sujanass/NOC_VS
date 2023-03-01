class S4_monitor extends uvm_monitor;
    //virtual interface
    virtual S4_inf S4_intf;
    //uvm_analysis port
    uvm_analysis_port #(S4_seq_item) item_collect_port;
    //seq_item handle
    S4_seq_item mon_item;
    //factory regestrartion
    `uvm_component_utils(S4_monitor)
  
    function new(string name = "S4_monitor", uvm_component parent = null);
        super.new(name, parent);
        item_collect_port = new("item_collect_port", this);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual S4_inf) :: get(this, "", "S4_inf", S4_intf))
            `uvm_fatal(get_type_name(), "slave2 interface Not set at top level");
    endfunction
  
    task run_phase (uvm_phase phase);
            mon_item = S4_seq_item::type_id::create("mon_item");      
    
        forever begin
            @(posedge S4_intf.ACLK);
       
            if(S4_intf.S4_PSEL )
            begin
                mon_item.S4_PSEL = S4_intf.S4_PSEL;
                mon_item.S4_PWRITE = S4_intf.S4_PWRITE;
                mon_item.S4_PENABLE = S4_intf.S4_PENABLE;
                mon_item.S4_PREADY = S4_intf.S4_PREADY;
                mon_item.S4_PADDR = S4_intf.S4_PADDR;
            if (mon_item.S4_PWRITE) 
            begin
                wait (S4_intf.S4_PREADY);
                mon_item.S4_PDATA = S4_intf.S4_PDATA;  
                mon_item.S4_PSTRB = S4_intf.S4_PSTRB;
                mon_item.S4_PSLVERR = S4_intf.S4_PSLVERR;
            end
            else
            begin
                wait (S4_intf.S4_PREADY);
                mon_item.S4_PSLVERR = S4_intf.S4_PSLVERR;
                mon_item.S4_PRDATA = S4_intf.S4_PRDATA;
            end
        end
          
        item_collect_port.write(mon_item);
 
        end 
    endtask
endclass

