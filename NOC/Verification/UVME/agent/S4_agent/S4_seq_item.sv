class S4_seq_item extends uvm_sequence_item;
 
    `uvm_object_utils (S4_seq_item)

    function new (string name = "S4_seq_item");
        super.new (name);
    endfunction
    rand  logic        is_write;
    rand  logic [31:0] S4_PRDATA;
    rand  logic        S4_PREADY;
    rand  logic        S4_PSLVERR; //slave error signal

     logic        S4_PENABLE;
     logic        S4_PSEL;
     logic        S4_PWRITE;
     logic [31:0] S4_PADDR;
     logic [31:0] S4_PDATA;
     logic [3:0]  S4_PSTRB;
    rand  int s4_blen;

endclass
