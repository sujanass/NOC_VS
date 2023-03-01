module tb();
localparam  WIDTH_CID   = 4                     ;  
localparam  WIDTH_ID    = 4                     ; 
localparam  WIDTH_AD    =32                     ; 
localparam  WIDTH_DA    =32                     ; 
localparam  WIDTH_DS    =(WIDTH_DA/8)           ; 
localparam  WIDTH_SID   =(WIDTH_CID+WIDTH_ID)   ;
localparam  WIDTH_AWUSER= 1                     ; 
localparam  WIDTH_WUSER = 1                     ; 
localparam  WIDTH_BUSER = 1                     ; 
localparam  WIDTH_ARUSER= 1                     ; 
localparam  WIDTH_RUSER = 1                     ;

logic                      ARESETn               ; 
logic                      ACLK                  ; 
logic                      ASW_RESET             ; 

//----------------------------------------         
 logic  [WIDTH_CID-1:0]     M0_MID                ; 
 logic  [WIDTH_ID-1:0]      M0_AWID               ; 
 logic  [WIDTH_AD-1:0]      M0_AWADDR             ; 
 //logic  [ 7:0]              M0_AWLEN              ; 
 //logic                      M0_AWLOCK             ; 
 logic  [ 3:0]              M0_AWLEN              ; 
 logic  [ 1:0]              M0_AWLOCK             ; 
 logic  [ 2:0]              M0_AWSIZE             ; 
 logic  [ 1:0]              M0_AWBURST            ; 
 logic  [ 3:0]              M0_AWCACHE            ; 
 logic  [ 2:0]              M0_AWPROT             ; 
 logic                      M0_AWVALID            ; 
 logic                      M0_AWREADY            ; 
 logic  [ 3:0]              M0_AWQOS              ; 
 logic  [ 3:0]              M0_AWREGION           ; 
 logic  [WIDTH_AWUSER-1:0]  M0_AWUSER             ; 
 logic  [WIDTH_ID-1:0]      M0_WID                ; 
 logic  [WIDTH_DA-1:0]      M0_WDATA              ; 
 logic  [WIDTH_DS-1:0]      M0_WSTRB              ; 
 logic                      M0_WLAST              ; 
 logic                      M0_WVALID             ; 
 logic                      M0_WREADY             ; 
 logic  [WIDTH_WUSER-1:0]   M0_WUSER              ; 
 logic  [WIDTH_ID-1:0]      M0_BID                ; 
 logic  [ 1:0]              M0_BRESP              ; 
 logic                      M0_BVALID             ; 
 logic                      M0_BREADY             ; 
 logic  [WIDTH_BUSER-1:0]   M0_BUSER              ; 
 logic  [WIDTH_ID-1:0]      M0_ARID               ; 
 logic  [WIDTH_AD-1:0]      M0_ARADDR             ; 
// logic  [ 7:0]              M0_ARLEN              ; 
// logic                      M0_ARLOCK             ; 
 logic  [ 3:0]              M0_ARLEN              ; 
 logic  [ 1:0]              M0_ARLOCK             ; 
 logic  [ 2:0]              M0_ARSIZE             ; 
 logic  [ 1:0]              M0_ARBURST            ; 
 logic  [ 3:0]              M0_ARCACHE            ; 
 logic  [ 2:0]              M0_ARPROT             ; 
 logic                      M0_ARVALID            ; 
 logic                      M0_ARREADY            ; 
 logic  [ 3:0]              M0_ARQOS              ; 
 logic  [ 3:0]              M0_ARREGION           ; 
 logic  [WIDTH_ARUSER-1:0]  M0_ARUSER             ; 
 logic  [WIDTH_ID-1:0]      M0_RID                ; 
 logic  [WIDTH_DA-1:0]      M0_RDATA              ; 
 logic  [ 1:0]              M0_RRESP              ; 
 logic                      M0_RLAST              ; 
 logic                      M0_RVALID             ; 
 logic                      M0_RREADY             ; 
 logic  [WIDTH_RUSER-1:0]   M0_RUSER              ; 
                                                    
//----------------------------------------          
 logic  [WIDTH_CID-1:0]     M1_MID                ; 
 logic  [WIDTH_ID-1:0]      M1_AWID               ; 
 logic  [WIDTH_AD-1:0]      M1_AWADDR             ; 
