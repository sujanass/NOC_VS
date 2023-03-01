class Virtual_sequencer extends uvm_sequencer;

	//------------------ Factory Registration -------//
	`uvm_component_utils(Virtual_sequencer)

   	M0_sequencer M0_seqr;
    	M1_sequencer M1_seqr;
    	S0_sequencer S0_seqr;
    	S1_sequencer S1_seqr;
    	S2_sequencer S2_seqr;
    	S3_sequencer S3_seqr;
    	S4_sequencer S4_seqr;
    	S5_sequencer S5_seqr;

    	//------------------ Constructor ----------------//	
	function new(string name = "Virtual_sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction
	
endclass
