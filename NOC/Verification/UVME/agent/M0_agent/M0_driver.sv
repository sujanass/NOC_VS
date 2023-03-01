class M0_driver extends uvm_driver#(M0_seq_item);

    //virtual interface 
    virtual M0_inf M0_intf;
    
    //seq_item handle
    M0_seq_item M0_seqi_inst;
    
    //factory registration
    `uvm_component_utils(M0_driver)
    
    //default constructor
    function new(string name = "M0_driver",uvm_component parent = null);
       super.new(name,parent);
    endfunction
    
    //build phase
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        //create the seq_item
    //    M0_seqi_inst = M0_seq_item::type_id::create ("M0_seqi_inst",this);
        //config db get method
        if(!uvm_config_db#(virtual M0_inf) :: get(this,"", "M0_inf", M0_intf))
            `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
    
    
    //runphase 
    
     task run_phase (uvm_phase phase);
    
         forever begin
             seq_item_port.get_next_item (M0_seqi_inst);
              
                if (!M0_seqi_inst.m0_burst)
                    begin
                        if (M0_seqi_inst.wrt_e)
                            drive_write (M0_seqi_inst);
                        else
                            drive_read (M0_seqi_inst);
                    end
                else 
                    begin
                        if (M0_seqi_inst.wrt_e)
                            drive_bwrite (M0_seqi_inst);
                        else
                            drive_rburst (M0_seqi_inst);
                    end
                        
             seq_item_port.item_done();
         end
     endtask
    
     //write task for axi slaves
    
     task drive_write (M0_seq_item M0_seqi_inst);
        int i;
        int burst_length;
        
        burst_length = M0_seqi_inst.M0_AWLEN+1;
         
       // drive write address
       begin    
           repeat(4) @(posedge M0_intf.ACLK); 
           M0_intf.M0_MID <= M0_seqi_inst.M0_MID;
           M0_intf.M0_drv_cb.M0_AWVALID <= M0_seqi_inst.M0_AWVALID;
           M0_intf.M0_drv_cb.M0_AWADDR  <= M0_seqi_inst.M0_AWADDR;
           M0_intf.M0_drv_cb.M0_AWLEN   <= M0_seqi_inst.M0_AWLEN;
           M0_intf.M0_drv_cb.M0_AWBURST <= M0_seqi_inst.M0_AWBURST;
           M0_intf.M0_drv_cb.M0_AWSIZE <= M0_seqi_inst.M0_AWSIZE;
    
           //wait for AWREADY
           @(posedge M0_intf.ACLK);
           wait (M0_intf.M0_drv_cb.M0_AWREADY);
    
           //  deassert the aw channel 
           M0_intf.M0_drv_cb.M0_AWVALID <= 0;
           M0_intf.M0_drv_cb.M0_AWADDR  <= 0;
           M0_intf.M0_drv_cb.M0_AWLEN   <= 0;
           M0_intf.M0_drv_cb.M0_AWBURST <= 0;
           M0_intf.M0_drv_cb.M0_AWSIZE <=  0;
           
           //drive write data
           for (i=0;i<burst_length;i++) begin 
               M0_intf.M0_drv_cb.M0_WVALID <=  M0_seqi_inst.M0_WVALID;
               M0_intf.M0_drv_cb.M0_WDATA  <=  $random;
               M0_intf.M0_drv_cb.M0_WSTRB <=   M0_seqi_inst.M0_WSTRB;
               M0_intf.M0_drv_cb.M0_WLAST <=  (i == burst_length-1);
               @(posedge M0_intf.ACLK);
           end
           //wait for wready      
           wait (M0_intf.M0_drv_cb.M0_WREADY);
           // deassert wchannel signals             
           M0_intf.M0_drv_cb.M0_WVALID <= 0;
           M0_intf.M0_drv_cb.M0_WDATA <=   0;
           M0_intf.M0_drv_cb.M0_WLAST <=   0;
           M0_intf.M0_drv_cb.M0_WSTRB <=   0;
                
           //drive rsp channel
           repeat(2) @(posedge M0_intf.ACLK);  
           M0_intf.M0_drv_cb.M0_BREADY <=  M0_seqi_inst.M0_BREADY;
           @(posedge M0_intf.ACLK);  
           wait (M0_intf.M0_drv_cb.M0_BVALID);
           M0_intf.M0_drv_cb.M0_BREADY <= 0;
        end
    endtask 
    
    //read task for axi slaves
    task drive_read (M0_seq_item M0_seqi_inst);
        int i;
        int burst_length;
        //read address channel
        begin
            repeat (4) @(posedge M0_intf.ACLK);
            M0_intf.M0_MID <= M0_seqi_inst.M0_MID;
            M0_intf.M0_drv_cb.M0_ARVALID <= M0_seqi_inst.M0_ARVALID;
            M0_intf.M0_drv_cb.M0_ARADDR <= M0_seqi_inst.M0_ARADDR;
            M0_intf.M0_drv_cb.M0_ARLEN <= M0_seqi_inst.M0_ARLEN;
            M0_intf.M0_drv_cb.M0_ARBURST <= M0_seqi_inst.M0_ARBURST;
            M0_intf.M0_drv_cb.M0_ARSIZE <= M0_seqi_inst.M0_ARSIZE;

            //wait for arready 
            //  @(posedge M0_intf.ACLK);
            wait  (M0_intf.M0_drv_cb.M0_ARREADY);
            burst_length = M0_intf.M0_drv_cb.M0_ARLEN +1;          
            //deassert the address signals
            M0_intf.M0_drv_cb.M0_ARVALID <= 0;
            M0_intf.M0_drv_cb.M0_ARADDR <= 0;
            M0_intf.M0_drv_cb.M0_ARLEN <= 0;
            M0_intf.M0_drv_cb.M0_ARBURST <= 0;
            M0_intf.M0_drv_cb.M0_ARSIZE <= 0;
            M0_intf.M0_drv_cb.M0_RREADY <= M0_seqi_inst.M0_RREADY;

            //wait for rvalid loop for burst transactions
            for (i = 0;i< burst_length;i++) begin
                @(posedge M0_intf.ACLK);
                wait(M0_intf.M0_drv_cb.M0_RVALID);
            end
            M0_intf.M0_drv_cb.M0_RREADY <= 1'b0;
        end
    endtask
    
    // write task for apb slaves 
    task drive_bwrite (M0_seq_item M0_seqi_inst);
        int i;
        int burst_length;
        
        burst_length = M0_seqi_inst.M0_AWLEN+1;
        
        // drive write address
        begin
            //write address signals
            repeat(4) @(posedge M0_intf.ACLK); 
            M0_intf.M0_MID <= M0_seqi_inst.M0_MID;
            M0_intf.M0_drv_cb.M0_AWVALID <= M0_seqi_inst.M0_AWVALID;
            M0_intf.M0_drv_cb.M0_AWADDR  <= M0_seqi_inst.M0_AWADDR;
            M0_intf.M0_drv_cb.M0_AWLEN   <= M0_seqi_inst.M0_AWLEN;
            M0_intf.M0_drv_cb.M0_AWBURST <= M0_seqi_inst.M0_AWBURST;
            M0_intf.M0_drv_cb.M0_AWSIZE <= M0_seqi_inst.M0_AWSIZE;

            //wait for AWREADY
            // @(posedge M0_intf.ACLK);
            wait (M0_intf.M0_drv_cb.M0_AWREADY);
            //deassert the aw channel signals
            M0_intf.M0_drv_cb.M0_AWVALID <= 0;
            M0_intf.M0_drv_cb.M0_AWADDR  <= 0;
            M0_intf.M0_drv_cb.M0_AWLEN   <= 0;
            M0_intf.M0_drv_cb.M0_AWBURST <= 0;
            M0_intf.M0_drv_cb.M0_AWSIZE <=  0;

            //drive write data
            for (i=0;i<burst_length;i++) begin 
                M0_intf.M0_drv_cb.M0_WVALID <=  M0_seqi_inst.M0_WVALID;
                M0_intf.M0_drv_cb.M0_WDATA  <=  $random;
                M0_intf.M0_drv_cb.M0_WSTRB <=   M0_seqi_inst.M0_WSTRB;
                M0_intf.M0_drv_cb.M0_WLAST <=  (i == burst_length-1);
                @(posedge M0_intf.ACLK);
                M0_intf.M0_drv_cb.M0_WLAST <=   0;
                if ( M0_intf.M0_drv_cb.M0_WLAST) 
                    begin
                    M0_intf.M0_drv_cb.M0_WVALID <= 0;
                    M0_intf.M0_drv_cb.M0_WDATA <=   0;
                    M0_intf.M0_drv_cb.M0_WSTRB <=   0;
                    M0_intf.M0_drv_cb.M0_BREADY <=  M0_seqi_inst.M0_BREADY;
                    end
                while (!M0_intf.M0_drv_cb.M0_WREADY)  @(posedge M0_intf.ACLK);       
                //  @(posedge M0_intf.ACLK);
            end
            
            //drive rsp channel
            
            wait (M0_intf.M0_drv_cb.M0_BVALID);
            M0_intf.M0_drv_cb.M0_BREADY <= 0;
        end
    endtask 
    
    //read task for apb slaves
    task drive_rburst (M0_seq_item M0_seqi_inst);
        int i;
        int burst_length;

        begin
            //drive the ar channel signals
            repeat (4) @(posedge M0_intf.ACLK);
            M0_intf.M0_MID <= M0_seqi_inst.M0_MID;
            M0_intf.M0_drv_cb.M0_ARVALID <= M0_seqi_inst.M0_ARVALID;
            M0_intf.M0_drv_cb.M0_ARADDR <= M0_seqi_inst.M0_ARADDR;
            M0_intf.M0_drv_cb.M0_ARLEN <= M0_seqi_inst.M0_ARLEN;
            M0_intf.M0_drv_cb.M0_ARBURST <= M0_seqi_inst.M0_ARBURST;
            M0_intf.M0_drv_cb.M0_ARSIZE <= M0_seqi_inst.M0_ARSIZE;

            //wait for arready
            // @(posedge M0_intf.ACLK);
            wait  (M0_intf.M0_drv_cb.M0_ARREADY);
            burst_length = M0_intf.M0_drv_cb.M0_ARLEN +1;          
            
            M0_intf.M0_drv_cb.M0_ARVALID <= 0;
            M0_intf.M0_drv_cb.M0_ARADDR <= 0;
            M0_intf.M0_drv_cb.M0_ARLEN <= 0;
            M0_intf.M0_drv_cb.M0_ARBURST <= 0;
            M0_intf.M0_drv_cb.M0_ARSIZE <= 0;
            M0_intf.M0_drv_cb.M0_RREADY <= M0_seqi_inst.M0_RREADY;

            @(posedge M0_intf.ACLK);

            for (i = 0;i< burst_length;i++) begin
                @(posedge M0_intf.ACLK); 
                while (!M0_intf.M0_drv_cb.M0_RVALID) @(posedge M0_intf.ACLK);                 
            end
            M0_intf.M0_drv_cb.M0_RREADY <= 1'b0;
        end
    endtask
endclass


