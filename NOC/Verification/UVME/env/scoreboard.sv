
`uvm_analysis_imp_decl (_m1)
`uvm_analysis_imp_decl (_m2)
`uvm_analysis_imp_decl (_s0)
`uvm_analysis_imp_decl (_s1)
`uvm_analysis_imp_decl (_s2)
`uvm_analysis_imp_decl (_s3)
`uvm_analysis_imp_decl (_s4)
`uvm_analysis_imp_decl (_s5)


class scoreboard extends uvm_scoreboard;
    //factory regestration
    `uvm_component_utils(scoreboard)
    
    //uvm_analysis imports
    uvm_analysis_imp_m1 #(M0_seq_item,scoreboard) M0_ap;
    uvm_analysis_imp_m2 #(M1_seq_item,scoreboard) M1_ap;
    uvm_analysis_imp_s0 #(S0_seq_item,scoreboard) S0_ap;
    uvm_analysis_imp_s1 #(S1_seq_item,scoreboard) S1_ap;
    uvm_analysis_imp_s2 #(S2_seq_item,scoreboard) S2_ap;
    uvm_analysis_imp_s3 #(S3_seq_item,scoreboard) S3_ap;
    uvm_analysis_imp_s4 #(S4_seq_item,scoreboard) S4_ap;
    uvm_analysis_imp_s5 #(S5_seq_item,scoreboard) S5_ap;
    
    //queues
    M0_seq_item   M0_seq_q[$],M0_seq_q2[$];    
    M1_seq_item   M1_seq_q[$],M1_seq_q2[$];   
    S0_seq_item s0_seq_q[$],s0_seq_q2[$];   
    S1_seq_item s1_seq_q[$],s1_seq_q2[$];
    S2_seq_item s2_seq_q[$];
    S3_seq_item s3_seq_q[$];
    S4_seq_item s4_seq_q[$];
    S5_seq_item s5_seq_q[$];

    logic m1_matched = 0;
    logic m2_matched = 0;
    bit enable_compare = 1;
  
    //default constructor
    function new(string name="scoreboard",uvm_component parent );
        super.new(name,parent);
        //new mwthod for ports
        M0_ap = new("M0_ap",this);
        M1_ap = new("M1_ap",this);    
        S0_ap = new("S0_ap",this);
        S1_ap = new("S1_ap",this);
        S2_ap = new("S2_ap",this);
        S3_ap = new("S3_ap",this);
        S4_ap = new("S4_ap",this);
        S5_ap = new("S5_ap",this);

    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
    //master1 write method 
    function void write_m1( input M0_seq_item M0_seq_h);
        //write to queue
        M0_seq_q.push_back(M0_seq_h);	   
        M0_seq_q2.push_back(M0_seq_h);	 
	//M0_checker();
	
      //  compare_transactions();
          
    endfunction
    //master 2 write method
    function void write_m2( input M1_seq_item M1_seq_h);
        //write to queue      
        M1_seq_q.push_back(M1_seq_h);	   
        M1_seq_q2.push_back(M1_seq_h);
            
        //m2_compare_transactions();
    endfunction
    //slave 0 write method
    function void write_s0( input S0_seq_item slv0_seq_h);
        //write to queue      
        s0_seq_q.push_back(slv0_seq_h);	   
        s0_seq_q2.push_back(slv0_seq_h);	   
          
    endfunction
    //slave1 write method
    function void write_s1( input S1_seq_item slv1_seq_h);          
        //write to queue        
        s1_seq_q.push_back(slv1_seq_h);	   
        s1_seq_q2.push_back(slv1_seq_h);	   
          
    endfunction
    //slave2 write method
    function void write_s2( input S2_seq_item slv2_seq_h);
        //write to queue
        s2_seq_q.push_back(slv2_seq_h);	   
    endfunction
    //slave3 write method
    function void write_s3( input S3_seq_item slv3_seq_h);          
        s3_seq_q.push_back(slv3_seq_h);	   
    endfunction
    //slave4 write method
    function void write_s4( input S4_seq_item slv4_seq_h);          
        s4_seq_q.push_back(slv4_seq_h);	   
          
    endfunction
    //slave5 write method
    function void write_s5( input S5_seq_item slv5_seq_h);
         s5_seq_q.push_back(slv5_seq_h);	   
    endfunction

    function void M0_checker();
    begin
    	if(!s2_seq_q.size())
	begin
                M0_seq_item   m0_item = M0_seq_q.pop_front();
                S2_seq_item slv2_item = s2_seq_q.pop_front();

		if(m0_item.M0_AWADDR == slv2_item.S2_PADDR)
		begin
              //	`uvm_info ("M0_ADDRESS",$sformatf("ADDRESS MATCHED:M0_AWVALID= %0d, M0_AWREADY= %0d, m0_AWADDR= %0h",m0_item.M0_AWVALID, m0_item.M0_AWREADY, m0_item.M0_AWADDR),UVM_MEDIUM)
              	`uvm_info ("M0_ADDRESS",$sformatf("ADDRESS MATCHED:M0_AWVALID= %0d, M0_AWREADY= %0d, m0_AWADDR= %0h,S2_PADDR=%0h ",m0_item.M0_AWVALID, m0_item.M0_AWREADY, m0_item.M0_AWADDR, slv2_item.S2_PADDR),UVM_MEDIUM)
		
		end
		else begin
      		`uvm_error("SCOREBOARD", $sformatf("M0_ADDRESS mismatched - Expected: M0_AWVALID= %0d, M0_AWREADY= %0d, m0_AWADDR= %0h, S2_PADDR=%0h",m0_item.M0_AWVALID, m0_item.M0_AWREADY, m0_item.M0_AWADDR, slv2_item.S2_PADDR))

		end

	end
    end

    endfunction : M0_checker

    function void compare_transactions();    
        begin
             bit wrt_comparision_passed = 0;
             bit rd_comparision_passed = 0;


            //will start once queue.size greater than zero
            //m1 to slv0
            while (M0_seq_q.size() > 0 && s0_seq_q.size() > 0)   
            begin
                //collect data from queue
                M0_seq_item   m0_seq_h = M0_seq_q.pop_front();
                S0_seq_item slv0_seq_h = s0_seq_q.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (m0_seq_h.M0_AWVALID && m0_seq_h.M0_AWREADY && slv0_seq_h.s0_awvalid && slv0_seq_h.S0_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_awaddr = %0h-->s0_awaddr = %0h",m0_seq_h.M0_AWADDR,slv0_seq_h.S0_AWADDR),UVM_MEDIUM)
          
                        if (m0_seq_h.M0_AWADDR == slv0_seq_h.S0_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (m0_seq_h.M0_WVALID && m0_seq_h.M0_WREADY && slv0_seq_h.s0_wvalid && slv0_seq_h.S0_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_WDATA = %0h-->S0_WDATA = %0h",m0_seq_h.M0_WDATA,slv0_seq_h.S0_WDATA),UVM_MEDIUM)
                    
                        if (m0_seq_h.M0_WDATA == slv0_seq_h.S0_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (m0_seq_h.M0_BVALID && m0_seq_h.M0_BREADY && slv0_seq_h.s0_bready && slv0_seq_h.S0_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: m0_bresp = %0b<--s0_bresp = %0b",m0_seq_h.M0_BRESP,slv0_seq_h.S0_BRESP),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_BRESP == slv0_seq_h.S0_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (m0_seq_h.M0_ARVALID && m0_seq_h.M0_ARREADY && slv0_seq_h.s0_arvalid && slv0_seq_h.S0_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_araddr = %0h-->s0_araddr = %0h",m0_seq_h.M0_ARADDR,slv0_seq_h.S0_ARADDR),UVM_MEDIUM)
                         
                        if (m0_seq_h.M0_ARADDR == slv0_seq_h.S0_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (m0_seq_h.M0_RVALID && m0_seq_h.M0_RREADY && slv0_seq_h.S0_RVALID && slv0_seq_h.S0_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_RDATA = %0h-->S0_RDATA = %0h",m0_seq_h.M0_RDATA,slv0_seq_h.S0_RDATA),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_RDATA == slv0_seq_h.S0_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: m0_rresp = %0b<--s0_rresp = %0b",m0_seq_h.M0_RRESP,slv0_seq_h.S0_RRESP),UVM_MEDIUM)                        
                        
                        if (m0_seq_h.M0_RRESP == slv0_seq_h.S0_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
            
    
            //will start once queue.size greater than zero
            //m1 to slv1
            while (M0_seq_q2.size() > 0 && s1_seq_q.size() > 0)   
            begin
                //collect data from queue
                M0_seq_item   m0_seq_h = M0_seq_q2.pop_front();
                S1_seq_item slv1_seq_h = s1_seq_q.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (m0_seq_h.M0_AWVALID && m0_seq_h.M0_AWREADY && slv1_seq_h.S1_awvalid && slv1_seq_h.S1_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_awaddr = %0h-->s1_awaddr = %0h",m0_seq_h.M0_AWADDR,slv1_seq_h.S1_AWADDR),UVM_MEDIUM)
          
                        if (m0_seq_h.M0_AWADDR == slv1_seq_h.S1_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (m0_seq_h.M0_WVALID && m0_seq_h.M0_WREADY && slv1_seq_h.S1_wvalid && slv1_seq_h.S1_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_WDATA = %0h-->S1_WDATA = %0h",m0_seq_h.M0_WDATA,slv1_seq_h.S1_WDATA),UVM_MEDIUM)
                    
                        if (m0_seq_h.M0_WDATA == slv1_seq_h.S1_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (m0_seq_h.M0_BVALID && m0_seq_h.M0_BREADY && slv1_seq_h.S1_bready && slv1_seq_h.S1_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: m0_bresp = %0b<--s1_bresp = %0b",m0_seq_h.M0_BRESP,slv1_seq_h.S1_BRESP),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_BRESP == slv1_seq_h.S1_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M0_seq_q2.delete();
                            s1_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M0_seq_q2.delete();
                            s1_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (m0_seq_h.M0_ARVALID && m0_seq_h.M0_ARREADY && slv1_seq_h.S1_arvalid && slv1_seq_h.S1_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_araddr = %0h-->s1_araddr = %0h",m0_seq_h.M0_ARADDR,slv1_seq_h.S1_ARADDR),UVM_MEDIUM)
                         
                        if (m0_seq_h.M0_ARADDR == slv1_seq_h.S1_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (m0_seq_h.M0_RVALID && m0_seq_h.M0_RREADY && slv1_seq_h.S1_RVALID && slv1_seq_h.S1_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_RDATA = %0h-->S1_RDATA = %0h",m0_seq_h.M0_RDATA,slv1_seq_h.S1_RDATA),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_RDATA == slv1_seq_h.S1_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: m0_rresp = %0b<--s1_rresp = %0b",m0_seq_h.M0_RRESP,slv1_seq_h.S1_RRESP),UVM_MEDIUM)                        
                        
                        if (m0_seq_h.M0_RRESP == slv1_seq_h.S1_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M0_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M0_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
    
    end
    endfunction        
        
    function void m2_compare_transactions();    
        begin

             bit wrt_comparision_passed = 0;
             bit rd_comparision_passed = 0;

            //will start once queue.size greater than zero
            //m1 to slv0
            while (M1_seq_q.size() > 0 && s0_seq_q2.size() > 0)   
            begin
                //collect data from queue
                M1_seq_item   M1_seq_h = M1_seq_q.pop_front();
                S0_seq_item slv0_seq_h = s0_seq_q2.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (M1_seq_h.M1_AWVALID && M1_seq_h.M1_AWREADY && slv0_seq_h.s0_awvalid && slv0_seq_h.S0_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_awaddr = %0h-->s0_awaddr = %0h",M1_seq_h.M1_AWADDR,slv0_seq_h.S0_AWADDR),UVM_MEDIUM)
          
                        if (M1_seq_h.M1_AWADDR == slv0_seq_h.S0_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (M1_seq_h.M1_WVALID && M1_seq_h.M1_WREADY && slv0_seq_h.s0_wvalid && slv0_seq_h.S0_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_WDATA = %0h-->S0_WDATA = %0h",M1_seq_h.M1_WDATA,slv0_seq_h.S0_WDATA),UVM_MEDIUM)
                    
                        if (M1_seq_h.M1_WDATA == slv0_seq_h.S0_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (M1_seq_h.M1_BVALID && M1_seq_h.M1_BREADY && slv0_seq_h.s0_bready && slv0_seq_h.S0_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: M1_bresp = %0b<--s0_bresp = %0b",M1_seq_h.M1_BRESP,slv0_seq_h.S0_BRESP),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_BRESP == slv0_seq_h.S0_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (M1_seq_h.M1_ARVALID && M1_seq_h.M1_ARREADY && slv0_seq_h.s0_arvalid && slv0_seq_h.S0_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_araddr = %0h-->s0_araddr = %0h",M1_seq_h.M1_ARADDR,slv0_seq_h.S0_ARADDR),UVM_MEDIUM)
                         
                        if (M1_seq_h.M1_ARADDR == slv0_seq_h.S0_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (M1_seq_h.M1_RVALID && M1_seq_h.M1_RREADY && slv0_seq_h.S0_RVALID && slv0_seq_h.S0_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_RDATA = %0h-->S0_RDATA = %0h",M1_seq_h.M1_RDATA,slv0_seq_h.S0_RDATA),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_RDATA == slv0_seq_h.S0_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: M1_rresp = %0b<--s0_rresp = %0b",M1_seq_h.M1_RRESP,slv0_seq_h.S0_RRESP),UVM_MEDIUM)                        
                        
                        if (M1_seq_h.M1_RRESP == slv0_seq_h.S0_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
            
    
            //will start once queue.size greater than zero
            //m2 to slv1
            while (M1_seq_q2.size() > 0 && s1_seq_q2.size() > 0)   
            begin
                //collect data from queue
                M1_seq_item   M1_seq_h = M1_seq_q2.pop_front();
                S1_seq_item slv1_seq_h = s1_seq_q2.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (M1_seq_h.M1_AWVALID && M1_seq_h.M1_AWREADY && slv1_seq_h.S1_awvalid && slv1_seq_h.S1_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_awaddr = %0h-->s1_awaddr = %0h",M1_seq_h.M1_AWADDR,slv1_seq_h.S1_AWADDR),UVM_MEDIUM)
          
                        if (M1_seq_h.M1_AWADDR == slv1_seq_h.S1_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (M1_seq_h.M1_WVALID && M1_seq_h.M1_WREADY && slv1_seq_h.S1_wvalid && slv1_seq_h.S1_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_WDATA = %0h-->S1_WDATA = %0h",M1_seq_h.M1_WDATA,slv1_seq_h.S1_WDATA),UVM_MEDIUM)
                    
                        if (M1_seq_h.M1_WDATA == slv1_seq_h.S1_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (M1_seq_h.M1_BVALID && M1_seq_h.M1_BREADY && slv1_seq_h.S1_bready && slv1_seq_h.S1_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: M1_bresp = %0b<--s1_bresp = %0b",M1_seq_h.M1_BRESP,slv1_seq_h.S1_BRESP),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_BRESP == slv1_seq_h.S1_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M1_seq_q2.delete();
                            s1_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M1_seq_q2.delete();
                            s1_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (M1_seq_h.M1_ARVALID && M1_seq_h.M1_ARREADY && slv1_seq_h.S1_arvalid && slv1_seq_h.S1_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_araddr = %0h-->s1_araddr = %0h",M1_seq_h.M1_ARADDR,slv1_seq_h.S1_ARADDR),UVM_MEDIUM)
                         
                        if (M1_seq_h.M1_ARADDR == slv1_seq_h.S1_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (M1_seq_h.M1_RVALID && M1_seq_h.M1_RREADY && slv1_seq_h.S1_RVALID && slv1_seq_h.S1_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_RDATA = %0h-->S1_RDATA = %0h",M1_seq_h.M1_RDATA,slv1_seq_h.S1_RDATA),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_RDATA == slv1_seq_h.S1_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: M1_rresp = %0b<--s1_rresp = %0b",M1_seq_h.M1_RRESP,slv1_seq_h.S1_RRESP),UVM_MEDIUM)                        
                        
                        if (M1_seq_h.M1_RRESP == slv1_seq_h.S1_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M1_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M1_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
    
    end
    endfunction        




endclass


/*

`uvm_analysis_imp_decl (_m1)
`uvm_analysis_imp_decl (_m2)
`uvm_analysis_imp_decl (_s0)
`uvm_analysis_imp_decl (_s1)
`uvm_analysis_imp_decl (_s2)
`uvm_analysis_imp_decl (_s3)
`uvm_analysis_imp_decl (_s4)
`uvm_analysis_imp_decl (_s5)


class scoreboard extends uvm_scoreboard;
    //factory regestration
    `uvm_component_utils(scoreboard)
    
    //uvm_analysis imports
    uvm_analysis_imp_m1 #(M0_seq_item,scoreboard) m1_ap;
    uvm_analysis_imp_m2 #(M1_seq_item,scoreboard) m2_ap;
    uvm_analysis_imp_s0 #(slv0_seq_item,scoreboard) s0_ap;
    uvm_analysis_imp_s1 #(slv1_seq_item,scoreboard) s1_ap;
    uvm_analysis_imp_s2 #(slv2_seq_item,scoreboard) s2_ap;
    uvm_analysis_imp_s3 #(slv3_seq_item,scoreboard) s3_ap;
    uvm_analysis_imp_s4 #(slv4_seq_item,scoreboard) s4_ap;
    uvm_analysis_imp_s5 #(slv5_seq_item,scoreboard) s5_ap;
    
    //queues
    M0_seq_item   M0_seq_q[$],M0_seq_q2[$];    
    M1_seq_item   M1_seq_q[$],M1_seq_q2[$];   
    slv0_seq_item s0_seq_q[$],s0_seq_q2[$];   
    slv1_seq_item s1_seq_q[$],s1_seq_q2[$];
    slv3_seq_item s3_seq_q[$];
    slv2_seq_item s2_seq_q[$];
    slv4_seq_item s4_seq_q[$];
    slv5_seq_item s5_seq_q[$];

    logic m1_matched = 0;
    logic m2_matched = 0;
    bit enable_compare = 1;
  
    //default constructor
    function new(string name="scoreboard",uvm_component parent );
        super.new(name,parent);
        //new mwthod for ports
        m1_ap = new("m1_ap",this);
        m2_ap = new("m2_ap",this);    
        s0_ap = new("s0_ap",this);
        s1_ap = new("s1_ap",this);
        s2_ap = new("s2_ap",this);
        s3_ap = new("s3_ap",this);
        s4_ap = new("s4_ap",this);
        s5_ap = new("s5_ap",this);

    endfunction
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
    //master1 write method 
    function void write_m1( input M0_seq_item m1_seq_h);
        //write to queue
        M0_seq_q.push_back(m1_seq_h);
        M0_seq_q2.push_back(m1_seq_h);	   
     //   compare_transactions();
          
    endfunction
    //master 2 write method
    function void write_m2( input M1_seq_item M1_seq_h);
        //write to queue      
        M1_seq_q.push_back(M1_seq_h);	   
        M1_seq_q2.push_back(M1_seq_h);	   
            
        m2_compare_transactions();
    endfunction
    //slave 0 write method
    function void write_s0( input slv0_seq_item slv0_seq_h);
        //write to queue      
        s0_seq_q.push_back(slv0_seq_h);	   
        s0_seq_q2.push_back(slv0_seq_h);	   
          
    endfunction
    //slave1 write method
    function void write_s1( input slv1_seq_item slv1_seq_h);          
        //write to queue        
        s1_seq_q.push_back(slv1_seq_h);	   
        s1_seq_q2.push_back(slv1_seq_h);	   
          
    endfunction
    //slave2 write method
    function void write_s2( input slv2_seq_item slv2_seq_h);
        //write to queue
        s2_seq_q.push_back(slv2_seq_h);	   
    endfunction
    //slave3 write method
    function void write_s3( input slv3_seq_item slv3_seq_h);          
        s3_seq_q.push_back(slv3_seq_h);	   
    endfunction
    //slave4 write method
    function void write_s4( input slv4_seq_item slv4_seq_h);          
        s4_seq_q.push_back(slv4_seq_h);	   
          
    endfunction
    //slave5 write method
    function void write_s5( input slv5_seq_item slv5_seq_h);
         s5_seq_q.push_back(slv5_seq_h);	   
    endfunction

    function void compare_transactions();    
        begin
             bit wrt_comparision_passed = 0;
             bit rd_comparision_passed = 0;


            //will start once queue.size greater than zero
            //m1 to slv0
            while ((M0_seq_q.size() != 0) || ((s0_seq_q.size() != 0) || (s1_seq_q.size() != 0) ))
	    //(|| (s2_seq_q.size() != 0) || (s3_seq_q.size() != 0)))   
            begin
                //collect data from queue
                M0_seq_item   m0_seq_h = M0_seq_q.pop_front();
                slv0_seq_item slv0_seq_h = s0_seq_q.pop_front();
		slv1_seq_item slv1_seq_h = s1_seq_q.pop_front();
		slv2_seq_item slv2_seq_h = s2_seq_q.pop_front();
                slv3_seq_item slv3_seq_h = s3_seq_q.pop_front();

		if(m0_seq_h.M0_AWVALID & m0_seq_h.M0_AWREADY)
		begin
			if(m0_seq_h.M0_AWADDR!=0)
			begin
			`uvm_info("NOC_SCOREBOARD",$sformatf("Time:%0t| M0_AWADDR(Address):%0h",$realtime,m0_seq_h.M0_AWADDR),UVM_MEDIUM);
				if((m0_seq_h.M0_AWADDR>=32'hA000_0000)&&(m0_seq_h.M0_AWADDR<=32'hA00_3FFF))
				begin
					if(m0_seq_h.M0_AWADDR==slv0_seq_h.S0_AWADDR)
					begin
					`uvm_info("SCOREBOARD", $sformatf("Master_0 to Slave_0 address matched M0_address=%0h and S1_address=%0h",m0_seq_h.M0_AWADDR, slv0_seq_h.S0_AWADDR), UVM_MEDIUM)
					end
					else
					begin
      					`uvm_error("SCOREBOARD", $sformatf("M0_address=%0h and S0_address=%0h",m0_seq_h.M0_AWADDR, slv0_seq_h.S0_AWADDR))
					end
				end	
				else if((m0_seq_h.M0_AWADDR>=32'hA004_0000)&&(m0_seq_h.M0_AWADDR<=32'hA005_FFFF))
				begin
					if(m0_seq_h.M0_AWADDR==slv1_seq_h.S1_AWADDR)
					begin
					`uvm_info("SCOREBOARD", $sformatf("Master_0 to Slave_1 address matched M0_address=%0h and S1_address=%0h",m0_seq_h.M0_AWADDR, slv1_seq_h.S1_AWADDR), UVM_MEDIUM)
					end
					else
					begin
      					`uvm_error("SCOREBOARD", $sformatf("M0_address=%0h and S1_address=%0h",m0_seq_h.M0_AWADDR, slv1_seq_h.S1_AWADDR))
					end
				end
				else if((m0_seq_h.M0_AWADDR>=32'hA006_0000)&&(m0_seq_h.M0_AWADDR<=32'hA006_03FF))
				begin
					if(m0_seq_h.M0_AWADDR==slv2_seq_h.S2_PADDR)
					begin
					`uvm_info("SCOREBOARD", $sformatf("Master_0 to Slave_2 address matched M0_address=%0h and S1_address=%0h",m0_seq_h.M0_AWADDR, slv2_seq_h.S2_PADDR), UVM_MEDIUM)
					end
					else
					begin
      					`uvm_error("SCOREBOARD", $sformatf("M0_address=%0h and S2_address=%0h",m0_seq_h.M0_AWADDR, slv2_seq_h.S2_PADDR))
					end
				end
				
				else if((m0_seq_h.M0_AWADDR>=32'hA006_1000)&&(m0_seq_h.M0_AWADDR<=32'hA006_13FF))
				begin
					if(m0_seq_h.M0_AWADDR==slv3_seq_h.S3_PADDR)
					begin
					`uvm_info("SCOREBOARD", $sformatf("Master_0 to Slave_3 address matched M0_address=%0h and S3_address=%0h",m0_seq_h.M0_AWADDR, slv3_seq_h.S3_PADDR), UVM_MEDIUM)
					end
					else
					begin
      					`uvm_error("SCOREBOARD", $sformatf("M0_address=%0h and S3_address=%0h",m0_seq_h.M0_AWADDR, slv3_seq_h.S3_PADDR))
					end
				end
				else
				begin
      				`uvm_error("SCOREBOARD", $sformatf("M0_address=%0h and S3_address=%0h",m0_seq_h.M0_AWADDR, slv3_seq_h.S3_PADDR))
				end


			end

		end
	end
end
endfunction



                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (m0_seq_h.M0_AWVALID && m0_seq_h.M0_AWREADY && slv0_seq_h.s0_awvalid && slv0_seq_h.S0_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_awaddr = %0h-->s0_awaddr = %0h",m0_seq_h.M0_AWADDR,slv0_seq_h.S0_AWADDR),UVM_MEDIUM)
          
                        if (m0_seq_h.M0_AWADDR == slv0_seq_h.S0_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (m0_seq_h.M0_WVALID && m0_seq_h.M0_WREADY && slv0_seq_h.s0_wvalid && slv0_seq_h.S0_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_WDATA = %0h-->S0_WDATA = %0h",m0_seq_h.M0_WDATA,slv0_seq_h.S0_WDATA),UVM_MEDIUM)
                    
                        if (m0_seq_h.M0_WDATA == slv0_seq_h.S0_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (m0_seq_h.M0_BVALID && m0_seq_h.M0_BREADY && slv0_seq_h.s0_bready && slv0_seq_h.S0_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: m0_bresp = %0b<--s0_bresp = %0b",m0_seq_h.M0_BRESP,slv0_seq_h.S0_BRESP),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_BRESP == slv0_seq_h.S0_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (m0_seq_h.M0_ARVALID && m0_seq_h.M0_ARREADY && slv0_seq_h.s0_arvalid && slv0_seq_h.S0_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_araddr = %0h-->s0_araddr = %0h",m0_seq_h.M0_ARADDR,slv0_seq_h.S0_ARADDR),UVM_MEDIUM)
                         
                        if (m0_seq_h.M0_ARADDR == slv0_seq_h.S0_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (m0_seq_h.M0_RVALID && m0_seq_h.M0_RREADY && slv0_seq_h.S0_RVALID && slv0_seq_h.S0_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_RDATA = %0h-->S0_RDATA = %0h",m0_seq_h.M0_RDATA,slv0_seq_h.S0_RDATA),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_RDATA == slv0_seq_h.S0_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: m0_rresp = %0b<--s0_rresp = %0b",m0_seq_h.M0_RRESP,slv0_seq_h.S0_RRESP),UVM_MEDIUM)                        
                        
                        if (m0_seq_h.M0_RRESP == slv0_seq_h.S0_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M0_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
            
    
            //will start once queue.size greater than zero
            //m1 to slv1
            while (M0_seq_q2.size() > 0 && s1_seq_q.size() > 0)   
            begin
                //collect data from queue
                M0_seq_item   m0_seq_h = M0_seq_q2.pop_front();
                slv1_seq_item slv1_seq_h = s1_seq_q.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (m0_seq_h.M0_AWVALID && m0_seq_h.M0_AWREADY && slv1_seq_h.S1_awvalid && slv1_seq_h.S1_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_awaddr = %0h-->s1_awaddr = %0h",m0_seq_h.M0_AWADDR,slv1_seq_h.S1_AWADDR),UVM_MEDIUM)
          
                        if (m0_seq_h.M0_AWADDR == slv1_seq_h.S1_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (m0_seq_h.M0_WVALID && m0_seq_h.M0_WREADY && slv1_seq_h.S1_wvalid && slv1_seq_h.S1_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_WDATA = %0h-->S1_WDATA = %0h",m0_seq_h.M0_WDATA,slv1_seq_h.S1_WDATA),UVM_MEDIUM)
                    
                        if (m0_seq_h.M0_WDATA == slv1_seq_h.S1_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (m0_seq_h.M0_BVALID && m0_seq_h.M0_BREADY && slv1_seq_h.S1_bready && slv1_seq_h.S1_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: m0_bresp = %0b<--s1_bresp = %0b",m0_seq_h.M0_BRESP,slv1_seq_h.S1_BRESP),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_BRESP == slv1_seq_h.S1_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M0_seq_q2.delete();
                            s1_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M0_seq_q2.delete();
                            s1_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (m0_seq_h.M0_ARVALID && m0_seq_h.M0_ARREADY && slv1_seq_h.S1_arvalid && slv1_seq_h.S1_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: m0_araddr = %0h-->s1_araddr = %0h",m0_seq_h.M0_ARADDR,slv1_seq_h.S1_ARADDR),UVM_MEDIUM)
                         
                        if (m0_seq_h.M0_ARADDR == slv1_seq_h.S1_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (m0_seq_h.M0_RVALID && m0_seq_h.M0_RREADY && slv1_seq_h.S1_RVALID && slv1_seq_h.S1_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M0_RDATA = %0h-->S1_RDATA = %0h",m0_seq_h.M0_RDATA,slv1_seq_h.S1_RDATA),UVM_MEDIUM)
                        
                        if (m0_seq_h.M0_RDATA == slv1_seq_h.S1_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: m0_rresp = %0b<--s1_rresp = %0b",m0_seq_h.M0_RRESP,slv1_seq_h.S1_RRESP),UVM_MEDIUM)                        
                        
                        if (m0_seq_h.M0_RRESP == slv1_seq_h.S1_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M0_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M0_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
    
    end
    endfunction      
        
    function void m2_compare_transactions();    
        begin

             bit wrt_comparision_passed = 0;
             bit rd_comparision_passed = 0;

            //will start once queue.size greater than zero
            //m1 to slv0
            while (M1_seq_q.size() > 0 && s0_seq_q2.size() > 0)   
            begin
                //collect data from queue
                M1_seq_item   M1_seq_h = M1_seq_q.pop_front();
                slv0_seq_item slv0_seq_h = s0_seq_q2.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (M1_seq_h.M1_AWVALID && M1_seq_h.M1_AWREADY && slv0_seq_h.s0_awvalid && slv0_seq_h.S0_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_awaddr = %0h-->s0_awaddr = %0h",M1_seq_h.M1_AWADDR,slv0_seq_h.S0_AWADDR),UVM_MEDIUM)
          
                        if (M1_seq_h.M1_AWADDR == slv0_seq_h.S0_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (M1_seq_h.M1_WVALID && M1_seq_h.M1_WREADY && slv0_seq_h.s0_wvalid && slv0_seq_h.S0_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_WDATA = %0h-->S0_WDATA = %0h",M1_seq_h.M1_WDATA,slv0_seq_h.S0_WDATA),UVM_MEDIUM)
                    
                        if (M1_seq_h.M1_WDATA == slv0_seq_h.S0_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (M1_seq_h.M1_BVALID && M1_seq_h.M1_BREADY && slv0_seq_h.s0_bready && slv0_seq_h.S0_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: M1_bresp = %0b<--s0_bresp = %0b",M1_seq_h.M1_BRESP,slv0_seq_h.S0_BRESP),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_BRESP == slv0_seq_h.S0_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (M1_seq_h.M1_ARVALID && M1_seq_h.M1_ARREADY && slv0_seq_h.s0_arvalid && slv0_seq_h.S0_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 0----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_araddr = %0h-->s0_araddr = %0h",M1_seq_h.M1_ARADDR,slv0_seq_h.S0_ARADDR),UVM_MEDIUM)
                         
                        if (M1_seq_h.M1_ARADDR == slv0_seq_h.S0_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (M1_seq_h.M1_RVALID && M1_seq_h.M1_RREADY && slv0_seq_h.S0_RVALID && slv0_seq_h.S0_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_RDATA = %0h-->S0_RDATA = %0h",M1_seq_h.M1_RDATA,slv0_seq_h.S0_RDATA),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_RDATA == slv0_seq_h.S0_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: M1_rresp = %0b<--s0_rresp = %0b",M1_seq_h.M1_RRESP,slv0_seq_h.S0_RRESP),UVM_MEDIUM)                        
                        
                        if (M1_seq_h.M1_RRESP == slv0_seq_h.S0_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M1_seq_q.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
            
    
            //will start once queue.size greater than zero
            //m2 to slv1
            while (M1_seq_q2.size() > 0 && s1_seq_q2.size() > 0)   
            begin
                //collect data from queue
                M1_seq_item   M1_seq_h = M1_seq_q2.pop_front();
                slv1_seq_item slv1_seq_h = s1_seq_q2.pop_front();

                if (enable_compare)   
                begin
           
                                       
                    //address channel
                    if (M1_seq_h.M1_AWVALID && M1_seq_h.M1_AWREADY && slv1_seq_h.S1_awvalid && slv1_seq_h.S1_AWREADY)
                    begin  
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");
                        `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_awaddr = %0h-->s1_awaddr = %0h",M1_seq_h.M1_AWADDR,slv1_seq_h.S1_AWADDR),UVM_MEDIUM)
          
                        if (M1_seq_h.M1_AWADDR == slv1_seq_h.S1_AWADDR)
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED!")
                    end
                    //write data channel
                    if (M1_seq_h.M1_WVALID && M1_seq_h.M1_WREADY && slv1_seq_h.S1_wvalid && slv1_seq_h.S1_WREADY)
                    begin
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_WDATA = %0h-->S1_WDATA = %0h",M1_seq_h.M1_WDATA,slv1_seq_h.S1_WDATA),UVM_MEDIUM)
                    
                        if (M1_seq_h.M1_WDATA == slv1_seq_h.S1_WDATA)
                        begin        
                            `uvm_info ("DATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
                        else    
                            `uvm_error ("DATA_COMPARE","DATA MISMATCH DETECTED!")              
                    end
                    // B channel
                    if (M1_seq_h.M1_BVALID && M1_seq_h.M1_BREADY && slv1_seq_h.S1_bready && slv1_seq_h.S1_BVALID)
                    begin
                        
                            `uvm_info ("RESP",$sformatf("RESP MATCH: M1_bresp = %0b<--s1_bresp = %0b",M1_seq_h.M1_BRESP,slv1_seq_h.S1_BRESP),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_BRESP == slv1_seq_h.S1_BRESP ) begin               
                            `uvm_info ("RSP_COMPARE","RESPONSE MATCHED SUCCESSFULLY ",UVM_LOW)
                            wrt_comparision_passed = 1;
                            M1_seq_q2.delete();
                            s1_seq_q.delete();
                            break;                            
                        end
                        else 
                        begin    
                            `uvm_error ("RSP_COMPARE","RESPONSE MISMATCH DETECTED!")              
                            M1_seq_q2.delete();
                            s1_seq_q.delete();
                            wrt_comparision_passed = 0;
                            
                            break;
                        end    
                    end
            
                    //read checker

                    if (M1_seq_h.M1_ARVALID && M1_seq_h.M1_ARREADY && slv1_seq_h.S1_arvalid && slv1_seq_h.S1_ARREADY) 
                    begin
                        $display ("--------------------------------MASTER 1 SLV 1----------------------------------------------");

                            `uvm_info ("ADDRESS",$sformatf("ADDRESS MATCH: M1_araddr = %0h-->s1_araddr = %0h",M1_seq_h.M1_ARADDR,slv1_seq_h.S1_ARADDR),UVM_MEDIUM)
                         
                        if (M1_seq_h.M1_ARADDR == slv1_seq_h.S1_ARADDR) 
                        begin
                            `uvm_info ("ADDRESS_COMPARE","ADDRESS MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("ADDRESS_COMPARE","ADDRESS MISMATCH DETECTED")                                            
                    end
                    
                    if (M1_seq_h.M1_RVALID && M1_seq_h.M1_RREADY && slv1_seq_h.S1_RVALID && slv1_seq_h.S1_RREADY)
                    begin  
                        `uvm_info ("DATA",$sformatf("DATA MATCH: M1_RDATA = %0h-->S1_RDATA = %0h",M1_seq_h.M1_RDATA,slv1_seq_h.S1_RDATA),UVM_MEDIUM)
                        
                        if (M1_seq_h.M1_RDATA == slv1_seq_h.S1_RDATA)                   
                        begin
                            `uvm_info ("RDATA_COMPARE","DATA MATCHED SUCCESSFULLY ",UVM_LOW)
                        end
               
                        else    
                            `uvm_error ("RDATA_COMPARE","DATA MISMATCH DETECTED") 
                    

                        `uvm_info ("RESP",$sformatf("RESP MATCH: M1_rresp = %0b<--s1_rresp = %0b",M1_seq_h.M1_RRESP,slv1_seq_h.S1_RRESP),UVM_MEDIUM)                        
                        
                        if (M1_seq_h.M1_RRESP == slv1_seq_h.S1_RRESP ) begin
                            `uvm_info ("RRESP_COMPARE","RRESP MATCHED SUCCESSFULLY ",UVM_LOW)
                            rd_comparision_passed = 1;
                            M1_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                        end
               
                        else 
                        begin    
                            `uvm_error ("RRESP_COMPARE","RRESP MISMATCH DETECTED") 
                            rd_comparision_passed = 0;
                            M1_seq_q2.delete();
                            s0_seq_q.delete();
                            break;                                                         
                       end
                   end                                              
            end                                  
        end
    
    end
    endfunction        




endclass*/
