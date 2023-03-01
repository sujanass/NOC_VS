class S2_monitor extends uvm_monitor;
    //virtual interface
    virtual S2_inf S2_intf;
    //analysis port
    uvm_analysis_port #(S2_seq_item) item_collect_port;
    //seq_item handle
    S2_seq_item mon_item;
    //factory regestration
    `uvm_component_utils(S2_monitor)
    
    //default constructor
    function new(string name = "S2_monitor", uvm_component parent = null);
        super.new(name, parent);
        item_collect_port = new("item_collect_port", this);
    endfunction

    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //uvm_config db get method
        if(!uvm_config_db#(virtual S2_inf) :: get(this, "", "S2_inf", S2_intf))
        `uvm_fatal(get_type_name(), "slave2 interface Not set at top level");
    endfunction
  
    task run_phase (uvm_phase phase);
            mon_item = S2_seq_item::type_id::create("mon_item");      
    
        forever begin
            @(posedge S2_intf.ACLK);
       
            if(S2_intf.S2_PSEL )
                begin
                    mon_item.S2_PWRITE = S2_intf.S2_PWRITE;
                    mon_item.S2_PENABLE = S2_intf.S2_PENABLE;
                    mon_item.S2_PREADY = S2_intf.S2_PREADY;
                    mon_item.S2_PSEL = S2_intf.S2_PSEL;
                    mon_item.S2_PADDR = S2_intf.S2_PADDR;
                    
                if (mon_item.S2_PWRITE) 
                begin
                    //collecting the write data
                    wait (S2_intf.S2_PREADY);
                    mon_item.S2_PDATA = S2_intf.S2_PDATA;
                    mon_item.S2_PSTRB = S2_intf.S2_PSTRB;
                    mon_item.S2_PSLVERR = S2_intf.S2_PSLVERR;
                end
                else
                begin
                    //collecting the read data
                    wait (S2_intf.S2_PREADY);
                    mon_item.S2_PSLVERR = S2_intf.S2_PSLVERR;
                    mon_item.S2_PRDATA = S2_intf.S2_PRDATA;
                end

            end
/*

`uvm_info("S2_monitor", $sformatf(
                    "Time: %0t | S2_PSEL: %0d, S2_PENABLE: %0d, S2_PREADY: %0d, S2_PWRITE: %0d, S2_PADDR: %0h, S2_PSTRB: %0b, S2_PDATA: %0h, S2_PSLVERR: %0d, S2_PRDATA:%0h",
                    $realtime, mon_item.S2_PSEL, mon_item.S2_PENABLE, mon_item.S2_PREADY, mon_item.S2_PWRITE, mon_item.S2_PADDR,mon_item.S2_PSTRB, mon_item.S2_PDATA, mon_item.S2_PSLVERR, mon_item.S2_PRDATA), UVM_LOW);
*/
            //write method      
            item_collect_port.write(mon_item);
        end  
    endtask
endclass

