module tb();
localparam  WIDTH_AD = 32 , WIDTH_DA = 32 ;
logic                      axi_apb_clk      ;
logic                      axi_apb_rstn     ;
logic                      axi_apb_sw_rst   ;
                                            
logic                      S3_AWVALID       ;
logic   [WIDTH_AD-1:0]     S3_AWADDR        ;
logic   [ 3:0]             S3_AWLEN         ;
logic   [ 2:0]             S3_AWSIZE        ;
logic   [ 1:0]             S3_AWBURST       ;
logic   [ 2:0]             S3_AWPROT        ;
logic                      S3_AWREADY       ;
                                            
logic                      S3_WVALID        ;
logic   [WIDTH_DA-1:0]     S3_WDATA         ;
logic   [3:0]              S3_WSTRB         ;
logic                      S3_WLAST         ;
logic                      S3_WREADY        ;
                                            
logic                      S3_BVALID        ;
logic   [ 1:0]             S3_BRESP         ;
logic                      S3_BREADY        ;
                                            
logic                      S3_ARVALID       ;
logic   [WIDTH_AD-1:0]     S3_ARADDR        ;
logic   [ 3:0]             S3_ARLEN         ;
logic   [ 2:0]             S3_ARSIZE        ;
logic   [ 1:0]             S3_ARBURST       ;
logic                      S3_ARREADY       ;
                                            
logic                      S3_RVALID        ;
logic   [WIDTH_DA-1:0]     S3_RDATA         ;
logic   [ 1:0]             S3_RRESP         ;
logic                      S3_RLAST         ;
logic                      S3_RREADY        ;
                                            
logic                      S4_AWVALID       ;
logic   [WIDTH_AD-1:0]     S4_AWADDR        ;
logic   [ 3:0]             S4_AWLEN         ;
logic   [ 2:0]             S4_AWSIZE        ;
logic   [ 1:0]             S4_AWBURST       ;
logic   [ 2:0]             S4_AWPROT        ;
logic                      S4_AWREADY       ;
                                            
logic                      S4_WVALID        ;
logic   [WIDTH_DA-1:0]     S4_WDATA         ;
logic   [3:0]              S4_WSTRB         ;
logic                      S4_WLAST         ;
logic                      S4_WREADY        ;
                                            
logic                      S4_BVALID        ;
logic   [ 1:0]             S4_BRESP         ;
logic                      S4_BREADY        ;
                                            
logic                      S4_ARVALID       ;
logic   [WIDTH_AD-1:0]     S4_ARADDR        ;
logic   [ 3:0]             S4_ARLEN         ;
logic   [ 2:0]             S4_ARSIZE        ;
logic   [ 1:0]             S4_ARBURST       ;
logic                      S4_ARREADY       ;
                                            
logic                      S4_RVALID        ;
logic   [WIDTH_DA-1:0]     S4_RDATA         ;
logic   [ 1:0]             S4_RRESP         ;
logic                      S4_RLAST         ;
logic                      S4_RREADY        ;
                                            
logic                      S5_AWVALID       ;
logic   [WIDTH_AD-1:0]     S5_AWADDR        ;
logic   [ 3:0]             S5_AWLEN         ;
logic   [ 2:0]             S5_AWSIZE        ;
logic   [ 1:0]             S5_AWBURST       ;
logic   [ 2:0]             S5_AWPROT        ;
logic                      S5_AWREADY       ;
                                            
logic                      S5_WVALID        ;
logic   [WIDTH_DA-1:0]     S5_WDATA         ;
logic   [3:0]              S5_WSTRB         ;
logic                      S5_WLAST         ;
logic                      S5_WREADY        ;
                                            
logic                      S5_BVALID        ;
logic   [ 1:0]             S5_BRESP         ;
logic                      S5_BREADY        ;
                                            
logic                      S5_ARVALID       ;
logic   [WIDTH_AD-1:0]     S5_ARADDR        ;
logic   [ 3:0]             S5_ARLEN         ;
logic   [ 2:0]             S5_ARSIZE        ;
logic   [ 1:0]             S5_ARBURST       ;
logic                      S5_ARREADY       ;
                                            
logic                      S5_RVALID        ;
logic   [WIDTH_DA-1:0]     S5_RDATA         ;
logic   [ 1:0]             S5_RRESP         ;
logic                      S5_RLAST         ;
logic                      S5_RREADY        ;
                                            
logic                      S6_AWVALID       ;
logic   [WIDTH_AD-1:0]     S6_AWADDR        ;
logic   [ 3:0]             S6_AWLEN         ;
logic   [ 2:0]             S6_AWSIZE        ;
logic   [ 1:0]             S6_AWBURST       ;
logic   [ 2:0]             S6_AWPROT        ;
logic                      S6_AWREADY       ;
                                            
