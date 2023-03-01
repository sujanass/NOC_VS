module noc_arbiter
       #(parameter WIDTH_CID   = 4 // Channel ID width in bits
                , WIDTH_ID    = 4 // ID width in bits
                , WIDTH_AD    =32 // address width
                , WIDTH_DA    =32 // data width
                , WIDTH_DS    =(WIDTH_DA/8)  // data strobe width
                , WIDTH_SID   =(WIDTH_CID+WIDTH_ID)// ID for slave
                `ifdef AMBA_AXI_AWUSER
                , WIDTH_AWUSER= 1 // Write-address user path
                `endif
                `ifdef AMBA_AXI_WUSER
                , WIDTH_WUSER = 1 // Write-data user path
                `endif
                `ifdef AMBA_AXI_BUSER
                , WIDTH_BUSER = 1 // Write-response user path
                `endif
                `ifdef AMBA_AXI_ARUSER
                , WIDTH_ARUSER= 1 // read-address user path
                `endif
                `ifdef AMBA_AXI_RUSER
                , WIDTH_RUSER = 1 // read-data user path
                `endif
                , SLAVE_EN0   = 1 , ADDR_BASE0  =32'hA0000000 , ADDR_LENGTH0=18 // effective addre bits
                , SLAVE_EN1   = 1 , ADDR_BASE1  =32'hA0040000 , ADDR_LENGTH1=17 // effective addre bits
                , SLAVE_EN2   = 1 , ADDR_BASE2  =32'hA0060000 , ADDR_LENGTH2=10 // effective addre bits
                , SLAVE_EN3   = 1 , ADDR_BASE3  =32'hA0061000 , ADDR_LENGTH3=10 // effective addre bits
                , SLAVE_EN4   = 1 , ADDR_BASE4  =32'hA0062000 , ADDR_LENGTH4=10 // effective addre bits
                , SLAVE_EN5   = 1 , ADDR_BASE5  =32'hA0063000 , ADDR_LENGTH5=10 // effective addre bits
                , NUM_MASTER  = 2  // should not be changed
                , NUM_SLAVE   = 6  // should not be changed
       )
       (
       input   wire                      ACLK
     , input   wire                      ARESETn 
     , input   wire                      ASW_RESET
     //--------------------------------------------------------------
     , input   wire  [WIDTH_CID-1:0]     M0_MID   // if not sure use 'h0
     , input   wire  [WIDTH_ID-1:0]      M0_AWID
     , input   wire  [WIDTH_AD-1:0]      M0_AWADDR
    
     , input   wire  [ 3:0]              M0_AWLEN
     
     , input   wire  [ 2:0]              M0_AWSIZE
     , input   wire  [ 1:0]              M0_AWBURST
    
     `ifdef AMBA_AXI_PROT
     , input   wire  [ 2:0]              M0_AWPROT
     `endif

     , input   wire                      M0_AWVALID
     , output  wire                      M0_AWREADY
    
     , input   wire  [WIDTH_ID-1:0]      M0_WID
     , input   wire  [WIDTH_DA-1:0]      M0_WDATA
     , input   wire  [WIDTH_DS-1:0]      M0_WSTRB
     , input   wire                      M0_WLAST
     , input   wire                      M0_WVALID
     , output  wire                      M0_WREADY
     
     , output  wire  [WIDTH_ID-1:0]      M0_BID
     , output  wire  [ 1:0]              M0_BRESP
     , output  wire                      M0_BVALID
     , input   wire                      M0_BREADY
     
     , input   wire  [WIDTH_ID-1:0]      M0_ARID
     , input   wire  [WIDTH_AD-1:0]      M0_ARADDR

     , input   wire  [ 3:0]              M0_ARLEN
     
     , input   wire  [ 2:0]              M0_ARSIZE
     , input   wire  [ 1:0]              M0_ARBURST
     
     `ifdef AMBA_AXI_PROT
     , input   wire  [ 2:0]              M0_ARPROT
     `endif
     , input   wire                      M0_ARVALID
     , output  wire                      M0_ARREADY
    
     , output  wire  [WIDTH_ID-1:0]      M0_RID
     , output  wire  [WIDTH_DA-1:0]      M0_RDATA
     , output  wire  [ 1:0]              M0_RRESP
     , output  wire                      M0_RLAST
     , output  wire                      M0_RVALID
     , input   wire                      M0_RREADY
     
     //--------------------------------------------------------------
     , input   wire  [WIDTH_CID-1:0]     M1_MID   // if not sure use 'h1
     , input   wire  [WIDTH_ID-1:0]      M1_AWID
     , input   wire  [WIDTH_AD-1:0]      M1_AWADDR
    
     , input   wire  [ 3:0]              M1_AWLEN
    
     , input   wire  [ 2:0]              M1_AWSIZE
     , input   wire  [ 1:0]              M1_AWBURST
     
     `ifdef AMBA_AXI_PROT
     , input   wire  [ 2:0]              M1_AWPROT
     `endif

     , input   wire                      M1_AWVALID
     , output  wire                      M1_AWREADY
    
     , input   wire  [WIDTH_ID-1:0]      M1_WID
     , input   wire  [WIDTH_DA-1:0]      M1_WDATA
     , input   wire  [WIDTH_DS-1:0]      M1_WSTRB
     , input   wire                      M1_WLAST
     , input   wire                      M1_WVALID
     , output  wire                      M1_WREADY
    
     , output  wire  [WIDTH_ID-1:0]      M1_BID
     , output  wire  [ 1:0]              M1_BRESP
     , output  wire                      M1_BVALID
     , input   wire                      M1_BREADY
     
     , input   wire  [WIDTH_ID-1:0]      M1_ARID
     , input   wire  [WIDTH_AD-1:0]      M1_ARADDR
    
     , input   wire  [ 3:0]              M1_ARLEN
     
     , input   wire  [ 2:0]              M1_ARSIZE
     , input   wire  [ 1:0]              M1_ARBURST
     
     , input   wire                      M1_ARVALID
     , output  wire                      M1_ARREADY
     
     , output  wire  [WIDTH_ID-1:0]      M1_RID
     , output  wire  [WIDTH_DA-1:0]      M1_RDATA
     , output  wire  [ 1:0]              M1_RRESP
     , output  wire                      M1_RLAST
     , output  wire                      M1_RVALID
     , input   wire                      M1_RREADY
     
     //--------------------------------------------------------------
     , output  wire   [WIDTH_SID-1:0]    S0_AWID
     , output  wire   [WIDTH_AD-1:0]     S0_AWADDR
     
     , output  wire   [ 3:0]             S0_AWLEN
     
     , output  wire   [ 2:0]             S0_AWSIZE
     , output  wire   [ 1:0]             S0_AWBURST
     
     , output  wire                      S0_AWVALID
     , input   wire                      S0_AWREADY
     
     , output  wire   [WIDTH_SID-1:0]    S0_WID
     , output  wire   [WIDTH_DA-1:0]     S0_WDATA
     , output  wire   [WIDTH_DS-1:0]     S0_WSTRB
     , output  wire                      S0_WLAST
     , output  wire                      S0_WVALID
     , input   wire                      S0_WREADY
    
     , input   wire   [WIDTH_SID-1:0]    S0_BID
     , input   wire   [ 1:0]             S0_BRESP
     , input   wire                      S0_BVALID
     , output  wire                      S0_BREADY
     
     , output  wire   [WIDTH_SID-1:0]    S0_ARID
     , output  wire   [WIDTH_AD-1:0]     S0_ARADDR
     
     , output  wire   [ 3:0]             S0_ARLEN
    
     , output  wire   [ 2:0]             S0_ARSIZE
     , output  wire   [ 1:0]             S0_ARBURST
     
     , output  wire                      S0_ARVALID
     , input   wire                      S0_ARREADY
    
     , input   wire   [WIDTH_SID-1:0]    S0_RID
     , input   wire   [WIDTH_DA-1:0]     S0_RDATA
     , input   wire   [ 1:0]             S0_RRESP
     , input   wire                      S0_RLAST
     , input   wire                      S0_RVALID
     , output  wire                      S0_RREADY
    
     //--------------------------------------------------------------
     , output  wire   [WIDTH_SID-1:0]    S1_AWID
     , output  wire   [WIDTH_AD-1:0]     S1_AWADDR
     
     , output  wire   [ 3:0]             S1_AWLEN
     
     , output  wire   [ 2:0]             S1_AWSIZE
     , output  wire   [ 1:0]             S1_AWBURST
     
     , output  wire                      S1_AWVALID
     , input   wire                      S1_AWREADY
     
     , output  wire   [WIDTH_SID-1:0]    S1_WID
     , output  wire   [WIDTH_DA-1:0]     S1_WDATA
     , output  wire   [WIDTH_DS-1:0]     S1_WSTRB
     , output  wire                      S1_WLAST
     , output  wire                      S1_WVALID
     , input   wire                      S1_WREADY
     
     , input   wire   [WIDTH_SID-1:0]    S1_BID
     , input   wire   [ 1:0]             S1_BRESP
     , input   wire                      S1_BVALID
     , output  wire                      S1_BREADY
    
     , output  wire   [WIDTH_SID-1:0]    S1_ARID
     , output  wire   [WIDTH_AD-1:0]     S1_ARADDR
     
     , output  wire   [ 3:0]             S1_ARLEN
     
     , output  wire   [ 2:0]             S1_ARSIZE
     , output  wire   [ 1:0]             S1_ARBURST
    
     `ifdef AMBA_AXI_PROT
     , output  wire   [ 2:0]             S1_ARPROT
     `endif
     , output  wire                      S1_ARVALID
     , input   wire                      S1_ARREADY
     
     , input   wire   [WIDTH_SID-1:0]    S1_RID
     , input   wire   [WIDTH_DA-1:0]     S1_RDATA
     , input   wire   [ 1:0]             S1_RRESP
     , input   wire                      S1_RLAST
     , input   wire                      S1_RVALID
     , output  wire                      S1_RREADY
     
     //--------------------------------------------------------------
    //    APB SIGNALS 
    , output  logic   [WIDTH_AD-1:0]     S2_PADDR        ,
      output  logic   [WIDTH_DA-1:0]     S2_PDATA        ,
      output  logic                      S2_PWRITE       ,
      output  logic                      S2_PENABLE      ,
      output  logic                      S2_PSEL         ,
      output  logic   [3:0]              S2_PSTRB        ,
      input   logic                      S2_PREADY       ,
      input   logic   [WIDTH_DA-1:0]     S2_PRDATA       ,
      input   logic                      S2_PSLVERR      ,

      output  logic   [WIDTH_AD-1:0]     S3_PADDR        ,
      output  logic   [WIDTH_DA-1:0]     S3_PDATA        ,
      output  logic                      S3_PWRITE       ,
      output  logic                      S3_PENABLE      ,
      output  logic                      S3_PSEL         ,
      output  logic   [3:0]              S3_PSTRB        ,
      input   logic                      S3_PREADY       ,
      input   logic   [WIDTH_DA-1:0]     S3_PRDATA       ,
      input   logic                      S3_PSLVERR      ,

      output  logic   [WIDTH_AD-1:0]     S4_PADDR        ,
      output  logic   [WIDTH_DA-1:0]     S4_PDATA        ,
      output  logic                      S4_PWRITE       ,
      output  logic                      S4_PENABLE      ,
      output  logic                      S4_PSEL         ,
      output  logic   [3:0]              S4_PSTRB        ,
      input   logic                      S4_PREADY       ,
      input   logic   [WIDTH_DA-1:0]     S4_PRDATA       ,
      input   logic                      S4_PSLVERR      ,

      output  logic   [WIDTH_AD-1:0]     S5_PADDR        ,
      output  logic   [WIDTH_DA-1:0]     S5_PDATA        ,
      output  logic                      S5_PWRITE       ,
      output  logic                      S5_PENABLE      ,
      output  logic                      S5_PSEL         ,
      output  logic   [3:0]              S5_PSTRB        ,
      input   logic                      S5_PREADY       ,
      input   logic   [WIDTH_DA-1:0]     S5_PRDATA       ,
      input   logic                      S5_PSLVERR 
);

