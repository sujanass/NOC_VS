class S5_sequencer extends uvm_sequencer#(S5_seq_item);
    `uvm_component_utils(S5_sequencer)
  
    function new(string name = "S5_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
endclass