logic                      S6_WVALID        ;
logic   [WIDTH_DA-1:0]     S6_WDATA         ;
logic   [3:0]              S6_WSTRB         ;
logic                      S6_WLAST         ;
logic                      S6_WREADY        ;
                                            
logic                      S6_BVALID        ;
logic   [ 1:0]             S6_BRESP         ;
logic                      S6_BREADY        ;
                                            
logic                      S6_ARVALID       ;
logic   [WIDTH_AD-1:0]     S6_ARADDR        ;
logic   [ 3:0]             S6_ARLEN         ;
logic   [ 2:0]             S6_ARSIZE        ;
logic   [ 1:0]             S6_ARBURST       ;
logic                      S6_ARREADY       ;
                                            
logic                      S6_RVALID        ;
logic   [WIDTH_DA-1:0]     S6_RDATA         ;
logic   [ 1:0]             S6_RRESP         ;
logic                      S6_RLAST         ;
logic                      S6_RREADY        ;
                                            
logic   [WIDTH_AD-1:0]     S0_PADDR         ;
logic   [WIDTH_DA-1:0]     S0_PDATA         ;
logic                      S0_PWRITE        ;
logic                      S0_PENABLE       ;
logic                      S0_PSEL          ;
logic   [3:0]              S0_PSTRB         ;
logic                      S0_PREADY        ;
logic   [WIDTH_DA-1:0]     S0_PRDATA        ;
logic                      S0_PSLVERR       ;
                                            
logic   [WIDTH_AD-1:0]     S1_PADDR         ;
logic   [WIDTH_DA-1:0]     S1_PDATA         ;
logic                      S1_PWRITE        ;
logic                      S1_PENABLE       ;
logic                      S1_PSEL          ;
logic   [3:0]              S1_PSTRB         ;
logic                      S1_PREADY        ;
logic   [WIDTH_DA-1:0]     S1_PRDATA        ;
logic                      S1_PSLVERR       ;
                                            
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

axi_apb_bridge
uut           (.*);

initial
begin
axi_apb_clk      = 0    ;
axi_apb_rstn     = 0    ;
axi_apb_sw_rst   = 0    ;
S3_AWVALID       = 0    ;
S3_AWADDR        = 0    ;
S3_AWLEN         = 0    ;
S3_AWSIZE        = 0    ;
S3_AWBURST       = 0    ;
S3_AWPROT        = 0    ;
S3_AWREADY       = 0    ;
S3_WVALID        = 0    ;
S3_WDATA         = 0    ;
S3_WSTRB         = 0    ;
S3_WLAST         = 0    ;
S3_WREADY        = 0    ;
S3_BVALID        = 0    ;
S3_BRESP         = 0    ;
S3_BREADY        = 0    ;
S3_ARVALID       = 0    ;
S3_ARADDR        = 0    ;
S3_ARLEN         = 0    ;
S3_ARSIZE        = 0    ;
S3_ARBURST       = 0    ;
S3_ARREADY       = 0    ;
S3_RVALID        = 0    ;
S3_RDATA         = 0    ;
S3_RRESP         = 0    ;
S3_RLAST         = 0    ;
S3_RREADY        = 0    ;
S4_AWVALID       = 0    ;
S4_AWADDR        = 0    ;
S4_AWLEN         = 0    ;
S4_AWSIZE        = 0    ;
S4_AWBURST       = 0    ;
S4_AWPROT        = 0    ;
S4_AWREADY       = 0    ;
S4_WVALID        = 0    ;
S4_WDATA         = 0    ;
S4_WSTRB         = 0    ;
S4_WLAST         = 0    ;
S4_WREADY        = 0    ;
S4_BVALID        = 0    ;
S4_BRESP         = 0    ;
S4_BREADY        = 0    ;
S4_ARVALID       = 0    ;
S4_ARADDR        = 0    ;
S4_ARLEN         = 0    ;
S4_ARSIZE        = 0    ;
S4_ARBURST       = 0    ;
S4_ARREADY       = 0    ;
S4_RVALID        = 0    ;
S4_RDATA         = 0    ;
S4_RRESP         = 0    ;
S4_RLAST         = 0    ;
S4_RREADY        = 0    ;
S5_AWVALID       = 0    ;
S5_AWADDR        = 0    ;
S5_AWLEN         = 0    ;
S5_AWSIZE        = 0    ;
S5_AWBURST       = 0    ;
S5_AWPROT        = 0    ;
S5_AWREADY       = 0    ;
S5_WVALID        = 0    ;
S5_WDATA         = 0    ;
S5_WSTRB         = 0    ;
S5_WLAST         = 0    ;
S5_WREADY        = 0    ;
S5_BVALID        = 0    ;
S5_BRESP         = 0    ;
S5_BREADY        = 0    ;
S5_ARVALID       = 0    ;
S5_ARADDR        = 0    ;
S5_ARLEN         = 0    ;
S5_ARSIZE        = 0    ;
S5_ARBURST       = 0    ;
S5_ARREADY       = 0    ;
S5_RVALID        = 0    ;
S5_RDATA         = 0    ;
S5_RRESP         = 0    ;
S5_RLAST         = 0    ;
S5_RREADY        = 0    ;
S6_AWVALID       = 0    ;
S6_AWADDR        = 0    ;
S6_AWLEN         = 0    ;
S6_AWSIZE        = 0    ;
S6_AWBURST       = 0    ;
S6_AWPROT        = 0    ;
S6_AWREADY       = 0    ;
S6_WVALID        = 0    ;
S6_WDATA         = 0    ;
S6_WSTRB         = 0    ;
S6_WLAST         = 0    ;
S6_WREADY        = 0    ;
S6_BVALID        = 0    ;
S6_BRESP         = 0    ;
S6_BREADY        = 0    ;
S6_ARVALID       = 0    ;
S6_ARADDR        = 0    ;
S6_ARLEN         = 0    ;
S6_ARSIZE        = 0    ;
S6_ARBURST       = 0    ;
S6_ARREADY       = 0    ;
S6_RVALID        = 0    ;
S6_RDATA         = 0    ;
S6_RRESP         = 0    ;
S6_RLAST         = 0    ;
S6_RREADY        = 0    ;
S0_PADDR         = 0    ;
S0_PDATA         = 0    ;
S0_PWRITE        = 0    ;
S0_PENABLE       = 0    ;
S0_PSEL          = 0    ;
S0_PSTRB         = 0    ;
S0_PREADY        = 0    ;
S0_PRDATA        = 0    ;
S0_PSLVERR       = 0    ;
S1_PADDR         = 0    ;
S1_PDATA         = 0    ;
S1_PWRITE        = 0    ;
S1_PENABLE       = 0    ;
S1_PSEL          = 0    ;
S1_PSTRB         = 0    ;
S1_PREADY        = 0    ;
S1_PRDATA        = 0    ;
S1_PSLVERR       = 0    ;
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
end