// logic  [ 7:0]              M1_AWLEN              ; 
// logic                      M1_AWLOCK             ; 
 logic  [ 3:0]              M1_AWLEN              ; 
 logic  [ 1:0]              M1_AWLOCK             ; 
 logic  [ 2:0]              M1_AWSIZE             ; 
 logic  [ 1:0]              M1_AWBURST            ; 
 logic  [ 3:0]              M1_AWCACHE            ; 
 logic  [ 2:0]              M1_AWPROT             ; 
 logic                      M1_AWVALID            ; 
 logic                      M1_AWREADY            ; 
 logic  [ 3:0]              M1_AWQOS              ; 
 logic  [ 3:0]              M1_AWREGION           ; 
 logic  [WIDTH_AWUSER-1:0]  M1_AWUSER             ; 
 logic  [WIDTH_ID-1:0]      M1_WID                ; 
 logic  [WIDTH_DA-1:0]      M1_WDATA              ; 
 logic  [WIDTH_DS-1:0]      M1_WSTRB              ; 
 logic                      M1_WLAST              ; 
 logic                      M1_WVALID             ; 
 logic                      M1_WREADY             ; 
 logic  [WIDTH_WUSER-1:0]   M1_WUSER              ; 
 logic  [WIDTH_ID-1:0]      M1_BID                ; 
 logic  [ 1:0]              M1_BRESP              ; 
 logic                      M1_BVALID             ; 
 logic                      M1_BREADY             ; 
 logic  [WIDTH_BUSER-1:0]   M1_BUSER              ; 
 logic  [WIDTH_ID-1:0]      M1_ARID               ; 
 logic  [WIDTH_AD-1:0]      M1_ARADDR             ; 
// logic  [ 7:0]              M1_ARLEN              ; 
// logic                      M1_ARLOCK             ; 
 logic  [ 3:0]              M1_ARLEN              ; 
 logic  [ 1:0]              M1_ARLOCK             ; 
 logic  [ 2:0]              M1_ARSIZE             ; 
 logic  [ 1:0]              M1_ARBURST            ; 
 logic  [ 3:0]              M1_ARCACHE            ; 
 logic  [ 2:0]              M1_ARPROT             ; 
 logic                      M1_ARVALID            ; 
 logic                      M1_ARREADY            ; 
 logic  [ 3:0]              M1_ARQOS              ; 
 logic  [ 3:0]              M1_ARREGION           ; 
 logic  [WIDTH_ARUSER-1:0]  M1_ARUSER             ; 
 logic  [WIDTH_ID-1:0]      M1_RID                ; 
 logic  [WIDTH_DA-1:0]      M1_RDATA              ; 
 logic  [ 1:0]              M1_RRESP              ; 
 logic                      M1_RLAST              ; 
 logic                      M1_RVALID             ; 
 logic                      M1_RREADY             ; 
 logic  [WIDTH_RUSER-1:0]   M1_RUSER              ; 
                                                    
//----------------------------------------         
 logic   [WIDTH_SID-1:0]    S0_AWID               ; 
 logic   [WIDTH_AD-1:0]     S0_AWADDR             ; 
