class S3_seq_item extends uvm_sequence_item;
 
    `uvm_object_utils (S3_seq_item)

    function new (string name = "S3_seq_item");
        super.new (name);
    endfunction
 
    rand  logic        is_write;
    rand  logic [31:0] S3_PRDATA;
    rand  logic        S3_PREADY;
    rand  logic        S3_PSLVERR; //slave error signal

     logic        S3_PENABLE;
     logic        S3_PSEL;
     logic        S3_PWRITE;
     logic [31:0] S3_PADDR;
     logic [31:0] S3_PDATA;
     logic [3:0]  S3_PSTRB;
    rand  int s3_blen;

endclass


