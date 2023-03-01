class S1_driver extends uvm_driver #(S1_seq_item);
    //virtual interface 
    virtual S1_inf S1_intf;
    //seq_item handel
    S1_seq_item S1_seqi_inst;
    //factory regestration
    `uvm_component_utils (S1_driver)
    //default constructor
    function new (string name = "S1_driver",uvm_component parent = null);
        super.new (name,parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);    
        S1_seqi_inst = S1_seq_item::type_id :: create ("S1_seqi_inst",this);
        //config db get method
        if(!uvm_config_db#(virtual S1_inf) :: get(this, "", "S1_inf", S1_intf))
        `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
    
    
    task run_phase (uvm_phase phase);
    
        S1_intf.S1_AWREADY <= 0;
        S1_intf.S1_WREADY <= 0;
        S1_intf.S1_BRESP <= 0;
        S1_intf.S1_BVALID <= 0;
        S1_intf.S1_ARREADY <= 0;
        S1_intf.S1_RDATA <= 0;
        S1_intf.S1_RRESP <= 0;
        S1_intf.S1_RVALID <= 0;
        S1_intf.S1_RLAST <= 0;
        S1_intf.S1_RREADY <= 0;
        S1_intf.S1_BID <= 0;
        S1_intf.S1_RID <= 0;
    
        forever begin
    
            seq_item_port.get_next_item(S1_seqi_inst);
    
            if (S1_seqi_inst.is_write)
                rsp_to_write(S1_seqi_inst);
            else
                rsp_to_read(S1_seqi_inst);
    
            seq_item_port.item_done();
        end
    endtask  
    
    task rsp_to_write (S1_seq_item S1_seqi_inst);
        int i;
        int b_len;
        begin
            // assert aweady  
            wait (S1_intf.S1_awvalid);
            b_len = S1_intf.S1_awlen+1;
    
            @(posedge S1_intf.ACLK);
            S1_intf.S1_drv_cb.S1_AWREADY <= S1_seqi_inst.S1_AWREADY;
            @(posedge S1_intf.ACLK);
            S1_intf.S1_drv_cb.S1_AWREADY <= 1'b0;
            S1_intf.S1_BID <= S1_seqi_inst.S1_BID;
    
    
            wait (S1_intf.S1_wvalid);
    
            for (i = 0;i<b_len;i++) begin
                S1_intf.S1_drv_cb.S1_WREADY <= S1_seqi_inst.S1_WREADY;
                @(negedge S1_intf.ACLK);    
            end
            @(posedge S1_intf.ACLK);
            S1_intf.S1_drv_cb.S1_WREADY <= 1'b0; 
    
            if ( S1_intf.S1_WSTRB) 
                S1_intf.S1_drv_cb.S1_BRESP <= S1_seqi_inst.S1_BRESP;
            else 
            S1_intf.S1_drv_cb.S1_BRESP <= 2'b10;
    
            @(posedge S1_intf.ACLK);
            S1_intf.S1_drv_cb.S1_BVALID <= S1_seqi_inst.S1_BVALID;
            wait (S1_intf.S1_bready);
            @(posedge S1_intf.ACLK);
    
            S1_intf.S1_drv_cb.S1_BVALID <= 0;
        end    
    endtask
    
    task rsp_to_read (S1_seq_item S1_seqi_inst);
        int i;
        int b_len;
        begin
            wait (S1_intf.S1_arvalid);
            b_len = S1_intf.S1_arlen+1;
            @(posedge S1_intf.ACLK);
            S1_intf.S1_ARREADY <= S1_seqi_inst.S1_ARREADY;
    
            wait (!S1_intf.S1_arvalid)
            //@(posedge S1_intf.ACLK);         
            S1_intf.S1_ARREADY <= 0;
    
            // wait (S1_intf.S1_RREADY);
            for (i =0;i < b_len;i++) begin
    
                S1_intf.S1_RID <= S1_seqi_inst.S1_RID;
                S1_intf.S1_RVALID <= S1_seqi_inst.S1_RVALID;
                S1_intf.S1_RDATA <= $random;
                S1_intf.S1_RLAST<= (i == b_len-1);
                S1_intf.S1_RRESP <= S1_seqi_inst.S1_RRESP;
                @(posedge S1_intf.ACLK); 
            end
    
            wait  (!S1_intf.S1_RREADY);
            //    @(posedge S1_intf.ACLK);
    
            S1_intf.S1_RVALID <= 0;
            S1_intf.S1_RDATA <= 0;
            S1_intf.S1_RLAST<=0;
    
            // @(posedge S1_intf.ACLK);
            S1_intf.S1_RRESP <= 0; 
        end                           
    endtask
endclass

