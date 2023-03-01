class M0_sequencer extends uvm_sequencer#(M0_seq_item);
    //factory regestration
    `uvm_component_utils(M0_sequencer)
    //default comstructor
     function new (string name = "M0_sequencer",uvm_component parent = null);
         super.new(name,parent);
     endfunction
    //build phase
     function void build_phase(uvm_phase phase);
         super.build_phase(phase);
     endfunction
endclass
