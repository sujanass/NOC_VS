class Virtual_sequence extends uvm_sequence;

	/////.....factory registration...../////
    	`uvm_object_utils(Virtual_sequence)

    	//----------------------- P Sequencer ----------------------//
    	`uvm_declare_p_sequencer(Virtual_sequencer)

	//------------sequence and sequence handle ------//

	string seq_type;


	/////.....function new constructor...../////
	function new(string name = "Virtual_sequence");
		super.new(name);
	endfunction
	
	virtual task body();

	M0_seq M0_seqh;
	M1_seq M1_seqh;
	S0_seq S0_seqh;
	S1_seq S1_seqh;
	S2_seq S2_seqh;
	S3_seq S3_seqh;
	S4_seq S4_seqh;
	S5_seq S5_seqh;


		M0_seqh=M0_seq::type_id::create("M0_seqh");
	//	M0_seqh=M0_seq::type_id::create("M0_seqh");
		S1_seqh=S1_seq::type_id::create("S1_seqh");

case(seq_type)
        "rst": begin
            M0_seqh.scenario = 1;
            M0_seqh.start(p_sequencer.M0_seqr);
        end
        
        "M0_S0_w": begin
            fork 
	/*    begin
	`uvm_do_on_with(M0_seqh, p_sequencer.M0_seqr, { scenario == 3; })
	`uvm_do_on_with(S1_seqh, p_sequencer.S1_seqr, { scenario == 2; })
	    end*/
                begin
                    M0_seqh.scenario = 3;
                  //  M0_seqh.start(p_sequencer.M0_seqr);
		  `uvm_do_on(M0_seqh, p_sequencer.M0_seqr)
		  end

		  begin

                    S1_seqh.scenario = 2;
                   // S1_seqh.start(p_sequencer.S1_seqr);
		  `uvm_do_on(S1_seqh, p_sequencer.S1_seqr)

                end
            join
        end
        
        default: `uvm_error(get_full_name(), $sformatf("Unknown seq_type: %s", seq_type))
endcase

	endtask


endclass
