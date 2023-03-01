class S0_seq_item extends uvm_sequence_item;
    //factory regestration 
    `uvm_object_utils (S0_seq_item)

    function new (string name = "S0_seq_item");
        super.new (name);
    endfunction

    // rand logic ARESETn;
    // rand logic ASW_RESET;

    /*************************************************
    axi slave0 inputs
    **************************************************/
    rand logic        is_write;
 
    rand logic  [7:0]      S0_BID;
    rand logic  [7:0]      S0_RID;
    rand logic          S0_AWREADY;
    rand logic          S0_WREADY;
    rand bit [1:0]      S0_BRESP;
    rand logic        S0_BVALID;

    rand logic        S0_ARREADY;
    rand logic [31:0] S0_RDATA;
    rand logic [1:0]  S0_RRESP;
    rand logic        S0_RVALID;
    rand logic        S0_RLAST;
    rand logic        S0_RREADY;

     logic [31:0] S0_AWADDR;
     logic [3:0]  S0_AWLEN;
     logic [1:0]  S0_AWBURST;
     logic [2:0]  S0_AWSIZE;
     logic [2:0]  S0_ARSIZE;
     

     logic        S0_WVALID;
     logic [31:0] S0_WDATA;
     logic        S0_WLAST;
     logic [3:0]  S0_WSTRB; //write strobe signal indicates which byte of the writebus is valid.
     
    
     logic [31:0] S0_ARADDR;
     logic [1:0]  S0_ARBURST;

     logic s0_awvalid;
     logic s0_wvalid;
     logic s0_bready;
     logic [3:0] s0_awlen;

     logic s0_arvalid;
     //logic s0_rvalid;
     logic [3:0] s0_arlen;

     function void do_print (uvm_printer printer);
         super.do_print(printer);

         printer.print_field("S0_AWVALID",this.s0_awvalid,1,UVM_BIN);
         printer.print_field("S0_AWREADY",this.S0_AWREADY,1,UVM_BIN);
         printer.print_field("S0_AWADDR",this.S0_AWADDR,32,UVM_HEX);
         
         printer.print_field("S0_WVALID",this.s0_wvalid,1,UVM_BIN);
         printer.print_field("S0_WREADY",this.S0_WREADY,1,UVM_BIN);
         printer.print_field("S0_WDATA",this.S0_WDATA,32,UVM_HEX);
         
         printer.print_field("S0_BVALID",this.S0_BVALID,1,UVM_BIN);
         printer.print_field("S0_BREADY",this.s0_bready,1,UVM_BIN);
         printer.print_field("S0_BRESP",this.S0_BRESP,2,UVM_DEC);


         printer.print_field("S0_ARVALID",this.s0_arvalid,1,UVM_BIN);
         printer.print_field("S0_ARREADY",this.S0_ARREADY,1,UVM_BIN);
         printer.print_field("S0_ARADDR",this.S0_ARADDR,32,UVM_HEX);
         
         printer.print_field("S0_RVALID",this.S0_RVALID,1,UVM_BIN);
         printer.print_field("S0_RREADY",this.S0_RREADY,1,UVM_BIN);
         printer.print_field("S0_RDATA",this.S0_RDATA,32,UVM_HEX);
         
         printer.print_field("S0_RRESP",this.S0_RRESP,2,UVM_DEC);

     endfunction
     
endclass

