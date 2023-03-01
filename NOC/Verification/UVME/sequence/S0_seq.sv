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
* File Name : S0_seq.sv

* Purpose :

* Creation Date : 

* Last Modified : Mon 20 Feb 2023 01:24:06 AM IST

* Created By : G.SUNENDRA 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/


class S0_seq extends uvm_sequence#(S0_seq_item);
    S0_seq_item S0_seqi_inst;
    `uvm_object_utils (S0_seq)
    int scenario;

    function new (string name= "S0_seq" );
        super.new(name);
    endfunction

    task body();
        `uvm_info (get_type_name(),"slv0 seq:inside body",UVM_LOW);
        if (scenario == 2)
        begin
            // repeat (4) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 1;
                    S0_seqi_inst.S0_AWREADY == 1;
                    S0_seqi_inst.S0_WREADY == 1;
                    S0_seqi_inst.S0_BID == 'h00;

                    S0_seqi_inst.S0_BVALID == 1; 
                    S0_seqi_inst.S0_BRESP == 2'b01; }); 

            finish_item (S0_seqi_inst);
        end

        //master1
        if (scenario == 3)
        begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 1;
                    S0_seqi_inst.S0_AWREADY == 1;
                    S0_seqi_inst.S0_WREADY == 1;
                    S0_seqi_inst.S0_BID == 'h10;

                    S0_seqi_inst.S0_BVALID == 1; 
                    S0_seqi_inst.S0_BRESP == 2'b01; }); 

            finish_item (S0_seqi_inst);
            end


        if (scenario == 4)
        begin
            
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 0;
                    S0_seqi_inst.S0_ARREADY == 1;                                                  
                    //   S0_seqi_inst.S0_RDATA == 32'hBABA_DADA;
                    S0_seqi_inst.S0_RID == 8'H00;
                    S0_seqi_inst.S0_RVALID == 1;
                    S0_seqi_inst.S0_RRESP == 2;
                    S0_seqi_inst.S0_RLAST == 1;

                    });
            finish_item (S0_seqi_inst); end

        if (scenario == 5)
        begin
            // repeat (3) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 0;
                    S0_seqi_inst.S0_ARREADY == 1;                                                  
                    S0_seqi_inst.S0_RID == 8'H10;
                    S0_seqi_inst.S0_RVALID == 1;
                    S0_seqi_inst.S0_RRESP == 2;
                    S0_seqi_inst.S0_RLAST == 1;

                    });
            finish_item (S0_seqi_inst);

        end

        if (scenario == 6)
        begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 1;
                    S0_seqi_inst.S0_AWREADY == 1;
                    S0_seqi_inst.S0_WREADY == 1;
                    S0_seqi_inst.S0_BID == 8'h00;

                    S0_seqi_inst.S0_BVALID == 1; 
                    S0_seqi_inst.S0_BRESP == 2'b01; }); 

            finish_item (S0_seqi_inst);

        end
        if (scenario == 7)
        begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 1;
                    S0_seqi_inst.S0_AWREADY == 1;
                    S0_seqi_inst.S0_WREADY == 1;
                    S0_seqi_inst.S0_BID == 8'h10;

                    S0_seqi_inst.S0_BVALID == 1; 
                    S0_seqi_inst.S0_BRESP == 2'b01; }); 

            finish_item (S0_seqi_inst);

        end



        if (scenario == 8)
        begin
            // repeat (3) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 0;
                    S0_seqi_inst.S0_ARREADY == 1;                                                  
                    S0_seqi_inst.S0_RID == 0;
                    S0_seqi_inst.S0_RVALID == 1;
                    S0_seqi_inst.S0_RRESP == 2;
                    S0_seqi_inst.S0_RLAST == 1;

                    });
        finish_item (S0_seqi_inst);
       end

        if (scenario == 9)
        begin
            // repeat (3) begin
            int i;
            for ( i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 0;
                    S0_seqi_inst.S0_ARREADY == 1;                                                  
                    S0_seqi_inst.S0_RID == 8'H10;
                    S0_seqi_inst.S0_RVALID == 1;
                    S0_seqi_inst.S0_RRESP == 2;
                    S0_seqi_inst.S0_RLAST == 1;

                    });
            finish_item (S0_seqi_inst);
        end
        end

        if (scenario == 10)
        begin
            int i;
            for ( i=32'hA000_0000;i < 32'hA000_3FFF;i=i+1) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 1;
                    S0_seqi_inst.S0_AWREADY == 1;
                    S0_seqi_inst.S0_WREADY == 1;
                    S0_seqi_inst.S0_BID == 8'h10;

                    S0_seqi_inst.S0_BVALID == 1; 
                    S0_seqi_inst.S0_BRESP == 2'b01; }); 

            finish_item (S0_seqi_inst);
            end
        end

        if (scenario == 11)
        begin
            // repeat (3) begin
            int i;
            for ( i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 0;
                    S0_seqi_inst.S0_ARREADY == 1;                                                  
                    S0_seqi_inst.S0_RID == 8'H00;
                    S0_seqi_inst.S0_RVALID == 1;
                    S0_seqi_inst.S0_RRESP == 2;
                    S0_seqi_inst.S0_RLAST == 1;

                    });
            finish_item (S0_seqi_inst);
        end
        end

        if (scenario == 12)
        begin
            int i;
            for ( i=32'hA000_0000;i<32'hA000_3FFF;i=i+1) begin
            S0_seqi_inst = S0_seq_item::type_id::create("S0_seqi_inst");
            start_item (S0_seqi_inst);
            assert(S0_seqi_inst.randomize()with {S0_seqi_inst.is_write == 1;
                    S0_seqi_inst.S0_AWREADY == 1;
                    S0_seqi_inst.S0_WREADY == 1;
                    S0_seqi_inst.S0_BID == 8'h00;

                    S0_seqi_inst.S0_BVALID == 1; 
                    S0_seqi_inst.S0_BRESP == 2'b01; }); 

            finish_item (S0_seqi_inst);
            end
        end
    
    
    endtask
endclass