logic  [WIDTH_AD-1:0]    S3_AWADDR_W        ; 
logic  [3:0]             S3_AWLEN_W         ; 
logic  [2:0]             S3_AWSIZE_W        ; 
logic  [1:0]             S3_AWBURST_W       ; 
logic                    S3_AWREADY_W       ; 
logic  [7:0]             S3_WID_W           ;
logic  [WIDTH_DA-1:0]    S3_WDATA_W         ; 
logic  [3:0]             S3_WSTRB_W         ; 
logic                    S3_WLAST_W         ; 
logic                    S3_WVALID_W        ; 
logic                    S3_WREADY_W        ; 
logic  [1:0]             S3_BRESP_W         ; 
logic                    S3_BVALID_W        ; 
logic                    S3_BREADY_W        ; 
logic  [7:0]             S3_ARID_W          ;
logic  [WIDTH_AD-1:0]    S3_ARADDR_W        ; 
logic  [3:0]             S3_ARLEN_W         ; 
logic  [2:0]             S3_ARSIZE_W        ; 
logic  [1:0]             S3_ARBURST_W       ; 
logic                    S3_ARVALID_W       ; 
logic                    S3_ARREADY_W       ; 
logic  [WIDTH_DA-1:0]    S3_RDATA_W         ; 
logic  [1:0]             S3_RRESP_W         ; 
logic                    S3_RLAST_W         ; 
logic                    S3_RVALID_W        ; 
logic                    S3_RREADY_W        ; 

