interface S0_inf (input bit ACLK,ARESETn,ASW_RESET);
   
  
    /*************************************************
    axi slave0 inputs
    **************************************************/
    logic [7:0]  S0_BID;
    logic [7:0]  S0_RID;

    logic        S0_AWREADY;
    logic        S0_WREADY;
    logic [1:0]  S0_BRESP;
    logic        S0_BVALID;

    logic        S0_ARREADY;
    logic [31:0] S0_RDATA;
    logic [1:0]  S0_RRESP;
    logic        S0_RVALID;
    logic        S0_RLAST;
    logic        S0_RREADY;

    logic [31:0] S0_AWADDR;
    //logic [3:0]  S0_AWLEN;
    logic [1:0]  S0_AWBURST;
    logic [2:0]  S0_AWSIZE;
    logic [2:0]  S0_ARSIZE;
    

   // logic        S0_WVALID;
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
 // logic s0_rvalid;
    logic [3:0] s0_arlen;


    clocking S0_drv_cb @(posedge ACLK);
        output S0_AWREADY,S0_WREADY,S0_BRESP,S0_BVALID;
    endclocking
    modport S0_drv_mp (clocking S0_drv_cb);
endinterface
