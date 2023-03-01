class S2_driver extends uvm_driver #(S2_seq_item);
    //virtual interface
    virtual S2_inf S2_intf;
    //seq_item handle
    S2_seq_item S2_seqi_inst;
    //factory regestration
    `uvm_component_utils (S2_driver)
	
    //deafult constructor
	function new (string name = "S2_driver",uvm_component parent = null);
	    super.new (name,parent);
	endfunction
	//build phase 
	function void build_phase(uvm_phase phase);
        super.build_phase(phase);	
        S2_seqi_inst = S2_seq_item::type_id :: create ("S2_seqi_inst",this);
        //config db get method
        if(!uvm_config_db#(virtual S2_inf) :: get(this, "", "S2_inf", S2_intf))
        `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
  
   
    task run_phase (uvm_phase phase);
     
        forever begin

            seq_item_port.get_next_item(S2_seqi_inst);
         
            if (S2_seqi_inst.is_write)
                rsp_to_write(S2_seqi_inst);
            else
                rsp_to_read(S2_seqi_inst);

            seq_item_port.item_done();
        end
    endtask

    task rsp_to_write (S2_seq_item S2_seqi_inst );
        int i;
        begin
            while (!S2_intf.S2_PSEL) @(posedge S2_intf.ACLK);
            
            @(posedge S2_intf.ACLK);
            for (i=0;i <S2_seqi_inst.s2_blen+1;i++)
            begin
                wait (S2_intf.S2_PENABLE) 
                @(posedge S2_intf.ACLK);
                 
                S2_intf.S2_PREADY = S2_seqi_inst.S2_PREADY;
                if (S2_intf.S2_PADDR >= 32'hA006_0000 && S2_intf.S2_PADDR <= 32'hA006_03FF) 
                    S2_intf.S2_PSLVERR = S2_seqi_inst.S2_PSLVERR;
                else
                    S2_intf.S2_PSLVERR = 1;

                @(posedge S2_intf.ACLK);
                S2_intf.S2_PREADY = 0;
                S2_intf.S2_PSLVERR = 0;
            end
        end         
    endtask  

    task rsp_to_read (S2_seq_item S2_seqi_inst );
        begin
            while (!S2_intf.S2_PSEL) @(posedge S2_intf.ACLK);
            @(posedge S2_intf.ACLK);
     
            for (int i=0;i<=S2_seqi_inst.s2_blen;i++) begin 
                wait (S2_intf.S2_PENABLE)
                @(posedge S2_intf.ACLK);
                S2_intf.S2_PRDATA <= $random;       
                S2_intf.S2_PREADY <= S2_seqi_inst.S2_PREADY;       
                S2_intf.S2_PSLVERR <= S2_seqi_inst.S2_PSLVERR;
          
                @(posedge S2_intf.ACLK);
                S2_intf.S2_PREADY <= 0;  
     
                S2_intf.S2_PRDATA <= 0;
             end
        end    
    endtask
endclass


