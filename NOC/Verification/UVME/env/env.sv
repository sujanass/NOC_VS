class env extends uvm_env;
	
	`uvm_component_utils(env)
	
	M0_agent      M0_agnt;
	M1_agent      M1_agnt;
	S0_agent      S0_agnt;
	S1_agent      S1_agnt;
	S2_agent      S2_agnt;
	S3_agent      S3_agnt;
	S4_agent      S4_agnt;
	S5_agent      S5_agnt;

	scoreboard          sb;
    //	functional_cov      cg;
   	Virtual_sequencer   vseqr;
	
	function new(string name = "env", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
	M0_agnt   = M0_agent::type_id::create("M0_agnt",this);
	M1_agnt   = M1_agent::type_id::create("M1_agnt",this);
	S0_agnt   = S0_agent::type_id::create("S0_agnt",this);
	S1_agnt   = S1_agent::type_id::create("S1_agnt",this);
	S2_agnt   = S2_agent::type_id::create("S2_agnt",this);
	S3_agnt   = S3_agent::type_id::create("S3_agnt",this);
	S4_agnt   = S4_agent::type_id::create("S4_agnt",this);
	S5_agnt   = S5_agent::type_id::create("S5_agnt",this);
	
        vseqr = Virtual_sequencer::type_id::create("vseqr",this);
	sb    = scoreboard::type_id::create("sb",this);
//	cg    = functional_cov::type_id::create("cg",this);

	endfunction
	
	function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        //---> Connect Virtual Sequencer to driver's seq_item_port
        vseqr.M0_seqr = M0_agnt.M0_sqr;
        vseqr.M1_seqr = M1_agnt.M1_sqr;
        vseqr.S0_seqr = S0_agnt.seqr;
        vseqr.S1_seqr = S1_agnt.seqr;
        vseqr.S2_seqr = S2_agnt.seqr;
        vseqr.S3_seqr = S3_agnt.seqr;
        vseqr.S4_seqr = S4_agnt.seqr;
        vseqr.S5_seqr = S5_agnt.seqr;

        //agt.drv.seq_item_port.connect(vseqr.seq_item_export);

   /*     //---> Connect monitor analysis port to Coverage & Scoreboard
        M0_agnt.M0_mon.item_collect_port.connect(sb.M0_ap);
        M1_agnt.M1_mon.item_collect_port.connect(sb.M1_ap);
        S0_agnt.mon.item_collect_port.connect(sb.S0_ap);
        S1_agnt.mon.item_collect_port.connect(sb.S1_ap);
        S2_agnt.mon.item_collect_port.connect(sb.S2_ap);
        S3_agnt.mon.item_collect_port.connect(sb.S3_ap);
        S4_agnt.mon.item_collect_port.connect(sb.S4_ap);
        S5_agnt.mon.item_collect_port.connect(sb.S5_ap);*/
	endfunction
	
	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();  
	endfunction
	
endclass
