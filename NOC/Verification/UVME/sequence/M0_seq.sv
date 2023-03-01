class M0_seq extends uvm_sequence#(M0_seq_item);
    //creating handle for seq_item
    M0_seq_item M0_seqi_inst;
    //virtual interface
    virtual M0_inf M0_intf;
    //factory regestration
    `uvm_object_utils (M0_seq)

    int scenario;

    //constructor
    function new (string name= "M0_seq" );
        super.new(name);
    endfunction


   virtual task body();
        `uvm_info (get_type_name(),"base seq:inside body",UVM_LOW);

        //reset scenario
        if (scenario == 1)
        begin
        // #5;
         //   `uvm_do_with(M0_seqi_inst,{M0_seqi_inst.M0_AWADDR == 32'h00000010;M0_seqi_inst.M0_AWVALID == 1'b0;M0_seqi_inst.M0_WVALID==1'b0;M0_seqi_inst.M0_WDATA == 32'h00000000;M0_seqi_inst.M0_BREADY==1'b0;M0_seqi_inst.M0_AWLEN == 0;M0_seqi_inst.M0_AWBURST == 0;M0_seqi_inst.M0_WSTRB == 0;M0_seqi_inst.M0_WLAST == 0;M0_seqi_inst.M0_ARVALID == 0;M0_seqi_inst.M0_ARADDR == 0;M0_seqi_inst.M0_ARLEN == 0;M0_seqi_inst.M0_ARBURST == 0;M0_seqi_inst.M0_RREADY == 0;M0_seqi_inst.M0_MID == 0;}); #20;
          //  `uvm_do(M0_seqi_inst);
        end


        // slave0 write scenario
        if (scenario == 2)
        begin

            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == 32'hA0000100;		    
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //  M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'b11;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        //slave1 write scenario
        if (scenario == 3)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (1);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //         M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });

            finish_item(M0_seqi_inst);

        `uvm_info("M0_SEQ",$sformatf("Inside M0_sequence scenario 3 M0_addr=%0h",M0_seqi_inst.M0_AWADDR),UVM_MEDIUM)

        `uvm_info("M0_SEQ","Inside M0_sequence scenario 3",UVM_LOW)
        end

        //slave 2 write scenario
        if (scenario == 4)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (1);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //         M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        //slave 4 fixed burst write 
        if (scenario == 5)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (1);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //         M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        // slave 0 read scenario
        if (scenario == 6)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_ARBURST == 0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end


        // slave1 read
        if (scenario == 7)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (1);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_ARBURST == 0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end

        //slave 2 read scenario
        if (scenario == 8)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (1);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_ARBURST == 0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end


        // slave 3 read scenario
        if (scenario == 9)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (1);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_ARBURST == 0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end


        // write burst 4beat slave0
        if (scenario == 10)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });

            finish_item(M0_seqi_inst);

        end

        // write burst 8 beat slave0
        if (scenario == 11)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end
        // write burst 16 beat slv0
        if (scenario == 12)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end

        // master0 - slave3 4 beat write burst
        if (scenario == 13)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (1);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 3;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end
        // write burst 8 beat slv5
        if (scenario == 14)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (1);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 7;
                    //  M0_seqi_inst.M0_AWBURST == 2;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end
        // write burst 16 beat slv4
        if (scenario == 15)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (1);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 15;
                    //   M0_seqi_inst.M0_AWBURST == 2;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end


        //wrap w_burst slave2
        if (scenario == 16)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == 32'hA006_0014;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 7;
                    M0_seqi_inst.M0_AWBURST == 2;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end
        // write burst 16 beat wrap slave3
        if (scenario == 17)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == 32'hA006_1030;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 15;
                    // M0_seqi_inst.M0_AWBURST == 2;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end

        // read burst 4 beat slv0       
        if (scenario == 18)
        begin
        //repeat (3) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        //end
        // read burst 8 beat
        if (scenario == 19)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end

        // read burst 16 beat
        if (scenario == 20)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        //end

        // read burst 4 beat slv3       
        if (scenario == 21)
        begin
            //repeat (3) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (1);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==3;
                    M0_seqi_inst.M0_ARBURST == 2;
                    //  M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        // read burst 8 beat slv5
        if (scenario == 22)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (1);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==7;
                    //  M0_seqi_inst.M0_ARBURST == 2;
                    M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end

        // read burst 16 beat slv4
        if (scenario == 23)
        begin
            //repeat (3) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (1);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==15;
                    M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end


        // read burst 8 beat read wrap burst slv2
        if (scenario == 24)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARADDR == 32'hA006_0014;
                    M0_seqi_inst.M0_ARLEN ==7;
                    M0_seqi_inst.M0_ARBURST == 2;
                    M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end

        // read burst 16 beat read wrap burst slv3
        if (scenario == 25)
        begin
            //repeat (3) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARADDR == 32'hA006_1030;
                    M0_seqi_inst.M0_ARLEN ==15;
                    M0_seqi_inst.M0_ARBURST == 2;
                    M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        //decode error
        if (scenario == 26)
        // repeat (4) 
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (1);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end
        //randomize the slaves
        if (scenario == 27)
        // repeat (4) 
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (1);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        // awlen randomization

        if (scenario == 28)
        // repeat (4) 
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; 
                    // M0_seqi_inst.M0_AWLEN == len; 
                    });



            finish_item(M0_seqi_inst);
        end
        //slave1 
        if (scenario == 29)
        begin

            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (1);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    //         M0_seqi_inst.M0_AWLEN == len; 
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        if (scenario == 30)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (1);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1;
                    //         M0_seqi_inst.M0_AWLEN == len; 
                    });



            finish_item(M0_seqi_inst);
        end

        //slverr
        if (scenario == 31)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (1);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'h0;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1;
                    M0_seqi_inst.M0_AWLEN == 0; 
                    });



            finish_item(M0_seqi_inst);
        end


        // slv error 
        if (scenario == 32)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (1);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'h0;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1;
                    M0_seqi_inst.M0_AWLEN == 0; 
                    });



            finish_item(M0_seqi_inst);
        end

        // slverr
        if (scenario == 33)
        begin

            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (1);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_WSTRB == 4'h0;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1;
                    });



            finish_item(M0_seqi_inst);
        end

        //slv2 end_address
        if (scenario == 34)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == 32'hA006_03FF;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 7;
                    M0_seqi_inst.M0_AWBURST == 2;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end
        //slv3 end_address
        if (scenario == 35)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == 32'hA006_13FF;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 15;
                    // M0_seqi_inst.M0_AWBURST == 2;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);

        end
        //slv3 read end_addr
        if (scenario == 36)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARADDR == 32'HA006_13FE;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==3;
                    M0_seqi_inst.M0_ARBURST == 2;
                    //  M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        //slv5 end addr
        if (scenario == 37)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARADDR == 32'HA006_33FE;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==7;
                    //M0_seqi_inst.M0_ARBURST == 1;
                    //  M0_seqi_inst.M0_ARSIZE == 2;

                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
    
        //slv2 read end_addr
        if (scenario == 38)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARADDR == 32'HA006_03FE;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==3;
                   // M0_seqi_inst.M0_ARBURST == 2;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        //slv4 end addr
        if (scenario == 39)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARADDR == 32'HA006_23FE;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==7;
                   // M0_seqi_inst.M0_ARBURST == 1;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end
        //slv3 fixed burst
        if (scenario == 40)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (1);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //         M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        //slave 5 write scenario
        if (scenario == 41)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (1);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //         M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });



            finish_item(M0_seqi_inst);
        end

        //slv4 read fixed burst
        if (scenario == 42)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (1);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end

        //slv5 read fixed burst
        if (scenario == 43)
        begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (1);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);

            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 1;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
        end

        if (scenario == 44)
        begin
            int i;
            for (i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARADDR == i;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_ARBURST == 0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
            end
        end

        if (scenario == 45)
        begin

            int i;
            for (i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == i;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //  M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });
            finish_item(M0_seqi_inst);
            end
        end

        if (scenario == 46)
        begin
            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 0;
                    M0_seqi_inst.M0_ARVALID == 1'b1;
                    M0_seqi_inst.M0_ARADDR == i;
                    M0_seqi_inst.M0_ARLEN ==0;
                    M0_seqi_inst.M0_ARBURST == 0;
                    M0_seqi_inst.M0_RREADY == 1'b1;
                    M0_seqi_inst.M0_MID ==0; });
            finish_item(M0_seqi_inst);
            end
        end

        if (scenario == 47)
        begin

            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+16) begin
            M0_seqi_inst = M0_seq_item::type_id::create("M0_seqi_inst");
            start_item (M0_seqi_inst);
            M0_seqi_inst.addr_slv0.constraint_mode (0);
            M0_seqi_inst.addr_slv1.constraint_mode (0);
            M0_seqi_inst.addr_slv2.constraint_mode (0);
            M0_seqi_inst.addr_slv3.constraint_mode (0);
            M0_seqi_inst.addr_slv4.constraint_mode (0);
            M0_seqi_inst.addr_slv5.constraint_mode (0);
            M0_seqi_inst.invalid_addr.constraint_mode (0);
            M0_seqi_inst.rand_addr.constraint_mode (0);
            assert(M0_seqi_inst.randomize() with {M0_seqi_inst.m0_burst == 0;
                    M0_seqi_inst.wrt_e == 1;
                    M0_seqi_inst.M0_MID    == 0;
                    M0_seqi_inst.M0_AWVALID == 1'b1;
                    M0_seqi_inst.M0_AWADDR == i;
                    M0_seqi_inst.M0_WVALID==1'b1;
                    M0_seqi_inst.M0_BREADY==1'b1;
                    //  M0_seqi_inst.M0_AWSIZE == 2;
                    M0_seqi_inst.M0_AWLEN == 0;
                    M0_seqi_inst.M0_AWBURST == 0;
                    M0_seqi_inst.M0_WSTRB == 4'hf;
                    M0_seqi_inst.M0_WLAST == 1;
                    M0_seqi_inst.M0_BREADY == 1; });
            finish_item(M0_seqi_inst);
            end
        end

    endtask
endclass 