// logic   [ 7:0]             S0_AWLEN              ; 
// logic                      S0_AWLOCK             ; 
 logic   [ 3:0]             S0_AWLEN              ; 
 logic   [ 1:0]             S0_AWLOCK             ; 
 logic   [ 2:0]             S0_AWSIZE             ; 
 logic   [ 1:0]             S0_AWBURST            ; 
 logic   [ 3:0]             S0_AWCACHE            ; 
 logic   [ 2:0]             S0_AWPROT             ; 
 logic                      S0_AWVALID            ; 
 logic                      S0_AWREADY            ; 
 logic   [ 3:0]             S0_AWQOS              ; 
 logic   [ 3:0]             S0_AWREGION           ; 
 logic   [WIDTH_AWUSER-1:0] S0_AWUSER             ; 
 logic   [WIDTH_SID-1:0]    S0_WID                ; 
 logic   [WIDTH_DA-1:0]     S0_WDATA              ; 
 logic   [WIDTH_DS-1:0]     S0_WSTRB              ; 
 logic                      S0_WLAST              ; 
 logic                      S0_WVALID             ; 
 logic                      S0_WREADY             ; 
 logic   [WIDTH_WUSER-1:0]  S0_WUSER              ; 
 logic   [WIDTH_SID-1:0]    S0_BID                ; 
 logic   [ 1:0]             S0_BRESP              ; 
 logic                      S0_BVALID             ; 
 logic                      S0_BREADY             ; 
 logic   [WIDTH_BUSER-1:0]  S0_BUSER              ; 
 logic   [WIDTH_SID-1:0]    S0_ARID               ; 
 logic   [WIDTH_AD-1:0]     S0_ARADDR             ; 
 //logic   [ 7:0]             S0_ARLEN              ; 
 //logic                      S0_ARLOCK             ; 
 logic   [ 3:0]             S0_ARLEN              ; 
 logic   [ 1:0]             S0_ARLOCK             ; 
 logic   [ 2:0]             S0_ARSIZE             ; 
 logic   [ 1:0]             S0_ARBURST            ; 
 logic   [ 3:0]             S0_ARCACHE            ; 
 logic   [ 2:0]             S0_ARPROT             ; 
 logic                      S0_ARVALID            ; 
 logic                      S0_ARREADY            ; 
 logic   [ 3:0]             S0_ARQOS              ; 
 logic   [ 3:0]             S0_ARREGION           ; 
 logic   [WIDTH_ARUSER-1:0] S0_ARUSER             ; 
 logic   [WIDTH_SID-1:0]    S0_RID                ; 
 logic   [WIDTH_DA-1:0]     S0_RDATA              ; 
 logic   [ 1:0]             S0_RRESP              ; 
 logic                      S0_RLAST              ; 
 logic                      S0_RVALID             ; 
 logic                      S0_RREADY             ; 
 logic   [WIDTH_RUSER-1:0]  S0_RUSER              ; 
                                                    
//----------------------------------------          
 logic   [WIDTH_SID-1:0]    S1_AWID               ; 
 logic   [WIDTH_AD-1:0]     S1_AWADDR             ; 
// logic   [ 7:0]             S1_AWLEN              ; 
// logic                      S1_AWLOCK             ; 
 logic   [ 3:0]             S1_AWLEN              ; 
 logic   [ 1:0]             S1_AWLOCK             ; 
 logic   [ 2:0]             S1_AWSIZE             ; 
 logic   [ 1:0]             S1_AWBURST            ; 
 logic   [ 3:0]             S1_AWCACHE            ; 
 logic   [ 2:0]             S1_AWPROT             ; 
 logic                      S1_AWVALID            ; 
 logic                      S1_AWREADY            ; 
 logic   [ 3:0]             S1_AWQOS              ; 
 logic   [ 3:0]             S1_AWREGION           ; 
 logic   [WIDTH_AWUSER-1:0] S1_AWUSER             ; 
 logic   [WIDTH_SID-1:0]    S1_WID                ; 
 logic   [WIDTH_DA-1:0]     S1_WDATA              ; 
 logic   [WIDTH_DS-1:0]     S1_WSTRB              ; 
 logic                      S1_WLAST              ; 
 logic                      S1_WVALID             ; 
 logic                      S1_WREADY             ; 
 logic   [WIDTH_WUSER-1:0]  S1_WUSER              ; 
 logic   [WIDTH_SID-1:0]    S1_BID                ; 
 logic   [ 1:0]             S1_BRESP              ; 
 logic                      S1_BVALID             ; 
 logic                      S1_BREADY             ; 
 logic   [WIDTH_BUSER-1:0]  S1_BUSER              ; 
 logic   [WIDTH_SID-1:0]    S1_ARID               ; 
 logic   [WIDTH_AD-1:0]     S1_ARADDR             ; 
// logic   [ 7:0]             S1_ARLEN              ; 
// logic                      S1_ARLOCK             ; 
 logic   [ 3:0]             S1_ARLEN              ; 
 logic   [ 1:0]             S1_ARLOCK             ; 
 logic   [ 2:0]             S1_ARSIZE             ; 
 logic   [ 1:0]             S1_ARBURST            ; 
 logic   [ 3:0]             S1_ARCACHE            ; 
 logic   [ 2:0]             S1_ARPROT             ; 
 logic                      S1_ARVALID            ; 
 logic                      S1_ARREADY            ; 
 logic   [ 3:0]             S1_ARQOS              ; 
 logic   [ 3:0]             S1_ARREGION           ; 
 logic   [WIDTH_ARUSER-1:0] S1_ARUSER             ; 
 logic   [WIDTH_SID-1:0]    S1_RID                ; 
 logic   [WIDTH_DA-1:0]     S1_RDATA              ; 
 logic   [ 1:0]             S1_RRESP              ; 
 logic                      S1_RLAST              ; 
 logic                      S1_RVALID             ; 
 logic                      S1_RREADY             ; 
 logic   [WIDTH_RUSER-1:0]  S1_RUSER              ; 
                                                    
