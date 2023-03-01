class S4_driver extends uvm_driver #(S4_seq_item);
    //virtual interface
    virtual S4_inf S4_intf;
    //seq_item handle
    S4_seq_item S4_seqi_inst;
    //factory regestration
    `uvm_component_utils (S4_driver)
	//default constructor
	function new (string name = "S4_driver",uvm_component parent = null);
	    super.new (name,parent);
	endfunction
	//build phase 
	function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	
        S4_seqi_inst = S4_seq_item::type_id :: create ("S4_seqi_inst",this);
   
        if(!uvm_config_db#(virtual S4_inf) :: get(this, "", "S4_inf", S4_intf))
        `uvm_fatal(get_type_name(), "Not set at top level");
    endfunction
     
    task run_phase (uvm_phase phase);
     
        forever begin
            //`uvm_info (get_type_name(),"in the slv driver",UVM_LOW);

            seq_item_port.get_next_item(S4_seqi_inst);
         
                if (S4_seqi_inst.is_write)
                    rsp_to_write(S4_seqi_inst);
                else
                    rsp_to_read(S4_seqi_inst);

            seq_item_port.item_done();
        end
    endtask

    task rsp_to_write (S4_seq_item S4_seqi_inst );
        int i;

        begin
            while (!S4_intf.S4_PSEL) @(posedge S4_intf.ACLK);
            @(posedge S4_intf.ACLK);
            
            for (i=0;i <S4_seqi_inst.s4_blen+1;i++)
                begin
                    wait (S4_intf.S4_PENABLE) 
                    @(posedge S4_intf.ACLK);
             
                    S4_intf.S4_PREADY = S4_seqi_inst.S4_PREADY;    
                    if (S4_intf.S4_PADDR >= 32'hA006_2000 && S4_intf.S4_PADDR <= 32'hA006_23FF) 
                        S4_intf.S4_PSLVERR = S4_seqi_inst.S4_PSLVERR;
                    else
                        S4_intf.S4_PSLVERR = 1;
                    
                    @(posedge S4_intf.ACLK);
                    S4_intf.S4_PREADY = 0; 
                    S4_intf.S4_PSLVERR = 0;
                end
        end 
    endtask

    task rsp_to_read (S4_seq_item S4_seqi_inst );
        begin

            while (!S4_intf.S4_PSEL) @(posedge S4_intf.ACLK);
            @(posedge S4_intf.ACLK);
     
            for (int i=0;i<=S4_seqi_inst.s4_blen;i++) begin 
                wait (S4_intf.S4_PENABLE)
                @(posedge S4_intf.ACLK);
                S4_intf.S4_PRDATA <= $random;       
                S4_intf.S4_PREADY <= S4_seqi_inst.S4_PREADY;       
                S4_intf.S4_PSLVERR <= S4_seqi_inst.S4_PSLVERR;
          
                @(posedge S4_intf.ACLK);
                S4_intf.S4_PREADY <= 0;  
     
                S4_intf.S4_PRDATA <= 0;
            end
        end   
    endtask
endclass

