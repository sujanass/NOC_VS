class M1_seq_item extends uvm_sequence_item;

    `uvm_object_utils (M1_seq_item)

    // rand logic        ARESETn;
    //  rand logic        ASW_RESET;
    rand logic    wrt_e;
    rand logic    m1_burst;
    rand logic [3:0]    M1_MID;
    rand logic [3:0]    M1_AWID;
    rand logic [3:0]    M1_BID;
    rand logic [3:0]    M1_WID;

    rand  logic        M1_AWVALID;
    randc logic [31:0] M1_AWADDR;
    randc logic [3:0]  M1_AWLEN;
    randc logic [1:0]  M1_AWBURST;
    randc logic [2:0]  M1_AWSIZE;

    rand logic        M1_WVALID;
    rand logic [31:0] M1_WDATA;
    rand logic        M1_WLAST;
    rand logic [3:0]  M1_WSTRB; 

    rand logic        M1_BREADY;

    rand logic        M1_ARVALID;
    randc logic [31:0] M1_ARADDR;
    randc logic [3:0]  M1_ARLEN;
    randc logic [1:0]  M1_ARBURST;
    randc logic [2:0]  M1_ARSIZE;

    rand logic        M1_RREADY;


    logic       M1_AWREADY;
    logic       M1_WREADY;    
    logic       M1_BVALID;
    logic [1:0] M1_BRESP;

    logic       M1_ARREADY;
    logic       M1_RVALID;
    logic [31:0]M1_RDATA;
    logic [1:0] M1_RRESP;

    //default constructor
    function new (string name = "M1_seq_item");
        super.new (name);
    endfunction

    //constraint valid_addr {} axi_slv0
    constraint addr_slv0 {M1_AWADDR inside {[32'hA0000000 :32'hA0003FFF]};M1_ARADDR inside {[32'hA0000000 :32'hA0003FFF]}; }

    //constraint valid_addr {} axi_slv1
    constraint addr_slv1 {M1_AWADDR inside {[32'hA0040000 :32'hA005FFFF]};M1_ARADDR inside {[32'hA0040000 :32'hA005FFFF]}; }

    //constraint valid_addr {} apb_slv2
    constraint addr_slv2 {M1_AWADDR inside {[32'hA0060000 :32'hA00603FF]};M1_ARADDR inside {[32'hA0060000 :32'hA00603FF]}; }
    // constraint for slv3
    constraint addr_slv3 {M1_AWADDR inside {[32'hA006_1000 :32'hA006_13FF]};M1_ARADDR inside {[32'hA006_1000 :32'hA006_13FF]}; }
    // constraint for slave 4
    constraint addr_slv4 {M1_AWADDR inside {[32'hA006_2000 :32'hA006_23FF]};M1_ARADDR inside {[32'hA006_2000 :32'hA006_23FF]}; }
    //constraint for slv5
    constraint addr_slv5 {M1_AWADDR inside {[32'hA006_3000 :32'hA006_33FF]};M1_ARADDR inside {[32'hA006_3000 :32'hA006_33FF]}; }
    //invalid address
    constraint invalid_addr {M1_AWADDR > 32'hA006_03FF;M1_ARADDR >32'hA00603FF; }
    //rand address
    constraint rand_addr {M1_AWADDR inside {[32'hA000_0000 :32'hA000_3FFF],[32'hA004_0000 :32'hA005_FFFF],[32'hA006_0000 :32'hA006_03FF],[32'hA006_1000 :32'hA006_13FF],[32'hA006_2000 :32'hA006_23FF],[32'hA006_3000 :32'hA006_33FF]};M1_ARADDR inside {[32'hA0060000 :32'hA00603FF]}; }
    //constraint for awsize & arsize
    constraint awsize {M1_AWSIZE inside {0,1,2};M1_ARSIZE inside {0,1,2};}
    // constraint for burst
    constraint awburst {M1_AWBURST inside {0,1,2};M1_ARBURST inside {0,1,2};}


     function void do_print (uvm_printer printer);
         super.do_print(printer);

         printer.print_field("M1_AWVALID",this.M1_AWVALID,1,UVM_BIN);
         printer.print_field("M1_AWREADY",this.M1_AWREADY,1,UVM_BIN);
         printer.print_field("M1_AWADDR",this.M1_AWADDR,32,UVM_HEX);
         
         printer.print_field("M1_WVALID",this.M1_WVALID,1,UVM_BIN);
         printer.print_field("M1_WREADY",this.M1_WREADY,1,UVM_BIN);
         printer.print_field("M1_WDATA",this.M1_WDATA,32,UVM_HEX);
         
         printer.print_field("M1_BVALID",this.M1_BVALID,1,UVM_BIN);
         printer.print_field("M1_BREADY",this.M1_BREADY,1,UVM_BIN);
         printer.print_field("M1_BRESP",this.M1_BRESP,2,UVM_DEC);
         

     endfunction


endclass