//----------------------------------------          
logic   [WIDTH_AD-1:0]     S4_PADDR         ;
logic   [WIDTH_DA-1:0]     S4_PDATA         ;
logic                      S4_PWRITE        ;
logic                      S4_PENABLE       ;
logic                      S4_PSEL          ;
logic   [3:0]              S4_PSTRB         ;
logic                      S4_PREADY        ;
logic   [WIDTH_DA-1:0]     S4_PRDATA        ;
logic                      S4_PSLVERR       ;
                                            
logic   [WIDTH_AD-1:0]     S5_PADDR         ;
logic   [WIDTH_DA-1:0]     S5_PDATA         ;
logic                      S5_PWRITE        ;
logic                      S5_PENABLE       ;
logic                      S5_PSEL          ;
logic   [3:0]              S5_PSTRB         ;
logic                      S5_PREADY        ;
logic   [WIDTH_DA-1:0]     S5_PRDATA        ;
logic                      S5_PSLVERR       ;
                                            
logic   [WIDTH_AD-1:0]     S2_PADDR         ;
logic   [WIDTH_DA-1:0]     S2_PDATA         ;
logic                      S2_PWRITE        ;
logic                      S2_PENABLE       ;
logic                      S2_PSEL          ;
logic   [3:0]              S2_PSTRB         ;
logic                      S2_PREADY        ;
logic   [WIDTH_DA-1:0]     S2_PRDATA        ;
logic                      S2_PSLVERR       ;
                                            
logic   [WIDTH_AD-1:0]     S3_PADDR         ;
logic   [WIDTH_DA-1:0]     S3_PDATA         ;
logic                      S3_PWRITE        ;
logic                      S3_PENABLE       ;
logic                      S3_PSEL          ;
logic   [3:0]              S3_PSTRB         ;
logic                      S3_PREADY        ;
logic   [WIDTH_DA-1:0]     S3_PRDATA        ;
logic                      S3_PSLVERR       ;


noc_arbiter
noc_arbiter_inst
(.*);

initial
begin
M0_MID          = 0     ;
M0_AWID         = 0     ;
M0_AWADDR       = 0     ;
M0_AWLEN        = 0     ;
M0_AWLOCK       = 0     ;
M0_AWLEN        = 0     ;
M0_AWLOCK       = 0     ;
M0_AWSIZE       = 0     ;
M0_AWBURST      = 0     ;
M0_AWCACHE      = 0     ;
M0_AWPROT       = 0     ;
M0_AWVALID      = 0     ;
M0_AWREADY      = 0     ;
M0_AWQOS        = 0     ;
M0_AWREGION     = 0     ;
M0_AWUSER       = 0     ;
M0_WID          = 0     ;
M0_WDATA        = 0     ;
M0_WSTRB        = 0     ;
M0_WLAST        = 0     ;
M0_WVALID       = 0     ;
M0_WREADY       = 0     ;
M0_WUSER        = 0     ;
M0_BID          = 0     ;
M0_BRESP        = 0     ;
M0_BVALID       = 0     ;
M0_BREADY       = 0     ;
M0_BUSER        = 0     ;
M0_ARID         = 0     ;
M0_ARADDR       = 0     ;
M0_ARLEN        = 0     ;
M0_ARLOCK       = 0     ;
M0_ARLEN        = 0     ;
M0_ARLOCK       = 0     ;
M0_ARSIZE       = 0     ;
M0_ARBURST      = 0     ;
M0_ARCACHE      = 0     ;
M0_ARPROT       = 0     ;
M0_ARVALID      = 0     ;
M0_ARREADY      = 0     ;
M0_ARQOS        = 0     ;
M0_ARREGION     = 0     ;
M0_ARUSER       = 0     ;
M0_RID          = 0     ;
M0_RDATA        = 0     ;
M0_RRESP        = 0     ;
M0_RLAST        = 0     ;
M0_RVALID       = 0     ;
M0_RREADY       = 0     ;
M0_RUSER        = 0     ; 

