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
* File Name : S2_seq.sv

* Purpose :

* Creation Date : 

* Last Modified : Tue 14 Feb 2023 05:44:29 PM IST

* Created By : G.SUNENDRA 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/

class S2_seq extends uvm_sequence#(S2_seq_item);
    //creating handle for seq_item
    S2_seq_item S2_seqi_inst;
    virtual S2_inf S2_intf;
    virtual M0_inf m0_intf;
    
    `uvm_object_utils (S2_seq)


    int scenario;
   

    //constructor
    function new (string name= "S2_seq" );
        super.new(name);
    endfunction

    task body();
        `uvm_info (get_type_name(),"slv1 seq:inside body",UVM_LOW);
        // repeat (8) begin
        if (scenario == 2)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 1;
                    S2_seqi_inst.s2_blen == 0;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end


        // read sequence
        if (scenario == 3)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 0;
                    S2_seqi_inst.s2_blen == 0;                                                  
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end
        if (scenario == 4)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);

            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 1;
                    S2_seqi_inst.s2_blen == 3;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end

       
        if (scenario == 5)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 1;
                    S2_seqi_inst.s2_blen == 7;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end
        if (scenario == 6)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 1;
                    S2_seqi_inst.s2_blen == 15;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

        finish_item (S2_seqi_inst);
        end

        if (scenario == 7)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);

            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 0;
                    S2_seqi_inst.s2_blen == 3;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end
        if (scenario == 8)
        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 0;
                    S2_seqi_inst.s2_blen == 7;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end
        if (scenario == 9)

        begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 0;
                    S2_seqi_inst.s2_blen == 15;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 

            finish_item (S2_seqi_inst);
        end


        if (scenario == 10)
        
            begin
            S2_seqi_inst = S2_seq_item::type_id::create("S2_seqi_inst");
            start_item (S2_seqi_inst);
            assert(S2_seqi_inst.randomize()with { S2_seqi_inst.is_write == 1;
                    S2_seqi_inst.s2_blen == 0;
                    S2_seqi_inst.S2_PREADY == 1;
                    S2_seqi_inst.S2_PSLVERR == 0;
                    }); 
        
            finish_item (S2_seqi_inst);
        end
    endtask
endclass



