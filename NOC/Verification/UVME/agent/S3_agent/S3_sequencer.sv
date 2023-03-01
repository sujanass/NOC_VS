class S3_sequencer extends uvm_sequencer#(S3_seq_item);
    `uvm_component_utils(S3_sequencer)
  
    function new(string name = "S3_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
endclass