M1_MID          = 0     ; 
M1_AWID         = 0     ; 
M1_AWADDR       = 0     ; 
M1_AWLEN        = 0     ; 
M1_AWLOCK       = 0     ; 
M1_AWLEN        = 0     ; 
M1_AWLOCK       = 0     ; 
M1_AWSIZE       = 0     ; 
M1_AWBURST      = 0     ; 
M1_AWCACHE      = 0     ; 
M1_AWPROT       = 0     ; 
M1_AWVALID      = 0     ; 
M1_AWREADY      = 0     ; 
M1_AWQOS        = 0     ; 
M1_AWREGION     = 0     ; 
M1_AWUSER       = 0     ; 
M1_WID          = 0     ; 
M1_WDATA        = 0     ; 
M1_WSTRB        = 0     ; 
M1_WLAST        = 0     ; 
M1_WVALID       = 0     ; 
M1_WREADY       = 0     ; 
M1_WUSER        = 0     ; 
M1_BID          = 0     ; 
M1_BRESP        = 0     ; 
M1_BVALID       = 0     ; 
M1_BREADY       = 0     ; 
M1_BUSER        = 0     ; 
M1_ARID         = 0     ; 
M1_ARADDR       = 0     ; 
M1_ARLEN        = 0     ; 
M1_ARLOCK       = 0     ; 
M1_ARLEN        = 0     ; 
M1_ARLOCK       = 0     ; 
M1_ARSIZE       = 0     ; 
M1_ARBURST      = 0     ; 
M1_ARCACHE      = 0     ; 
M1_ARPROT       = 0     ; 
M1_ARVALID      = 0     ; 
M1_ARREADY      = 0     ; 
M1_ARQOS        = 0     ; 
M1_ARREGION     = 0     ; 
M1_ARUSER       = 0     ; 
M1_RID          = 0     ; 
M1_RDATA        = 0     ; 
M1_RRESP        = 0     ; 
M1_RLAST        = 0     ; 
M1_RVALID       = 0     ; 
M1_RREADY       = 0     ; 
M1_RUSER        = 0     ; 

S0_AWID         = 0     ;   
S0_AWADDR       = 0     ;   
S0_AWLEN        = 0     ;   
S0_AWLOCK       = 0     ;   
S0_AWLEN        = 0     ;   
S0_AWLOCK       = 0     ;   
S0_AWSIZE       = 0     ;   
S0_AWBURST      = 0     ;   
S0_AWCACHE      = 0     ;   
S0_AWPROT       = 0     ;   
S0_AWVALID      = 0     ;   
S0_AWREADY      = 0     ;   
S0_AWQOS        = 0     ;   
S0_AWREGION     = 0     ;   
S0_AWUSER       = 0     ;   
S0_WREADY       = 0     ;   
S0_WUSER        = 0     ;   
S0_BID          = 0     ;   
S0_BRESP        = 0     ;   
S0_BVALID       = 0     ;   
S0_BREADY       = 0     ;   
S0_BUSER        = 0     ;   
S0_ARID         = 0     ;   
S0_ARADDR       = 0     ;   
S0_ARLEN        = 0     ;   
S0_ARLOCK       = 0     ;   
S0_ARLEN        = 0     ;   
S0_ARLOCK       = 0     ;   
S0_ARSIZE       = 0     ;   
S0_ARBURST      = 0     ;   
S0_ARCACHE      = 0     ;   
S0_ARPROT       = 0     ;   
S0_ARVALID      = 0     ;   
S0_ARREADY      = 0     ;   
S0_ARQOS        = 0     ;   
S0_ARREGION     = 0     ;   
S0_ARUSER       = 0     ;   
S0_RID          = 0     ;   
S0_RDATA        = 0     ;   
S0_RRESP        = 0     ;   
S0_RLAST        = 0     ;   
S0_RVALID       = 0     ;   
S0_RREADY       = 0     ;   
S0_RUSER        = 0     ;   

