interface M0_inf (input bit ACLK,ARESETn,ASW_RESET);


    /**************************************************
    axi4 master1 inputs
    ***************************************************/
    logic [3:0]  M0_MID;
    logic [3:0]  M0_AWID;
    logic [3:0]  M0_BID;
    logic [3:0]  M0_WID;
    logic [3:0]  M0_ARID;
    logic [3:0]  M0_RID;
    logic [2:0]  M0_AWSIZE;
    logic [2:0]  M0_ARSIZE;
  
  //  logic [2:0]  M0_AWPROT;
  //  logic [2:0]  M0_ARPROT;
    
  
    logic        M0_AWVALID;
    logic [31:0] M0_AWADDR;
    logic [3:0]  M0_AWLEN;
    logic [1:0]  M0_AWBURST; 
  
    logic        M0_WVALID;
    logic [31:0] M0_WDATA;
    logic        M0_WLAST;
    logic [3:0]  M0_WSTRB; //write strobe signal indicates which byte of the writebus is valid.
  
    logic        M0_BREADY;
  
    logic        M0_ARVALID;
    logic [31:0] M0_ARADDR;
    logic [3:0]  M0_ARLEN;
    logic [1:0]  M0_ARBURST;
  
    logic        M0_RREADY;

    /*****************************************************
    axi4 master1 outputs
    *****************************************************/

    logic       M0_AWREADY;
    logic       M0_WREADY;    
    logic       M0_BVALID;
    logic [1:0] M0_BRESP;
   
    logic       M0_ARREADY;
    logic       M0_RVALID;
    logic [31:0]M0_RDATA;
    logic [1:0] M0_RRESP;
    logic       M0_RLAST;
   
   
   
    clocking M0_drv_cb @(posedge ACLK);
   
        // default input #1 output #1;  //input and output skew
   
        output M0_AWADDR,M0_AWVALID,M0_AWLEN,M0_AWBURST,M0_AWSIZE;
        input  M0_AWREADY;
   
        output M0_WDATA,M0_WSTRB,M0_WVALID,M0_WLAST;
        input M0_WREADY;
   
        output M0_BREADY;
        input M0_BRESP,M0_BVALID;
       
        output M0_ARADDR,M0_ARVALID,M0_ARLEN,M0_ARBURST,M0_ARSIZE;
        input M0_ARREADY;
   
        input M0_RDATA,M0_RRESP,M0_RVALID;
        output M0_RREADY;
    endclocking
   
    modport m0_drv_mp (clocking M0_drv_cb);

endinterface
