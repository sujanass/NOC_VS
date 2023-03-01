module axi_apb_bridge
#(
      parameter WIDTH_AD = 32                            ,
                WIDTH_DA = 32
)
(
      input   logic                      axi_apb_clk     ,
      input   logic                      axi_apb_rstn    ,
      input   logic                      axi_apb_sw_rst  ,
       
      //    AXI CHANNEL SIGNALS (SLAVE 3)
      input   logic                      S3_AWVALID      ,
      input   logic   [WIDTH_AD-1:0]     S3_AWADDR       , 
      input   logic   [ 3:0]             S3_AWLEN        ,
      input   logic   [ 2:0]             S3_AWSIZE       ,
      input   logic   [ 1:0]             S3_AWBURST      ,
   // input   logic   [ 2:0]             S3_AWPROT
      output  logic                      S3_AWREADY      ,

      input   logic   [7:0]              S3_WID          ,
      input   logic                      S3_WVALID       ,   
      input   logic   [WIDTH_DA-1:0]     S3_WDATA        , 
      input   logic   [3:0]              S3_WSTRB        ,
      input   logic                      S3_WLAST        ,
      output  logic                      S3_WREADY       ,

      output  logic   [7:0]              S3_BID          ,
      output  logic                      S3_BVALID       ,  
      output  logic   [ 1:0]             S3_BRESP        ,
      input   logic                      S3_BREADY       ,

      input   logic   [7:0]              S3_ARID         ,
      input   logic                      S3_ARVALID      ,
      input   logic   [WIDTH_AD-1:0]     S3_ARADDR       ,
      input   logic   [ 3:0]             S3_ARLEN        ,
      input   logic   [ 2:0]             S3_ARSIZE       ,
      input   logic   [ 1:0]             S3_ARBURST      ,
      output  logic                      S3_ARREADY      ,

      output  logic   [7:0]              S3_RID          ,
      output  logic                      S3_RVALID       ,       
      output  logic   [WIDTH_DA-1:0]     S3_RDATA        ,       
      output  logic   [ 1:0]             S3_RRESP        ,       
      output  logic                      S3_RLAST        ,       
      input   logic                      S3_RREADY       ,

      //----------------------------------------------------
        
      //    AXI CHANNEL SIGNALS (SLAVE 4)
      input   logic                      S4_AWVALID      ,
      input   logic   [WIDTH_AD-1:0]     S4_AWADDR       , 
      input   logic   [ 3:0]             S4_AWLEN        ,
      input   logic   [ 2:0]             S4_AWSIZE       ,
      input   logic   [ 1:0]             S4_AWBURST      ,
   // input   logic   [ 2:0]             S4_AWPROT
      output  logic                      S4_AWREADY      ,

      input   logic   [7:0]              S4_WID          ,
      input   logic                      S4_WVALID       ,   
      input   logic   [WIDTH_DA-1:0]     S4_WDATA        , 
      input   logic   [3:0]              S4_WSTRB        ,
      input   logic                      S4_WLAST        ,
      output  logic                      S4_WREADY       ,

      output  logic   [7:0]              S4_BID          ,
      output  logic                      S4_BVALID       ,  
      output  logic   [1:0]              S4_BRESP        ,
      input   logic                      S4_BREADY       ,

      input   logic   [7:0]              S4_ARID         ,
      input   logic                      S4_ARVALID      ,
      input   logic   [WIDTH_AD-1:0]     S4_ARADDR       ,
      input   logic   [ 3:0]             S4_ARLEN        ,
      input   logic   [ 2:0]             S4_ARSIZE       ,
      input   logic   [ 1:0]             S4_ARBURST      ,
      output  logic                      S4_ARREADY      ,

      output  logic   [7:0]              S4_RID          ,
      output  logic                      S4_RVALID       ,       
      output  logic   [WIDTH_DA-1:0]     S4_RDATA        ,       
      output  logic   [ 1:0]             S4_RRESP        ,       
      output  logic                      S4_RLAST        ,       
      input   logic                      S4_RREADY       ,

      //----------------------------------------------------

      //    AXI CHANNEL SIGNALS (SLAVE 5)
      input   logic                      S5_AWVALID      ,
      input   logic   [WIDTH_AD-1:0]     S5_AWADDR       , 
      input   logic   [ 3:0]             S5_AWLEN        ,
      input   logic   [ 2:0]             S5_AWSIZE       ,
      input   logic   [ 1:0]             S5_AWBURST      ,
   // input   logic   [ 2:0]             S5_AWPROT
      output  logic                      S5_AWREADY      ,

      input   logic   [7:0]              S5_WID          ,
      input   logic                      S5_WVALID       ,   
      input   logic   [WIDTH_DA-1:0]     S5_WDATA        , 
      input   logic   [3:0]              S5_WSTRB        ,
      input   logic                      S5_WLAST        ,
      output  logic                      S5_WREADY       ,

      output  logic   [7:0]              S5_BID          ,
      output  logic                      S5_BVALID       ,  
      output  logic   [ 1:0]             S5_BRESP        ,
      input   logic                      S5_BREADY       ,

      input   logic   [7:0]              S5_ARID         ,
      input   logic                      S5_ARVALID      ,
      input   logic   [WIDTH_AD-1:0]     S5_ARADDR       ,
      input   logic   [ 3:0]             S5_ARLEN        ,
      input   logic   [ 2:0]             S5_ARSIZE       ,
      input   logic   [ 1:0]             S5_ARBURST      ,
      output  logic                      S5_ARREADY      ,

      output  logic   [7:0]              S5_RID          ,
      output  logic                      S5_RVALID       ,       
      output  logic   [WIDTH_DA-1:0]     S5_RDATA        ,       
      output  logic   [ 1:0]             S5_RRESP        ,       
      output  logic                      S5_RLAST        ,       
      input   logic                      S5_RREADY       ,

      //----------------------------------------------------

      //    AXI CHANNEL SIGNALS (SLAVE 6)
      input   logic                      S6_AWVALID      ,
      input   logic   [WIDTH_AD-1:0]     S6_AWADDR       , 
      input   logic   [ 3:0]             S6_AWLEN        ,
      input   logic   [ 2:0]             S6_AWSIZE       ,
      input   logic   [ 1:0]             S6_AWBURST      ,
   // input   logic   [ 2:0]             S6_AWPROT
      output  logic                      S6_AWREADY      ,

      input   logic   [7:0]              S6_WID          ,
      input   logic                      S6_WVALID       ,   
      input   logic   [WIDTH_DA-1:0]     S6_WDATA        , 
      input   logic   [3:0]              S6_WSTRB        ,
      input   logic                      S6_WLAST        ,
      output  logic                      S6_WREADY       ,

      output  logic   [7:0]              S6_BID          ,
      output  logic                      S6_BVALID       ,  
      output  logic   [ 1:0]             S6_BRESP        ,
      input   logic                      S6_BREADY       ,

      input   logic   [7:0]              S6_ARID         ,
      input   logic                      S6_ARVALID      ,
      input   logic   [WIDTH_AD-1:0]     S6_ARADDR       ,
      input   logic   [ 3:0]             S6_ARLEN        ,
      input   logic   [ 2:0]             S6_ARSIZE       ,
      input   logic   [ 1:0]             S6_ARBURST      ,
      output  logic                      S6_ARREADY      ,

      output  logic   [7:0]              S6_RID          ,
      output  logic                      S6_RVALID       ,       
      output  logic   [WIDTH_DA-1:0]     S6_RDATA        ,       
      output  logic   [ 1:0]             S6_RRESP        ,       
      output  logic                      S6_RLAST        ,       
      input   logic                      S6_RREADY       ,   

      //----------------------------------------------------

      //    APB SIGNALS 
      output  logic   [WIDTH_AD-1:0]     S0_PADDR        ,
      output  logic   [WIDTH_DA-1:0]     S0_PDATA        ,
      output  logic                      S0_PWRITE       ,
      output  logic                      S0_PENABLE      ,
      output  logic                      S0_PSEL         ,
      output  logic   [3:0]              S0_PSTRB        ,
      input   logic                      S0_PREADY       ,
      input   logic   [WIDTH_DA-1:0]     S0_PRDATA       ,
      input   logic                      S0_PSLVERR      ,

      output  logic   [WIDTH_AD-1:0]     S1_PADDR        ,
      output  logic   [WIDTH_DA-1:0]     S1_PDATA        ,
      output  logic                      S1_PWRITE       ,
      output  logic                      S1_PENABLE      ,
      output  logic                      S1_PSEL         ,
      output  logic   [3:0]              S1_PSTRB        ,
      input   logic                      S1_PREADY       ,
      input   logic   [WIDTH_DA-1:0]     S1_PRDATA       ,
      input   logic                      S1_PSLVERR      ,

      output  logic   [WIDTH_AD-1:0]     S2_PADDR        ,
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
      input   logic                      S3_PSLVERR      
);
    logic val;
      //    FSM STATES
      localparam  IDLE               = 3'd0     , 
                  AXI_TO_APB_SLAVE0  = 3'd1     ,          
                  AXI_TO_APB_SLAVE1  = 3'd2     ,     
                  AXI_TO_APB_SLAVE2  = 3'd3     ,      
                  AXI_TO_APB_SLAVE3  = 3'd4     ;

      logic  [2:0]      next_state              ;            
      logic  [2:0]      present_state           ;

      logic             enable_S0_r             ;
      logic             enable_S1_r             ;
      logic             enable_S2_r             ;
      logic             enable_S3_r             ;

      logic             enable_S0               ;
      logic             enable_S1               ;
      logic             enable_S2               ;
      logic             enable_S3               ;
      //    INTERNAL DECLERATIONS WRT WRITE
      logic                 wr_trans_done       ; 

      logic                 wr_req_apb_s0_ltch  ;
      logic                 wr_req_apb_s1_ltch  ;
      logic                 wr_req_apb_s2_ltch  ;
      logic                 wr_req_apb_s3_ltch  ;

      logic                 wr_req_apb_s0_reg   ;
      logic                 wr_req_apb_s1_reg   ;
      logic                 wr_req_apb_s2_reg   ;
      logic                 wr_req_apb_s3_reg   ;

      logic [WIDTH_AD-1:0]  get_wr_addr_S0      ;
      logic [WIDTH_DA-1:0]  get_wr_data_S0      ;
      logic [WIDTH_AD-1:0]  get_wr_addr_S0_reg  ;
      logic [WIDTH_DA-1:0]  get_wr_data_S0_reg  ;
      logic                 enable_S0_ltch      ;
      logic                 enable_S0_reg       ;

      logic [WIDTH_AD-1:0]  get_wr_addr_S1      ;
      logic [WIDTH_DA-1:0]  get_wr_data_S1      ;
      logic [WIDTH_AD-1:0]  get_wr_addr_S1_reg  ;
      logic [WIDTH_DA-1:0]  get_wr_data_S1_reg  ;
      logic                 enable_S1_ltch      ;
      logic                 enable_S1_reg       ;

      logic [WIDTH_AD-1:0]  get_wr_addr_S2      ;
      logic [WIDTH_DA-1:0]  get_wr_data_S2      ;
      logic [WIDTH_AD-1:0]  get_wr_addr_S2_reg  ;
      logic [WIDTH_DA-1:0]  get_wr_data_S2_reg  ;
      logic                 enable_S2_ltch      ;
      logic                 enable_S2_reg       ;

      logic [WIDTH_AD-1:0]  get_wr_addr_S3      ;
      logic [WIDTH_DA-1:0]  get_wr_data_S3      ;
      logic [WIDTH_AD-1:0]  get_wr_addr_S3_reg  ;
      logic [WIDTH_DA-1:0]  get_wr_data_S3_reg  ;
      logic                 enable_S3_ltch      ;
      logic                 enable_S3_reg       ;

      logic                 wr_trans_done_S0    ; 
      logic                 wr_trans_done_S1    ; 
      logic                 wr_trans_done_S2    ; 
      logic                 wr_trans_done_S3    ;
      //------------------------------------------

      //------------WRITE BURST STATES FSM-------------------------------
      localparam    WR_IDLE       = 2'd0                                ;
      localparam    WR_FIX_BURST  = 2'd1                                ;
      localparam    WR_INCR_BURST = 2'd2                                ;
      localparam    WR_WRAP_BURST = 2'd3                                ;

      localparam    NO_OF_BYTES   = 4                                   ;
      
      logic  [1:0]                  present_state_wr                  ;
      logic  [1:0]                  next_state_wr                     ;

      logic  [WIDTH_AD-1:0]         wr_addr_r                         ;
      logic  [WIDTH_AD-1:0]         wr_addr_r1                        ;
      logic  [WIDTH_AD-1:0]         wr_addr_reg                       ;
      logic  [4:0]                  wr_down_counter                   ;
      logic                         awvalid_reg                       ;

      logic  [WIDTH_AD-1:0]         S3_addr_n_wr                      ;
      logic  [WIDTH_AD-1:0]         S3_addr_n_r                       ;
      logic  [WIDTH_AD-1:0]         S3_wrap_bndry                     ;
      logic  [WIDTH_AD-1:0]         S3_wrap_bndry_r                   ;
      logic  [31:0]                 S3_add_wr                         ;
      
      logic  [WIDTH_AD-1:0]         S4_addr_n_wr                      ;
      logic  [WIDTH_AD-1:0]         S4_addr_n_r                       ;
      logic  [WIDTH_AD-1:0]         S4_wrap_bndry                     ;
      logic  [WIDTH_AD-1:0]         S4_wrap_bndry_r                   ;
      logic  [31:0]                 S4_add_wr                         ;

      logic  [WIDTH_AD-1:0]         S5_addr_n_wr                      ;
      logic  [WIDTH_AD-1:0]         S5_addr_n_r                       ;
      logic  [WIDTH_AD-1:0]         S5_wrap_bndry                     ;
      logic  [WIDTH_AD-1:0]         S5_wrap_bndry_r                   ;
      logic  [31:0]                 S5_add_wr                         ;

      logic  [WIDTH_AD-1:0]         S6_addr_n_wr                      ;
      logic  [WIDTH_AD-1:0]         S6_addr_n_r                       ;
      logic  [WIDTH_AD-1:0]         S6_wrap_bndry                     ;
      logic  [WIDTH_AD-1:0]         S6_wrap_bndry_r                   ;
      logic  [31:0]                 S6_add_wr                         ;
      //-----------------------------------------------------------------
            
      //    INTERNAL DECLERATIONS WRT READ
      logic             rd_trans_done           ; 

      logic             rd_req_apb_s0_ltch      ;
      logic             rd_req_apb_s1_ltch      ;
      logic             rd_req_apb_s2_ltch      ;
      logic             rd_req_apb_s3_ltch      ;

      logic             rd_req_apb_s0_reg       ;
      logic             rd_req_apb_s1_reg       ;
      logic             rd_req_apb_s2_reg       ;
      logic             rd_req_apb_s3_reg       ;

      logic [WIDTH_AD-1:0]  get_rd_addr_S0      ;
      logic [WIDTH_AD-1:0]  get_rd_addr_S0_reg  ;
      logic                 enable_S0_ltch0     ;
      logic                 enable_S0_reg0      ;

      logic [WIDTH_AD-1:0]  get_rd_addr_S1      ;
      logic [WIDTH_AD-1:0]  get_rd_addr_S1_reg  ;
      logic                 enable_S1_ltch0     ;
      logic                 enable_S1_reg0      ;

      logic [WIDTH_AD-1:0]  get_rd_addr_S2      ;
      logic [WIDTH_AD-1:0]  get_rd_addr_S2_reg  ;
      logic                 enable_S2_ltch0     ;
      logic                 enable_S2_reg0      ;


      logic [WIDTH_AD-1:0]  get_rd_addr_S3      ;
      logic [WIDTH_AD-1:0]  get_rd_addr_S3_reg  ;
      logic                 enable_S3_ltch0     ;
      logic                 enable_S3_reg0      ;

      logic                 rd_trans_done_S0    ; 
      logic                 rd_trans_done_S1    ; 
      logic                 rd_trans_done_S2    ; 
      logic                 rd_trans_done_S3    ; 
      //-----------------------------------------

      //------------READ BURST STATES FSM--------------------------------
      localparam    RD_IDLE       = 2'd0                                ;
      localparam    RD_FIX_BURST  = 2'd1                                ;
      localparam    RD_INCR_BURST = 2'd2                                ;
      localparam    RD_WRAP_BURST = 2'd3                                ;

      logic  [1:0]                  present_state_rd                  ;
      logic  [1:0]                  next_state_rd                     ;

      logic  [WIDTH_AD-1:0]         rd_addr_r                         ;
      logic  [WIDTH_AD-1:0]         rd_addr_r1                        ;
      logic  [WIDTH_AD-1:0]         rd_addr_reg                       ;
      logic  [4:0]                  rd_down_counter                   ;
      logic                         arvalid_reg                       ;

      logic  [WIDTH_AD-1:0]         S3_addr_n_rd                      ;
      logic  [WIDTH_AD-1:0]         S3_addr_n_w                       ;
      logic  [WIDTH_AD-1:0]         S3_wrap_bndry_rd                  ;
      logic  [WIDTH_AD-1:0]         S3_wrap_bndry_w                   ;
      logic  [31:0]                 S3_addr_rd                        ;

      logic  [WIDTH_AD-1:0]         S4_addr_n_rd                      ;
      logic  [WIDTH_AD-1:0]         S4_addr_n_w                       ;
      logic  [WIDTH_AD-1:0]         S4_wrap_bndry_rd                  ;
      logic  [WIDTH_AD-1:0]         S4_wrap_bndry_w                   ;
      logic  [31:0]                 S4_addr_rd                        ;

      logic  [WIDTH_AD-1:0]         S5_addr_n_rd                      ;
      logic  [WIDTH_AD-1:0]         S5_addr_n_w                       ;
      logic  [WIDTH_AD-1:0]         S5_wrap_bndry_rd                  ;
      logic  [WIDTH_AD-1:0]         S5_wrap_bndry_w                   ;
      logic  [31:0]                 S5_addr_rd                        ;

      logic  [WIDTH_AD-1:0]         S6_addr_n_rd                      ;
      logic  [WIDTH_AD-1:0]         S6_addr_n_w                       ;
      logic  [WIDTH_AD-1:0]         S6_wrap_bndry_rd                  ;
      logic  [WIDTH_AD-1:0]         S6_wrap_bndry_w                   ;
      logic  [31:0]                 S6_addr_rd                        ;

      logic                         wr_resp                           ;
      //-----------------------------------------------------------------

      logic                         S3_AWVALID_R  ;
      logic  [3:0]                  S3_AWLEN_R    ;
      logic  [3:0]                  S3_AWLEN_REG  ;

      logic                         S4_AWVALID_R  ;
      logic  [3:0]                  S4_AWLEN_R    ;
      logic  [3:0]                  S4_AWLEN_REG  ;

      logic                         S5_AWVALID_R  ;
      logic  [3:0]                  S5_AWLEN_R    ;
      logic  [3:0]                  S5_AWLEN_REG  ;

      logic                         S6_AWVALID_R  ;
      logic  [3:0]                  S6_AWLEN_R    ;
      logic  [3:0]                  S6_AWLEN_REG  ;

      logic                         S3_ARVALID_R  ;
      logic                         S3_ARVALID_R1 ;
      logic  [3:0]                  S3_ARLEN_R    ;
      logic  [3:0]                  S3_ARLEN_REG  ;

      logic                         S4_ARVALID_R  ;
      logic                         S4_ARVALID_R1 ;
      logic  [3:0]                  S4_ARLEN_R    ;
      logic  [3:0]                  S4_ARLEN_REG  ;

      logic                         S5_ARVALID_R  ;
      logic                         S5_ARVALID_R1 ;
      logic  [3:0]                  S5_ARLEN_R    ;
      logic  [3:0]                  S5_ARLEN_REG  ;

      logic                         S6_ARVALID_R  ;
      logic                         S6_ARVALID_R1 ;
      logic  [3:0]                  S6_ARLEN_R    ;
      logic  [3:0]                  S6_ARLEN_REG  ;

      logic                         S3_ARREADY_R  ;
      logic                         S4_ARREADY_R  ;
      logic                         S5_ARREADY_R  ;
      logic                         S6_ARREADY_R  ;

      logic                         S0_PREADY_R   ;
      logic                         S1_PREADY_R   ;
      logic                         S2_PREADY_R   ;
      logic                         S3_PREADY_R   ;

      logic                         S0_PREADY_R1  ;
      logic                         S1_PREADY_R1  ;
      logic                         S2_PREADY_R1  ;
      logic                         S3_PREADY_R1  ;

      logic                         S3_WVALID_R   ;
      logic                         S3_WVALID_R1  ;

      logic                         S4_WVALID_R   ;
      logic                         S4_WVALID_R1  ;

      logic                         S5_WVALID_R   ;
      logic                         S5_WVALID_R1  ;

      logic                         S6_WVALID_R   ;
      logic                         S6_WVALID_R1  ;

      logic                         posedge_det_s3       ;
      logic                         posedge_det_s4       ;
      logic                         posedge_det_s5       ;
      logic                         posedge_det_s6       ;

      logic     [3:0]               s3_wstrb_ltch        ;
      logic     [3:0]               s3_wstrb_reg         ;
      logic     [3:0]               s4_wstrb_ltch        ;
      logic     [3:0]               s4_wstrb_reg         ;
      logic     [3:0]               s5_wstrb_ltch        ;
      logic     [3:0]               s5_wstrb_reg         ;
      logic     [3:0]               s6_wstrb_ltch        ;
      logic     [3:0]               s6_wstrb_reg         ;
    
      //    DECLERATIONS FOR APB USAGE 
      localparam    APB_IDLE   = 2'b00                   ;
      localparam    APB_SETUP  = 2'b01                   ;
      localparam    APB_ACCESS = 2'b10                   ;
      logic     [1:0]               apb_present_state    ;
      logic     [1:0]               apb_next_state       ;
      logic                         penable_reg          ;

      logic                         wr_transfer_done     ; 
      logic                         wr_transfer_pending  ;
      logic                         rd_transfer_done     ; 
      logic                         rd_transfer_pending  ;
      
      logic    [7:0]                S3_WID_ltch          ;
      logic    [7:0]                S4_WID_ltch          ;
      logic    [7:0]                S5_WID_ltch          ;
      logic    [7:0]                S6_WID_ltch          ;

      logic    [7:0]                S3_ARID_ltch         ;
      logic    [7:0]                S4_ARID_ltch         ;
      logic    [7:0]                S5_ARID_ltch         ;
      logic    [7:0]                S6_ARID_ltch         ;

      logic     [7:0]               S3_WID_REG           ;
      logic     [7:0]               S4_WID_REG           ;
      logic     [7:0]               S5_WID_REG           ;
      logic     [7:0]               S6_WID_REG           ;

      logic     [7:0]               S3_ARID_REG          ;
      logic     [7:0]               S4_ARID_REG          ;
      logic     [7:0]               S5_ARID_REG          ;
      logic     [7:0]               S6_ARID_REG          ;

      //    LATCHING WID AND ARID
      assign S3_WID_ltch  = (S3_WVALID  && S3_WREADY)     ? S3_WID   : S3_WID_REG     ;
      assign S4_WID_ltch  = (S4_WVALID  && S4_WREADY)     ? S4_WID   : S4_WID_REG     ;
      assign S5_WID_ltch  = (S5_WVALID  && S5_WREADY)     ? S5_WID   : S5_WID_REG     ;
      assign S6_WID_ltch  = (S6_WVALID  && S6_WREADY)     ? S6_WID   : S6_WID_REG     ;

      assign S3_ARID_ltch  = (S3_ARVALID  && S3_ARREADY)  ? S3_ARID  : S3_ARID_REG    ;
      assign S4_ARID_ltch  = (S4_ARVALID  && S4_ARREADY)  ? S4_ARID  : S4_ARID_REG    ;
      assign S5_ARID_ltch  = (S5_ARVALID  && S5_ARREADY)  ? S5_ARID  : S5_ARID_REG    ;
      assign S6_ARID_ltch  = (S6_ARVALID  && S6_ARREADY)  ? S6_ARID  : S6_ARID_REG    ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          S3_WID_REG  <= 8'D0         ;
          S4_WID_REG  <= 8'D0         ;
          S5_WID_REG  <= 8'D0         ;
          S6_WID_REG  <= 8'D0         ;

          S3_ARID_REG <= 8'D0         ;
          S4_ARID_REG <= 8'D0         ;
          S5_ARID_REG <= 8'D0         ;
          S6_ARID_REG <= 8'D0         ;
          end
      else
          begin
          S3_WID_REG <= S3_WID_ltch  ;
          S4_WID_REG <= S4_WID_ltch  ;
          S5_WID_REG <= S5_WID_ltch  ;
          S6_WID_REG <= S6_WID_ltch  ;

          S3_ARID_REG <= S3_ARID_ltch  ;
          S4_ARID_REG <= S4_ARID_ltch  ;
          S5_ARID_REG <= S5_ARID_ltch  ;
          S6_ARID_REG <= S6_ARID_ltch  ;
          end
      end

      //    LATCHING AWLENGTH
      assign S3_AWLEN_R = (S3_AWVALID && S3_AWREADY) ? S3_AWLEN : S3_AWLEN_REG  ;
      assign S4_AWLEN_R = (S4_AWVALID && S4_AWREADY) ? S4_AWLEN : S4_AWLEN_REG  ;
      assign S5_AWLEN_R = (S5_AWVALID && S5_AWREADY) ? S5_AWLEN : S5_AWLEN_REG  ;
      assign S6_AWLEN_R = (S6_AWVALID && S6_AWREADY) ? S6_AWLEN : S6_AWLEN_REG  ;

      //    LATCHING ARLENGTH
      assign S3_ARLEN_R = (S3_ARVALID && S3_ARREADY) ? S3_ARLEN : S3_ARLEN_REG  ;
      assign S4_ARLEN_R = (S4_ARVALID && S4_ARREADY) ? S4_ARLEN : S4_ARLEN_REG  ;
      assign S5_ARLEN_R = (S5_ARVALID && S5_ARREADY) ? S5_ARLEN : S5_ARLEN_REG  ;
      assign S6_ARLEN_R = (S6_ARVALID && S6_ARREADY) ? S6_ARLEN : S6_ARLEN_REG  ;

      assign wr_addr_r1 = (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY) ? wr_addr_r : wr_addr_reg      ; 
      assign rd_addr_r1 = (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY) ? rd_addr_r : rd_addr_reg      ; 
      
      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          S3_AWVALID_R  <= 1'b0             ;
          S3_AWLEN_REG  <= 4'd0             ;
          S4_AWVALID_R  <= 1'b0             ;
          S4_AWLEN_REG  <= 4'd0             ;
          S5_AWVALID_R  <= 1'b0             ;
          S5_AWLEN_REG  <= 4'd0             ;
          S6_AWVALID_R  <= 1'b0             ;
          S6_AWLEN_REG  <= 4'd0             ;

          S3_ARVALID_R  <= 1'b0             ;
          S3_ARVALID_R1 <= 1'b0             ;
          S3_ARLEN_REG  <= 4'd0             ;
          S4_ARVALID_R  <= 1'b0             ;
          S4_ARVALID_R1 <= 1'b0             ;
          S4_ARLEN_REG  <= 4'd0             ;
          S5_ARVALID_R  <= 1'b0             ;
          S5_ARVALID_R1 <= 1'b0             ;
          S5_ARLEN_REG  <= 4'd0             ;
          S6_ARVALID_R  <= 1'b0             ;
          S6_ARVALID_R1 <= 1'b0             ;
          S6_ARLEN_REG  <= 4'd0             ;

          S3_ARREADY_R  <= 1'b0             ;
          S4_ARREADY_R  <= 1'b0             ;
          S5_ARREADY_R  <= 1'b0             ;
          S6_ARREADY_R  <= 1'b0             ;

          S0_PREADY_R   <= 1'b0             ;
          S1_PREADY_R   <= 1'b0             ;
          S2_PREADY_R   <= 1'b0             ;
          S3_PREADY_R   <= 1'b0             ;

          S0_PREADY_R1  <= 1'b0             ;
          S1_PREADY_R1  <= 1'b0             ;
          S2_PREADY_R1  <= 1'b0             ;
          S3_PREADY_R1  <= 1'b0             ;

          enable_S0     <= 1'b0             ;      
          enable_S1     <= 1'b0             ;
          enable_S2     <= 1'b0             ;
          enable_S3     <= 1'b0             ;

          wr_addr_reg   <= {WIDTH_AD{1'b0}} ;
          rd_addr_reg   <= {WIDTH_AD{1'b0}} ;

          S3_WVALID_R   <= 1'b0             ;
          S3_WVALID_R1  <= 1'b0             ;
          S4_WVALID_R   <= 1'b0             ;
          S4_WVALID_R1  <= 1'b0             ;
          S5_WVALID_R   <= 1'b0             ;
          S5_WVALID_R1  <= 1'b0             ;
          S6_WVALID_R   <= 1'b0             ;
          S6_WVALID_R1  <= 1'b0             ;
          end
      else if(axi_apb_sw_rst)  
          begin
          S3_AWVALID_R  <= 1'b0             ;
          S3_AWLEN_REG  <= 4'd0             ;
          S4_AWVALID_R  <= 1'b0             ;
          S4_AWLEN_REG  <= 4'd0             ;
          S5_AWVALID_R  <= 1'b0             ;
          S5_AWLEN_REG  <= 4'd0             ;
          S6_AWVALID_R  <= 1'b0             ;
          S6_AWLEN_REG  <= 4'd0             ;
          S6_AWLEN_REG  <= 4'd0             ;

          S3_ARVALID_R  <= 1'b0             ;
          S3_ARVALID_R1 <= 1'b0             ;
          S3_ARLEN_REG  <= 4'd0             ;
          S4_ARVALID_R  <= 1'b0             ;
          S4_ARVALID_R1 <= 1'b0             ;
          S4_ARLEN_REG  <= 4'd0             ;
          S5_ARVALID_R  <= 1'b0             ;
          S5_ARVALID_R1 <= 1'b0             ;
          S5_ARLEN_REG  <= 4'd0             ;
          S6_ARVALID_R  <= 1'b0             ;
          S6_ARVALID_R1 <= 1'b0             ;
          S6_ARLEN_REG  <= 4'd0             ;

          S3_ARREADY_R  <= 1'b0             ;
          S4_ARREADY_R  <= 1'b0             ;
          S5_ARREADY_R  <= 1'b0             ;
          S6_ARREADY_R  <= 1'b0             ;

          S0_PREADY_R   <= 1'b0             ;
          S1_PREADY_R   <= 1'b0             ;
          S2_PREADY_R   <= 1'b0             ;
          S3_PREADY_R   <= 1'b0             ;

          S0_PREADY_R1  <= 1'b0             ;
          S1_PREADY_R1  <= 1'b0             ;
          S2_PREADY_R1  <= 1'b0             ;
          S3_PREADY_R1  <= 1'b0             ;

          enable_S0     <= 1'b0             ;      
          enable_S1     <= 1'b0             ;
          enable_S2     <= 1'b0             ;
          enable_S3     <= 1'b0             ;

          wr_addr_reg   <= {WIDTH_AD{1'b0}} ;
          rd_addr_reg   <= {WIDTH_AD{1'b0}} ;

          S3_WVALID_R   <= 1'b0             ;
          S3_WVALID_R1  <= 1'b0             ;
          S4_WVALID_R   <= 1'b0             ;
          S4_WVALID_R1  <= 1'b0             ;
          S5_WVALID_R   <= 1'b0             ;
          S5_WVALID_R1  <= 1'b0             ;
          S6_WVALID_R   <= 1'b0             ;
          S6_WVALID_R1  <= 1'b0             ;
          end
      else
          begin
          S3_AWVALID_R  <= S3_AWVALID      ;
          S3_AWLEN_REG  <= S3_AWLEN_R      ;
          S4_AWVALID_R  <= S4_AWVALID      ;
          S4_AWLEN_REG  <= S4_AWLEN_R      ;
          S5_AWVALID_R  <= S5_AWVALID      ;
          S5_AWLEN_REG  <= S5_AWLEN_R      ;
          S6_AWVALID_R  <= S6_AWVALID      ;
          S6_AWLEN_REG  <= S6_AWLEN_R      ;

          S3_ARVALID_R  <= S3_ARVALID      ;
          S3_ARVALID_R1 <= S3_ARVALID_R    ;
          S3_ARLEN_REG  <= S3_ARLEN_R      ;
          S4_ARVALID_R  <= S4_ARVALID      ;
          S4_ARVALID_R1 <= S4_ARVALID_R    ;
          S4_ARLEN_REG  <= S4_ARLEN_R      ;
          S5_ARVALID_R  <= S5_ARVALID      ;
          S5_ARVALID_R1 <= S5_ARVALID_R    ;
          S5_ARLEN_REG  <= S5_ARLEN_R      ;
          S6_ARVALID_R  <= S6_ARVALID      ;
          S6_ARVALID_R1 <= S6_ARVALID_R    ;
          S6_ARLEN_REG  <= S6_ARLEN_R      ;

          S3_ARREADY_R  <= S3_ARREADY      ;
          S4_ARREADY_R  <= S4_ARREADY      ;
          S5_ARREADY_R  <= S5_ARREADY      ;
          S6_ARREADY_R  <= S6_ARREADY      ;

          S0_PREADY_R   <= S0_PREADY       ;
          S1_PREADY_R   <= S1_PREADY       ;
          S2_PREADY_R   <= S2_PREADY       ;
          S3_PREADY_R   <= S3_PREADY       ;

          S0_PREADY_R1  <= S0_PREADY_R     ;
          S1_PREADY_R1  <= S1_PREADY_R     ;
          S2_PREADY_R1  <= S2_PREADY_R     ;
          S3_PREADY_R1  <= S3_PREADY_R     ;

          enable_S0     <= enable_S0_r     ;      
          enable_S1     <= enable_S1_r     ;
          enable_S2     <= enable_S2_r     ;
          enable_S3     <= enable_S3_r     ;

          wr_addr_reg   <= wr_addr_r1      ;
          rd_addr_reg   <= rd_addr_r1      ;

          S3_WVALID_R   <= S3_WVALID       ;
          S3_WVALID_R1  <= S3_WVALID_R     ;
          S4_WVALID_R   <= S4_WVALID       ;
          S4_WVALID_R1  <= S4_WVALID_R     ;
          S5_WVALID_R   <= S5_WVALID       ;
          S5_WVALID_R1  <= S5_WVALID_R     ;
          S6_WVALID_R   <= S6_WVALID       ;
          S6_WVALID_R1  <= S6_WVALID_R     ;
          end
      end
      //    PRESENT STATE LOGIC
      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          present_state <= IDLE         ;
          end
      else if(axi_apb_sw_rst) 
          begin
          present_state <= IDLE         ;
          end
      else 
          begin
          present_state <= next_state   ;
          end

      end

      //    NEXT STATE LOGIC
      always_comb
      begin
      next_state = IDLE                   ; 
      
      case(present_state)

      IDLE              :
                         begin
                            if(S3_AWVALID || S3_ARVALID)
                                begin
                                next_state = AXI_TO_APB_SLAVE0      ;
                                end

                            else if(S4_AWVALID || S4_ARVALID)
                                begin
                                next_state = AXI_TO_APB_SLAVE1      ;
                                end

                            else if(S5_AWVALID || S5_ARVALID)
                                begin
                                next_state = AXI_TO_APB_SLAVE2      ;
                                end

                            else if(S6_AWVALID || S6_ARVALID)
                                begin
                                next_state = AXI_TO_APB_SLAVE3      ;
                                end
                         end 

      AXI_TO_APB_SLAVE0 :
                         begin
                             if((S3_BVALID && S3_BREADY) || ((S3_RVALID && S3_RREADY) && (rd_down_counter == 5'd1)))
                                 begin
                                 next_state = IDLE                  ;
                                 end
                             else
                                 begin
                                 next_state = AXI_TO_APB_SLAVE0     ;
                                 end
                         end
      
      AXI_TO_APB_SLAVE1 :
                         begin
                             if((S4_BVALID && S4_BREADY) || ((S4_RVALID && S4_RREADY) && (rd_down_counter == 5'd1)))
                                 begin
                                 next_state = IDLE                  ;
                                 end
                             else
                                 begin
                                 next_state = AXI_TO_APB_SLAVE1     ;
                                 end
                         end

      AXI_TO_APB_SLAVE2 :
                         begin
                             if((S5_BVALID && S5_BREADY) || ((S5_RVALID && S5_RREADY) && (rd_down_counter == 5'd1)))
                                 begin
                                 next_state = IDLE                  ;
                                 end
                             else
                                 begin
                                 next_state = AXI_TO_APB_SLAVE2     ;
                                 end
                         end

      AXI_TO_APB_SLAVE3 :
                         begin
                             if((S6_BVALID && S6_BREADY) || ((S6_RVALID && S6_RREADY) && (rd_down_counter == 5'd1)))
                                 begin
                                 next_state = IDLE                  ;
                                 end
                             else
                                 begin
                                 next_state = AXI_TO_APB_SLAVE3     ;
                                 end
                         end
      endcase
      
      end

      //    DETECTING THE POSEDGE OF AWVALID 
      assign posedge_det_s3 = S3_WVALID & !S3_WVALID_R    ;
      assign posedge_det_s4 = S4_WVALID & !S4_WVALID_R    ;
      assign posedge_det_s5 = S5_WVALID & !S5_WVALID_R    ;
      assign posedge_det_s6 = S6_WVALID & !S6_WVALID_R    ;

      //  LATCHING THE STROBE VALUE   
      assign s3_wstrb_ltch = (S3_WVALID & S3_WREADY) ? S3_WSTRB : s3_wstrb_reg    ;
      assign s4_wstrb_ltch = (S4_WVALID & S4_WREADY) ? S4_WSTRB : s4_wstrb_reg    ;
      assign s5_wstrb_ltch = (S5_WVALID & S5_WREADY) ? S5_WSTRB : s5_wstrb_reg    ;
      assign s6_wstrb_ltch = (S6_WVALID & S6_WREADY) ? S6_WSTRB : s6_wstrb_reg    ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin
      if(!axi_apb_rstn)
          begin
          s3_wstrb_reg <= 4'd0           ; 
          s4_wstrb_reg <= 4'd0           ;
          s5_wstrb_reg <= 4'd0           ;
          s6_wstrb_reg <= 4'd0           ;
          end
      else if(axi_apb_sw_rst)
          begin
          s3_wstrb_reg <= 4'd0           ; 
          s4_wstrb_reg <= 4'd0           ;
          s5_wstrb_reg <= 4'd0           ;
          s6_wstrb_reg <= 4'd0           ;
          end
      else
          begin
          s3_wstrb_reg <= s3_wstrb_ltch  ; 
          s4_wstrb_reg <= s4_wstrb_ltch  ;
          s5_wstrb_reg <= s5_wstrb_ltch  ;
          s6_wstrb_reg <= s6_wstrb_ltch  ;
          end

      end

      //    OUTPUT LOGIC
      always_comb
      begin
      S3_AWREADY = 1'b0                              ; 
      S3_WREADY  = 1'b0                              ;
      S3_ARREADY = 1'b0                              ;
      S4_AWREADY = 1'b0                              ; 
      S4_WREADY  = 1'b0                              ;

      S4_ARREADY = 1'b0                              ;
      S5_AWREADY = 1'b0                              ; 
      S5_WREADY  = 1'b0                              ;
      S5_ARREADY = 1'b0                              ;
      S6_AWREADY = 1'b0                              ; 
      S6_WREADY  = 1'b0                              ;
      S6_ARREADY = 1'b0                              ;

      case(present_state)
      IDLE              : 
                         begin
                         S3_AWREADY = 1'b0                              ; 
                         S3_WREADY  = 1'b0                              ;
                         S3_ARREADY = 1'b0                              ;
                         S4_AWREADY = 1'b0                              ; 
                         S4_WREADY  = 1'b0                              ;
                         S4_ARREADY = 1'b0                              ;
                         S5_AWREADY = 1'b0                              ; 
                         S5_WREADY  = 1'b0                              ;
                         S5_ARREADY = 1'b0                              ;
                         S6_AWREADY = 1'b0                              ; 
                         S6_WREADY  = 1'b0                              ;
                         S6_ARREADY = 1'b0                              ;
                         end

      AXI_TO_APB_SLAVE0 : 
                         begin

                         if(wr_req_apb_s0_ltch)
                             begin
                             S3_AWREADY = S3_AWVALID ? 1'b1 : 1'b0      ;
                             S3_WREADY  = S0_PREADY_R ? 1'b1 : (posedge_det_s3 ? 1'b1 : 1'b0)      ;
                             end
                         else if(rd_req_apb_s0_ltch)
                             begin
                             S3_ARREADY = S3_ARVALID ? 1'b1 : 1'b0      ;
                             end

                         end
      AXI_TO_APB_SLAVE1 : 
                         begin

                         if(wr_req_apb_s1_ltch)
                             begin
                             S4_AWREADY = S4_AWVALID ? 1'b1 : 1'b0      ;
                             S4_WREADY  = S1_PREADY_R ? 1'b1 :(posedge_det_s4 ? 1'b1 : 1'b0)      ;
                             end
                         else if(rd_req_apb_s1_ltch)
                             begin
                             S4_ARREADY = S4_ARVALID ? 1'b1 : 1'b0      ;
                             end

                         end
      AXI_TO_APB_SLAVE2 : 
                         begin

                         if(wr_req_apb_s2_ltch)
                             begin
                             S5_AWREADY = S5_AWVALID ? 1'b1 : 1'b0      ;
                             S5_WREADY  = S2_PREADY_R ? 1'b1 :(posedge_det_s5 ? 1'b1 : 1'b0)      ;
                             end
                         else if(rd_req_apb_s2_ltch)
                             begin
                             S5_ARREADY = S5_ARVALID ? 1'b1 : 1'b0      ;
                             end

                         end
      AXI_TO_APB_SLAVE3 : 
                         begin

                         if(wr_req_apb_s3_ltch)
                             begin
                             S6_AWREADY = S6_AWVALID ? 1'b1 : 1'b0      ;
                             S6_WREADY  = S3_PREADY_R ? 1'b1 :(posedge_det_s6 ? 1'b1 : 1'b0)      ;
                             end
                         else if(rd_req_apb_s3_ltch)
                             begin
                             S6_ARREADY = S6_ARVALID ? 1'b1 : 1'b0      ;
                             end

                         end

      endcase
      end
      //----------------------------------------------------------------------------------
      
      //    GENERATING WRITE REQUEST WHEN WRITE TRANSACTION OCCURS
      assign wr_trans_done       = ((S3_BVALID && S3_BREADY) || (S4_BVALID && S4_BREADY) || (S5_BVALID && S5_BREADY) || (S6_BVALID && S6_BREADY))    ;
      assign wr_req_apb_s0_ltch  = S3_AWVALID ? 1'b1 : wr_req_apb_s0_reg    ;
      assign wr_req_apb_s1_ltch  = S4_AWVALID ? 1'b1 : wr_req_apb_s1_reg    ;
      assign wr_req_apb_s2_ltch  = S5_AWVALID ? 1'b1 : wr_req_apb_s2_reg    ;
      assign wr_req_apb_s3_ltch  = S6_AWVALID ? 1'b1 : wr_req_apb_s3_reg    ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          wr_req_apb_s0_reg <= 1'b0                       ;
          wr_req_apb_s1_reg <= 1'b0                       ;
          wr_req_apb_s2_reg <= 1'b0                       ;
          wr_req_apb_s3_reg <= 1'b0                       ;
          end
      else if(axi_apb_sw_rst)
          begin
          wr_req_apb_s0_reg <= 1'b0                       ;
          wr_req_apb_s1_reg <= 1'b0                       ;
          wr_req_apb_s2_reg <= 1'b0                       ;
          wr_req_apb_s3_reg <= 1'b0                       ;
          end
      else if(wr_trans_done)
          begin
          wr_req_apb_s0_reg <= 1'b0                       ;
          wr_req_apb_s1_reg <= 1'b0                       ;
          wr_req_apb_s2_reg <= 1'b0                       ;
          wr_req_apb_s3_reg <= 1'b0                       ;
          end
      else
          begin
          wr_req_apb_s0_reg <= wr_req_apb_s0_ltch         ;
          wr_req_apb_s1_reg <= wr_req_apb_s1_ltch         ;
          wr_req_apb_s2_reg <= wr_req_apb_s2_ltch         ;
          wr_req_apb_s3_reg <= wr_req_apb_s3_ltch         ;
          end

      end

      //    GENERATING READ REQUEST WHEN READ TRANSACTION OCCURS
      assign rd_trans_done       = (((S3_RVALID && S3_RREADY) || (S4_RVALID && S4_RREADY) || (S5_RVALID && S5_RREADY) || (S6_RVALID && S6_RREADY)) && (rd_down_counter == 5'd1)) ? 1'b1 : 1'b0    ;
      assign rd_req_apb_s0_ltch  = S3_ARVALID ? 1'b1 : rd_req_apb_s0_reg    ;
      assign rd_req_apb_s1_ltch  = S4_ARVALID ? 1'b1 : rd_req_apb_s1_reg    ;
      assign rd_req_apb_s2_ltch  = S5_ARVALID ? 1'b1 : rd_req_apb_s2_reg    ;
      assign rd_req_apb_s3_ltch  = S6_ARVALID ? 1'b1 : rd_req_apb_s3_reg    ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          rd_req_apb_s0_reg <= 1'b0                       ;
          rd_req_apb_s1_reg <= 1'b0                       ;
          rd_req_apb_s2_reg <= 1'b0                       ;
          rd_req_apb_s3_reg <= 1'b0                       ;
          end
      else if(axi_apb_sw_rst)
          begin
          rd_req_apb_s0_reg <= 1'b0                       ;
          rd_req_apb_s1_reg <= 1'b0                       ;
          rd_req_apb_s2_reg <= 1'b0                       ;
          rd_req_apb_s3_reg <= 1'b0                       ;
          end
      else if(rd_trans_done)
          begin
          rd_req_apb_s0_reg <= 1'b0                       ;
          rd_req_apb_s1_reg <= 1'b0                       ;
          rd_req_apb_s2_reg <= 1'b0                       ;
          rd_req_apb_s3_reg <= 1'b0                       ;
          end
      else
          begin
          rd_req_apb_s0_reg <= rd_req_apb_s0_ltch         ;
          rd_req_apb_s1_reg <= rd_req_apb_s1_ltch         ;
          rd_req_apb_s2_reg <= rd_req_apb_s2_ltch         ;
          rd_req_apb_s3_reg <= rd_req_apb_s3_ltch         ;
          end

      end
      //-------------------------------------------------------------------------

      //    LATCHING THE WRITE ADDRESS AND DATA TO SEND TO APB SLAVE 1
      assign get_wr_addr_S0 = (S3_AWVALID && S3_AWREADY) ? S3_AWADDR : get_wr_addr_S0_reg   ;
      assign get_wr_data_S0 = (S3_WVALID  && S3_WREADY ) ? S3_WDATA  : get_wr_data_S0_reg   ;
      assign enable_S0_ltch = (S3_WVALID  && S3_WREADY ) ? 1'b1      : enable_S0_reg        ; 
      assign wr_trans_done_S0  = (S3_BVALID && S3_BREADY)   ? 1'b1   : 1'b0                 ; 

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S0_reg      <= 1'b0              ;
          get_wr_addr_S0_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S0_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S0_reg      <= 1'b0              ;
          get_wr_addr_S0_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S0_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(wr_trans_done_S0)
          begin
          enable_S0_reg      <= 1'b0              ;
          get_wr_addr_S0_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S0_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else
          begin
          enable_S0_reg      <= enable_S0_ltch    ;
          get_wr_addr_S0_reg <= get_wr_addr_S0    ;
          get_wr_data_S0_reg <= get_wr_data_S0    ; 
          end
      end

      //    LATCHING THE WRITE ADDRESS AND DATA TO SEND TO APB SLAVE 2
      assign get_wr_addr_S1 = (S4_AWVALID && S4_AWREADY) ? S4_AWADDR : get_wr_addr_S1_reg   ;
      assign get_wr_data_S1 = (S4_WVALID  && S4_WREADY ) ? S4_WDATA  : get_wr_data_S1_reg   ;
      assign enable_S1_ltch = (S4_WVALID  && S4_WREADY ) ? 1'b1      : enable_S1_reg        ; 
      assign wr_trans_done_S1  = (S4_BVALID && S4_BREADY)   ? 1'b1   : 1'b0                 ; 

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S1_reg      <= 1'b0              ;
          get_wr_addr_S1_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S1_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S1_reg      <= 1'b0              ;
          get_wr_addr_S1_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S1_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(wr_trans_done_S1)
          begin
          enable_S1_reg      <= 1'b0              ;
          get_wr_addr_S1_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S1_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else
          begin
          enable_S1_reg      <= enable_S1_ltch    ;
          get_wr_addr_S1_reg <= get_wr_addr_S1    ;
          get_wr_data_S1_reg <= get_wr_data_S1    ; 
          end
      end

      //    LATCHING THE WRITE ADDRESS AND DATA TO SEND TO APB SLAVE 3
      assign get_wr_addr_S2 = (S5_AWVALID && S5_AWREADY) ? S5_AWADDR : get_wr_addr_S2_reg   ;
      assign get_wr_data_S2 = (S5_WVALID  && S5_WREADY ) ? S5_WDATA  : get_wr_data_S2_reg   ;
      assign enable_S2_ltch = (S5_WVALID  && S5_WREADY ) ? 1'b1      : enable_S2_reg        ; 
      assign wr_trans_done_S2  = (S5_BVALID && S5_BREADY)   ? 1'b1   : 1'b0                 ; 

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S2_reg <= 1'b0                   ;
          get_wr_addr_S2_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S2_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S2_reg <= 1'b0                   ;
          get_wr_addr_S2_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S2_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(wr_trans_done_S2)
          begin
          enable_S2_reg <= 1'b0                   ;
          get_wr_addr_S2_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S2_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else
          begin
          enable_S2_reg <= enable_S2_ltch         ;
          get_wr_addr_S2_reg <= get_wr_addr_S2    ;
          get_wr_data_S2_reg <= get_wr_data_S2    ; 
          end
      end

      //    LATCHING THE WRITE ADDRESS AND DATA TO SEND TO APB SLAVE 4
      assign get_wr_addr_S3 = (S6_AWVALID && S6_AWREADY) ? S6_AWADDR : get_wr_addr_S3_reg    ;
      assign get_wr_data_S3 = (S6_WVALID  && S6_WREADY ) ? S6_WDATA  : get_wr_data_S3_reg    ;
      assign enable_S3_ltch = (S6_WVALID  && S6_WREADY ) ? 1'b1      : enable_S3_reg         ; 
      assign wr_trans_done_S3  = (S6_BVALID && S6_BREADY)   ? 1'b1   : 1'b0                  ; 

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S3_reg <= 1'b0                   ;
          get_wr_addr_S3_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S3_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S3_reg <= 1'b0                   ;
          get_wr_addr_S3_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S3_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else if(wr_trans_done_S3)
          begin
          enable_S3_reg <= 1'b0                   ;
          get_wr_addr_S3_reg <= {WIDTH_AD{1'b0}}  ;
          get_wr_data_S3_reg <= {WIDTH_DA{1'b0}}  ; 
          end
      else
          begin
          enable_S3_reg <= enable_S3_ltch         ;
          get_wr_addr_S3_reg <= get_wr_addr_S3    ;
          get_wr_data_S3_reg <= get_wr_data_S3    ; 
          end
      end
      //------------------------------------------------------------------------

      //    LATCHING THE READ ADDRESS TO SEND TO APB SLAVE 0
      assign get_rd_addr_S0  = (S3_ARVALID && S3_ARREADY)      ? S3_ARADDR : get_rd_addr_S0_reg  ;
      assign enable_S0_ltch0 = (S3_ARVALID_R1 && S3_ARREADY_R) ? 1'b1      : enable_S0_reg0      ;
      assign rd_trans_done_S0= ((S3_RVALID && S3_RREADY) && (rd_down_counter ==5'd1))   ? 1'b1      : 1'b0                ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S0_reg0 <= 1'b0                   ;
          get_rd_addr_S0_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S0_reg0 <= 1'b0                   ;
          get_rd_addr_S0_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(rd_trans_done_S0)
          begin
          enable_S0_reg0 <= 1'b0                   ;
          get_rd_addr_S0_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else
          begin
          enable_S0_reg0 <= enable_S0_ltch0        ;
          get_rd_addr_S0_reg <= get_rd_addr_S0     ;
          end
      end
      
      //    LATCHING THE READ ADDRESS TO SEND TO APB SLAVE 1
      assign get_rd_addr_S1  = (S4_ARVALID && S4_ARREADY)      ? S4_ARADDR : get_rd_addr_S1_reg  ;
      assign enable_S1_ltch0 = (S4_ARVALID_R1 && S4_ARREADY_R) ? 1'b1      : enable_S1_reg0      ;
      assign rd_trans_done_S1= ((S4_RVALID && S4_RREADY) && (rd_down_counter ==5'd1))   ? 1'b1      : 1'b0                ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S1_reg0 <= 1'b0                   ;
          get_rd_addr_S1_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S1_reg0 <= 1'b0                   ;
          get_rd_addr_S1_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(rd_trans_done_S1)
          begin
          enable_S1_reg0 <= 1'b0                   ;
          get_rd_addr_S1_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else
          begin
          enable_S1_reg0 <= enable_S1_ltch0        ;
          get_rd_addr_S1_reg <= get_rd_addr_S1     ;
          end
      end

      //    LATCHING THE READ ADDRESS TO SEND TO APB SLAVE 2
      assign get_rd_addr_S2  = (S5_ARVALID && S5_ARREADY)      ? S5_ARADDR : get_rd_addr_S2_reg  ;
      assign enable_S2_ltch0 = (S5_ARVALID_R1 && S5_ARREADY_R) ? 1'b1      : enable_S2_reg0      ;
      assign rd_trans_done_S2= ((S5_RVALID && S5_RREADY) && (rd_down_counter ==5'd1))   ? 1'b1      : 1'b0                ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S2_reg0 <= 1'b0                   ;
          get_rd_addr_S2_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S2_reg0 <= 1'b0                   ;
          get_rd_addr_S2_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(rd_trans_done_S2)
          begin
          enable_S2_reg0 <= 1'b0                   ;
          get_rd_addr_S2_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else
          begin
          enable_S2_reg0 <= enable_S2_ltch0        ;
          get_rd_addr_S2_reg <= get_rd_addr_S2     ;
          end
      end

      //    LATCHING THE READ ADDRESS TO SEND TO APB SLAVE 3
      assign get_rd_addr_S3  = (S6_ARVALID && S6_ARREADY)      ? S6_ARADDR : get_rd_addr_S3_reg  ;
      assign enable_S3_ltch0 = (S6_ARVALID_R1 && S6_ARREADY_R) ? 1'b1      : enable_S3_reg0      ;
      assign rd_trans_done_S3= ((S6_RVALID && S6_RREADY) && (rd_down_counter ==5'd1))       ? 1'b1      : 1'b0                ;

      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin

      if(!axi_apb_rstn)
          begin
          enable_S3_reg0 <= 1'b0                   ;
          get_rd_addr_S3_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(axi_apb_sw_rst)
          begin
          enable_S3_reg0 <= 1'b0                   ;
          get_rd_addr_S3_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else if(rd_trans_done_S3)
          begin
          enable_S3_reg0 <= 1'b0                   ;
          get_rd_addr_S3_reg <= {WIDTH_AD{1'b0}}   ;
          end
      else
          begin
          enable_S3_reg0 <= enable_S3_ltch0        ;
          get_rd_addr_S3_reg <= get_rd_addr_S3     ;
          end
      end

      //---------------------------------------------------------------------------------------
      
      //    LOGIC FOR ENABLING THE PARTICULAR SLAVE
      assign enable_S0_r = (enable_S0_ltch || enable_S0_ltch0) ? 1'b1 : 1'b0      ;
      assign enable_S1_r = (enable_S1_ltch || enable_S1_ltch0) ? 1'b1 : 1'b0      ;
      assign enable_S2_r = (enable_S2_ltch || enable_S2_ltch0) ? 1'b1 : 1'b0      ;
      assign enable_S3_r = (enable_S3_ltch || enable_S3_ltch0) ? 1'b1 : 1'b0      ;
      //---------------------------------------------------------------------------------------


      //    PRESENT STATE LOGIC
      always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
      begin
      if(!axi_apb_rstn)
          begin
          apb_present_state <= APB_IDLE       ;
          end
      else 
          begin
          apb_present_state <= apb_next_state ;
          end
      end

     // LOGIC FOR APB STATE CHANGES 
     assign wr_transfer_done    = ((S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY) && ((S3_BVALID ) || (S4_BVALID ) || (S5_BVALID ) || (S6_BVALID ))) ? 1'b1 : 1'b0    ;
     assign wr_transfer_pending = ((S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY) && ((!S3_BVALID) || (!S4_BVALID) || (!S5_BVALID) || (!S6_BVALID))) ? 1'b1 : 1'b0    ;
     assign rd_transfer_done    = ((S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY) && ((S3_RVALID ) || (S4_RVALID ) || (S5_RVALID ) || (S6_RVALID )) && (rd_down_counter == 5'd1)) ? 1'b1 : 1'b0    ;
     assign rd_transfer_pending = ((S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY) && ((!S3_RVALID) || (!S4_RVALID) || (!S5_RVALID) || (!S6_RVALID)) && (rd_down_counter <= 5'd1)) ? 1'b1 : 1'b0    ;

      //    NEXT STATE LOGIC
      always_comb
      begin
      apb_next_state = APB_IDLE  ;
      unique case(apb_present_state)
      APB_IDLE   : begin 
                    if(S3_WREADY || S4_WREADY || S5_WREADY || S6_WREADY || S3_ARREADY_R || S4_ARREADY_R || S5_ARREADY_R || S6_ARREADY_R)
                        begin
                        apb_next_state = APB_SETUP ;
                        end
                    else 
                        begin
                        apb_next_state = APB_IDLE  ;
                        end
                   end 
      APB_SETUP  : begin
                   apb_next_state = APB_ACCESS     ;
                   end
      APB_ACCESS : begin
                   if(wr_transfer_done || rd_transfer_done)
                       begin
                       apb_next_state = APB_IDLE   ;
                       end
                   else if(wr_transfer_pending || rd_transfer_pending) 
                       begin
                       apb_next_state = APB_SETUP  ;
                       end
                   else
                       begin
                       apb_next_state = APB_ACCESS ;
                       end
                   end
      endcase
      end

      // PENABLE OUTPUT LOGIC
      always_comb
      begin
      penable_reg = 1'b0 ;
      unique case(apb_present_state)
      APB_IDLE    : begin  penable_reg = 1'b0 ; end
      APB_SETUP   : begin  penable_reg = 1'b0 ; end
      APB_ACCESS  : begin  penable_reg = 1'b1 ; end
      endcase
      end
      

      //  OUTPUT LOGIC
      always_comb
      begin

                         S0_PADDR   = {WIDTH_AD{1'b0}}      ; 
                         S0_PDATA   = {WIDTH_DA{1'b0}}      ;  
                         S0_PWRITE  = 1'b0                  ;
                         S0_PENABLE = 1'b0                  ;
                         S0_PSEL    = 1'b0                  ;
                         S0_PSTRB   = 4'd0                  ;

                         S1_PADDR   = {WIDTH_AD{1'b0}}      ;
                         S1_PDATA   = {WIDTH_DA{1'b0}}      ;
                         S1_PWRITE  = 1'b0                  ;
                         S1_PENABLE = 1'b0                  ;
                         S1_PSEL    = 1'b0                  ;
                         S1_PSTRB   = 4'd0                  ;

                         S2_PADDR   = {WIDTH_AD{1'b0}}      ;
                         S2_PDATA   = {WIDTH_DA{1'b0}}      ;
                         S2_PWRITE  = 1'b0                  ;
                         S2_PENABLE = 1'b0                  ;
                         S2_PSEL    = 1'b0                  ;
                         S2_PSTRB   = 4'd0                  ;

                         S3_PADDR   = {WIDTH_AD{1'b0}}      ;
                         S3_PDATA   = {WIDTH_DA{1'b0}}      ;
                         S3_PWRITE  = 1'b0                  ;
                         S3_PENABLE = 1'b0                  ;
                         S3_PSEL    = 1'b0                  ;
                         S3_PSTRB   = 4'd0                  ;

      case(present_state)
      IDLE              : 
                         begin 
                         S0_PADDR   = {WIDTH_AD{1'b0}}      ; 
                         S0_PDATA   = {WIDTH_DA{1'b0}}      ;  
                         S0_PWRITE  = 1'b0                  ;
                         S0_PENABLE = 1'b0                  ;
                         S0_PSEL    = 1'b0                  ;
                         S0_PSTRB   = 4'd0                  ;

                         S1_PADDR   = {WIDTH_AD{1'b0}}      ;
                         S1_PDATA   = {WIDTH_DA{1'b0}}      ;
                         S1_PWRITE  = 1'b0                  ;
                         S1_PENABLE = 1'b0                  ;
                         S1_PSEL    = 1'b0                  ;
                         S1_PSTRB   = 4'd0                  ;

                         S2_PADDR   = {WIDTH_AD{1'b0}}      ;
                         S2_PDATA   = {WIDTH_DA{1'b0}}      ;
                         S2_PWRITE  = 1'b0                  ;
                         S2_PENABLE = 1'b0                  ;
                         S2_PSEL    = 1'b0                  ;
                         S2_PSTRB   = 4'd0                  ;

                         S3_PADDR   = {WIDTH_AD{1'b0}}      ;
                         S3_PDATA   = {WIDTH_DA{1'b0}}      ;
                         S3_PWRITE  = 1'b0                  ;
                         S3_PENABLE = 1'b0                  ;
                         S3_PSEL    = 1'b0                  ;
                         S3_PSTRB   = 4'd0                  ;
                         end
      AXI_TO_APB_SLAVE0 : 
                         begin

                         if(enable_S0)
                             begin
                         S0_PENABLE = penable_reg               ;
                         S0_PSEL    = 1'b1                      ;
                         S0_PSTRB   = s3_wstrb_ltch             ;  

                             if(wr_req_apb_s0_ltch)
                                 begin
                                 S0_PADDR   = wr_addr_r         ; 
                                 S0_PDATA   = get_wr_data_S0    ;
                                 S0_PWRITE  = 1'b1              ;
                                 end
                             else if(rd_req_apb_s0_ltch) 
                                 begin
                                 S0_PADDR   = rd_addr_r         ; 
                                 S0_PDATA   = {WIDTH_DA{1'b0}}  ;
                                 S0_PWRITE  = 1'b0              ;
                                 end 

                             end

                         end
      AXI_TO_APB_SLAVE1 : 
                         begin

                         if(enable_S1)
                             begin
                         S1_PENABLE = penable_reg               ;
                         S1_PSEL    = 1'b1                      ;
                         S1_PSTRB   = s4_wstrb_ltch             ;  

                             if(wr_req_apb_s1_ltch)
                                 begin
                                 S1_PADDR   = wr_addr_r         ; 
                                 S1_PDATA   = get_wr_data_S1    ;
                                 S1_PWRITE  = 1'b1              ;
                                 end
                             else if(rd_req_apb_s1_ltch) 
                                 begin
                                 S1_PADDR   = rd_addr_r         ;     
                                 S1_PDATA   = {WIDTH_DA{1'b0}}  ;
                                 S1_PWRITE  = 1'b0              ;
                                 end 

                             end

                         end
      AXI_TO_APB_SLAVE2 : 
                         begin

                         if(enable_S2)
                             begin
                         S2_PENABLE = penable_reg               ;
                         S2_PSEL    = 1'b1                      ;
                         S2_PSTRB   = s5_wstrb_ltch             ; 

                             if(wr_req_apb_s2_ltch)
                                 begin
                                 S2_PADDR   = wr_addr_r         ; 
                                 S2_PDATA   = get_wr_data_S2    ;
                                 S2_PWRITE  = 1'b1              ;
                                 end
                             else if(rd_req_apb_s2_ltch) 
                                 begin
                                 S2_PADDR   = rd_addr_r         ; 
                                 S2_PDATA   = {WIDTH_DA{1'b0}}  ;
                                 S2_PWRITE  = 1'b0              ;
                                 end 

                             end 

                         end
      AXI_TO_APB_SLAVE3 : 
                         begin

                         if(enable_S3)
                             begin
                         S3_PENABLE = penable_reg               ;
                         S3_PSEL    = 1'b1                      ;
                         S3_PSTRB   = s6_wstrb_ltch             ; 

                             if(wr_req_apb_s3_ltch)
                                 begin
                                 S3_PADDR   = wr_addr_r         ; 
                                 S3_PDATA   = get_wr_data_S3    ;
                                 S3_PWRITE  = 1'b1              ;
                                 end
                             else if(rd_req_apb_s3_ltch) 
                                 begin
                                 S3_PADDR   = rd_addr_r         ; 
                                 S3_PDATA   = {WIDTH_DA{1'b0}}  ;
                                 S3_PWRITE  = 1'b0              ;
                                 end 

                             end 

                         end

      endcase
      end
      //----------------------------------------------------------------------------

      //    LOGIC FOR WRITE RESP 
      always_comb
      begin
      S3_BID    = 8'd0  ;
      S3_BVALID = 1'b0  ;
      S3_BRESP  = 2'b00 ;     
      S4_BID    = 8'd0  ;
      S4_BVALID = 1'b0  ;
      S4_BRESP  = 2'b00 ;     
      S5_BID    = 8'd0  ;
      S5_BVALID = 1'b0  ;
      S5_BRESP  = 2'b00 ;     
      S6_BID    = 8'd0  ;
      S6_BVALID = 1'b0  ;
      S6_BRESP  = 2'b00 ;     

      case(present_state)
      IDLE               :
                          begin 
                                    S3_BVALID = 1'b0  ;
                                    S3_BRESP  = 2'b00 ;     
                                    S4_BVALID = 1'b0  ;
                                    S4_BRESP  = 2'b00 ;     
                                    S5_BVALID = 1'b0  ;
                                    S5_BRESP  = 2'b00 ;     
                                    S6_BVALID = 1'b0  ;
                                    S6_BRESP  = 2'b00 ;     
                          end
      AXI_TO_APB_SLAVE0  :
                          begin
                          if(S0_PREADY && (wr_down_counter == 5'd1))
                              begin
                                    if(wr_req_apb_s0_ltch)
                                    begin    
                                      if(!S0_PSLVERR)
                                          begin
                                          S3_BID    = S3_WID_ltch ;
                                          S3_BVALID = 1'b1  ;
                                          S3_BRESP  = 2'b00 ;     //OKAY RESPONSE
                                          end
                                      else
                                          begin
                                          S3_BID    = S3_WID_ltch ;
                                          S3_BVALID = 1'b1  ;
                                          S3_BRESP  = 2'b11 ;     //DECODE ERROR
                                          end
                                    end      
                              end
                          end
      AXI_TO_APB_SLAVE1  :
                          begin
                          if(S1_PREADY && (wr_down_counter == 5'd1))
                              begin
                                    if(wr_req_apb_s1_ltch)
                                    begin
                                        if(!S1_PSLVERR)
                                            begin
                                            S4_BID    = S4_WID_ltch ;
                                            S4_BVALID = 1'b1  ;
                                            S4_BRESP  = 2'b00 ;     //OKAY RESPONSE
                                            end
                                        else
                                            begin
                                            S4_BID    = S4_WID_ltch ;
                                            S4_BVALID = 1'b1  ;
                                            S4_BRESP  = 2'b11 ;     //DECODE ERROR
                                            end
                                    end
                              end
                          end
      AXI_TO_APB_SLAVE2  :
                          begin
                          if(S2_PREADY && (wr_down_counter == 5'd1))
                              begin
                                   if(wr_req_apb_s2_ltch)
                                   begin
                                           if(!S2_PSLVERR)
                                               begin
                                               S5_BID    = S5_WID_ltch ;
                                               S5_BVALID = 1'b1  ;
                                               S5_BRESP  = 2'b00 ;     //OKAY RESPONSE
                                               end
                                           else
                                               begin
                                               S5_BID    = S5_WID_ltch ;
                                               S5_BVALID = 1'b1  ;
                                               S5_BRESP  = 2'b11 ;     //DECODE ERROR
                                               end
                                             end  
                                   end
                          end
      AXI_TO_APB_SLAVE3  :
                          begin
                          if(S3_PREADY && (wr_down_counter == 5'd1))
                              begin
                                   if(wr_req_apb_s3_ltch)
                                   begin    
                                           if(!S3_PSLVERR)
                                               begin
                                               S6_BID    = S6_WID_ltch ;
                                               S6_BVALID = 1'b1  ;
                                               S6_BRESP  = 2'b00 ;     //OKAY RESPONSE
                                               end
                                           else
                                               begin
                                               S6_BID    = S6_WID_ltch ;
                                               S6_BVALID = 1'b1  ;
                                               S6_BRESP  = 2'b11 ;     //DECODE ERROR
                                               end
                                   end      
                              end
                          end
      endcase
      end
      //----------------------------------------------------------------------------
      
      //    LOGIC FOR READ DATA FROM APB SLAVES
      always_comb
      begin
      S3_RID    = 8'D0                ;
      S3_RDATA  = {WIDTH_DA{1'b0}}    ; 
      S3_RVALID = 1'b0                ;     
      S3_RLAST  = 1'b0                ;
      S3_RRESP  = 2'b00               ;
      S4_RID    = 8'D0                ;
      S4_RDATA  = {WIDTH_DA{1'b0}}    ;
      S4_RVALID = 1'b0                ;
      S4_RLAST  = 1'b0                ;
      S4_RRESP  = 2'b00               ;
      S5_RID    = 8'D0                ;
      S5_RDATA  = {WIDTH_DA{1'b0}}    ;
      S5_RVALID = 1'b0                ;
      S5_RLAST  = 1'b0                ;
      S5_RRESP  = 2'b00               ;
      S6_RID    = 8'D0                ;
      S6_RDATA  = {WIDTH_DA{1'b0}}    ;
      S6_RVALID = 1'b0                ;
      S6_RLAST  = 1'b0                ;
      S6_RRESP  = 2'b00               ;

      case(present_state)
      IDLE              :
                         begin
                         S3_RID    = 8'D0                ;
                         S3_RDATA  = {WIDTH_DA{1'b0}}    ; 
                         S3_RVALID = 1'b0                ;     
                         S3_RLAST  = 1'b0                ;
                         S4_RID    = 8'D0                ;
                         S4_RDATA  = {WIDTH_DA{1'b0}}    ;
                         S4_RVALID = 1'b0                ;
                         S4_RLAST  = 1'b0                ;
                         S5_RID    = 8'D0                ;
                         S5_RDATA  = {WIDTH_DA{1'b0}}    ;
                         S5_RVALID = 1'b0                ;
                         S5_RLAST  = 1'b0                ;
                         S6_RID    = 8'D0                ;
                         S6_RDATA  = {WIDTH_DA{1'b0}}    ;
                         S6_RVALID = 1'b0                ;
                         S6_RLAST  = 1'b0                ;
                         end
      AXI_TO_APB_SLAVE0 :
                         begin
                         
                         if(rd_down_counter > 5'd1)
                             begin
                             
                             if(S0_PREADY & rd_req_apb_s0_ltch)
                                 begin
                                 S3_RID    = S3_ARID_ltch    ;
                                 S3_RDATA  = S0_PRDATA       ;
                                 S3_RVALID = 1'B1            ;
                                 end

                             if(!S0_PSLVERR)
                                 begin
                                 S3_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S3_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end

                             end
                         else 
                             begin

                             if(S0_PREADY & rd_req_apb_s0_ltch)
                                 begin
                                 S3_RID    = S3_ARID_ltch    ;
                                 S3_RDATA  = S0_PRDATA       ;
                                 S3_RVALID = 1'B1            ;
                                 S3_RLAST  = 1'B1            ;  
                                 end

                             if(!S0_PSLVERR)
                                 begin
                                 S3_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S3_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end
                             end
                             
                         end
      AXI_TO_APB_SLAVE1 :
                         begin
                         if(rd_down_counter > 5'd1)
                             begin
                             
                             if(S1_PREADY & rd_req_apb_s1_ltch)
                                 begin
                                 S4_RID    = S4_ARID_ltch    ;
                                 S4_RDATA  = S1_PRDATA       ;
                                 S4_RVALID = 1'B1            ;
                                 end

                             if(!S1_PSLVERR)
                                 begin
                                 S4_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S4_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end

                             end
                         else 
                             begin

                             if(S1_PREADY & rd_req_apb_s1_ltch)
                                 begin
                                 S4_RID    = S4_ARID_ltch    ;
                                 S4_RDATA  = S1_PRDATA       ;
                                 S4_RVALID = 1'B1            ;
                                 S4_RLAST  = 1'B1            ;  
                                 end

                             if(!S1_PSLVERR)
                                 begin
                                 S4_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S4_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end
                             end
                         end
      AXI_TO_APB_SLAVE2 :
                         begin
                         if(rd_down_counter > 5'd1)
                             begin
                             
                             if(S2_PREADY & rd_req_apb_s2_ltch)
                                 begin
                                 S5_RID    = S5_ARID_ltch    ;
                                 S5_RDATA  = S2_PRDATA       ;
                                 S5_RVALID = 1'B1            ;
                                 end

                             if(!S2_PSLVERR)
                                 begin
                                 S5_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S5_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end

                             end
                         else 
                             begin

                             if(S2_PREADY & rd_req_apb_s2_ltch)
                                 begin
                                 S5_RID    = S5_ARID_ltch    ;
                                 S5_RDATA  = S2_PRDATA       ;
                                 S5_RVALID = 1'B1            ;
                                 S5_RLAST  = 1'B1            ;  
                                 end

                             if(!S2_PSLVERR)
                                 begin
                                 S5_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S5_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end
                             end
                         end
      AXI_TO_APB_SLAVE3 :
                         begin
                         if(rd_down_counter > 5'd1)
                             begin
                             
                             if(S3_PREADY & rd_req_apb_s3_ltch)
                                 begin
                                 S6_RID    = S6_ARID_ltch    ;
                                 S6_RDATA  = S3_PRDATA       ;
                                 S6_RVALID = 1'B1            ;
                                 end

                             if(!S3_PSLVERR)
                                 begin
                                 S6_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S6_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end

                             end
                         else 
                             begin

                             if(S3_PREADY & rd_req_apb_s3_ltch)
                                 begin
                                 S6_RID    = S6_ARID_ltch    ;
                                 S6_RDATA  = S3_PRDATA       ;
                                 S6_RVALID = 1'B1            ;
                                 S6_RLAST  = 1'B1            ;  
                                 end

                             if(!S3_PSLVERR)
                                 begin
                                 S6_RRESP = 2'b00        ;  //  OKAY RESPONSE
                                 end
                             else 
                                 begin
                                 S6_RRESP = 2'b11        ;  //  DECODE ERROR
                                 end
                             end
                         end
      endcase
      end
      //-----------------------------------------------------------------   

          //    BURST OPERATION 
            /////////////////////////////////////////////////////////////// 
            //                   WRITE BURST FSM                         // 
            ///////////////////////////////////////////////////////////////

            //              PRESENT STATE LOGIC
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin
            
            if(!axi_apb_rstn)
                begin
                present_state_wr  <=  WR_IDLE                                ;                
                end
            else if(axi_apb_sw_rst)
                begin
                present_state_wr  <=  WR_IDLE                                ;                
                end    
            else 
                begin
                present_state_wr  <=  next_state_wr                          ;
                end

            end

            //              NEXT STATE LOGIC
            always_comb
            begin

            case(present_state_wr)
            WR_IDLE         : begin 

                                if((S3_AWVALID && S3_AWBURST == 2'd0) || (S4_AWVALID && S4_AWBURST == 2'd0) || (S5_AWVALID && S5_AWBURST == 2'd0) || (S6_AWVALID && S6_AWBURST == 2'd0))
                                    begin
                                    next_state_wr = WR_FIX_BURST        ;
                                    end
                                else if((S3_AWVALID && S3_AWBURST == 2'd1) || (S4_AWVALID && S4_AWBURST == 2'd1) || (S5_AWVALID && S5_AWBURST == 2'd1) || (S6_AWVALID && S6_AWBURST == 2'd1))
                                    begin
                                    next_state_wr = WR_INCR_BURST       ;
                                    end
                                else if((S3_AWVALID && S3_AWBURST == 2'd2) || (S4_AWVALID && S4_AWBURST == 2'd2) || (S5_AWVALID && S5_AWBURST == 2'd2) || (S6_AWVALID && S6_AWBURST == 2'd2))
                                    begin
                                    next_state_wr = WR_WRAP_BURST       ; 
                                    end
                                else
                                    begin
                                    next_state_wr = WR_IDLE             ;
                                    end
                                    
                              end

            WR_FIX_BURST    : begin
                                
                                if((wr_down_counter == 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                    begin
                                    next_state_wr = WR_IDLE            ;
                                    end
                                else
                                    begin
                                    next_state_wr = WR_FIX_BURST       ;
                                    end
                                
                              end

            WR_INCR_BURST   : begin 
                            
                                 if((wr_down_counter  == 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                    begin
                                    next_state_wr = WR_IDLE            ;
                                    end
                                else
                                    begin
                                    next_state_wr = WR_INCR_BURST      ;
                                    end

                              end

            WR_WRAP_BURST   : begin 

                                 if((wr_down_counter == 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                    begin
                                    next_state_wr = WR_IDLE            ;
                                    end
                                else
                                    begin
                                    next_state_wr = WR_WRAP_BURST      ;
                                    end

                              end

            endcase
            end

            //                   ADDRESS OUTPUT LOGIC
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                wr_addr_r   <=  32'd0                                                         ;
                awvalid_reg <= 1'b0                                                           ;
                end
            else if(axi_apb_sw_rst)
                begin
                wr_addr_r   <=  32'd0                                                         ;
                awvalid_reg <= 1'b0                                                           ;
                end    
            else
                begin

            case(present_state_wr)
            WR_IDLE         : begin
                              wr_addr_r        <= 32'd0                                       ;    
                              end

            WR_FIX_BURST    : begin
                              
                              if((wr_down_counter != 5'd0) && (present_state == 3'd1))
                                  begin
                                  wr_addr_r   <= get_wr_addr_S0                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter != 5'd0) && (present_state == 3'd2))
                                  begin
                                  wr_addr_r   <= get_wr_addr_S1                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter != 5'd0) && (present_state == 3'd3))
                                  begin
                                  wr_addr_r   <= get_wr_addr_S2                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter != 5'd0) && (present_state == 3'd4))
                                  begin
                                  wr_addr_r   <= get_wr_addr_S3                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end    
                              else if((wr_down_counter == 5'd0))
                                  begin
                                  wr_addr_r   <= 32'd0                                        ;
                                  awvalid_reg <= 1'b0                                         ;
                                  end
                              

                              end 

            WR_INCR_BURST   : begin

                              if((wr_down_counter == (S3_AWLEN_R + 1'b1)) && (present_state == 3'd1) && (!S0_PREADY))
                                  begin
                                  wr_addr_r   <= get_wr_addr_S0                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter == (S4_AWLEN_R + 1'b1)) && (present_state == 3'd2) && (!S1_PREADY)) 
                                  begin
                                  wr_addr_r   <= get_wr_addr_S1                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter == (S5_AWLEN_R + 1'b1)) && (present_state == 3'd3) && (!S2_PREADY)) 
                                  begin
                                  wr_addr_r   <= get_wr_addr_S2                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter == (S6_AWLEN_R + 1'b1)) && (present_state == 3'd4) && (!S3_PREADY)) 
                                  begin
                                  wr_addr_r   <= get_wr_addr_S3                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end    
                              else if((wr_down_counter != 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                  begin
                                  wr_addr_r   <= wr_addr_r + 32'd4                            ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else
                                  begin
                                  wr_addr_r   <= wr_addr_r                                    ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end

                              end

            WR_WRAP_BURST   : begin

                              if((wr_down_counter == (S3_AWLEN_R + 1'b1)) && (present_state == 3'd1) && (!S0_PREADY))
                                  begin
                                  wr_addr_r   <= get_wr_addr_S0                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter == (S4_AWLEN_R + 1'b1)) && (present_state == 3'd2) && (!S1_PREADY)) 
                                  begin
                                  wr_addr_r   <= get_wr_addr_S1                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter == (S5_AWLEN_R + 1'b1)) && (present_state == 3'd3) && (!S2_PREADY)) 
                                  begin
                                  wr_addr_r   <= get_wr_addr_S2                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if((wr_down_counter == (S6_AWLEN_R + 1'b1)) && (present_state == 3'd4) && (!S3_PREADY)) 
                                  begin
                                  wr_addr_r   <= get_wr_addr_S3                               ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if(((wr_addr_r1 + 32'd4) == S3_addr_n_wr) && present_state == 3'd1)
                                  begin
                                  wr_addr_r   <= S3_wrap_bndry                                ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if(((wr_addr_r1 + 32'd4) == S4_addr_n_wr) && present_state == 3'd2)
                                  begin
                                  wr_addr_r   <= S4_wrap_bndry                                ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if(((wr_addr_r1 + 32'd4) == S5_addr_n_wr) && present_state == 3'd3)
                                  begin
                                  wr_addr_r   <= S5_wrap_bndry                                ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else if(((wr_addr_r1 + 32'd4) == S6_addr_n_wr) && present_state == 3'd4)
                                  begin
                                  wr_addr_r   <= S6_wrap_bndry                                ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end    
                              else if((wr_down_counter != 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY)) 
                                  begin
                                  wr_addr_r   <= wr_addr_r + 32'd4                            ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              else 
                                  begin
                                  wr_addr_r   <= wr_addr_r                                    ;
                                  awvalid_reg <= 1'b1                                         ;
                                  end
                              
                              end
            endcase
            end
            end

            //                WRITE DOWN COUNTER LOGIC
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                wr_down_counter  <= 5'd0                                                        ; 
                end

            else if(axi_apb_sw_rst)
                begin
                wr_down_counter  <= 5'd0                                                        ; 
                end     

            else if((S3_AWVALID_R) && present_state == 3'd1)
                begin
                wr_down_counter  <= S3_AWLEN_R + 4'd1                                             ;
                end

            else if((S4_AWVALID_R) && present_state == 3'd2)
                begin
                wr_down_counter  <= S4_AWLEN_R + 4'd1                                             ;
                end

            else if((S5_AWVALID_R) && present_state == 3'd3)
                begin
                wr_down_counter  <= S5_AWLEN_R + 4'd1                                             ;
                end

            else if((S6_AWVALID_R) && present_state == 3'd4)
                begin
                wr_down_counter  <= S6_AWLEN_R + 4'd1                                             ;
                end    
    
            else if(((present_state_wr == 2'd1)||(present_state_wr==2'd2)||(present_state_wr==2'd3)) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY)) 
                begin
                wr_down_counter <= wr_down_counter - 1'b1                                       ;
                end

            else 
                begin
                wr_down_counter <= wr_down_counter                                              ;
                end

            end

            //--------------------WRAP BOUNDRY CALCULATION-------------------------------------
            assign S3_add_wr = (NO_OF_BYTES * (S3_AWLEN + 1'b1))                                ;
            assign S4_add_wr = (NO_OF_BYTES * (S4_AWLEN + 1'b1))                                ;
            assign S5_add_wr = (NO_OF_BYTES * (S5_AWLEN + 1'b1))                                ;
            assign S6_add_wr = (NO_OF_BYTES * (S6_AWLEN + 1'b1))                                ;

            assign S3_wrap_bndry = (S3_AWVALID && (S3_AWBURST == 2'd2)) ? ((S3_AWADDR/S3_add_wr)*S3_add_wr) : S3_wrap_bndry_r ;
            assign S4_wrap_bndry = (S4_AWVALID && (S4_AWBURST == 2'd2)) ? ((S4_AWADDR/S4_add_wr)*S4_add_wr) : S4_wrap_bndry_r ;
            assign S5_wrap_bndry = (S5_AWVALID && (S5_AWBURST == 2'd2)) ? ((S5_AWADDR/S5_add_wr)*S5_add_wr) : S5_wrap_bndry_r ;
            assign S6_wrap_bndry = (S6_AWVALID && (S6_AWBURST == 2'd2)) ? ((S6_AWADDR/S6_add_wr)*S6_add_wr) : S6_wrap_bndry_r ;

            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                S3_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                S4_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                S5_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                S6_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                end
            else if(axi_apb_sw_rst)
                begin
                S3_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                S4_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                S5_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                S6_wrap_bndry_r <= {WIDTH_AD{1'b0}}      ;
                end
            else
                begin
                S3_wrap_bndry_r <= S3_wrap_bndry           ;                
                S4_wrap_bndry_r <= S4_wrap_bndry           ;                
                S5_wrap_bndry_r <= S5_wrap_bndry           ;                
                S6_wrap_bndry_r <= S6_wrap_bndry           ;                
                end

            end
            //---------------------------------------------------------------------------------

            //-----------------------ADDRESS_N CALCULATION-------------------------------------
            assign S3_addr_n_wr = (S3_AWVALID && S3_AWBURST == 2'd2) ? (S3_wrap_bndry + (NO_OF_BYTES*(S3_AWLEN+1'b1))) : S3_addr_n_r  ;
            assign S4_addr_n_wr = (S4_AWVALID && S4_AWBURST == 2'd2) ? (S4_wrap_bndry + (NO_OF_BYTES*(S4_AWLEN+1'b1))) : S4_addr_n_r  ;
            assign S5_addr_n_wr = (S5_AWVALID && S5_AWBURST == 2'd2) ? (S5_wrap_bndry + (NO_OF_BYTES*(S5_AWLEN+1'b1))) : S5_addr_n_r  ;
            assign S6_addr_n_wr = (S6_AWVALID && S6_AWBURST == 2'd2) ? (S6_wrap_bndry + (NO_OF_BYTES*(S6_AWLEN+1'b1))) : S6_addr_n_r  ;

            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                S3_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                S4_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                S5_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                S6_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                end
            else if(axi_apb_sw_rst)
                begin
                S3_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                S4_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                S5_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                S6_addr_n_r <= {WIDTH_AD{1'b0}}      ;
                end
            else
                begin
                S3_addr_n_r <= S3_addr_n_wr            ;                
                S4_addr_n_r <= S4_addr_n_wr            ;                
                S5_addr_n_r <= S5_addr_n_wr            ;                
                S6_addr_n_r <= S6_addr_n_wr            ;                
                end

            end
            //---------------------------------------------------------------------------------
        
            /////////////////////////////////////////////////////////////// 
            //                   READ BURST FSM                          // 
            ///////////////////////////////////////////////////////////////

            //              PRESENT STATE LOGIC
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin
            
            if(!axi_apb_rstn)
                begin
                present_state_rd  <=  RD_IDLE                                ;                
                end
            else if(axi_apb_sw_rst)
                begin
                present_state_rd  <=  RD_IDLE                                ;                
                end    
            else 
                begin
                present_state_rd  <=  next_state_rd                          ;
                end

            end

            //              NEXT STATE LOGIC
            always_comb
            begin

            case(present_state_rd)
            RD_IDLE         : begin 

                                if((S3_ARVALID && S3_ARBURST == 2'd0) || (S4_ARVALID && S4_ARBURST == 2'd0) || (S5_ARVALID && S5_ARBURST == 2'd0) || (S6_ARVALID && S6_ARBURST == 2'd0))
                                    begin
                                    next_state_rd = RD_FIX_BURST            ;
                                    end
                                else if((S3_ARVALID && S3_ARBURST == 2'd1) || (S4_ARVALID && S4_ARBURST == 2'd1) || (S5_ARVALID && S5_ARBURST == 2'd1) || (S6_ARVALID && S6_ARBURST == 2'd1))
                                    begin
                                    next_state_rd = RD_INCR_BURST           ;      
                                    end
                                else if((S3_ARVALID && S3_ARBURST == 2'd2) || (S4_ARVALID && S4_ARBURST == 2'd2) || (S5_ARVALID && S5_ARBURST == 2'd2) || (S6_ARVALID && S6_ARBURST == 2'd2))
                                    begin
                                    next_state_rd = RD_WRAP_BURST           ; 
                                    end
                                else
                                    begin
                                    next_state_rd = RD_IDLE                 ;
                                    end
                                    
                              end

            RD_FIX_BURST    : begin
                                
                                if((rd_down_counter == 5'd1) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                    begin
                                    next_state_rd = RD_IDLE                 ;
                                    end
                                else
                                    begin
                                    next_state_rd = RD_FIX_BURST            ;
                                    end
                                
                              end

            RD_INCR_BURST   : begin 
                            
                                 if((rd_down_counter == 5'd1) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                    begin
                                    next_state_rd = RD_IDLE                 ;
                                    end
                                else
                                    begin
                                    next_state_rd = RD_INCR_BURST           ;
                                    end

                              end

            RD_WRAP_BURST   : begin 

                                 if((rd_down_counter == 5'd1) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                    begin
                                    next_state_rd = RD_IDLE                 ;
                                    end
                                else
                                    begin
                                    next_state_rd = RD_WRAP_BURST           ;
                                    end

                              end

            endcase
            end

            //                   ADDRESS OUTPUT LOGIC
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                rd_addr_r   <= 32'd0                                ;
                arvalid_reg <= 1'b0                                 ;
                end
            else if(axi_apb_sw_rst)
                begin
                rd_addr_r   <= 32'd0                                ;
                arvalid_reg <= 1'b0                                 ;
                end    
            else
                begin

            case(present_state_rd)
            RD_IDLE         : begin
                              rd_addr_r   <= 32'd0                  ;    
                              arvalid_reg <= 1'b0                   ;
                              end

            RD_FIX_BURST    : begin
                              
                              if((rd_down_counter != 5'd0) && (present_state == 3'd1))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S0     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter != 5'd0) && (present_state == 3'd2))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S1     ;
                                  arvalid_reg <= 1'b1               ;
                                  end    
                              else if((rd_down_counter != 5'd0) && (present_state == 3'd3))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S2     ;
                                  arvalid_reg <= 1'b1               ;
                                  end    
                              else if((rd_down_counter != 5'd0) && (present_state == 3'd4))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S3     ;
                                  arvalid_reg <= 1'b1               ;
                                  end    
                              else if((rd_down_counter == 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                  begin
                                  rd_addr_r   <= 32'd0              ;
                                  arvalid_reg <= 1'b0               ;
                                  end

                              end 

            RD_INCR_BURST   : begin

                              if((rd_down_counter == (S3_ARLEN_R + 1'b1)) && (present_state == 3'd1) && (!S0_PREADY))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S0     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter == (S4_ARLEN_R + 1'b1)) && (present_state == 3'd2) && (!S1_PREADY)) 
                                  begin
                                  rd_addr_r   <= get_rd_addr_S1     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter == (S5_ARLEN_R + 1'b1)) && (present_state == 3'd3) && (!S2_PREADY)) 
                                  begin
                                  rd_addr_r   <= get_rd_addr_S2     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter == (S6_ARLEN_R + 1'b1)) && (present_state == 3'd4) && (!S3_PREADY)) 
                                  begin
                                  rd_addr_r   <= get_rd_addr_S3     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter != 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY))
                                  begin
                                  rd_addr_r   <= rd_addr_r + 32'd4  ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else
                                  begin
                                  rd_addr_r   <= rd_addr_r          ;
                                  arvalid_reg <= arvalid_reg        ;
                                  end

                              end

            RD_WRAP_BURST   : begin

                              if((rd_down_counter == (S3_ARLEN_R + 4'd1)) && (present_state == 3'd1) && (!S0_PREADY))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S0     ;                                  
                                  arvalid_reg <= 1'b1               ;
                                  end 
                              else if((rd_down_counter == (S4_ARLEN_R + 4'd1)) && (present_state == 3'd2) && (!S1_PREADY))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S1     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter == (S5_ARLEN_R + 4'd1)) && (present_state == 3'd3) && (!S2_PREADY))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S2     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if((rd_down_counter == (S6_ARLEN_R + 4'd1)) && (present_state == 3'd4) && (!S3_PREADY))
                                  begin
                                  rd_addr_r   <= get_rd_addr_S3     ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if(((rd_addr_r1 + 32'd4) == S3_addr_n_rd) && present_state == 3'd1)
                                  begin
                                  rd_addr_r   <= S3_wrap_bndry_rd   ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else if(((rd_addr_r1 + 32'd4) == S4_addr_n_rd) && present_state == 3'd2)
                                  begin
                                  rd_addr_r   <= S4_wrap_bndry_rd   ;
                                  arvalid_reg <= 1'b1               ;
                                  end    
                              else if(((rd_addr_r1 + 32'd4) == S5_addr_n_rd) && present_state == 3'd3)
                                  begin
                                  rd_addr_r   <= S5_wrap_bndry_rd   ;
                                  arvalid_reg <= 1'b1               ;
                                  end    
                              else if(((rd_addr_r1 + 32'd4) == S6_addr_n_rd) && present_state == 3'd4)
                                  begin
                                  rd_addr_r   <= S6_wrap_bndry_rd   ;
                                  arvalid_reg <= 1'b1               ;
                                  end    
                              else if((rd_down_counter != 5'd0) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY)) 
                                  begin
                                  rd_addr_r   <= rd_addr_r + 32'd4  ;
                                  arvalid_reg <= 1'b1               ;
                                  end
                              else 
                                  begin
                                  rd_addr_r   <= rd_addr_r          ;
                                  arvalid_reg <= arvalid_reg        ;
                                  end
                              
                              end
            endcase
            end
            end

            //                WRITE DOWN COUNTER LOGIC
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                rd_down_counter  <= 5'd0                                                          ; 
                end

            else if(axi_apb_sw_rst)
                begin
                rd_down_counter  <= 5'd0                                                          ; 
                end     

            else if((S3_ARVALID_R) && present_state == 3'd1)
                begin
                rd_down_counter  <= S3_ARLEN_R + 4'd1                                               ;
                end

            else if((S4_ARVALID_R) && present_state == 3'd2 )
                begin
                rd_down_counter  <= S4_ARLEN_R + 4'd1                                               ;
                end
    
            else if((S5_ARVALID_R) && present_state == 3'd3)
                begin
                rd_down_counter  <= S5_ARLEN_R + 4'd1                                               ;
                end

            else if((S6_ARVALID_R) && present_state == 3'd4)
                begin
                rd_down_counter  <= S6_ARLEN_R + 4'd1                                               ;
                end

            else if(((present_state_rd == 2'd1)||(present_state_rd==2'd2)||(present_state_rd==2'd3)) && (S0_PREADY || S1_PREADY || S2_PREADY || S3_PREADY)) 
                begin
                rd_down_counter  <= rd_down_counter - 1'b1                                        ;
                end

            else 
                begin
                rd_down_counter  <= rd_down_counter                                               ;
                end

            end

            //--------------------WRAP BOUNDRY CALCULATION-------------------------------------
              assign S3_addr_rd = (NO_OF_BYTES * (S3_ARLEN+1'b1))                                 ;
              assign S4_addr_rd = (NO_OF_BYTES * (S4_ARLEN+1'b1))                                 ;
              assign S5_addr_rd = (NO_OF_BYTES * (S5_ARLEN+1'b1))                                 ;
              assign S6_addr_rd = (NO_OF_BYTES * (S6_ARLEN+1'b1))                                 ;

            assign S3_wrap_bndry_rd = (S3_ARVALID && (S3_ARBURST == 2'd2)) ? ((S3_ARADDR/S3_addr_rd)*S3_addr_rd) : S3_wrap_bndry_w ;
            assign S4_wrap_bndry_rd = (S4_ARVALID && (S4_ARBURST == 2'd2)) ? ((S4_ARADDR/S4_addr_rd)*S4_addr_rd) : S4_wrap_bndry_w ;
            assign S5_wrap_bndry_rd = (S5_ARVALID && (S5_ARBURST == 2'd2)) ? ((S5_ARADDR/S5_addr_rd)*S5_addr_rd) : S5_wrap_bndry_w ;
            assign S6_wrap_bndry_rd = (S6_ARVALID && (S6_ARBURST == 2'd2)) ? ((S6_ARADDR/S6_addr_rd)*S6_addr_rd) : S6_wrap_bndry_w ;

            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                S3_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                S4_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                S5_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                S6_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                end
            else if(axi_apb_sw_rst)
                begin
                S3_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                S4_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                S5_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                S6_wrap_bndry_w <= {WIDTH_AD{1'b0}}      ;
                end
            else
                begin
                S3_wrap_bndry_w <= S3_wrap_bndry_rd        ;                
                S4_wrap_bndry_w <= S4_wrap_bndry_rd        ;
                S5_wrap_bndry_w <= S5_wrap_bndry_rd        ;
                S6_wrap_bndry_w <= S6_wrap_bndry_rd        ;
                end

            end
            //---------------------------------------------------------------------------------

            //-----------------------ADDRESS_N CALCULATION-------------------------------------
            assign S3_addr_n_rd = (S3_ARVALID && S3_ARBURST == 2'd2) ? (S3_wrap_bndry_rd + (NO_OF_BYTES*(S3_ARLEN+1'b1))) : S3_addr_n_w  ;
            assign S4_addr_n_rd = (S4_ARVALID && S4_ARBURST == 2'd2) ? (S4_wrap_bndry_rd + (NO_OF_BYTES*(S4_ARLEN+1'b1))) : S4_addr_n_w  ;
            assign S5_addr_n_rd = (S5_ARVALID && S5_ARBURST == 2'd2) ? (S5_wrap_bndry_rd + (NO_OF_BYTES*(S5_ARLEN+1'b1))) : S5_addr_n_w  ;
            assign S6_addr_n_rd = (S6_ARVALID && S6_ARBURST == 2'd2) ? (S6_wrap_bndry_rd + (NO_OF_BYTES*(S6_ARLEN+1'b1))) : S6_addr_n_w  ;
 
            always_ff@(posedge axi_apb_clk or negedge axi_apb_rstn)
            begin

            if(!axi_apb_rstn)
                begin
                S3_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                S4_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                S5_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                S6_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                end
            else if(axi_apb_sw_rst)
                begin
                S3_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                S4_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                S5_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                S6_addr_n_w <= {WIDTH_AD{1'b0}}      ;
                end
            else
                begin
                S3_addr_n_w <= S3_addr_n_rd            ;                
                S4_addr_n_w <= S4_addr_n_rd            ;                
                S5_addr_n_w <= S5_addr_n_rd            ;                
                S6_addr_n_w <= S6_addr_n_rd            ;                
                end

            end

       
//assign val = ((wr_down_counter == (S3_AWLEN_R + 1'b1)) && (present_state == 3'd1)) ;
            
endmodule