logic  [WIDTH_AD-1:0]    S4_AWADDR_W        ; 
logic  [3:0]             S4_AWLEN_W         ; 
logic  [2:0]             S4_AWSIZE_W        ; 
logic  [1:0]             S4_AWBURST_W       ; 
logic                    S4_AWREADY_W       ; 
logic  [7:0]             S4_WID_W           ;
logic  [WIDTH_DA-1:0]    S4_WDATA_W         ; 
logic  [3:0]             S4_WSTRB_W         ; 
logic                    S4_WLAST_W         ; 
logic                    S4_WVALID_W        ; 
logic                    S4_WREADY_W        ; 
logic  [1:0]             S4_BRESP_W         ; 
logic                    S4_BVALID_W        ; 
logic                    S4_BREADY_W        ; 
logic  [7:0]             S4_ARID_W          ;
logic  [WIDTH_AD-1:0]    S4_ARADDR_W        ; 
logic  [3:0]             S4_ARLEN_W         ; 
logic  [2:0]             S4_ARSIZE_W        ; 
logic  [1:0]             S4_ARBURST_W       ; 
logic                    S4_ARVALID_W       ; 
logic                    S4_ARREADY_W       ; 
logic  [WIDTH_DA-1:0]    S4_RDATA_W         ; 
logic  [1:0]             S4_RRESP_W         ; 
logic                    S4_RLAST_W         ; 
logic                    S4_RVALID_W        ; 
logic                    S4_RREADY_W        ; 

logic  [WIDTH_AD-1:0]    S5_AWADDR_W        ; 
logic  [3:0]             S5_AWLEN_W         ; 
logic  [2:0]             S5_AWSIZE_W        ; 
logic  [1:0]             S5_AWBURST_W       ; 
logic                    S5_AWREADY_W       ; 
logic  [7:0]             S5_WID_W           ;
logic  [WIDTH_DA-1:0]    S5_WDATA_W         ; 
logic  [3:0]             S5_WSTRB_W         ; 
logic                    S5_WLAST_W         ; 
logic                    S5_WVALID_W        ; 
logic                    S5_WREADY_W        ; 
logic  [1:0]             S5_BRESP_W         ; 
logic                    S5_BVALID_W        ; 
logic                    S5_BREADY_W        ; 
logic  [7:0]             S5_ARID_W          ;
logic  [WIDTH_AD-1:0]    S5_ARADDR_W        ; 
logic  [3:0]             S5_ARLEN_W         ; 
logic  [2:0]             S5_ARSIZE_W        ; 
logic  [1:0]             S5_ARBURST_W       ; 
logic                    S5_ARVALID_W       ; 
logic                    S5_ARREADY_W       ; 
logic  [WIDTH_DA-1:0]    S5_RDATA_W         ; 
logic  [1:0]             S5_RRESP_W         ; 
logic                    S5_RLAST_W         ; 
logic                    S5_RVALID_W        ; 
logic                    S5_RREADY_W        ; 

logic  [WIDTH_AD-1:0]    S6_AWADDR_W        ; 
logic  [3:0]             S6_AWLEN_W         ; 
logic  [2:0]             S6_AWSIZE_W        ; 
logic  [1:0]             S6_AWBURST_W       ; 
logic                    S6_AWREADY_W       ; 
logic  [7:0]             S6_WID_W           ;
logic  [WIDTH_DA-1:0]    S6_WDATA_W         ; 
logic  [3:0]             S6_WSTRB_W         ; 
logic                    S6_WLAST_W         ; 
logic                    S6_WVALID_W        ; 
logic                    S6_WREADY_W        ; 
logic  [1:0]             S6_BRESP_W         ; 
logic                    S6_BVALID_W        ; 
logic                    S6_BREADY_W        ; 
logic  [7:0]             S6_ARID_W          ;
logic  [WIDTH_AD-1:0]    S6_ARADDR_W        ; 
logic  [3:0]             S6_ARLEN_W         ; 
logic  [2:0]             S6_ARSIZE_W        ; 
logic  [1:0]             S6_ARBURST_W       ; 
logic                    S6_ARVALID_W       ; 
logic                    S6_ARREADY_W       ; 
logic  [WIDTH_DA-1:0]    S6_RDATA_W         ; 
logic  [1:0]             S6_RRESP_W         ; 
logic                    S6_RLAST_W         ; 
logic                    S6_RVALID_W        ; 
logic                    S6_RREADY_W        ; 

