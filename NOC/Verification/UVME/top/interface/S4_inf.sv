interface S4_inf (input bit ACLK,ARESETn,ASW_RESET);
   
    /***************************************************
    apb slave4 inputs
    ****************************************************/
    logic [31:0] S4_PRDATA;
    logic        S4_PREADY;
    logic        S4_PSLVERR;

    /***************************************************
     apb slave4 outputs
    ****************************************************/

    logic        S4_PENABLE;
    logic        S4_PSEL;
    logic        S4_PWRITE;
    logic [31:0] S4_PADDR;
    logic [31:0] S4_PDATA;
    logic [3:0]  S4_PSTRB;
endinterface
  
