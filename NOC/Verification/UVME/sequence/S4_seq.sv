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
* File Name : S4_seq.sv

* Purpose :

* Creation Date : 08-03-2023

* Last Modified : Sun 12 Feb 2023 09:11:55 PM IST

* Created By : G.SUNENDRA. 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/

class S4_seq extends uvm_sequence#(S4_seq_item);
    //creating handle for seq_item
    S4_seq_item S4_seqi_inst;
    virtual S4_inf S4_intf;
    virtual M0_inf M0_intf;
    
    `uvm_object_utils (S4_seq)


    int scenario;


    //constructor
    function new (string name= "S4_seq" );
        super.new(name);
    endfunction

    task body();
        `uvm_info (get_type_name(),"slv1 seq:inside body",UVM_LOW);
        // repeat (8) begin
        if (scenario == 2)
            begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 1;
                    S4_seqi_inst.s4_blen == 0;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        // end
        
        // read sequence
        if (scenario == 3)
            begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 0;
                    S4_seqi_inst.s4_blen == 0;                                                  
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        if (scenario == 4)        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
        
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 1;
                    S4_seqi_inst.s4_blen == 3;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        if (scenario == 5)
        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 1;
                    S4_seqi_inst.s4_blen == 7;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        if (scenario == 6)
        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 1;
                    S4_seqi_inst.s4_blen == 15;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        
        
        if (scenario == 7)
        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
        
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 0;
                    S4_seqi_inst.s4_blen == 3;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        if (scenario == 8)        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 0;
                    S4_seqi_inst.s4_blen == 7;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        if (scenario == 9)
        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 0;
                    S4_seqi_inst.s4_blen == 15;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
        
               
        
        if (scenario == 10)
        
        begin
            S4_seqi_inst = S4_seq_item::type_id::create("S4_seqi_inst");
            start_item (S4_seqi_inst);
            assert(S4_seqi_inst.randomize()with { S4_seqi_inst.is_write == 1;
                    S4_seqi_inst.s4_blen == 0;
                    S4_seqi_inst.S4_PREADY == 1;
                    S4_seqi_inst.S4_PSLVERR == 0;
                    }); 
        
            finish_item (S4_seqi_inst);
        end
    endtask
endclass



