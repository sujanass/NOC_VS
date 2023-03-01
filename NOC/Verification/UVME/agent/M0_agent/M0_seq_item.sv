class M0_seq_item extends uvm_sequence_item;
    //factory regestration
    `uvm_object_utils (M0_seq_item)
         
     rand logic    wrt_e;    //control signals for write and read task
     rand logic    m0_burst; //control signal for apb write and read task 
     rand logic [3:0]    M0_MID;
     rand logic [3:0]    M0_AWID;
     rand logic [3:0]    M0_BID;
     rand logic [3:0]    M0_WID;

     rand  logic        M0_AWVALID;
     randc logic [31:0] M0_AWADDR;
     randc logic [3:0]  M0_AWLEN;
     randc logic [1:0]  M0_AWBURST;
     randc logic [2:0]  M0_AWSIZE;

     rand logic        M0_WVALID;
     rand logic [31:0] M0_WDATA;
     rand logic        M0_WLAST;
     rand logic [3:0]  M0_WSTRB; 

     rand logic        M0_BREADY;

     rand  logic        M0_ARVALID;
     randc logic [31:0] M0_ARADDR;
     randc logic [3:0]  M0_ARLEN;
     randc logic [1:0]  M0_ARBURST;
     randc logic [2:0]  M0_ARSIZE;

     rand logic        M0_RREADY;
    
    
          logic       M0_AWREADY;
          logic       M0_WREADY;    
          logic       M0_BVALID;
          logic [1:0] M0_BRESP;
    
          logic       M0_ARREADY;
          logic       M0_RVALID;
          logic [31:0]M0_RDATA;
          logic [1:0] M0_RRESP;
    
     //default constructor
     function new (string name = "M0_seq_item");
         super.new (name);
     endfunction
    
     //constraint valid_addr {} axi_slv0
     constraint addr_slv0 {M0_AWADDR inside {[32'hA0000000 :32'hA0003FFF]};M0_ARADDR inside {[32'hA0000000 :32'hA0003FFF]}; }
    
     //constraint valid_addr {} axi_slv1
     constraint addr_slv1 {M0_AWADDR inside {[32'hA0040000 :32'hA005FFFF]};M0_ARADDR inside {[32'hA0040000 :32'hA005FFFF]}; }
    
     //constraint valid_addr {} apb_slv2
     constraint addr_slv2 {M0_AWADDR inside {[32'hA0060000 :32'hA00603FF]};M0_ARADDR inside {[32'hA0060000 :32'hA00603FF]}; }
     //constraint for apb_slv3
     constraint addr_slv3 {M0_AWADDR inside {[32'hA006_1000 :32'hA006_13FF]};M0_ARADDR inside {[32'hA006_1000 :32'hA006_13FF]}; }
     //constraint for apb_slv4
     constraint addr_slv4 {M0_AWADDR inside {[32'hA006_2000 :32'hA006_23FF]};M0_ARADDR inside {[32'hA006_2000 :32'hA006_23FF]}; }
     //constraint for apb_slv5
     constraint addr_slv5 {M0_AWADDR inside {[32'hA006_3000 :32'hA006_33FF]};M0_ARADDR inside {[32'hA006_3000 :32'hA006_33FF]}; }
     //constraint for out of bond addr
     constraint invalid_addr {M0_AWADDR > 32'hA006_03FF;M0_ARADDR >32'hA00603FF; }
    //randmized the all slave addresses
     constraint rand_addr {M0_AWADDR inside {[32'hA000_0000 :32'hA000_3FFF],[32'hA004_0000 :32'hA005_FFFF],[32'hA006_0000 :32'hA006_03FF],[32'hA006_1000 :32'hA006_13FF],[32'hA006_2000 :32'hA006_23FF],[32'hA006_3000 :32'hA006_33FF]};M0_ARADDR inside {[32'hA0060000 :32'hA00603FF]}; }
    
     //constraint for awsize and arsize        
     constraint awsize {M0_AWSIZE inside {0,1,2};M0_ARSIZE inside {0,1,2};} //upto 32bits (4bytes)
     //constraint for burst
     constraint awburst {M0_AWBURST inside {0,1,2};M0_ARBURST inside {0,1,2};}

     //`uvm_object_utils_begin(M0_seq_item)
     //   `uvm_field_int(M0_AWREADY,UVM_ALL_ON)
     //   `uvm_field_int(M0_AWVALID,UVM_ALL_ON)
     //   `uvm_field_int(M0_AWADDR,UVM_ALL_ON)
     
     
     //`uvm_object_utils_end
     function void do_print (uvm_printer printer);
         super.do_print(printer);

         printer.print_field("M0_AWVALID",this.M0_AWVALID,1,UVM_BIN);
         printer.print_field("M0_AWREADY",this.M0_AWREADY,1,UVM_BIN);
         printer.print_field("M0_AWADDR",this.M0_AWADDR,32,UVM_HEX);
         
         printer.print_field("M0_WVALID",this.M0_WVALID,1,UVM_BIN);
         printer.print_field("M0_WREADY",this.M0_WREADY,1,UVM_BIN);
         printer.print_field("M0_WDATA",this.M0_WDATA,32,UVM_HEX);
         
         printer.print_field("M0_BVALID",this.M0_BVALID,1,UVM_BIN);
         printer.print_field("M0_BREADY",this.M0_BREADY,1,UVM_BIN);
         printer.print_field("M0_BRESP",this.M0_BRESP,2,UVM_DEC);


         printer.print_field("M0_ARVALID",this.M0_ARVALID,1,UVM_BIN);
         printer.print_field("M0_ARREADY",this.M0_ARREADY,1,UVM_BIN);
         printer.print_field("M0_ARADDR",this.M0_ARADDR,32,UVM_HEX);
         
         printer.print_field("M0_RVALID",this.M0_RVALID,1,UVM_BIN);
         printer.print_field("M0_RREADY",this.M0_RREADY,1,UVM_BIN);
         printer.print_field("M0_RDATA",this.M0_RDATA,32,UVM_HEX);
         
         printer.print_field("M0_RRESP",this.M0_RRESP,2,UVM_DEC);

     endfunction

        
endclass

