class S5_seq_item extends uvm_sequence_item;
 
    `uvm_object_utils (S5_seq_item)

    function new (string name = "S5_seq_item");
        super.new (name);
    endfunction
    rand  logic        is_write;
    rand  logic [31:0] S5_PRDATA;
    rand  logic        S5_PREADY;
    rand  logic        S5_PSLVERR; //slave error signal

     logic        S5_PENABLE;
     logic        S5_PSEL;
     logic        S5_PWRITE;
     logic [31:0] S5_PADDR;
     logic [31:0] S5_PDATA;
     logic [3:0]  S5_PSTRB;
    rand  int s5_blen;

endclass

