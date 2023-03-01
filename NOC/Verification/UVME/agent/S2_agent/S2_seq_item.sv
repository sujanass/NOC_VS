class S2_seq_item extends uvm_sequence_item;
    //factory regestration
    `uvm_object_utils (S2_seq_item)

    function new (string name = "S2_seq_item");
        super.new (name);
    endfunction
    rand  logic        is_write;
    rand  logic [31:0] S2_PRDATA;
    rand  logic        S2_PREADY;
    rand  logic        S2_PSLVERR; //slave error signal

     logic        S2_PENABLE;
     logic        S2_PSEL;
     logic        S2_PWRITE;
     logic [31:0] S2_PADDR;
     logic [31:0] S2_PDATA;
     logic [3:0]  S2_PSTRB;
    rand  int s2_blen;

endclass