always #5 axi_apb_clk = ~axi_apb_clk    ;

/*
initial
begin
#10;
axi_apb_sw_rst = 1'b1   ;
axi_apb_rstn = 1'b1     ;
#10;

//axi_apb_sw_rst = 1'b0   ;
#10;
S3_ARVALID       = 1'b1      ;
S3_ARADDR        = 32'd10    ;
S3_ARLEN         = 4'd3      ;
S3_ARBURST       = 2'd1      ;
#15;
S3_ARVALID       = 1'b0      ;
S3_ARADDR        = 32'd0     ;

S3_ARLEN         = 4'd0      ;
S3_ARBURST       = 2'd0      ;

//S3_WVALID        = 1'b1      ;
//S3_WDATA         = $random   ;
#10;
//S3_WVALID        = 1'b0      ;
//S3_WDATA         = 0         ;

//S0_PREADY        = 1'B1      ;
//S3_BREADY        = 1'b1      ;
#10;
S0_PREADY        = 1'B1      ;
S3_BREADY        = 1'b0      ;
#10;

S0_PREADY        = 1'B0      ;
#10;
S0_PREADY        = 1'B1      ;
#10;
S0_PREADY        = 1'B0      ;

#100;
$finish();
end
*/

/*
initial
begin
#10;
axi_apb_sw_rst = 1'b1   ;
axi_apb_rstn = 1'b1     ;
#10;
axi_apb_sw_rst = 1'b0   ;
#10;
S3_AWVALID       = 1'b1      ;
S3_AWADDR        = 32'd4     ;
S3_AWLEN         = 4'd3      ;
S3_AWBURST       = 2'd2      ;
#15;
S3_AWVALID       = 1'b0      ;
S3_AWADDR        = 32'd0     ;

S3_AWLEN         = 4'd0      ;
S3_AWBURST       = 2'd0      ;

S3_WVALID        = 1'b1      ;
S3_WDATA         = $random   ;
#10;
S3_WVALID        = 1'b0      ;
S3_WDATA         = 0         ;

//S0_PREADY        = 1'B1      ;
//S3_BREADY        = 1'b1      ;
#10;
S0_PREADY        = 1'B1      ;
//S3_BREADY        = 1'b1      ;
#10;

S0_PREADY        = 1'B0      ;
#10;
S0_PREADY        = 1'B1      ;
//S3_BREADY        = 1'b1      ;
#10;
S0_PREADY        = 1'B0      ;
//S3_BREADY        = 1'b1      ;
#10;
S0_PREADY        = 1'B1      ;
S3_BREADY        = 1'b1      ;
#10;
S0_PREADY        = 1'B0      ;
S3_BREADY        = 1'b0      ;

#100;
$finish();
end
*/

initial
begin
axi_apb_rstn = 1'b0     ;
#1000;
$finish();
end

initial
begin
$shm_open("wave.shm")   ;
$shm_probe("ACTMF")     ;
end

endmodule
