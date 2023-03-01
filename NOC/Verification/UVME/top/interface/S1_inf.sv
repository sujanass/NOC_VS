interface S1_inf (input bit ACLK,ARESETn,ASW_RESET);
   


    /*************************************************
    axi slave1 inputs
    **************************************************/
    logic        S1_AWREADY;
    logic        S1_WREADY;
    logic [1:0]  S1_BRESP;
    logic        S1_BVALID;
    logic [7:0]  S1_BID;
    logic [7:0]  S1_RID;

    logic        S1_ARREADY;
    logic [31:0] S1_RDATA;
    logic [1:0]  S1_RRESP;
    logic        S1_RVALID;
    logic        S1_RLAST;
    logic        S1_RREADY;

    logic [31:0] S1_AWADDR;
  // logic [3:0]  S1_AWLEN;
    logic [1:0]  S1_AWBURST;
    logic [2:0]  S1_AWSIZE;
    logic [2:0]  S1_ARSIZE;
    

   // logic        S1_WVALID;
    logic [31:0] S1_WDATA;
    logic        S1_WLAST;
    logic [3:0]  S1_WSTRB; //write strobe signal indicates which byte of the writebus is valid.

    logic [31:0] S1_ARADDR;
    logic [1:0]  S1_ARBURST;

     logic S1_awvalid;
    logic S1_wvalid;
    logic S1_bready;
    logic [3:0] S1_awlen;

    logic S1_arvalid;
 // logic S1_rvalid;
    logic [3:0] S1_arlen;


    clocking S1_drv_cb @(posedge ACLK);
        output S1_AWREADY,S1_WREADY,S1_BRESP,S1_BVALID;
    endclocking
    
    modport S1_drv_mp (clocking S1_drv_cb);

endinterface