logic  [7:0]             S3_BID_W           ;
logic  [7:0]             S4_BID_W           ;
logic  [7:0]             S5_BID_W           ;
logic  [7:0]             S6_BID_W           ;

logic  [7:0]             S3_RID_W           ;
logic  [7:0]             S4_RID_W           ;
logic  [7:0]             S5_RID_W           ;
logic  [7:0]             S6_RID_W           ;
///////////////////////////////////////////////////////////////
//          AXI MASTER 2 AND SLAVE 6 MODULE INSTANTIATION    //
///////////////////////////////////////////////////////////////
amba_axi_m2s6
       #(
        .WIDTH_CID  (  WIDTH_CID  )       ,
        .WIDTH_ID   (  WIDTH_ID   )       , 
        .WIDTH_AD   (  WIDTH_AD   )       , 
        .WIDTH_DA   (  WIDTH_DA   )       , 
        .WIDTH_DS   (  WIDTH_DS   )       , 
        .WIDTH_SID  (  WIDTH_SID  )       , 
        .SLAVE_EN0  (  SLAVE_EN0  )       ,  
        .SLAVE_EN1  (  SLAVE_EN1  )       ,  
        .SLAVE_EN2  (  SLAVE_EN2  )       ,  
        .SLAVE_EN3  (  SLAVE_EN3  )       ,  
        .SLAVE_EN4  (  SLAVE_EN4  )       ,  
        .SLAVE_EN5  (  SLAVE_EN5  )       ,  
        .NUM_MASTER (  NUM_MASTER )       , 
        .NUM_SLAVE  (  NUM_SLAVE  )         
        )
