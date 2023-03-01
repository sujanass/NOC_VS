class S3_driver extends uvm_driver #(S3_seq_item);
    //virtual interface
    virtual S3_inf S3_intf;
    //seq_item handel
    S3_seq_item S3_seqi_inst;
    //factory regestration
    `uvm_component_utils (S3_driver)
    
    function new (string name = "S3_driver",uvm_component parent = null);
        super.new (name,parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    
        S3_seqi_inst = S3_seq_item::type_id :: create ("S3_seqi_inst",this);
        //config db get method
        if(!uvm_config_db#(virtual S3_inf) :: get(this, "", "S3_inf", S3_intf))
        `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
        
    task run_phase (uvm_phase phase);
        
        forever begin
            //`uvm_info (get_type_name(),"in the slv driver",UVM_LOW);
    
            seq_item_port.get_next_item(S3_seqi_inst);
    
            if (S3_seqi_inst.is_write)
                rsp_to_write(S3_seqi_inst);
            else
                rsp_to_read(S3_seqi_inst);
    
            seq_item_port.item_done();
        end
    endtask
    
    task rsp_to_write (S3_seq_item S3_seqi_inst );
        int i;
        begin
            while (!S3_intf.S3_PSEL) @(posedge S3_intf.ACLK);
  
            @(posedge S3_intf.ACLK);
            for (i=0;i <S3_seqi_inst.s3_blen+1;i++)
            begin
                wait (S3_intf.S3_PENABLE) 
                @(posedge S3_intf.ACLK);
    
                S3_intf.S3_PREADY = S3_seqi_inst.S3_PREADY; 
    
                if (S3_intf.S3_PADDR >= 32'hA006_1000 && S3_intf.S3_PADDR <= 32'hA006_13FF ) 
                    S3_intf.S3_PSLVERR = S3_seqi_inst.S3_PSLVERR;
                else
                    S3_intf.S3_PSLVERR = 1;
    
                @(posedge S3_intf.ACLK);
                S3_intf.S3_PREADY = 0;
                S3_intf.S3_PSLVERR = 0;
            end
    
            S3_intf.S3_PSLVERR = S3_seqi_inst.S3_PSLVERR;
        end
    endtask
    
    task rsp_to_read (S3_seq_item S3_seqi_inst );
        begin
            while (!S3_intf.S3_PSEL) @(posedge S3_intf.ACLK);
            @(posedge S3_intf.ACLK);
    
            for (int i=0;i<=S3_seqi_inst.s3_blen;i++) begin 
                wait (S3_intf.S3_PENABLE)
                @(posedge S3_intf.ACLK);
                S3_intf.S3_PRDATA <= $random;       
                S3_intf.S3_PREADY <= S3_seqi_inst.S3_PREADY;       
                S3_intf.S3_PSLVERR <= S3_seqi_inst.S3_PSLVERR;
    
                @(posedge S3_intf.ACLK);
                S3_intf.S3_PREADY <= 0;  
    
                S3_intf.S3_PRDATA <= 0;
            end
        end
    endtask
endclass


