class M0_S1_wtest extends test;

	//factory registration
	`uvm_component_utils(M0_S1_wtest)
	
	function new(string name ="M0_S1_wtest", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
        `uvm_info(get_full_name,$sformatf("M0_S1_wtest STARTED"),UVM_MEDIUM);


       		phase.raise_objection(this);
		`uvm_info(get_full_name,$sformatf("INSIDE M0_S1_wtest"),UVM_MEDIUM)
		begin
		v_seq.seq_type="M0_S0_w";
            	v_seq.start(envh.vseqr);
        	end
        
        	`uvm_info(get_full_name,$sformatf("END OF M0_S1_wtest"),UVM_MEDIUM)        
        	phase.drop_objection(this);
        uvm_test_done.set_drain_time(this,4);

    	endtask
	
endclass