amba_axi_m2s6_inst
(
        .ARESETn     ( ARESETn        )     ,        
        .ACLK        ( ACLK           )     ,
                                            
        .M0_MID      ( M0_MID         )     ,
        .M0_AWID     ( M0_AWID        )     ,
        .M0_AWADDR   ( M0_AWADDR      )     ,
        .M0_AWLEN    ( M0_AWLEN       )     ,
        .M0_AWSIZE   ( M0_AWSIZE      )     ,
        .M0_AWBURST  ( M0_AWBURST     )     ,
        .M0_AWVALID  ( M0_AWVALID     )     ,
        .M0_AWREADY  ( M0_AWREADY     )     ,
        .M0_WID      ( M0_WID         )     ,
        .M0_WDATA    ( M0_WDATA       )     ,
        .M0_WSTRB    ( M0_WSTRB       )     ,
        .M0_WLAST    ( M0_WLAST       )     ,
        .M0_WVALID   ( M0_WVALID      )     ,
        .M0_WREADY   ( M0_WREADY      )     ,
        .M0_BID      ( M0_BID         )     ,
        .M0_BRESP    ( M0_BRESP       )     ,
        .M0_BVALID   ( M0_BVALID      )     ,
        .M0_BREADY   ( M0_BREADY      )     ,
        .M0_ARID     ( M0_ARID        )     ,
        .M0_ARADDR   ( M0_ARADDR      )     ,
        .M0_ARLEN    ( M0_ARLEN       )     ,
        .M0_ARSIZE   ( M0_ARSIZE      )     ,
        .M0_ARBURST  ( M0_ARBURST     )     ,
        .M0_ARVALID  ( M0_ARVALID     )     ,
        .M0_ARREADY  ( M0_ARREADY     )     ,
        .M0_RID      ( M0_RID         )     ,
        .M0_RDATA    ( M0_RDATA       )     ,
        .M0_RRESP    ( M0_RRESP       )     ,
        .M0_RLAST    ( M0_RLAST       )     ,
        .M0_RVALID   ( M0_RVALID      )     ,
        .M0_RREADY   ( M0_RREADY      )     ,
                                            
        .M1_MID      ( M1_MID         )     ,
        .M1_AWID     ( M1_AWID        )     ,
        .M1_AWADDR   ( M1_AWADDR      )     ,
        .M1_AWLEN    ( M1_AWLEN       )     ,
        .M1_AWSIZE   ( M1_AWSIZE      )     ,
        .M1_AWBURST  ( M1_AWBURST     )     ,
        .M1_AWVALID  ( M1_AWVALID     )     ,
        .M1_AWREADY  ( M1_AWREADY     )     ,
        .M1_WID      ( M1_WID         )     ,
        .M1_WDATA    ( M1_WDATA       )     ,
        .M1_WSTRB    ( M1_WSTRB       )     ,
        .M1_WLAST    ( M1_WLAST       )     ,
        .M1_WVALID   ( M1_WVALID      )     ,
        .M1_WREADY   ( M1_WREADY      )     ,
        .M1_BID      ( M1_BID         )     ,
        .M1_BRESP    ( M1_BRESP       )     ,
        .M1_BVALID   ( M1_BVALID      )     ,
        .M1_BREADY   ( M1_BREADY      )     ,
        .M1_ARID     ( M1_ARID        )     ,
        .M1_ARADDR   ( M1_ARADDR      )     ,
        .M1_ARLEN    ( M1_ARLEN       )     ,
        .M1_ARSIZE   ( M1_ARSIZE      )     ,
        .M1_ARBURST  ( M1_ARBURST     )     ,
        .M1_ARVALID  ( M1_ARVALID     )     ,
        .M1_ARREADY  ( M1_ARREADY     )     ,
        .M1_RID      ( M1_RID         )     ,
        .M1_RDATA    ( M1_RDATA       )     ,
        .M1_RRESP    ( M1_RRESP       )     ,
        .M1_RLAST    ( M1_RLAST       )     ,
        .M1_RVALID   ( M1_RVALID      )     ,
        .M1_RREADY   ( M1_RREADY      )     ,
                                            
        .S0_AWID     ( S0_AWID        )     ,
        .S0_AWADDR   ( S0_AWADDR      )     ,
        .S0_AWLEN    ( S0_AWLEN       )     ,
        .S0_AWSIZE   ( S0_AWSIZE      )     ,
        .S0_AWBURST  ( S0_AWBURST     )     ,
        .S0_AWVALID  ( S0_AWVALID     )     ,
        .S0_AWREADY  ( S0_AWREADY     )     ,
        .S0_WID      ( S0_WID         )     ,
        .S0_WDATA    ( S0_WDATA       )     ,
        .S0_WSTRB    ( S0_WSTRB       )     ,
        .S0_WLAST    ( S0_WLAST       )     ,
        .S0_WVALID   ( S0_WVALID      )     ,
        .S0_WREADY   ( S0_WREADY      )     ,
        .S0_BID      ( S0_BID         )     ,
        .S0_BRESP    ( S0_BRESP       )     ,
        .S0_BVALID   ( S0_BVALID      )     ,
        .S0_BREADY   ( S0_BREADY      )     ,
        .S0_ARID     ( S0_ARID        )     ,
        .S0_ARADDR   ( S0_ARADDR      )     ,
        .S0_ARLEN    ( S0_ARLEN       )     ,
        .S0_ARSIZE   ( S0_ARSIZE      )     ,
        .S0_ARBURST  ( S0_ARBURST     )     ,
        .S0_ARVALID  ( S0_ARVALID     )     ,
        .S0_ARREADY  ( S0_ARREADY     )     ,
        .S0_RID      ( S0_RID         )     ,
        .S0_RDATA    ( S0_RDATA       )     ,
        .S0_RRESP    ( S0_RRESP       )     ,
        .S0_RLAST    ( S0_RLAST       )     ,
        .S0_RVALID   ( S0_RVALID      )     ,
        .S0_RREADY   ( S0_RREADY      )     ,
                                            
        .S1_AWID     ( S1_AWID        )     ,
        .S1_AWADDR   ( S1_AWADDR      )     ,
        .S1_AWLEN    ( S1_AWLEN       )     ,
        .S1_AWSIZE   ( S1_AWSIZE      )     ,
        .S1_AWBURST  ( S1_AWBURST     )     ,
        .S1_AWVALID  ( S1_AWVALID     )     ,
        .S1_AWREADY  ( S1_AWREADY     )     ,
        .S1_WID      ( S1_WID         )     ,
        .S1_WDATA    ( S1_WDATA       )     ,
        .S1_WSTRB    ( S1_WSTRB       )     ,
        .S1_WLAST    ( S1_WLAST       )     ,
        .S1_WVALID   ( S1_WVALID      )     ,
        .S1_WREADY   ( S1_WREADY      )     ,
        .S1_BID      ( S1_BID         )     ,
        .S1_BRESP    ( S1_BRESP       )     ,
        .S1_BVALID   ( S1_BVALID      )     ,
        .S1_BREADY   ( S1_BREADY      )     ,
        .S1_ARID     ( S1_ARID        )     ,
        .S1_ARADDR   ( S1_ARADDR      )     ,
        .S1_ARLEN    ( S1_ARLEN       )     ,
        .S1_ARSIZE   ( S1_ARSIZE      )     ,
        .S1_ARBURST  ( S1_ARBURST     )     ,
        .S1_ARVALID  ( S1_ARVALID     )     ,
        .S1_ARREADY  ( S1_ARREADY     )     ,
        .S1_RID      ( S1_RID         )     ,
        .S1_RDATA    ( S1_RDATA       )     ,
        .S1_RRESP    ( S1_RRESP       )     ,
        .S1_RLAST    ( S1_RLAST       )     ,
        .S1_RVALID   ( S1_RVALID      )     ,
        .S1_RREADY   ( S1_RREADY      )     ,
                                            
        .S2_AWID     (                )     ,
        .S2_AWADDR   ( S3_AWADDR_W    )     ,
        .S2_AWLEN    ( S3_AWLEN_W     )     ,
        .S2_AWSIZE   ( S3_AWSIZE_W    )     ,
        .S2_AWBURST  ( S3_AWBURST_W   )     ,
        .S2_AWVALID  ( S3_AWVALID_W   )     ,
        .S2_AWREADY  ( S3_AWREADY_W   )     ,
        .S2_WID      ( S3_WID_W       )     ,
        .S2_WDATA    ( S3_WDATA_W     )     ,
        .S2_WSTRB    ( S3_WSTRB_W     )     ,
        .S2_WLAST    ( S3_WLAST_W     )     ,
        .S2_WVALID   ( S3_WVALID_W    )     ,
        .S2_WREADY   ( S3_WREADY_W    )     ,
        .S2_BID      ( S3_BID_W       )     ,
        .S2_BRESP    ( S3_BRESP_W     )     ,
        .S2_BVALID   ( S3_BVALID_W    )     ,
        .S2_BREADY   ( S3_BREADY_W    )     ,
        .S2_ARID     ( S3_ARID_W      )     ,
        .S2_ARADDR   ( S3_ARADDR_W    )     ,
        .S2_ARLEN    ( S3_ARLEN_W     )     ,
        .S2_ARSIZE   ( S3_ARSIZE_W    )     ,
        .S2_ARBURST  ( S3_ARBURST_W   )     ,
        .S2_ARVALID  ( S3_ARVALID_W   )     ,
        .S2_ARREADY  ( S3_ARREADY_W   )     ,
        .S2_RID      ( S3_RID_W       )     ,
        .S2_RDATA    ( S3_RDATA_W     )     ,
        .S2_RRESP    ( S3_RRESP_W     )     ,
        .S2_RLAST    ( S3_RLAST_W     )     ,
        .S2_RVALID   ( S3_RVALID_W    )     ,
        .S2_RREADY   ( S3_RREADY_W    )     ,
                                            
        .S3_AWID     (                )     ,
        .S3_AWADDR   ( S4_AWADDR_W    )     ,
        .S3_AWLEN    ( S4_AWLEN_W     )     ,
        .S3_AWSIZE   ( S4_AWSIZE_W    )     ,
        .S3_AWBURST  ( S4_AWBURST_W   )     ,
        .S3_AWVALID  ( S4_AWVALID_W   )     ,
        .S3_AWREADY  ( S4_AWREADY_W   )     ,
        .S3_WID      ( S4_WID_W       )     ,
        .S3_WDATA    ( S4_WDATA_W     )     ,
        .S3_WSTRB    ( S4_WSTRB_W     )     ,
        .S3_WLAST    ( S4_WLAST_W     )     ,
        .S3_WVALID   ( S4_WVALID_W    )     ,
        .S3_WREADY   ( S4_WREADY_W    )     ,
        .S3_BID      ( S4_BID_W       )     ,
        .S3_BRESP    ( S4_BRESP_W     )     ,
        .S3_BVALID   ( S4_BVALID_W    )     ,
        .S3_BREADY   ( S4_BREADY_W    )     ,
        .S3_ARID     ( S4_ARID_W      )     ,
        .S3_ARADDR   ( S4_ARADDR_W    )     ,
        .S3_ARLEN    ( S4_ARLEN_W     )     ,
        .S3_ARSIZE   ( S4_ARSIZE_W    )     ,
        .S3_ARBURST  ( S4_ARBURST_W   )     ,
        .S3_ARVALID  ( S4_ARVALID_W   )     ,
        .S3_ARREADY  ( S4_ARREADY_W   )     ,
        .S3_RID      ( S4_RID_W       )     ,
        .S3_RDATA    ( S4_RDATA_W     )     ,
        .S3_RRESP    ( S4_RRESP_W     )     ,
        .S3_RLAST    ( S4_RLAST_W     )     ,
        .S3_RVALID   ( S4_RVALID_W    )     ,
        .S3_RREADY   ( S4_RREADY_W    )     ,
                                            
        .S4_AWID     (                )     ,
        .S4_AWADDR   ( S5_AWADDR_W    )     ,
        .S4_AWLEN    ( S5_AWLEN_W     )     ,
        .S4_AWSIZE   ( S5_AWSIZE_W    )     ,
        .S4_AWBURST  ( S5_AWBURST_W   )     ,
        .S4_AWVALID  ( S5_AWVALID_W   )     ,
        .S4_AWREADY  ( S5_AWREADY_W   )     ,
        .S4_WID      ( S5_WID_W       )     ,
        .S4_WDATA    ( S5_WDATA_W     )     ,
        .S4_WSTRB    ( S5_WSTRB_W     )     ,
        .S4_WLAST    ( S5_WLAST_W     )     ,
        .S4_WVALID   ( S5_WVALID_W    )     ,
        .S4_WREADY   ( S5_WREADY_W    )     ,
        .S4_BID      ( S5_BID_W       )     ,
        .S4_BRESP    ( S5_BRESP_W     )     ,
        .S4_BVALID   ( S5_BVALID_W    )     ,
        .S4_BREADY   ( S5_BREADY_W    )     ,
        .S4_ARID     ( S5_ARID_W      )     ,
        .S4_ARADDR   ( S5_ARADDR_W    )     ,
        .S4_ARLEN    ( S5_ARLEN_W     )     ,
        .S4_ARSIZE   ( S5_ARSIZE_W    )     ,
        .S4_ARBURST  ( S5_ARBURST_W   )     ,
        .S4_ARVALID  ( S5_ARVALID_W   )     ,
        .S4_ARREADY  ( S5_ARREADY_W   )     ,
        .S4_RID      ( S5_RID_W       )     ,
        .S4_RDATA    ( S5_RDATA_W     )     ,
        .S4_RRESP    ( S5_RRESP_W     )     ,
        .S4_RLAST    ( S5_RLAST_W     )     ,
        .S4_RVALID   ( S5_RVALID_W    )     ,
        .S4_RREADY   ( S5_RREADY_W    )     ,
                                      
        .S5_AWID     (                )     ,
        .S5_AWADDR   ( S6_AWADDR_W    )     ,
        .S5_AWLEN    ( S6_AWLEN_W     )     ,
        .S5_AWSIZE   ( S6_AWSIZE_W    )     ,
        .S5_AWBURST  ( S6_AWBURST_W   )     ,
        .S5_AWVALID  ( S6_AWVALID_W   )     ,
        .S5_AWREADY  ( S6_AWREADY_W   )     ,
        .S5_WID      ( S6_WID_W       )     ,
        .S5_WDATA    ( S6_WDATA_W     )     ,
        .S5_WSTRB    ( S6_WSTRB_W     )     ,
        .S5_WLAST    ( S6_WLAST_W     )     ,
        .S5_WVALID   ( S6_WVALID_W    )     ,
        .S5_WREADY   ( S6_WREADY_W    )     ,
        .S5_BID      ( S6_BID_W       )     ,
        .S5_BRESP    ( S6_BRESP_W     )     ,
        .S5_BVALID   ( S6_BVALID_W    )     ,
        .S5_BREADY   ( S6_BREADY_W    )     ,
        .S5_ARID     ( S6_ARID_W      )     ,
        .S5_ARADDR   ( S6_ARADDR_W    )     ,
        .S5_ARLEN    ( S6_ARLEN_W     )     ,
        .S5_ARSIZE   ( S6_ARSIZE_W    )     ,
        .S5_ARBURST  ( S6_ARBURST_W   )     ,
        .S5_ARVALID  ( S6_ARVALID_W   )     ,
        .S5_ARREADY  ( S6_ARREADY_W   )     ,
        .S5_RID      ( S6_RID_W       )     ,
        .S5_RDATA    ( S6_RDATA_W     )     ,
        .S5_RRESP    ( S6_RRESP_W     )     ,
        .S5_RLAST    ( S6_RLAST_W     )     ,
        .S5_RVALID   ( S6_RVALID_W    )     ,
        .S5_RREADY   ( S6_RREADY_W    )     
                 
        );
