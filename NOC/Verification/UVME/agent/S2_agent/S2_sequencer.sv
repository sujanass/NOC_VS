class S2_sequencer extends uvm_sequencer#(S2_seq_item);
    //factory regestration
    `uvm_component_utils(S2_sequencer)
    //default constructor
    function new(string name = "S2_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
endclass
