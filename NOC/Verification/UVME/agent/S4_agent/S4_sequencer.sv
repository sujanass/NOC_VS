class S4_sequencer extends uvm_sequencer#(S4_seq_item);
    
    `uvm_component_utils(S4_sequencer)
  
    function new(string name = "S4_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
endclass

