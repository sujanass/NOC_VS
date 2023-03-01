interface S5_inf (input bit ACLK,ARESETn,ASW_RESET);
   
 
    /***************************************************
    apb slave5 inputs
    ****************************************************/
    logic [31:0] S5_PRDATA;
    logic        S5_PREADY;
    logic        S5_PSLVERR;


   /***************************************************
   apb slave5 outputs
   ****************************************************/

    logic        S5_PENABLE;
    logic        S5_PSEL;
    logic        S5_PWRITE;
    logic [31:0] S5_PADDR;
    logic [31:0] S5_PDATA;
    logic [3:0]  S5_PSTRB;

endinterface

