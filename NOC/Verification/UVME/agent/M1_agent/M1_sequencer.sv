class M1_sequencer extends uvm_sequencer#(M1_seq_item);
    //factory regestration
    `uvm_component_utils(M1_sequencer)
    
     //default constructor
     function new (string name = "M1_sequencer",uvm_component parent = null);
         super.new(name,parent);
     endfunction
    
     //build phase
     function void build_phase(uvm_phase phase);
         super.build_phase(phase);
     endfunction
endclass
