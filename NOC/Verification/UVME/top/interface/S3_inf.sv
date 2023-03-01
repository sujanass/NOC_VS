interface S3_inf (input logic ACLK,ARESETn,ASW_RESET);
   

    /***************************************************
    apb slave3 inputs
    ****************************************************/
    logic [31:0] S3_PRDATA;
    logic        S3_PREADY;
    logic        S3_PSLVERR;


    /***************************************************
     apb slave3 outputs
    ****************************************************/

    logic       S3_PENABLE;
    logic       S3_PSEL;
    logic       S3_PWRITE;
    logic [31:0]S3_PADDR;
    logic [31:0]S3_PDATA;
    logic [3:0] S3_PSTRB;

endinterface
