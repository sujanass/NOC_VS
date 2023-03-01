class M1_driver extends uvm_driver#(M1_seq_item);
    
    //virtual interface 
    virtual M1_inf  M1_intf;
    
    //seq_item handle
    M1_seq_item M1_seqi_inst;
    
    //factory registration
    `uvm_component_utils(M1_driver)
    
    //default constructor
    function new(string name = "M1_driver",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    
    //build phase
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        //seq_item
        M1_seqi_inst = M1_seq_item::type_id::create ("M1_seqi_inst",this);
        //config db get method
        if(!uvm_config_db#(virtual M1_inf) :: get(this,"", "M1_inf", M1_intf))
            `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
    
    
    //runphase 
    
    task run_phase (uvm_phase phase);
    
        `uvm_info (get_type_name,"M1_driver",UVM_LOW);
          
        forever begin
            seq_item_port.get_next_item (M1_seqi_inst);
             
            if (!M1_seqi_inst.m1_burst)
                begin
                    if (M1_seqi_inst.wrt_e)
                        drive_write (M1_seqi_inst);
                    else
                        drive_read (M1_seqi_inst);
                end
            else 
                begin
                    if (M1_seqi_inst.wrt_e)
                        drive_bwrite (M1_seqi_inst);
                    else
                        drive_rburst (M1_seqi_inst);
                end
                    
            seq_item_port.item_done();
        end
    endtask
    
    //write task    
    task drive_write (M1_seq_item M1_seqi_inst);
        int i;
        int burst_length;
    
        burst_length = M1_seqi_inst.M1_AWLEN+1;
         
        // drive write address
        begin
    
            repeat(4) @(posedge M1_intf.ACLK); 
            M1_intf.M1_MID <= M1_seqi_inst.M1_MID;
            M1_intf.M1_drv_cb.M1_AWVALID <= M1_seqi_inst.M1_AWVALID;
            M1_intf.M1_drv_cb.M1_AWADDR  <= M1_seqi_inst.M1_AWADDR;
            M1_intf.M1_drv_cb.M1_AWLEN   <= M1_seqi_inst.M1_AWLEN;
            M1_intf.M1_drv_cb.M1_AWBURST <= M1_seqi_inst.M1_AWBURST;
            M1_intf.M1_drv_cb.M1_AWSIZE <= M1_seqi_inst.M1_AWSIZE;
    
            //wait for AWREADY
             @(posedge M1_intf.ACLK);
            wait (M1_intf.M1_drv_cb.M1_AWREADY);
    
            //  deassert the aw channel 
            M1_intf.M1_drv_cb.M1_AWVALID <= 0;
            M1_intf.M1_drv_cb.M1_AWADDR  <= 0;
            M1_intf.M1_drv_cb.M1_AWLEN   <= 0;
            M1_intf.M1_drv_cb.M1_AWBURST <= 0;
            M1_intf.M1_drv_cb.M1_AWSIZE <=  0;
       
            //drive write data
            for (i=0;i<burst_length;i++) begin 
                M1_intf.M1_drv_cb.M1_WVALID <=  M1_seqi_inst.M1_WVALID;
                M1_intf.M1_drv_cb.M1_WDATA  <=  $random;
                M1_intf.M1_drv_cb.M1_WSTRB <=   M1_seqi_inst.M1_WSTRB;
                M1_intf.M1_drv_cb.M1_WLAST <=  (i == burst_length-1);
                @(posedge M1_intf.ACLK);
            end
         
    
            wait (M1_intf.M1_drv_cb.M1_WREADY);
            // deassert wchannel   
      //     wait for wready
            M1_intf.M1_drv_cb.M1_WVALID <= 0;
            M1_intf.M1_drv_cb.M1_WDATA <=   0;
            M1_intf.M1_drv_cb.M1_WLAST <=   0;
            M1_intf.M1_drv_cb.M1_WSTRB <=   0;
    
            
              //drive rsp channel
              repeat(2) @(posedge M1_intf.ACLK);  
              M1_intf.M1_drv_cb.M1_BREADY <=  M1_seqi_inst.M1_BREADY;
              @(posedge M1_intf.ACLK);  
              wait (M1_intf.M1_drv_cb.M1_BVALID);
              M1_intf.M1_drv_cb.M1_BREADY <= 0;
        end
    endtask 
    
    task drive_read (M1_seq_item M1_seqi_inst);
        int i;
        int burst_length;
        begin
            repeat (4) @(posedge M1_intf.ACLK);
            M1_intf.M1_MID <= M1_seqi_inst.M1_MID;
            M1_intf.M1_drv_cb.M1_ARVALID <= M1_seqi_inst.M1_ARVALID;
            M1_intf.M1_drv_cb.M1_ARADDR <= M1_seqi_inst.M1_ARADDR;
            M1_intf.M1_drv_cb.M1_ARLEN <= M1_seqi_inst.M1_ARLEN;
            M1_intf.M1_drv_cb.M1_ARBURST <= M1_seqi_inst.M1_ARBURST;
            M1_intf.M1_drv_cb.M1_ARSIZE <= M1_seqi_inst.M1_ARSIZE;
            
            //wait for arready
            //  @(posedge M1_intf.ACLK);
            wait(M1_intf.M1_drv_cb.M1_ARREADY);
            burst_length = M1_intf.M1_drv_cb.M1_ARLEN +1;          
            //deassert the ar signals
            M1_intf.M1_drv_cb.M1_ARVALID <= 0;
            M1_intf.M1_drv_cb.M1_ARADDR <= 0;
            M1_intf.M1_drv_cb.M1_ARLEN <= 0;
            M1_intf.M1_drv_cb.M1_ARBURST <= 0;
            M1_intf.M1_drv_cb.M1_ARSIZE <= 0;
            M1_intf.M1_drv_cb.M1_RREADY <= M1_seqi_inst.M1_RREADY;
    
       
            for (i = 0;i< burst_length;i++) begin
                @(posedge M1_intf.ACLK);
                wait(M1_intf.M1_drv_cb.M1_RVALID);
            end
    
            M1_intf.M1_drv_cb.M1_RREADY <= 1'b0;
        end
    endtask
    
    // apb_write_burst 
    task drive_bwrite (M1_seq_item M1_seqi_inst);
        int i;
        int burst_length;
    
        burst_length = M1_seqi_inst.M1_AWLEN+1;
         
        // drive write address
       begin    
           repeat(4) @(posedge M1_intf.ACLK); 
           M1_intf.M1_MID <= M1_seqi_inst.M1_MID;
           M1_intf.M1_drv_cb.M1_AWVALID <= M1_seqi_inst.M1_AWVALID;
           M1_intf.M1_drv_cb.M1_AWADDR  <= M1_seqi_inst.M1_AWADDR;
           M1_intf.M1_drv_cb.M1_AWLEN   <= M1_seqi_inst.M1_AWLEN;
           M1_intf.M1_drv_cb.M1_AWBURST <= M1_seqi_inst.M1_AWBURST;
           M1_intf.M1_drv_cb.M1_AWSIZE <= M1_seqi_inst.M1_AWSIZE;
    
           //wait for AWREADY
           // @(posedge M1_intf.ACLK);
           wait (M1_intf.M1_drv_cb.M1_AWREADY);
           //deassert aw signals 
           M1_intf.M1_drv_cb.M1_AWVALID <= 0;
           M1_intf.M1_drv_cb.M1_AWADDR  <= 0;
           M1_intf.M1_drv_cb.M1_AWLEN   <= 0;
           M1_intf.M1_drv_cb.M1_AWBURST <= 0;
           M1_intf.M1_drv_cb.M1_AWSIZE <=  0;
       
           //drive write data
           for(i=0;i<burst_length;i++) begin 
               M1_intf.M1_drv_cb.M1_WVALID <=  M1_seqi_inst.M1_WVALID;
               M1_intf.M1_drv_cb.M1_WDATA  <=  $random;
               M1_intf.M1_drv_cb.M1_WSTRB <=   M1_seqi_inst.M1_WSTRB;
               M1_intf.M1_drv_cb.M1_WLAST <=  (i == burst_length-1);
               @(posedge M1_intf.ACLK);
               M1_intf.M1_drv_cb.M1_WLAST <=   0;
               
               if (M1_intf.M1_drv_cb.M1_WLAST) 
                   begin
                       M1_intf.M1_drv_cb.M1_WVALID <= 0;
                       M1_intf.M1_drv_cb.M1_WDATA <=   0;
                       M1_intf.M1_drv_cb.M1_WSTRB <=   0;
                       M1_intf.M1_drv_cb.M1_BREADY <=  M1_seqi_inst.M1_BREADY;
                   end
               while (!M1_intf.M1_drv_cb.M1_WREADY)  @(posedge M1_intf.ACLK);       
               //  @(posedge M1_intf.ACLK);
           end
    
           //drive rsp channel
    
           wait (M1_intf.M1_drv_cb.M1_BVALID);
           M1_intf.M1_drv_cb.M1_BREADY <= 0;
        end
    endtask 
    
    
    task drive_rburst (M1_seq_item M1_seqi_inst);
        int i;
        int burst_length;
    
        begin
            repeat (4) @(posedge M1_intf.ACLK);
            M1_intf.M1_MID <= M1_seqi_inst.M1_MID;
            M1_intf.M1_drv_cb.M1_ARVALID <= M1_seqi_inst.M1_ARVALID;
            M1_intf.M1_drv_cb.M1_ARADDR <= M1_seqi_inst.M1_ARADDR;
            M1_intf.M1_drv_cb.M1_ARLEN <= M1_seqi_inst.M1_ARLEN;
            M1_intf.M1_drv_cb.M1_ARBURST <= M1_seqi_inst.M1_ARBURST;
            M1_intf.M1_drv_cb.M1_ARSIZE <= M1_seqi_inst.M1_ARSIZE;
            
            //wait for arready
            // @(posedge M1_intf.ACLK);
            wait  (M1_intf.M1_drv_cb.M1_ARREADY);
            burst_length = M1_intf.M1_drv_cb.M1_ARLEN +1;          
            M1_intf.M1_drv_cb.M1_ARVALID <= 0;
            M1_intf.M1_drv_cb.M1_ARADDR <= 0;
            M1_intf.M1_drv_cb.M1_ARLEN <= 0;
            M1_intf.M1_drv_cb.M1_ARBURST <= 0;
            M1_intf.M1_drv_cb.M1_ARSIZE <= 0;
            M1_intf.M1_drv_cb.M1_RREADY <= M1_seqi_inst.M1_RREADY;
    
            @(posedge M1_intf.ACLK);
    
            for (i = 0;i< burst_length;i++) begin
                @(posedge M1_intf.ACLK); 
                while (!M1_intf.M1_drv_cb.M1_RVALID) @(posedge M1_intf.ACLK);  
                    
            end
            M1_intf.M1_drv_cb.M1_RREADY <= 1'b0;
        end
    endtask
endclass
  

