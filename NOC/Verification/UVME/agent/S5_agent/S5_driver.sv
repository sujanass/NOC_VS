class S5_driver extends uvm_driver #(S5_seq_item);
   
    virtual S5_inf S5_intf;
    S5_seq_item S5_seqi_inst;
   
    `uvm_component_utils (S5_driver)
	
	function new (string name = "S5_driver",uvm_component parent = null);
	    super.new (name,parent);
	endfunction
	 
	function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	
        S5_seqi_inst = S5_seq_item::type_id :: create ("S5_seqi_inst",this);
   
        if(!uvm_config_db#(virtual S5_inf) :: get(this, "", "S5_inf", S5_intf))
         `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
  
   
    task run_phase (uvm_phase phase);
     
        forever begin
            //`uvm_info (get_type_name(),"in the slv driver",UVM_LOW);

            seq_item_port.get_next_item(S5_seqi_inst);
         
            if (S5_seqi_inst.is_write)
                rsp_to_write(S5_seqi_inst);
            else
                rsp_to_read(S5_seqi_inst);

            seq_item_port.item_done();
        end
    endtask

    task rsp_to_write (S5_seq_item S5_seqi_inst );
        int i;
        
        begin
            while (!S5_intf.S5_PSEL) @(posedge S5_intf.ACLK);
            @(posedge S5_intf.ACLK);
       
            for (i=0;i <S5_seqi_inst.s5_blen+1;i++)
            begin
                wait (S5_intf.S5_PENABLE) 
                @(posedge S5_intf.ACLK);
         
                S5_intf.S5_PREADY = S5_seqi_inst.S5_PREADY;                                                     
        
                if (S5_intf.S5_PADDR >= 32'hA006_3000 && S5_intf.S5_PADDR <= 32'hA006_33FF)
                    S5_intf.S5_PSLVERR = S5_seqi_inst.S5_PSLVERR;
                else   
                    S5_intf.S5_PSLVERR = 1;
        
                @(posedge S5_intf.ACLK);
                S5_intf.S5_PREADY = 0; 
                S5_intf.S5_PSLVERR = 0;
            end
        end                
    endtask

    task rsp_to_read (S5_seq_item S5_seqi_inst );
        begin
            while (!S5_intf.S5_PSEL) @(posedge S5_intf.ACLK);
            @(posedge S5_intf.ACLK);
     
            for (int i=0;i<=S5_seqi_inst.s5_blen;i++) begin 
                wait (S5_intf.S5_PENABLE)
                @(posedge S5_intf.ACLK);
                S5_intf.S5_PRDATA <= $random;       
                S5_intf.S5_PREADY <= S5_seqi_inst.S5_PREADY;       
                S5_intf.S5_PSLVERR <= S5_seqi_inst.S5_PSLVERR;
          
                @(posedge S5_intf.ACLK);
                S5_intf.S5_PREADY <= 0;  
     
                S5_intf.S5_PRDATA <= 0;
            end
        end
    endtask
endclass

