class S1_seq_item extends uvm_sequence_item;
    //factory regestration
    `uvm_object_utils (S1_seq_item)
    //default constructor
    function new (string name = "S1_seq_item");
        super.new (name);
    endfunction

    // rand logic ARESETn;
    // rand logic ASW_RESET;

    /*************************************************
    axi slave0 inputs
    **************************************************/
    rand logic        is_write;
    
    rand logic  [7:0] S1_BID;
    rand logic  [7:0] S1_RID;
    rand logic        S1_AWREADY;
    rand logic        S1_WREADY;
    rand logic [1:0]  S1_BRESP;
    rand logic        S1_BVALID;

    rand logic        S1_ARREADY;
    rand logic [31:0] S1_RDATA;
    rand logic [1:0]  S1_RRESP;
    rand logic        S1_RVALID;
    rand logic        S1_RLAST;
    rand logic        S1_RREADY;
     
     logic [31:0] S1_AWADDR;
     logic [3:0]  S1_AWLEN;
     logic [1:0]  S1_AWBURST;
     logic [2:0]  S1_AWSIZE;
     logic [2:0]  S1_ARSIZE;
     

     logic        S1_WVALID;
     logic [31:0] S1_WDATA;
     logic        S1_WLAST;
     logic [3:0]  S1_WSTRB; //write strobe signal indicates which byte of the writebus is valid.


     logic [31:0] S1_ARADDR;
     //logic [3:0]  S1_ARLEN;
     logic [1:0]  S1_ARBURST;
    //logic [2:0]  S1_ARSIZE;


     logic S1_awvalid;
     logic S1_wvalid;
     logic S1_bready;
     logic [3:0] S1_awlen;

     logic S1_arvalid;
     //logic S1_rvalid;
     logic [3:0] S1_arlen;

          function void do_print (uvm_printer printer);
         super.do_print(printer);

         printer.print_field("S1_AWVALID",this.S1_awvalid,1,UVM_BIN);
         printer.print_field("S1_AWREADY",this.S1_AWREADY,1,UVM_BIN);
         printer.print_field("S1_AWADDR",this.S1_AWADDR,32,UVM_HEX);
         
         printer.print_field("S1_WVALID",this.S1_wvalid,1,UVM_BIN);
         printer.print_field("S1_WREADY",this.S1_WREADY,1,UVM_BIN);
         printer.print_field("S1_WDATA",this.S1_WDATA,32,UVM_HEX);
         
         printer.print_field("S1_BVALID",this.S1_BVALID,1,UVM_BIN);
         printer.print_field("S1_BREADY",this.S1_bready,1,UVM_BIN);
         printer.print_field("S1_BRESP",this.S1_BRESP,2,UVM_DEC);


         printer.print_field("S1_ARVALID",this.S1_arvalid,1,UVM_BIN);
         printer.print_field("S1_ARREADY",this.S1_ARREADY,1,UVM_BIN);
         printer.print_field("S1_ARADDR",this.S1_ARADDR,32,UVM_HEX);
         
         printer.print_field("S1_RVALID",this.S1_RVALID,1,UVM_BIN);
         printer.print_field("S1_RREADY",this.S1_RREADY,1,UVM_BIN);
         printer.print_field("S1_RDATA",this.S1_RDATA,32,UVM_HEX);
         
         printer.print_field("S1_RRESP",this.S1_RRESP,2,UVM_DEC);

     endfunction

endclass


