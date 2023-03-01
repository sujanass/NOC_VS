class test extends uvm_test;

	// Factory Registration
    `uvm_component_utils(test)
	
	env envh;
   	Virtual_sequence v_seq;

    	string seq_type;

    	// Constructor
	function new(string name = "test", uvm_component parent);
	super.new(name, parent);
	endfunction
	
    	// Build Phase
	function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	envh = env::type_id::create("envh",this);
        v_seq = Virtual_sequence::type_id::create("v_seq",this);
	endfunction

    	virtual task run_phase(uvm_phase phase);

        super.run_phase(phase);
        `uvm_info(get_full_name,$sformatf("BASE TEST START"),UVM_MEDIUM)

        phase.raise_objection(this);
        `uvm_info(get_full_name,$sformatf("INSIDE BASE TEST"),UVM_MEDIUM)

        	begin
            	v_seq.seq_type = "rst";
            	v_seq.start(envh.vseqr);
        	end
        
        `uvm_info(get_full_name,$sformatf("END OF BASE TEST"),UVM_MEDIUM)        
        phase.drop_objection(this);
        uvm_test_done.set_drain_time(this,4);

    	endtask
	
endclass