S1_AWID         = 0     ;
S1_AWADDR       = 0     ;
S1_AWLEN        = 0     ;
S1_AWLOCK       = 0     ;
S1_AWLEN        = 0     ;
S1_AWLOCK       = 0     ;
S1_AWSIZE       = 0     ;
S1_AWBURST      = 0     ;
S1_AWCACHE      = 0     ;
S1_AWPROT       = 0     ;
S1_AWVALID      = 0     ;
S1_AWREADY      = 0     ;
S1_AWQOS        = 0     ;
S1_AWREGION     = 0     ;
S1_AWUSER       = 0     ;
S1_WID          = 0     ;
S1_WDATA        = 0     ;
S1_WSTRB        = 0     ;
S1_WLAST        = 0     ;
S1_WVALID       = 0     ;
S1_WREADY       = 0     ;
S1_WUSER        = 0     ;
S1_BID          = 0     ;
S1_BRESP        = 0     ;
S1_BVALID       = 0     ;
S1_BREADY       = 0     ;
S1_BUSER        = 0     ;
S1_ARID         = 0     ;
S1_ARADDR       = 0     ;
S1_ARLEN        = 0     ;
S1_ARLOCK       = 0     ;
S1_ARLEN        = 0     ;
S1_ARLOCK       = 0     ;
S1_ARSIZE       = 0     ;
S1_ARBURST      = 0     ;
S1_ARCACHE      = 0     ;
S1_ARPROT       = 0     ;
S1_ARVALID      = 0     ;
S1_ARREADY      = 0     ;
S1_ARQOS        = 0     ;
S1_ARREGION     = 0     ;
S1_ARUSER       = 0     ;
S1_RID          = 0     ;
S1_RDATA        = 0     ;
S1_RRESP        = 0     ;
S1_RLAST        = 0     ;
S1_RVALID       = 0     ;
S1_RREADY       = 0     ;
S1_RUSER        = 0     ;

S4_PADDR         = 0    ;
S4_PDATA         = 0    ;
S4_PWRITE        = 0    ;
S4_PENABLE       = 0    ;
S4_PSEL          = 0    ;
S4_PSTRB         = 0    ;
S4_PREADY        = 0    ;
S4_PRDATA        = 0    ;
S4_PSLVERR       = 0    ;
S5_PADDR         = 0    ;
S5_PDATA         = 0    ;
S5_PWRITE        = 0    ;
S5_PENABLE       = 0    ;
S5_PSEL          = 0    ;
S5_PSTRB         = 0    ;
S5_PREADY        = 0    ;
S5_PRDATA        = 0    ;
S5_PSLVERR       = 0    ;
S2_PADDR         = 0    ;
S2_PDATA         = 0    ;
S2_PWRITE        = 0    ;
S2_PENABLE       = 0    ;
S2_PSEL          = 0    ;
S2_PSTRB         = 0    ;
S2_PREADY        = 0    ;
S2_PRDATA        = 0    ;
S2_PSLVERR       = 0    ;
S3_PADDR         = 0    ;
S3_PDATA         = 0    ;
S3_PWRITE        = 0    ;
S3_PENABLE       = 0    ;
S3_PSEL          = 0    ;
S3_PSTRB         = 0    ;
S3_PREADY        = 0    ;
S3_PRDATA        = 0    ;
S3_PSLVERR       = 0    ;
    ARESETn = 1'b0  ;
    ACLK = 1'b0     ;

#10;
    ARESETn = 1'b1  ;
#1000;

    ARESETn = 1'b0  ;
#100;
    $finish();

end

always #5 ACLK = ~ACLK  ;  


initial
begin

#10;
//M0_AWID    = 4'd1   ;
M0_AWVALID = 1'b1   ;
M0_AWADDR  = 32'hA0000004;
M0_AWSIZE  = 3'd2   ;

//M0_WID    = 4'd1    ;
M0_WVALID = 1'b1    ;
M0_WDATA  = $random ;
M0_WLAST  = 1'b1    ;
M0_WSTRB  = 4'd15   ;     

#5;
S0_AWREADY = 1'b1   ;
#10;

/*M0_WVALID = 1'b1    ;
M0_WDATA  = $random ;
M0_WLAST  = 1'b1    ;
M0_WSTRB  = 4'd15   ;     
*/
S0_AWREADY = 1'b0   ;
M0_AWVALID = 1'b0   ;
M0_AWADDR  = 32'd0  ;
M0_AWSIZE  = 3'd0   ;
#10;

M0_WVALID = 1'b0    ;
M0_WDATA  = 32'd0   ;
M0_WLAST  = 1'b0    ;
M0_WSTRB  = 4'd0    ;     


#100;
$finish();
end

initial
begin
#25;
S0_WREADY = 1'b1    ;
#10;
S0_WREADY = 1'b0    ;
end

initial
begin
#35;
M0_BREADY = 1'B1    ;
S0_BRESP  = 2'd2    ;
S0_BVALID = 1'b1    ;
#10;
M0_BREADY = 1'B0    ;
S0_BVALID = 1'b0    ;

end
initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end







endmodule



