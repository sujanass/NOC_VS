class S1_seq extends uvm_sequence#(S1_seq_item);
    S1_seq_item S1_seqi_inst;
    `uvm_object_utils (S1_seq)
    int scenario;

    function new (string name= "S1_seq" );
        super.new(name);
    endfunction

    task body();
        `uvm_info (get_type_name(),"slv1 seq:inside body",UVM_LOW);
        if (scenario == 2)
        begin
            // repeat (4) begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 1;
                    S1_seqi_inst.S1_AWREADY == 1;
                    S1_seqi_inst.S1_WREADY == 1;
                    S1_seqi_inst.S1_BID == 8'h00;

                    S1_seqi_inst.S1_BVALID == 1; 
                    S1_seqi_inst.S1_BRESP == 2'b01; }); 

            finish_item (S1_seqi_inst);
            // end

        end

        if (scenario == 3)
        begin
            // repeat (4) begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 1;
                    S1_seqi_inst.S1_AWREADY == 1;
                    S1_seqi_inst.S1_WREADY == 1;
                    S1_seqi_inst.S1_BID == 8'h10;

                    S1_seqi_inst.S1_BVALID == 1; 
                    S1_seqi_inst.S1_BRESP == 2'b01; }); 

            finish_item (S1_seqi_inst);
            // end

        end


        if (scenario == 4)
        begin
            // repeat (3) begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 0;
                    S1_seqi_inst.S1_ARREADY == 1;                                                  
                    //   S1_seqi_inst.S1_RDATA == 32'hBABA_DADA;
                    S1_seqi_inst.S1_RVALID == 1;
                    S1_seqi_inst.S1_RID == 8'H00;
                    S1_seqi_inst.S1_RRESP == 2;
                    S1_seqi_inst.S1_RLAST == 1;

                    });
            finish_item (S1_seqi_inst);
        end


        if (scenario == 5)
        begin
        // repeat (3) begin
        S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
        start_item (S1_seqi_inst);
        assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 0;
                S1_seqi_inst.S1_ARREADY == 1;                                                  
                S1_seqi_inst.S1_RID == 8'H10;
                S1_seqi_inst.S1_RVALID == 1;
                S1_seqi_inst.S1_RRESP == 2;
                S1_seqi_inst.S1_RLAST == 1;

                });
        finish_item (S1_seqi_inst);
        end

        if (scenario == 6)
        begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 1;
                    S1_seqi_inst.S1_AWREADY == 1;
                    S1_seqi_inst.S1_WREADY == 1;
                    S1_seqi_inst.S1_BID == 8'h10;

                    S1_seqi_inst.S1_BVALID == 1; 
                    S1_seqi_inst.S1_BRESP == 2'b01; }); 

            finish_item (S1_seqi_inst);

        end


        if (scenario == 7)
        begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 1;
                    S1_seqi_inst.S1_AWREADY == 1;
                    S1_seqi_inst.S1_WREADY == 1;
                    S1_seqi_inst.S1_BID == 8'h00;

                    S1_seqi_inst.S1_BVALID == 1; 
                    S1_seqi_inst.S1_BRESP == 2'b01; }); 

            finish_item (S1_seqi_inst);

        end



        if (scenario == 8)
        begin
            // repeat (3) begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 0;
                    S1_seqi_inst.S1_ARREADY == 1;                                                  
                    //   S1_seqi_inst.S1_RDATA == 32'hBABA_DADA;
                    S1_seqi_inst.S1_RID == 8'h10;
                    S1_seqi_inst.S1_RVALID == 1;
                    S1_seqi_inst.S1_RRESP == 1;
                    S1_seqi_inst.S1_RLAST == 1;

                    });
            finish_item (S1_seqi_inst);
        end
    
    
        if (scenario == 9)
        begin
            // repeat (4) begin
            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin            
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 1;
                    S1_seqi_inst.S1_AWREADY == 1;
                    S1_seqi_inst.S1_WREADY == 1;
                    S1_seqi_inst.S1_BID == 8'h10;

                    S1_seqi_inst.S1_BVALID == 1; 
                    S1_seqi_inst.S1_BRESP == 2'b01; }); 

            finish_item (S1_seqi_inst);
            end

        end


        if (scenario == 10)
        begin
            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin
            // repeat (3) begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 0;
                    S1_seqi_inst.S1_ARREADY == 1;                                                  
                    //   S1_seqi_inst.S1_RDATA == 32'hBABA_DADA;
                    S1_seqi_inst.S1_RVALID == 1;
                    S1_seqi_inst.S1_RID == 8'H10;
                    S1_seqi_inst.S1_RRESP == 2;
                    S1_seqi_inst.S1_RLAST == 1;

                    });
            finish_item (S1_seqi_inst);
            end
        end
    
        if (scenario == 11)
        begin
            // repeat (4) begin
            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin            
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 1;
                    S1_seqi_inst.S1_AWREADY == 1;
                    S1_seqi_inst.S1_WREADY == 1;
                    S1_seqi_inst.S1_BID == 8'h00;

                    S1_seqi_inst.S1_BVALID == 1; 
                    S1_seqi_inst.S1_BRESP == 2'b01; }); 

            finish_item (S1_seqi_inst);
            end

        end


        if (scenario == 12)
        begin
            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin
            // repeat (3) begin
            S1_seqi_inst = S1_seq_item::type_id::create("S1_seqi_inst");
            start_item (S1_seqi_inst);
            assert(S1_seqi_inst.randomize()with {S1_seqi_inst.is_write == 0;
                    S1_seqi_inst.S1_ARREADY == 1;                                                  
                    //   S1_seqi_inst.S1_RDATA == 32'hBABA_DADA;
                    S1_seqi_inst.S1_RVALID == 1;
                    S1_seqi_inst.S1_RID == 8'H00;
                    S1_seqi_inst.S1_RRESP == 2;
                    S1_seqi_inst.S1_RLAST == 1;

                    });
            finish_item (S1_seqi_inst);
            end
        end
    endtask
endclass


