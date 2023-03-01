interface S2_inf (input bit ACLK ,ARESETn,ASW_RESET);
   
    /***************************************************
     apb slave2 inputs
    ****************************************************/
    logic [31:0] S2_PRDATA;
    logic        S2_PREADY;
    logic        S2_PSLVERR; //slave error signal

    /***************************************************
    apb slave2 outputs
    ****************************************************/

    logic        S2_PENABLE;
    logic        S2_PSEL;
    logic        S2_PWRITE;
    logic [31:0] S2_PADDR;
    logic [31:0] S2_PDATA;
    logic [3:0]  S2_PSTRB;
    int s2_blen;

endinterface