//----------------------------------------------------------

/////////////////////////////////////////////////////
//          AXI TO APB BRIDGE INSTANTIATION        //
////////////////////////////////////////////////////
axi_apb_bridge                                                                                
#(                                                                                               
        .WIDTH_DA   (  WIDTH_DA   )       , 
        .WIDTH_AD   (  WIDTH_AD   )        
 )
axi_apb_bridge_inst
(
        .axi_apb_clk   ( ACLK           )       ,
        .axi_apb_rstn  ( ARESETn        )       ,
        .axi_apb_sw_rst( ASW_RESET      )       ,
         
        .S3_AWVALID    ( S3_AWVALID_W   )       , 
        .S3_AWADDR     ( S3_AWADDR_W    )       ,
        .S3_AWLEN      ( S3_AWLEN_W     )       , 
        .S3_AWSIZE     ( S3_AWSIZE_W    )       ,
        .S3_AWBURST    ( S3_AWBURST_W   )       , 
       // .S3_AWPROT       
        .S3_AWREADY    ( S3_AWREADY_W   )       ,
        .S3_WID        ( S3_WID_W       )       ,
        .S3_WVALID     ( S3_WVALID_W    )       ,
        .S3_WDATA      ( S3_WDATA_W     )       , 
        .S3_WSTRB      ( S3_WSTRB_W     )       , 
        .S3_WLAST      ( S3_WLAST_W     )       , 
        .S3_WREADY     ( S3_WREADY_W    )       ,
        .S3_BID        ( S3_BID_W       )       ,
        .S3_BVALID     ( S3_BVALID_W    )       ,
        .S3_BRESP      ( S3_BRESP_W     )       ,   
        .S3_BREADY     ( S3_BREADY_W    )       ,
        .S3_ARID       ( S3_ARID_W      )       ,
        .S3_ARVALID    ( S3_ARVALID_W   )       , 
        .S3_ARADDR     ( S3_ARADDR_W    )       ,
        .S3_ARLEN      ( S3_ARLEN_W     )       ,
        .S3_ARSIZE     ( S3_ARSIZE_W    )       ,
        .S3_ARBURST    ( S3_ARBURST_W   )       , 
        .S3_ARREADY    ( S3_ARREADY_W   )       , 
        .S3_RID        ( S3_RID_W       )       ,
        .S3_RVALID     ( S3_RVALID_W    )       ,
        .S3_RDATA      ( S3_RDATA_W     )       , 
        .S3_RRESP      ( S3_RRESP_W     )       , 
        .S3_RLAST      ( S3_RLAST_W     )       , 
        .S3_RREADY     ( S3_RREADY_W    )       ,
       
        .S4_AWVALID    ( S4_AWVALID_W   )       ,
        .S4_AWADDR     ( S4_AWADDR_W    )       ,
        .S4_AWLEN      ( S4_AWLEN_W     )       ,
        .S4_AWSIZE     ( S4_AWSIZE_W    )       ,
        .S4_AWBURST    ( S4_AWBURST_W   )       ,
      //  .S4_AWPROT      
        .S4_AWREADY    ( S4_AWREADY_W   )       ,               
        .S4_WID        ( S4_WID_W       )       ,
        .S4_WVALID     ( S4_WVALID_W    )       ,
        .S4_WDATA      ( S4_WDATA_W     )       ,
        .S4_WSTRB      ( S4_WSTRB_W     )       ,
        .S4_WLAST      ( S4_WLAST_W     )       ,
        .S4_WREADY     ( S4_WREADY_W    )       ,
        .S4_BID        ( S4_BID_W       )       ,
        .S4_BVALID     ( S4_BVALID_W    )       ,
        .S4_BRESP      ( S4_BRESP_W     )       ,
        .S4_BREADY     ( S4_BREADY_W    )       ,
        .S4_ARID       ( S4_ARID_W      )       ,
        .S4_ARVALID    ( S4_ARVALID_W   )       ,
        .S4_ARADDR     ( S4_ARADDR_W    )       ,
        .S4_ARLEN      ( S4_ARLEN_W     )       ,
        .S4_ARSIZE     ( S4_ARSIZE_W    )       ,
        .S4_ARBURST    ( S4_ARBURST_W   )       ,
        .S4_ARREADY    ( S4_ARREADY_W   )       ,
        .S4_RID        ( S4_RID_W       )       ,
        .S4_RVALID     ( S4_RVALID_W    )       ,
        .S4_RDATA      ( S4_RDATA_W     )       ,
        .S4_RRESP      ( S4_RRESP_W     )       ,
        .S4_RLAST      ( S4_RLAST_W     )       ,
        .S4_RREADY     ( S4_RREADY_W    )       ,
        
        .S5_AWVALID    ( S5_AWVALID_W   )       ,
        .S5_AWADDR     ( S5_AWADDR_W    )       ,
        .S5_AWLEN      ( S5_AWLEN_W     )       ,
        .S5_AWSIZE     ( S5_AWSIZE_W    )       ,
        .S5_AWBURST    ( S5_AWBURST_W   )       ,
       // .S5_AWPROT      
        .S5_AWREADY    ( S5_AWREADY_W   )       ,
        .S5_WID        ( S5_WID_W       )       ,
        .S5_WVALID     ( S5_WVALID_W    )       ,
        .S5_WDATA      ( S5_WDATA_W     )       ,
        .S5_WSTRB      ( S5_WSTRB_W     )       ,
        .S5_WLAST      ( S5_WLAST_W     )       ,
        .S5_WREADY     ( S5_WREADY_W    )       ,
        .S5_BID        ( S5_BID_W       )       ,
        .S5_BVALID     ( S5_BVALID_W    )       ,
        .S5_BRESP      ( S5_BRESP_W     )       ,
        .S5_BREADY     ( S5_BREADY_W    )       ,
        .S5_ARID       ( S5_ARID_W      )       ,
        .S5_ARVALID    ( S5_ARVALID_W   )       ,
        .S5_ARADDR     ( S5_ARADDR_W    )       ,
        .S5_ARLEN      ( S5_ARLEN_W     )       ,
        .S5_ARSIZE     ( S5_ARSIZE_W    )       ,
        .S5_ARBURST    ( S5_ARBURST_W   )       ,
        .S5_ARREADY    ( S5_ARREADY_W   )       ,
        .S5_RID        ( S5_RID_W       )       ,
        .S5_RVALID     ( S5_RVALID_W    )       ,
        .S5_RDATA      ( S5_RDATA_W     )       ,
        .S5_RRESP      ( S5_RRESP_W     )       ,
        .S5_RLAST      ( S5_RLAST_W     )       ,
        .S5_RREADY     ( S5_RREADY_W    )       ,
        
        .S6_AWVALID    ( S6_AWVALID_W   )       ,
        .S6_AWADDR     ( S6_AWADDR_W    )       ,
        .S6_AWLEN      ( S6_AWLEN_W     )       ,
        .S6_AWSIZE     ( S6_AWSIZE_W    )       ,
        .S6_AWBURST    ( S6_AWBURST_W   )       ,
      //  .S6_AWPROT      
        .S6_AWREADY    ( S6_AWREADY_W   )       ,
        .S6_WID        ( S6_WID_W       )       ,
        .S6_WVALID     ( S6_WVALID_W    )       ,
        .S6_WDATA      ( S6_WDATA_W     )       ,
        .S6_WSTRB      ( S6_WSTRB_W     )       ,
        .S6_WLAST      ( S6_WLAST_W     )       ,
        .S6_WREADY     ( S6_WREADY_W    )       ,
        .S6_BID        ( S6_BID_W       )       ,
        .S6_BVALID     ( S6_BVALID_W    )       ,
        .S6_BRESP      ( S6_BRESP_W     )       ,
        .S6_BREADY     ( S6_BREADY_W    )       ,
        .S6_ARID       ( S6_ARID_W      )       ,
        .S6_ARVALID    ( S6_ARVALID_W   )       ,
        .S6_ARADDR     ( S6_ARADDR_W    )       ,
        .S6_ARLEN      ( S6_ARLEN_W     )       ,
        .S6_ARSIZE     ( S6_ARSIZE_W    )       ,
        .S6_ARBURST    ( S6_ARBURST_W   )       ,
        .S6_ARREADY    ( S6_ARREADY_W   )       ,
        .S6_RID        ( S6_RID_W       )       ,
        .S6_RVALID     ( S6_RVALID_W    )       ,
        .S6_RDATA      ( S6_RDATA_W     )       ,
        .S6_RRESP      ( S6_RRESP_W     )       ,
        .S6_RLAST      ( S6_RLAST_W     )       ,
        .S6_RREADY     ( S6_RREADY_W    )       ,
                       
        .S0_PADDR      ( S2_PADDR       )       , 
        .S0_PDATA      ( S2_PDATA       )       , 
        .S0_PWRITE     ( S2_PWRITE      )       , 
        .S0_PENABLE    ( S2_PENABLE     )       , 
        .S0_PSEL       ( S2_PSEL        )       , 
        .S0_PSTRB      ( S2_PSTRB       )       , 
        .S0_PREADY     ( S2_PREADY      )       , 
        .S0_PRDATA     ( S2_PRDATA      )       , 
        .S0_PSLVERR    ( S2_PSLVERR     )       , 
                       
        .S1_PADDR      ( S3_PADDR       )       ,
        .S1_PDATA      ( S3_PDATA       )       ,
        .S1_PWRITE     ( S3_PWRITE      )       ,
        .S1_PENABLE    ( S3_PENABLE     )       ,
        .S1_PSEL       ( S3_PSEL        )       ,
        .S1_PSTRB      ( S3_PSTRB       )       ,
        .S1_PREADY     ( S3_PREADY      )       ,
        .S1_PRDATA     ( S3_PRDATA      )       ,
        .S1_PSLVERR    ( S3_PSLVERR     )       ,
                       
        .S2_PADDR      ( S4_PADDR       )       ,
        .S2_PDATA      ( S4_PDATA       )       ,
        .S2_PWRITE     ( S4_PWRITE      )       ,
        .S2_PENABLE    ( S4_PENABLE     )       ,
        .S2_PSEL       ( S4_PSEL        )       ,
        .S2_PSTRB      ( S4_PSTRB       )       ,
        .S2_PREADY     ( S4_PREADY      )       ,
        .S2_PRDATA     ( S4_PRDATA      )       ,
        .S2_PSLVERR    ( S4_PSLVERR     )       ,
        
        .S3_PADDR      ( S5_PADDR       )       ,
        .S3_PDATA      ( S5_PDATA       )       ,
        .S3_PWRITE     ( S5_PWRITE      )       ,
        .S3_PENABLE    ( S5_PENABLE     )       ,
        .S3_PSEL       ( S5_PSEL        )       ,
        .S3_PSTRB      ( S5_PSTRB       )       ,
        .S3_PREADY     ( S5_PREADY      )       ,
        .S3_PRDATA     ( S5_PRDATA      )       ,
        .S3_PSLVERR    ( S5_PSLVERR     )       

);

endmodule        
