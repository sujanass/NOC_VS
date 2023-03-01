class S0_driver extends uvm_driver #(S0_seq_item);
    //virtual interface
    virtual S0_inf S0_intf;
    //seq_item handle
    S0_seq_item S0_seqi_inst;
    //factory regestration
    `uvm_component_utils (S0_driver)
	//default constructor
	function new (string name = "S0_driver",uvm_component parent = null);
	    super.new (name,parent);
	endfunction
	//buildphase 
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	    //create method
        S0_seqi_inst = S0_seq_item::type_id :: create ("S0_seqi_inst",this);
         // config db get method
         if(!uvm_config_db#(virtual S0_inf) :: get(this, "", "S0_inf", S0_intf))
        `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
  
    //run phase
    task run_phase (uvm_phase phase);

        S0_intf.S0_AWREADY <= 0;
        S0_intf.S0_WREADY <= 0;
        S0_intf.S0_BRESP <= 0;
        S0_intf.S0_BVALID <= 0;
        S0_intf.S0_ARREADY <= 0;
        S0_intf.S0_RDATA <= 0;
        S0_intf.S0_RRESP <= 0;
        S0_intf.S0_RVALID <= 0;
        S0_intf.S0_RLAST <= 0;
        S0_intf.S0_RREADY <= 0;
        S0_intf.S0_BID <= 0;
        S0_intf.S0_RID <= 0;

        forever begin
            // `uvm_info (get_type_name(),"in the slv driver",UVM_LOW);

            seq_item_port.get_next_item(S0_seqi_inst);
         
            if (S0_seqi_inst.is_write)
                rsp_to_write(S0_seqi_inst);
            else
                rsp_to_read(S0_seqi_inst);

            seq_item_port.item_done();
        end
    endtask  

    task rsp_to_write (S0_seq_item S0_seqi_inst);
        int i;
        int b_len;
        begin
            // assert aweady  
            wait (S0_intf.s0_awvalid);
            b_len = S0_intf.s0_awlen+1;
                    
            @(posedge S0_intf.ACLK);
            S0_intf.S0_drv_cb.S0_AWREADY <= S0_seqi_inst.S0_AWREADY;
            @(posedge S0_intf.ACLK);
            S0_intf.S0_drv_cb.S0_AWREADY <= 1'b0;


            wait (S0_intf.s0_wvalid);

            for (i = 0;i<b_len;i++) begin
                S0_intf.S0_drv_cb.S0_WREADY <= S0_seqi_inst.S0_WREADY;
                @(negedge S0_intf.ACLK);
               
            end
            //   wait (S0_intf.s0_bready);
            @(posedge S0_intf.ACLK);
            S0_intf.S0_drv_cb.S0_WREADY <= 1'b0; 
            S0_intf.S0_BID <= S0_seqi_inst.S0_BID;

            //@(posedge S0_intf.ACLK);

            if (S0_intf.S0_WSTRB == 4'hF) 
                S0_intf.S0_drv_cb.S0_BRESP <= S0_seqi_inst.S0_BRESP;
            else 
                S0_intf.S0_drv_cb.S0_BRESP <= 2'b10;

            @(posedge S0_intf.ACLK);         
            S0_intf.S0_drv_cb.S0_BVALID <= S0_seqi_inst.S0_BVALID;
            wait (S0_intf.s0_bready);
            @(posedge S0_intf.ACLK);

            S0_intf.S0_drv_cb.S0_BVALID <= 0;
        end
    endtask

    task rsp_to_read (S0_seq_item S0_seqi_inst);
        int i;
        int b_len;
        begin
            wait (S0_intf.s0_arvalid);
            b_len = S0_intf.s0_arlen+1;

            @(posedge S0_intf.ACLK);         
            S0_intf.S0_ARREADY <= S0_seqi_inst.S0_ARREADY;
       
            wait (!S0_intf.s0_arvalid)
            //@(posedge S0_intf.ACLK);         
            S0_intf.S0_ARREADY <= 0;
 
            // wait (S0_intf.S0_RREADY);
            for (i =0;i < b_len;i++) begin
                    
                S0_intf.S0_RID <= S0_seqi_inst.S0_RID;
                S0_intf.S0_RVALID <= S0_seqi_inst.S0_RVALID;
                S0_intf.S0_RDATA <= $random;
                S0_intf.S0_RLAST<= (i == b_len-1);
                S0_intf.S0_RRESP <= S0_seqi_inst.S0_RRESP;
                @(posedge S0_intf.ACLK); 
            end
            
            
            wait  (!S0_intf.S0_RREADY);
            //@(posedge S0_intf.ACLK);

            S0_intf.S0_RVALID <= 0;
            S0_intf.S0_RDATA <= 0;
            S0_intf.S0_RLAST<=0;
 
             
            
            // @(posedge S0_intf.ACLK);
             S0_intf.S0_RRESP <= 0; 

        end                         
    endtask
endclass

