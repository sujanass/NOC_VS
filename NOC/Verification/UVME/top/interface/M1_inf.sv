interface M1_inf (input bit ACLK,ARESETn,ASW_RESET);

    /**************************************************
    axi4 master2 inputs
    ***************************************************/
    logic [3:0]       M1_MID;
    logic        M1_AWVALID;
    logic [31:0] M1_AWADDR;
    logic [3:0]  M1_AWLEN;
    logic [1:0]  M1_AWBURST;
    logic [3:0]  M1_ARID;
    logic [3:0]  M1_AWID;
    logic [3:0]  M1_WID;
    logic [3:0]  M1_RID;
    logic [2:0]  M1_AWSIZE;
    logic [2:0]  M1_ARSIZE;
    
    logic        M1_WVALID;
    logic [31:0] M1_WDATA;
    logic        M1_WLAST;
    logic [3:0]  M1_WSTRB; //write strobe signal indicates which byte of the writebus is valid.

    logic        M1_BREADY;

    logic        M1_ARVALID;
    logic [31:0] M1_ARADDR;
    logic [3:0]  M1_ARLEN;
    logic [1:0]  M1_ARBURST;

    logic        M1_RREADY;
    logic        M1_RLAST;
  
    /*****************************************************
    axi4 master2 outputs
    *****************************************************/

    logic       M1_AWREADY;
    logic       M1_WREADY;    
    logic       M1_BVALID;
    logic [1:0] M1_BRESP;
   
    logic       M1_ARREADY;
    logic       M1_RVALID;
    logic [31:0]M1_RDATA;
    logic [1:0] M1_RRESP;
   
    clocking M1_drv_cb @(posedge ACLK);
   
        // default input #1 output #1;  //input and output skew
   
        output M1_AWADDR,M1_AWVALID,M1_AWLEN,M1_AWBURST,M1_AWSIZE;
        input  M1_AWREADY;
   
        output M1_WDATA,M1_WSTRB,M1_WVALID,M1_WLAST;
        input M1_WREADY;
   
        output M1_BREADY;
        input M1_BRESP,M1_BVALID;
     
        output M1_ARADDR,M1_ARVALID,M1_ARLEN,M1_ARBURST,M1_ARSIZE;
        input M1_ARREADY;
   
        input M1_RDATA,M1_RRESP,M1_RVALID;
        output M1_RREADY;
   endclocking
   
   modport M1_drv_mp (clocking M1_drv_cb);

endinterface
