module NOC_arbiter;

    //uvm package
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    // tb package
    import pkg::*;

    //global signals
     bit ACLK;        
     bit ARESETn;
     bit ASW_RESET;
    

     // interface instantiation   
     M0_inf M0_intf (ACLK,ARESETn,ASW_RESET);
     M1_inf M1_intf (ACLK,ARESETn,ASW_RESET);
    
     S0_inf S0_intf (ACLK,ARESETn,ASW_RESET);
     S1_inf S1_intf (ACLK,ARESETn,ASW_RESET);
    
     S2_inf S2_intf (ACLK,ARESETn,ASW_RESET);
     S3_inf S3_intf (ACLK,ARESETn,ASW_RESET);
     S4_inf S4_intf (ACLK,ARESETn,ASW_RESET);
     S5_inf S5_intf (ACLK,ARESETn,ASW_RESET);    


//module instantiation   
     noc_arbiter dut (
       
       .ACLK     (ACLK)       ,
       .ARESETn  (ARESETn)    ,
       .ASW_RESET (ASW_RESET) ,
    
       // signals from axi4 master1 signals
    
       // write signals
       .M0_MID          (M0_intf.M0_MID    )       ,
       .M0_BID          (M0_intf.M0_BID    )       ,
       .M0_AWID         (M0_intf.M0_AWID   )       ,
       .M0_WID          (M0_intf.M0_WID    )       ,
       .M0_ARID         (M0_intf.M0_ARID   )       ,
       .M0_RID          (M0_intf.M0_RID    )       ,
       .M0_ARSIZE       (M0_intf.M0_ARSIZE )       ,
       .M0_AWSIZE       (M0_intf.M0_AWSIZE )       ,
         
       .M0_AWVALID      (M0_intf.M0_AWVALID)       ,
       .M0_AWADDR       (M0_intf.M0_AWADDR )       ,          
       .M0_AWLEN        (M0_intf.M0_AWLEN  )       , 
       .M0_AWBURST      (M0_intf.M0_AWBURST)       ,
    
       .M0_WVALID       (M0_intf.M0_WVALID )       ,
       .M0_WDATA        (M0_intf.M0_WDATA  )       ,
       .M0_WLAST        (M0_intf.M0_WLAST  )       ,
       .M0_WSTRB        (M0_intf.M0_WSTRB  )       ,
       .M0_BREADY       (M0_intf.M0_BREADY )       ,
    
       //read signals
    
       .M0_ARVALID      (M0_intf.M0_ARVALID)       ,
       .M0_ARADDR       (M0_intf.M0_ARADDR )       ,
       .M0_ARLEN        (M0_intf.M0_ARLEN  )       ,
       .M0_ARBURST      (M0_intf.M0_ARBURST)       ,
    
       .M0_RREADY       (M0_intf.M0_RREADY )       ,
    
       // master1 output signals
       .M0_AWREADY      (M0_intf.M0_AWREADY)       ,
       .M0_WREADY       (M0_intf.M0_WREADY )       ,  
       .M0_BVALID       (M0_intf.M0_BVALID )       ,
       .M0_BRESP        (M0_intf.M0_BRESP  )       ,
    
       .M0_ARREADY      (M0_intf.M0_ARREADY)       ,
       .M0_RVALID       (M0_intf.M0_RVALID)        ,
       .M0_RDATA        (M0_intf.M0_RDATA  )       ,
       .M0_RRESP        (M0_intf.M0_RRESP  )       ,
       .M0_RLAST        (M0_intf.M0_RLAST  )       ,
    
    
       // signals from axi4 master2 signals
    
       // write signals
       .M1_MID          (M1_intf.M1_MID   )       ,
       .M1_AWID         (M1_intf.M1_AWID  )       ,
       .M1_WID          (M1_intf.M1_WID   )       ,
       .M1_ARID         (M1_intf.M1_ARID  )       ,
         
       //  .M1_AWPROT   (M1_intf.M1_AWPROT)       ,
       //  .M1_ARPROT   (M1_intf.M1_ARPROT)       ,
    
    
       .M1_AWSIZE      (M1_intf.M1_AWSIZE)       ,
       .M1_ARSIZE      (M1_intf.M1_ARSIZE)       ,
         
       .M1_AWVALID      (M1_intf.M1_AWVALID)     ,
       .M1_AWADDR       (M1_intf.M1_AWADDR )     ,          
       .M1_AWLEN        (M1_intf.M1_AWLEN  )     , 
       .M1_AWBURST      (M1_intf.M1_AWBURST)     ,
  
       .M1_WVALID       (M1_intf.M1_WVALID )     ,
       .M1_WDATA        (M1_intf.M1_WDATA  )     ,
       .M1_WLAST        (M1_intf.M1_WLAST  )     ,
       .M1_WSTRB        (M1_intf.M1_WSTRB  )     ,
       .M1_BREADY       (M1_intf.M1_BREADY )     ,
    
       //read signals
    
       .M1_ARVALID      (M1_intf.M1_ARVALID)       ,
       .M1_ARADDR       (M1_intf.M1_ARADDR )       ,
       .M1_ARLEN        (M1_intf.M1_ARLEN  )       ,
       .M1_ARBURST      (M1_intf.M1_ARBURST)       ,
    
       .M1_RREADY       (M1_intf.M1_RREADY )       ,
    
        // master 2 output signals
       .M1_AWREADY      (M1_intf.M1_AWREADY)       ,
       .M1_WREADY       (M1_intf.M1_WREADY )       ,  
       .M1_BVALID       (M1_intf.M1_BVALID )       ,
       .M1_BRESP        (M1_intf.M1_BRESP  )       ,
    
       .M1_ARREADY      (M1_intf.M1_ARREADY)       ,
       .M1_RVALID       (M1_intf.M1_RVALID)        ,
       // .M1_RVALID_O     (M1_intf.M1_RVALID_O)   ,
       .M1_RDATA        (M1_intf.M1_RDATA  )       ,
       .M1_RRESP        (M1_intf.M1_RRESP  )       ,
       .M1_RLAST        (M1_intf.M1_RLAST  )       ,
    
       // axi4 slave0 signals                  
       .S0_BID      (S0_intf.S0_BID)   ,  
       .S0_RID      (S0_intf.S0_RID)   ,  
             
       .S0_AWREADY      (S0_intf.S0_AWREADY)   ,  
       .S0_WREADY       (S0_intf.S0_WREADY )   , 
       .S0_BRESP        (S0_intf.S0_BRESP  )   , 
       .S0_BVALID       (S0_intf.S0_BVALID )   ,
    
       .S0_ARREADY      (S0_intf.S0_ARREADY)   , 
       .S0_RDATA        (S0_intf.S0_RDATA  )   ,
     
       .S0_RRESP        (S0_intf.S0_RRESP  )   ,
       .S0_RVALID       (S0_intf.S0_RVALID )   ,
       .S0_RLAST        (S0_intf.S0_RLAST  )   ,
       .S0_RREADY       (S0_intf.S0_RREADY )   ,
       .S0_AWVALID      (S0_intf.s0_awvalid)   ,
       .S0_WVALID       (S0_intf.s0_wvalid )   ,
       .S0_BREADY       (S0_intf.s0_bready )   ,
       .S0_AWLEN        (S0_intf.s0_awlen  )   ,
      
       .S0_ARLEN       (S0_intf.s0_arlen )     ,
       .S0_ARVALID     (S0_intf.s0_arvalid)    ,
       
       .S0_AWADDR      (S0_intf.S0_AWADDR)    ,
       .S0_AWSIZE      (S0_intf.S0_AWSIZE)    ,
       .S0_AWBURST     (S0_intf.S0_AWBURST)   ,
       .S0_WDATA       (S0_intf.S0_WDATA)     ,
       .S0_WSTRB       (S0_intf.S0_WSTRB)     ,
       .S0_WLAST       (S0_intf.S0_WLAST)     ,
       .S0_ARADDR      (S0_intf.S0_ARADDR)    ,
       .S0_ARBURST     (S0_intf.S0_ARBURST)   ,
       .S0_ARSIZE      (S0_intf.S0_ARSIZE)    ,
   
       // axi4 slave1 signals
       .S1_BID      (S1_intf.S1_BID)   ,  
       .S1_RID      (S1_intf.S1_RID)   ,  
                  
       .S1_AWREADY      (S1_intf.S1_AWREADY)   ,  
       .S1_WREADY       (S1_intf.S1_WREADY )   , 
       .S1_BRESP        (S1_intf.S1_BRESP  )   , 
       .S1_BVALID       (S1_intf.S1_BVALID )   ,
    
       .S1_ARREADY      (S1_intf.S1_ARREADY)   , 
       .S1_RDATA        (S1_intf.S1_RDATA  )   ,
       
       .S1_RRESP        (S1_intf.S1_RRESP  )   ,
       .S1_RVALID       (S1_intf.S1_RVALID )   ,
       .S1_RLAST        (S1_intf.S1_RLAST  )   ,
       .S1_RREADY       (S1_intf.S1_RREADY )   ,
    
       .S1_AWVALID      (S1_intf.S1_awvalid)   ,
       .S1_WVALID       (S1_intf.S1_wvalid )   ,
       .S1_BREADY       (S1_intf.S1_bready )   ,
       .S1_AWLEN        (S1_intf.S1_awlen  )   ,
      
       .S1_ARLEN        (S1_intf.S1_arlen  )   ,
       .S1_ARVALID      (S1_intf.S1_arvalid)   ,
    
       .S1_AWADDR       (S1_intf.S1_AWADDR )   ,
       .S1_AWSIZE       (S1_intf.S1_AWSIZE )   ,
       .S1_AWBURST      (S1_intf.S1_AWBURST)   ,
       .S1_WDATA        (S1_intf.S1_WDATA  )   ,
       .S1_WSTRB        (S1_intf.S1_WSTRB  )   ,
       .S1_WLAST        (S1_intf.S1_WLAST  )   ,
       .S1_ARADDR       (S1_intf.S1_ARADDR )   ,
       
       .S1_ARBURST      (S1_intf.S1_ARBURST)   ,
       .S1_ARSIZE       (S1_intf.S1_ARSIZE )   ,
        
    
    
       // apb slave2 signals
       .S2_PRDATA       (S2_intf.S2_PRDATA )    ,
       .S2_PREADY       (S2_intf.S2_PREADY )    ,
       .S2_PSLVERR      (S2_intf.S2_PSLVERR)    ,
           
       .S2_PENABLE     (S2_intf.S2_PENABLE)    ,
       .S2_PSEL        (S2_intf.S2_PSEL   )    ,
       .S2_PWRITE      (S2_intf.S2_PWRITE )    ,
       .S2_PADDR       (S2_intf.S2_PADDR  )    ,
       .S2_PDATA       (S2_intf.S2_PDATA  )    ,
       .S2_PSTRB       (S2_intf.S2_PSTRB  )    ,
        
       // apb slave3 signals
       .S3_PRDATA       (S3_intf.S3_PRDATA )    ,
       .S3_PREADY       (S3_intf.S3_PREADY )    ,
       .S3_PSLVERR      (S3_intf.S3_PSLVERR)    ,
            
       .S3_PENABLE     (S3_intf.S3_PENABLE)    ,
       .S3_PSEL        (S3_intf.S3_PSEL   )    ,
       .S3_PWRITE      (S3_intf.S3_PWRITE )    ,
       .S3_PADDR       (S3_intf.S3_PADDR  )    ,
       .S3_PDATA       (S3_intf.S3_PDATA  )    ,
       .S3_PSTRB       (S3_intf.S3_PSTRB  )    ,
    
    
       // apb slave4 signals
       .S4_PRDATA       (S4_intf.S4_PRDATA )    ,
       .S4_PREADY       (S4_intf.S4_PREADY )    ,
       .S4_PSLVERR      (S4_intf.S4_PSLVERR)    ,       
    
       .S4_PENABLE     (S4_intf.S4_PENABLE)    ,
       .S4_PSEL        (S4_intf.S4_PSEL   )    ,
       .S4_PWRITE      (S4_intf.S4_PWRITE )    ,
       .S4_PADDR       (S4_intf.S4_PADDR  )    ,
       .S4_PDATA       (S4_intf.S4_PDATA  )    ,
       .S4_PSTRB       (S4_intf.S4_PSTRB  )    ,
    
       // apb slave5 signals
       .S5_PRDATA       (S5_intf.S5_PRDATA )    ,
       .S5_PREADY       (S5_intf.S5_PREADY )    ,
       .S5_PSLVERR      (S5_intf.S5_PSLVERR)    ,
       
       .S5_PENABLE     (S5_intf.S5_PENABLE)    ,
       .S5_PSEL        (S5_intf.S5_PSEL   )    ,
       .S5_PWRITE      (S5_intf.S5_PWRITE )    ,
       .S5_PADDR       (S5_intf.S5_PADDR  )    ,
       .S5_PDATA       (S5_intf.S5_PDATA  )    ,
       .S5_PSTRB       (S5_intf.S5_PSTRB  )    
            
                                             );
    
       initial begin
     
           M0_intf.M0_MID          = 0     ;
           M0_intf.M0_AWID         = 0     ;
           M0_intf.M0_AWADDR       = 0     ;
           M0_intf.M0_AWLEN        = 0     ;
           M0_intf.M0_AWSIZE       = 0     ;
           M0_intf.M0_AWBURST      = 0     ;
           M0_intf.M0_AWVALID      = 0     ;
             
           M0_intf.M0_WID          = 0     ;
           M0_intf.M0_WDATA        = 0     ;
           M0_intf.M0_WSTRB        = 0     ;
           M0_intf.M0_WLAST        = 0     ;
           M0_intf.M0_WVALID       = 0     ;
           
           M0_intf.M0_BREADY       = 0     ;
           M0_intf.M0_ARID         = 0     ;
           M0_intf.M0_ARADDR       = 0     ;
           M0_intf.M0_ARLEN        = 0     ;
           M0_intf.M0_ARSIZE       = 0     ;
           M0_intf.M0_ARBURST      = 0     ;
           M0_intf.M0_ARVALID      = 0     ;
           
          // M0_intf.M0_RID         = 0      ;
           M0_intf.M0_RREADY       = 0     ;
           
           
           M1_intf.M1_MID          = 0     ;
           M1_intf.M1_AWID         = 0     ;
           M1_intf.M1_AWADDR       = 0     ;
           M1_intf.M1_AWLEN        = 0     ;
           M1_intf.M1_AWSIZE       = 0     ;
           M1_intf.M1_AWBURST      = 0     ;
           M1_intf.M1_AWVALID      = 0     ;
             
           M1_intf.M1_WID          = 0     ;
           M1_intf.M1_WDATA        = 0     ;
           M1_intf.M1_WSTRB        = 0     ;
           M1_intf.M1_WLAST        = 0     ;
           M1_intf.M1_WVALID       = 0     ;
           
           M1_intf.M1_BREADY       = 0     ;
           M1_intf.M1_ARID         = 0     ;
           M1_intf.M1_ARADDR       = 0     ;
           M1_intf.M1_ARLEN        = 0     ;
           M1_intf.M1_ARSIZE       = 0     ;
           M1_intf.M1_ARBURST      = 0     ;
           M1_intf.M1_ARVALID      = 0     ;
           
           //M1_intf.M1_RID         = 0     ;
           M1_intf.M1_RREADY       = 0     ;
           
           S0_intf.S0_AWREADY      = 0     ;   
           S0_intf.S0_WREADY       = 0     ;   
           S0_intf.S0_BRESP        = 0     ;   
           S0_intf.S0_BVALID       = 0     ;   
           S0_intf.S0_ARREADY      = 0     ;   
           S0_intf.S0_RDATA        = 0     ;   
           S0_intf.S0_RRESP        = 0     ;   
           S0_intf.S0_RVALID       = 0     ;   
           S0_intf.S0_RLAST        = 0     ;   
           //S0_intf.S0_RREADY     = 0     ; 
           S0_intf.S0_BID          = 0     ;   
           S0_intf.S0_RID          = 0     ;   
           
           S1_intf.S1_AWREADY      = 0     ;   
           S1_intf.S1_WREADY       = 0     ;   
           S1_intf.S1_BRESP        = 0     ;   
           S1_intf.S1_BVALID       = 0     ;   
           S1_intf.S1_ARREADY      = 0     ;   
           S1_intf.S1_RDATA        = 0     ;   
           S1_intf.S1_RRESP        = 0     ;   
           S1_intf.S1_RVALID       = 0     ;   
           S1_intf.S1_RLAST        = 0     ;   
           //S1_intf.S1_RREADY     = 0     ; 
           S1_intf.S1_BID          = 0     ;   
           S1_intf.S1_RID          = 0     ;   
           
           S2_intf.S2_PRDATA  = 0     ;
           S2_intf.S2_PREADY  = 0     ;
           S2_intf.S2_PSLVERR = 0     ;
           
           S3_intf.S3_PRDATA  = 0     ;
           S3_intf.S3_PREADY  = 0     ;
           S3_intf.S3_PSLVERR = 0     ;
           
           S4_intf.S4_PRDATA  = 0     ;
           S4_intf.S4_PREADY  = 0     ;
           S4_intf.S4_PSLVERR = 0     ;
           
           S5_intf.S5_PRDATA  = 0     ;
           S5_intf.S5_PREADY  = 0     ;
           S5_intf.S5_PSLVERR = 0     ;
           
           #5;
            M1_intf.M1_MID    = 4'h1  ;
           
    end

    initial begin 
        ACLK = 0;
        forever #5 ACLK = ~ACLK;
    end
    initial begin 
    
        ARESETn = 0;
        ASW_RESET = 0;
    
        #10;
        ARESETn = 1;
        ASW_RESET =0;
    
        #10;
        ARESETn = 0;
        ASW_RESET = 1;
             
        #10;  
        ARESETn = 1;
        ASW_RESET = 0; 

	#10;  
        ARESETn = 1;
        ASW_RESET = 0; 
             
       end 

     //config db set method for interface
     initial begin            
         uvm_config_db#(virtual M0_inf)::set(null,"*","M0_inf",M0_intf);
         uvm_config_db#(virtual M1_inf)::set(null,"*","M1_inf",M1_intf);
    
    
         uvm_config_db#(virtual S0_inf)::set(null,"*","S0_inf",S0_intf);
         uvm_config_db#(virtual S1_inf)::set(null,"*","S1_inf",S1_intf);
         uvm_config_db#(virtual S2_inf)::set(null,"*","S2_inf",S2_intf);
         uvm_config_db#(virtual S3_inf)::set(null,"*","S3_inf",S3_intf);
         uvm_config_db#(virtual S4_inf)::set(null,"*","S4_inf",S4_intf);
         uvm_config_db#(virtual S5_inf)::set(null,"*","S5_inf",S5_intf);
    
     end
       
    
    initial begin
   //     ACLK = 0;
    uvm_top.set_report_verbosity_level(UVM_HIGH); 
    //run test
    run_test ("test");
    
   //    #5000000 
   //    $finish;
       
     end
     //wavedump
     initial begin
         $shm_open("waves.shm");
         $shm_probe("ACTMF");
     end

endmodule
