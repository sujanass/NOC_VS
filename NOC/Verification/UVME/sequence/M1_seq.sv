//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////Copyright © 2022 PravegaSemi PVT LTD., All rights reserved//////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//All works published under Zilla_Gen_0 by PravegaSemi PVT LTD is copyrighted by the Association and ownership  // 
//of all right, title and interest in and to the works remains with PravegaSemi PVT LTD. No works or documents  //
//published under Zilla_Gen_0 by PravegaSemi PVT LTD may be reproduced,transmitted or copied without the express//
//written permission of PravegaSemi PVT LTD will be considered as a violations of Copyright Act and it may lead //
//to legal action.                                                                                         //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////
* File Name : seq.sv

* Purpose :

* Creation Date : 

* Last Modified : Mon 20 Feb 2023 04:23:36 PM IST

* Created By : G.SUNENDRA. 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/

class M1_seq extends uvm_sequence#(M1_seq_item);
    //creating handle for seq_item
    M1_seq_item M1_seqi_inst;
    //factory regestration
    `uvm_object_utils (M1_seq)

    int scenario;

    //constructor
    function new (string name= "M1_seq" );
        super.new(name);
    endfunction



    task body();
        `uvm_info (get_type_name(),"base seq:inside body",UVM_LOW);


        //reset scenario
        if (scenario == 1)
        begin
            `uvm_do_with(M1_seqi_inst,{M1_seqi_inst.M1_AWADDR == 32'h00000000;M1_seqi_inst.M1_AWVALID == 1'b0;M1_seqi_inst.M1_WVALID==1'b0;M1_seqi_inst.M1_WDATA == 32'h00000000;M1_seqi_inst.M1_BREADY==1'b0;M1_seqi_inst.M1_AWLEN == 0;M1_seqi_inst.M1_AWBURST == 0;M1_seqi_inst.M1_WSTRB == 0;M1_seqi_inst.M1_WLAST == 0;M1_seqi_inst.M1_ARVALID == 0;M1_seqi_inst.M1_ARADDR == 0;M1_seqi_inst.M1_ARLEN == 0;M1_seqi_inst.M1_ARBURST == 0;M1_seqi_inst.M1_RREADY == 0;M1_seqi_inst.M1_MID == 0;}); #20;
            `uvm_do(M1_seqi_inst);
        end


        //master-2 to slave0 fixed write burst
        if (scenario == 2)
        begin

            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (1);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 4'h1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_AWBURST == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
        end
    
        //master2_slave1_fixed write burst
        if (scenario == 3)
        begin

            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 4'h1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_AWBURST == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
        end
        //master2_slave3_fixed_write_burst
        if (scenario == 4)
        begin

            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (1);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 4'h1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_AWBURST == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
        end

        //master1_slave5_fixed_write
        if (scenario == 5)
        begin

            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (1);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 4'h1;

                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_AWBURST == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
        end

        //master1_slave0_fixed_read
        // read scenario
        if (scenario == 6)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (1);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        
        //master1_slave1_fixed_read
        if (scenario == 7)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        //master1_slave4_fixed_read
        if (scenario == 8)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (1);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);

        end

        //master1_slave5_fixed_read
        if (scenario == 9)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (1);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        // write burst 4beat
        //master2_slave1_4 beat write_burst
        if (scenario == 10)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;  // doing apb slave burst here keep 1
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end
        // write burst 8 beat
        //master2_slave1_8 beat write_burst
        if (scenario == 11)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end
        // write burst 16 beat
        //master2_slave1_16 beat write_burst
        if (scenario == 12)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end


        //master2_slave4_4 beat write_burst
        if (scenario == 13)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (1);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;  // doing apb slave burst here keep 1
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 3;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end
        // write burst 8 beat
        //master2_slave5_8 beat write_burst
        if (scenario == 14)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (1);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 7;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end
        // write burst 16 beat
        //master2_slave3_ 16 beat write_burst
        if (scenario == 15)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (1);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 15;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end


        //master2_slave4  8 beat wrap_write_burst
        if (scenario == 16)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_AWADDR == 32'hA006_2010;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 7;
                    M1_seqi_inst.M1_AWBURST == 2;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end
        // write burst 16 beat

        //master2_slave5 16 beat wrap_write_burst
        if (scenario == 17)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_AWADDR == 32'hA006_3034;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 15;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);

        end


        // read burst 4 beat
        //master1_slave1 4 beat read burst
        if (scenario == 18)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        // read burst 8 beat
        //master1_slave1 8 beat read burst
        if (scenario == 19)
        begin
    
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==7;
                    M1_seqi_inst.M1_ARBURST == 2;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
    

        // read burst 16 beat
        //master1_slave1 16 beat read burst
        if (scenario == 20)
        begin
    
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (1);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        
        //master1_slave2 4 beat read burst
        if (scenario == 21)
        begin
    
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (1);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==3;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end


        //master1_slave5 4 beat read burst
        if (scenario == 22)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (1);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==3;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
    
        // read burst 8 beat
        //master1_slave3 8 beat read burst
        if (scenario == 23)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (1);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==7;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        //master1_slave5 16 beat read burst
        if (scenario == 24)
        begin
    
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (1);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==15;
                    M1_seqi_inst.M1_ARBURST == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        //master1_slave4 8 beat read burst
        if (scenario == 25)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARADDR == 32'hA006_2010;
                    M1_seqi_inst.M1_ARLEN ==7;
                    M1_seqi_inst.M1_ARBURST == 2;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
    
        //master1_slave3 16 beat wrap_read burst
        if (scenario == 26)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARADDR == 32'hA006_1030;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==15;
                    M1_seqi_inst.M1_ARBURST == 2;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end


        // read burst 16 beat
        //master1_slave4 16 beat read burst
        if (scenario == 27)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (1);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==15;
                    M1_seqi_inst.M1_ARBURST == 2;
                    M1_seqi_inst.M1_ARSIZE == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        //decode error
        if (scenario == 28)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (1);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        //randomize the all the slaves
        if (scenario == 29)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (1);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;        
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });


            finish_item(M1_seqi_inst);
        end
        //master1 - slave5 slaveerror
        if (scenario == 30)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (1);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;        
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_WSTRB == 4'h0;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_BREADY == 1; });


            finish_item(M1_seqi_inst);
        end

        //master1 - slave2 slaveerror
        if (scenario == 31)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (1);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;        
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_WSTRB == 4'h0;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });


            finish_item(M1_seqi_inst);
        end
        //master1 - slave5 last address burst scenario
        if (scenario == 32)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_AWADDR == 32'hA006_33FF;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 7;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });

            finish_item(M1_seqi_inst);

        end
        //master1 - slave4 last address burst scenario
        if (scenario == 33)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_AWADDR == 32'hA006_23FF;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 7;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
          end
        //slave 2 end address
        if (scenario == 34)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARADDR == 32'hA006_03FE;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==7;
                    M1_seqi_inst.M1_ARBURST == 2;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        //slave 3 end address
        if (scenario == 35)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARADDR == 32'HA006_13FF;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==7;
                    M1_seqi_inst.M1_ARBURST == 1;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        //slave 4 end address
        if (scenario == 36)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARADDR == 32'HA006_23FF;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==3;
                    //M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        //slave5  end address
        if (scenario == 37)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARADDR == 32'HA006_33FF;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==3;
                    //M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        //master1 - slave2 fixed burst scenario
        if (scenario == 38)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (1);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
          end

        //master1 - slave4 fixed burst scenario
        if (scenario == 39)
        begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (1);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWSIZE == 2;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
          end

        //slave2 fixed read burst 
        if (scenario == 40)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (1);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end

        //slave3  read fixed burst
        if (scenario == 41)
        begin
            //repeat (3) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (1);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 1;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        if (scenario == 42)
        begin
            //repeat (3) begin
            int i;
            for (i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARADDR == i;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
        end
        end

        if (scenario == 43)
        begin

            int i;
            for (i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (1);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 4'h1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_AWADDR == i;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_AWBURST == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });

            finish_item(M1_seqi_inst);
                `uvm_info ("M1_AWADDR",$sformatf("m1_awaddr = %0h",i),UVM_LOW)
            end
        end

        if (scenario == 44)
        begin
            //repeat (3) begin
            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);
            start_item (M1_seqi_inst);
            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 0;
                    M1_seqi_inst.M1_ARVALID == 1'b1;
                    M1_seqi_inst.M1_ARADDR == i;
                    M1_seqi_inst.M1_ARLEN ==0;
                    M1_seqi_inst.M1_ARBURST == 0;
                    M1_seqi_inst.M1_RREADY == 1'b1;
                    M1_seqi_inst.M1_MID ==1; });
            finish_item(M1_seqi_inst);
            end
        end

        if (scenario == 45)
        begin

            int i;
            for (i=32'hA004_0000;i<32'hA005_FFFF;i=i+1) begin
            M1_seqi_inst = M1_seq_item::type_id::create("M1_seqi_inst");
            start_item (M1_seqi_inst);
            M1_seqi_inst.addr_slv0.constraint_mode (0);
            M1_seqi_inst.addr_slv1.constraint_mode (0);
            M1_seqi_inst.addr_slv2.constraint_mode (0);
            M1_seqi_inst.addr_slv3.constraint_mode (0);
            M1_seqi_inst.addr_slv4.constraint_mode (0);
            M1_seqi_inst.addr_slv5.constraint_mode (0);
            M1_seqi_inst.invalid_addr.constraint_mode (0);
            M1_seqi_inst.rand_addr.constraint_mode (0);

            assert(M1_seqi_inst.randomize() with {M1_seqi_inst.m1_burst == 0;
                    M1_seqi_inst.wrt_e == 1;
                    M1_seqi_inst.M1_MID    == 4'h1;
                    M1_seqi_inst.M1_AWVALID == 1'b1;
                    M1_seqi_inst.M1_AWADDR == i;
                    M1_seqi_inst.M1_WVALID==1'b1;
                    M1_seqi_inst.M1_BREADY==1'b1;
                    M1_seqi_inst.M1_AWLEN == 0;
                    M1_seqi_inst.M1_AWBURST == 0;
                    M1_seqi_inst.M1_WSTRB == 4'hf;
                    M1_seqi_inst.M1_WLAST == 1;
                    M1_seqi_inst.M1_BREADY == 1; });



            finish_item(M1_seqi_inst);
        end
        end 


    endtask
endclass  
