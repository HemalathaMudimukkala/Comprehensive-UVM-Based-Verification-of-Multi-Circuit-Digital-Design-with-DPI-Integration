//testbench.sv file
`include "uvm_macros.svh"
  import uvm_pkg::*;

import "DPI-C" function void send_to_cpp(input int rst1, input int din1);

import "DPI-C" function void send_to_mul(input int numa, input int numb);

import "DPI-C" function void send_to_mux(input int sel1, input int in1);

import "DPI-C" function void send_to_demux(input int demux_sel1, input int demux_in1);

import "DPI-C" function void send_to_ha(input int ha_a1, input int ha_b1);

import "DPI-C" function void send_to_fa(input int fa_a1, input int fa_b1, input int fa_cin1);

import "DPI-C" function void send_to_buf(input int buff_in1);

import "DPI-C" function void send_to_hs(input int hs_a1, input int hs_b1);

import "DPI-C" function void send_to_fs(input int fs_a1, input int fs_b1, input int fs_bin1);

import "DPI-C" function void send_to_dec(input int dec_in1);

import "DPI-C" function void send_to_enc(input int enc_in1);

import "DPI-C" function void send_to_comp(input int comp_a1, input int comp_b1);

import "DPI-C" function void send_to_tff(input int rst1, input int tin1);

import "DPI-C" function void send_to_jkff(input int rst1, input int j1,input int k1);

import "DPI-C" function void send_to_srff(input int rst1, input int s1,input int r1);

import "DPI-C" function void send_to_d_latch(input int rst1, input int en1,input int d_latch1);

import "DPI-C" function void send_to_t_latch(input int rst1, input int en1,input int t_latch1);

import "DPI-C" function void send_to_sr_latch(input int rst1, input int en1,input int s_latch1,input int r_latch1);

import "DPI-C" function void send_to_jk_latch(input int rst1, input int en1,input int j_latch1,input int k_latch1);

import "DPI-C" function void send_to_counter(input int rstcnt1);

import "DPI-C" function void send_to_siso(input int rstsiso1,input int insiso1);

class transaction extends uvm_sequence_item;
`uvm_object_utils(transaction)
  
  rand bit rst;
  rand bit din;
       bit dout;
          
   function new(input string path = "transaction");
    super.new(path);
   endfunction
   
endclass 

class transaction1 extends uvm_sequence_item;
  `uvm_object_utils(transaction1)
  
  rand bit [3:0] num1;
  rand bit [3:0] num2;
  bit [7:0] mul;
  
  function new(input string path = "transaction1");
    super.new(path);
  endfunction
  
endclass

class transaction2 extends uvm_sequence_item;
  `uvm_object_utils(transaction2)
  
  rand bit [1:0] sel;
  rand bit [3:0] in;
  bit mux_out;
  
  function new(input string path = "transaction2");
    super.new(path);
  endfunction
  
endclass

class transaction3 extends uvm_sequence_item;
  `uvm_object_utils(transaction3)
  
  rand bit [1:0] demux_sel;
  rand bit demux_in;
  bit [3:0] demux_out;
  
  function new(input string path="transaction3");
    super.new(path);
  endfunction
  
endclass

class transaction4 extends uvm_sequence_item;
  `uvm_object_utils(transaction4)
  
  rand bit ha_a,ha_b;
  //rand bit ha_b;
  bit ha_sum;
  bit ha_cout;
  constraint ha_c{
    ha_a dist{0:=50,1:=50};
    ha_b dist{0:=50,1:=50};
    
  }
  function new(input string path="transaction4");
    super.new(path);
  endfunction
  
endclass

class transaction5 extends uvm_sequence_item;
  `uvm_object_utils(transaction5)
  
  rand bit fa_a,fa_b,fa_cin;
  bit fa_sum,fa_cout;
  
  constraint fa_c{
    fa_a dist{0:=50,1:=50};
    fa_b dist{0:=50,1:=50};
    fa_cin dist{0:=50,1:=50};
  }
  function new(input string path="transaction5");
    super.new(path);
  endfunction
  
endclass

class transaction6 extends uvm_sequence_item;
  `uvm_object_utils(transaction6)
  
  rand bit [3:0] buff_in;
  bit [3:0] buff_out;
  
  function new(input string path="transaction6");
    super.new(path);
  endfunction
  
endclass

class transaction7 extends uvm_sequence_item;
  `uvm_object_utils(transaction7)
  
  rand bit hs_a;
  rand bit hs_b;
  bit hs_diff,hs_bout;
  
  constraint hs_c{
    hs_a dist{0:=50,1:=50};
    hs_b dist{0:=50,1:=50};
  }
  function new(input string path="transaction7");
    super.new(path);
  endfunction
  
endclass

class transaction8 extends uvm_sequence_item;
  `uvm_object_utils(transaction8)
  
  rand bit fs_a,fs_b,fs_bin;
  bit fs_diff,fs_bout;
  
  constraint fs_c{
    fs_a dist{0:=50,1:=50};
    fs_b dist{0:=50,1:=50};
    fs_bin dist{0:=50,1:=50};
  }
  function new(input string path="transaction8");
    super.new(path);
  endfunction
  
endclass 

class transaction9 extends uvm_sequence_item;
  `uvm_object_utils(transaction9)
  
  rand bit [1:0] dec_in;
  bit [3:0] dec_out;
  
  function new(input string path="transaction9");
    super.new(path);
  endfunction
  
endclass 

class transaction10 extends uvm_sequence_item;
  `uvm_object_utils(transaction10)
  
  rand bit [3:0] enc_in;
  bit [1:0] enc_out;
  
  constraint enc_c{
    enc_in<9;
  }
  function new(input string path="transaction10");
    super.new(path);
  endfunction
  
endclass 

class transaction11 extends uvm_sequence_item;
  `uvm_object_utils(transaction11)
  
  rand bit comp_a;
  rand bit comp_b;
  bit [2:0] comp_out;
  
  constraint comp_c{
    comp_a dist{0:=50,1:=50};
    comp_b dist{0:=50,1:=50};
  }
  
  function new(input string path="transaction11");
    super.new(path);
  endfunction
  
endclass 

class transaction12 extends uvm_sequence_item;
  `uvm_object_utils(transaction12)
  
  rand bit rst_t_ff;
  rand bit tin;
  bit tout;
  
  constraint tff_c{
    rst_t_ff dist{0:=90,1:=10};
    tin dist{0:=50,1:=50};
  }
  function new(input string path="transaction12");
    super.new(path);
  endfunction
  
endclass 

class transaction13 extends uvm_sequence_item;
  `uvm_object_utils(transaction13)
  
  rand bit j;
  rand bit k;
  rand bit rst_jk_ff;
  bit jk_out;
  
  constraint jkff_c{
    rst_jk_ff dist{0:=90,1:=10};
    j dist{0:=50,1:=50};
    k dist{0:=50,1:=50};
  }
  
  function new(input string path="transaction13");
    super.new(path);
  endfunction
  
endclass 

class transaction14 extends uvm_sequence_item;
  `uvm_object_utils(transaction14)
  
  rand bit s;
  rand bit r;
  rand bit rst_sr_ff;
  bit sr_out;
  
  function new(input string path="transaction14");
    super.new(path);
  endfunction
  
  constraint rst_sr_ff_c{
    rst_sr_ff dist{1:=20, 0:=90};
    s dist{0:=50, 1:=50};
    r dist{0:=50, 1:=50};
  }
    
  
endclass 

class transaction15 extends uvm_sequence_item;
  `uvm_object_utils(transaction15)
  
  rand bit en;
  rand bit d_latch;
  rand bit rst_d_latch;
  bit d_latch_out;
  
  constraint d_latch_c{
    rst_d_latch dist{0:=90,1:=10};
    en dist{0:=30,1:=70};
    d_latch dist{0:=50,1:=50};
  }
  
  function new(input string path="transaction15");
    super.new(path);
  endfunction
  
endclass 

class transaction16 extends uvm_sequence_item;
  `uvm_object_utils(transaction16)
  
  rand bit en_t;
  rand bit t_latch;
  rand bit rst_t_latch;
  bit t_latch_out;
  
  constraint t_latch_c{
    rst_t_latch dist{0:=80, 1:=20};
    en_t dist{0:=30,1:=70};
    t_latch dist{0:=50, 1:=50};
  }
  
  function new(input string path="transaction16");
    super.new(path);
  endfunction
  
endclass 

class transaction17 extends uvm_sequence_item;
  `uvm_object_utils(transaction17)
  
  rand bit en_sr;
  rand bit s_l;
  rand bit r_l;
  rand bit rst_sr_latch;
  bit sr_latch_out;
  
  constraint sr_latch_c{
    rst_sr_latch dist{0:=70,1:=30};
    en_sr dist{0:=10, 1:=90};
    s_l dist{0:=50,1:=50};
    r_l dist{0:=50,1:=50};
  }
    
    
  
  function new(input string path="transaction17");
    super.new(path);
  endfunction
  
endclass 

class transaction18 extends uvm_sequence_item;
  `uvm_object_utils(transaction18)
  
  rand bit en_jk;
  rand bit j_l;
  rand bit k_l;
  rand bit rst_jk_latch;
  bit jk_latch_out;
  
  constraint jk_latch_c{
    rst_jk_latch dist{1:=30, 0:=70};
    en_jk dist{0:=10, 1:=90};
    j_l dist{0:=50,1:=50};
    k_l dist{0:=50,1:=50};
  }
        
  function new(input string path="transaction18");
    super.new(path);
  endfunction
  
endclass 

class transaction19 extends uvm_sequence_item;
  `uvm_object_utils(transaction19)
  
  rand bit rstcnt;
  bit [3:0] count_out;
  
  constraint counter_c{
    rstcnt dist{1:=10, 0:=90};
  }
        
  function new(input string path="transaction19");
    super.new(path);
  endfunction
  
endclass 

class transaction20 extends uvm_sequence_item;
  `uvm_object_utils(transaction20)
  
  rand bit rstsiso;
  rand bit insiso;
  bit outsiso;
  
  constraint siso_c{
    rstsiso dist{1:=10, 0:=90};
    insiso dist{0:=50,1:=50};
  }
        
  function new(input string path="transaction20");
    super.new(path);
  endfunction
  
endclass 


class valid_din extends uvm_sequence#(transaction);
`uvm_object_utils(valid_din)
  
    transaction tr;
 
   function new(input string path = "valid_din");
    super.new(path);
   endfunction
   
   
   virtual task body(); 
     repeat(5)
     begin
         tr = transaction::type_id::create("tr");
         start_item(tr);
         assert(tr.randomize());
         tr.rst = 1'b0; 
       //`uvm_info("SEQ:valid_din", $sformatf("rst : %0b  din : %0b  dout : %0b", tr.rst, tr.din, tr.dout), UVM_NONE);
         finish_item(tr);     
     end
   endtask
 
endclass


class rst_dff extends uvm_sequence#(transaction);
`uvm_object_utils(rst_dff)
  
    transaction tr;
 
   function new(input string path = "rst_dff");
    super.new(path);
   endfunction
   
   
   virtual task body(); 
     repeat(3)
     begin
         tr = transaction::type_id::create("tr");
         start_item(tr);
         assert(tr.randomize());
         tr.rst = 1'b1;
       //`uvm_info("SEQ:rst_dff", $sformatf("rst : %0b  din : %0b  dout : %0b", tr.rst, tr.din, tr.dout), UVM_NONE);
         finish_item(tr);     
     end
   endtask
 
endclass
 

class rand_din_rst extends uvm_sequence#(transaction);
`uvm_object_utils(rand_din_rst)
  
    transaction tr;
 
   function new(input string path = "rand_din_rst");
    super.new(path);
   endfunction
   
   
   virtual task body(); 
     repeat(2000)
     begin
         tr = transaction::type_id::create("tr");
         start_item(tr);
         assert(tr.randomize());
      //`uvm_info("SEQ:rand_din_rst", $sformatf("rst : %0b  din : %0b  dout : %0b", tr.rst, tr.din, tr.dout), UVM_NONE);
         finish_item(tr);     
     end
   endtask
 
endclass

class seq_mul extends uvm_sequence#(transaction1);
  `uvm_object_utils(seq_mul)
  
  transaction1 tr1;
  
  function new(input string path="seq_mul");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr1 = transaction1::type_id::create("tr1");
        start_item(tr1);
        assert(tr1.randomize());
        //`uvm_info("SEQ:seqdff",$sformatf("num1:%0d,num2:%0d,mul:%0d",tr1.num1,tr1.num2,tr1.mul),UVM_NONE); 
        finish_item(tr1);
      end
    endtask
endclass

class seq_mux extends uvm_sequence#(transaction2);
  `uvm_object_utils(seq_mux)
  
  transaction2 tr2;
  
  function new(input string path="seq_mux");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr2 = transaction2::type_id::create("tr2");
        start_item(tr2);
        assert(tr2.randomize());
        //`uvm_info("SEQ:seq_mux",$sformatf("sel:%b,in:%b,mux_out:%b",tr2.sel,tr2.in,tr2.mux_out),UVM_NONE);
        finish_item(tr2);
      end
  endtask
endclass

class seq_demux extends uvm_sequence#(transaction3);
  `uvm_object_utils(seq_demux)
  
  transaction3 tr3;
  
  function new(input string path="seq_mux");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr3 = transaction3::type_id::create("tr3");
        start_item(tr3);
        assert(tr3.randomize());
        //`uvm_info("SEQ:seq_demux",$sformatf("demux_sel:%0b,demux_in:%0b,demux_out:%0b",tr3.demux_sel,tr3.demux_in,tr3.demux_out),UVM_NONE);
        finish_item(tr3);
      end
  endtask
endclass

class seq_ha extends uvm_sequence#(transaction4);
  `uvm_object_utils(seq_ha)
  
  transaction4 tr4;
  
  function new(input string path="seq_ha");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr4= transaction4::type_id::create("tr4");
        start_item(tr4);
        assert(tr4.randomize());
        //`uvm_info("SEQ:seq_ha",$sformatf("ha_a:%0b,ha_b:%0b,ha_sum:%0b,ha_cout:%0b",tr4.ha_a,tr4.ha_b,tr4.ha_sum,tr4.ha_cout),UVM_NONE);
        finish_item(tr4);
      end
  endtask
endclass

class seq_fa extends uvm_sequence#(transaction5);
  `uvm_object_utils(seq_fa)
  
  transaction5 tr5;
  
  function new(input string path="seq_fa");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr5 = transaction5::type_id::create("tr5");
        start_item(tr5);
        assert(tr5.randomize());
    //`uvm_info("SEQ:seq_fa",$sformatf("fa_a:%0b,fa_b:%0b,fa_cin:%0b,fa_sum:%0b,fa_cout:%0b",tr5.fa_a,tr5.fa_b,tr5.fa_cin,tr5.fa_sum,tr5.fa_cout),UVM_NONE);
        finish_item(tr5);
    end
  endtask
endclass

class seq_buf extends uvm_sequence#(transaction6);
  `uvm_object_utils(seq_buf)
  
  transaction6 tr6;
  
  function new(input string path="seq_buf");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr6 = transaction6::type_id::create("tr6");
        start_item(tr6);
        assert(tr6.randomize());
        //`uvm_info("SEQ:seq_buf",$sformatf("buff_in:%0d, buff_out:%0d",tr6.buff_in,tr6.buff_out),UVM_NONE);
        finish_item(tr6);
      end
  endtask
endclass
      
class seq_hs extends uvm_sequence#(transaction7);
  `uvm_object_utils(seq_hs)
  
  transaction7 tr7;
  
  function new(input string path="seq_hs");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr7 = transaction7::type_id::create("tr7");
        start_item(tr7);
        assert(tr7.randomize());
        //`uvm_info("SEQ:seq_hs",$sformatf("hs_a:%0b, hs_b:%0b, hs_diff:%0b, hs_bout:%0b",tr7.hs_a,tr7.hs_b,tr7.hs_diff,tr7.hs_bout),UVM_NONE);
        finish_item(tr7);
      end
  endtask
endclass

class seq_fs extends uvm_sequence#(transaction8);
  `uvm_object_utils(seq_fs)
  
  transaction8 tr8;
  
  function new(input string path="seq_fs");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr8 = transaction8::type_id::create("tr8");
        start_item(tr8);
        assert(tr8.randomize());
        //`uvm_info("SEQ:seq_fs",$sformatf("fs_a:%0b,fs_b:%0b,fs_bin:%0b,fs_diff:%0b,fs_bout:%0b",tr8.fs_a,tr8.fs_b,tr8.fs_bin,tr8.fs_diff,tr8.fs_bout),UVM_NONE);
        finish_item(tr8);
    end
  endtask
endclass

class seq_dec extends uvm_sequence#(transaction9);
  `uvm_object_utils(seq_dec)
  
  transaction9 tr9;
  
  function new(input string path="seq_dec");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr9 = transaction9::type_id::create("tr9");
        start_item(tr9);
        assert(tr9.randomize());
        //`uvm_info("SEQ:seq_dec",$sformatf("dec_in:%0b,dec_out:%0b",tr9.dec_in,tr9.dec_out),UVM_NONE);
        finish_item(tr9);
      end
  endtask
endclass

class seq_enc extends uvm_sequence#(transaction10);
  `uvm_object_utils(seq_enc)
  
  transaction10 tr10;
  
  function new(input string path="seq_enc");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr10 = transaction10::type_id::create("tr10");
        start_item(tr10);
        assert(tr10.randomize());
        //`uvm_info("SEQ:seq_enc",$sformatf("enc_in:%0b,enc_out:%0b",tr10.enc_in,tr10.enc_out),UVM_NONE);
        finish_item(tr10);
      end
  endtask
endclass

class seq_comp extends uvm_sequence#(transaction11);
  `uvm_object_utils(seq_comp)
  
  transaction11 tr11;
  
  function new(input string path="seq_comp");
    super.new(path);
  endfunction
  
  virtual task body();
    repeat(500)
      begin
        tr11 = transaction11::type_id::create("tr11");
        start_item(tr11);
        assert(tr11.randomize());
        //`uvm_info("SEQ:seq_comp",$sformatf("comp_a:%0b,comp_b:%0b,comp_out:%0b",tr11.comp_a,tr11.comp_b,tr11.comp_out),UVM_NONE);
        finish_item(tr11);
      end
  endtask
endclass

class seq_tff extends uvm_sequence#(transaction12);
  `uvm_object_utils(seq_tff)
  
  transaction12 tr12;
 
  function new(input string path = "seq_tff");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr12 = transaction12::type_id::create("tr12");
        start_item(tr12);
        assert(tr12.randomize());
        //`uvm_info("SEQ:seq_tff", $sformatf("rst_t_ff: %0b  tin : %0b  tout : %0b", tr12.rst_t_ff, tr12.tin, tr12.tout), UVM_NONE);
        finish_item(tr12);     
     end
   endtask
 
endclass

class seq_jkff extends uvm_sequence#(transaction13);
  `uvm_object_utils(seq_jkff)
  
  transaction13 tr13;
 
  function new(input string path = "seq_jkff");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr13 = transaction13::type_id::create("tr13");
        start_item(tr13);
        assert(tr13.randomize());
        //`uvm_info("SEQ:seq_jkff", $sformatf("rst_jk_ff:%0b,j:%0b,k:%0b,jk_out:%0b", tr13.rst_jk_ff, tr13.j,tr13.k,tr13.jk_out), UVM_NONE);
        finish_item(tr13);     
     end
   endtask
 
endclass

class seq_srff extends uvm_sequence#(transaction14);
  `uvm_object_utils(seq_srff)
  
  transaction14 tr14;
 
  function new(input string path = "seq_srff");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr14 = transaction14::type_id::create("tr14");
        start_item(tr14);
        assert(tr14.randomize());
        //`uvm_info("SEQ:seq_srff", $sformatf("rst_sr_ff:%0b,s:%0b,r:%0b,sr_out:%0b", tr14.rst_sr_ff, tr14.s,tr14.r,tr14.sr_out), UVM_NONE);
        finish_item(tr14);    
     end
   endtask
 
endclass

class seq_d_latch extends uvm_sequence#(transaction15);
  `uvm_object_utils(seq_d_latch)
 
  transaction15 tr15;
 
  function new(input string path = "seq_d_latch");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr15 = transaction15::type_id::create("tr15");
        start_item(tr15);
        assert(tr15.randomize());
        //`uvm_info("SEQ:seq_d_latch", $sformatf("rst_d_latch:%0b,en:%0b,d_latch:%0b,d_latch_out:%0b", tr15.rst_d_latch, tr15.en,tr15.d_latch,tr15.d_latch_out), UVM_NONE);
        finish_item(tr15);     
     end
   endtask
 
endclass

class seq_t_latch extends uvm_sequence#(transaction16);
  `uvm_object_utils(seq_t_latch)
 
  transaction16 tr16;
 
  function new(input string path = "seq_t_latch");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr16 = transaction16::type_id::create("tr16");
        start_item(tr16);
        assert(tr16.randomize());
        //`uvm_info("SEQ:seq_t_latch", $sformatf("rst_t_latch:%0b,en_t:%0b,t_latch:%0b,t_latch_out:%0b", tr16.rst_t_latch, tr16.en_t,tr16.t_latch,tr16.t_latch_out), UVM_NONE);
        finish_item(tr16);     
     end
   endtask
 
endclass

class seq_sr_latch extends uvm_sequence#(transaction17);
  `uvm_object_utils(seq_sr_latch)
 
  transaction17 tr17;
 
  function new(input string path = "seq_sr_latch");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr17 = transaction17::type_id::create("tr17");
        start_item(tr17);
        assert(tr17.randomize());
        //`uvm_info("SEQ:seq_sr_latch", $sformatf("rst_sr_latch:%0b,en_sr:%0b,s_l:%0b,r_l:%0b,sr_latch_out:%0b", tr17.rst_sr_latch, tr17.en_sr,tr17.s_l,tr17.r_l,tr17.sr_latch_out), UVM_NONE);
        finish_item(tr17);     
     end
   endtask
 
endclass

class seq_jk_latch extends uvm_sequence#(transaction18);
  `uvm_object_utils(seq_jk_latch)
 
  transaction18 tr18;
 
  function new(input string path = "seq_jk_latch");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr18 = transaction18::type_id::create("tr18");
        start_item(tr18);
        assert(tr18.randomize());
        //`uvm_info("SEQ:seq_jk_latch", $sformatf("rst_jk_latch:%0b,en_jk:%0b,j_l:%0b,k_l:%0b,jk_latch_out:%0b", tr18.rst_jk_latch, tr18.en_jk,tr18.j_l,tr18.k_l,tr18.jk_latch_out), UVM_NONE);
        finish_item(tr18);     
     end
   endtask
 
endclass

class seq_count extends uvm_sequence#(transaction19);
  `uvm_object_utils(seq_count)
 
  transaction19 tr19;
 
  function new(input string path = "seq_count");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr19 = transaction19::type_id::create("tr19");
        start_item(tr19);
        assert(tr19.randomize());
        //`uvm_info("SEQ:seq_count", $sformatf("rstcnt:%0b,count_out:%0b", tr19.rstcnt, tr19.count_out), UVM_NONE);
        finish_item(tr19);     
     end
    tr19 = transaction19::type_id::create("tr19");
    start_item(tr19);
    tr19.rstcnt=1;
    //`uvm_info("SEQ:seq_count", $sformatf("rstcnt:%0b,count_out:%0b", tr19.rstcnt, tr19.count_out), UVM_NONE);
    finish_item(tr19);
   endtask
 
endclass

class seq_siso extends uvm_sequence#(transaction20);
  `uvm_object_utils(seq_siso)
 
  transaction20 tr20;
 
  function new(input string path = "seq_siso");
    super.new(path);
  endfunction
  
  virtual task body(); 
    repeat(500)
      begin
        tr20 = transaction20::type_id::create("tr20");
        start_item(tr20);
        assert(tr20.randomize());
        //`uvm_info("SEQ:seq_siso", $sformatf("rstsiso:%0b,insiso:%0b,outsiso:%0b", tr20.rstsiso, tr20.insiso, tr20.outsiso), UVM_NONE);
        #5;
        finish_item(tr20); 
     end
   endtask
 
endclass

class drv extends uvm_driver#(uvm_sequence_item);
  `uvm_component_utils(drv)
 
  transaction tr;
  transaction1 tr1;
  transaction2 tr2;
  transaction3 tr3;
  transaction4 tr4;
  transaction5 tr5;
  transaction6 tr6;
  transaction7 tr7;
  transaction8 tr8;
  transaction9 tr9;
  transaction10 tr10;
  transaction11 tr11;
  transaction12 tr12;
  transaction13 tr13;
  transaction14 tr14;
  transaction15 tr15;
  transaction16 tr16;
  transaction17 tr17;
  transaction18 tr18;
  transaction19 tr19;
  transaction20 tr20;
  uvm_sequence_item req;
 
  function new(input string path = "drv", uvm_component parent = null);
    super.new(path,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);    
  endfunction
  
   virtual task run_phase(uvm_phase phase);
     tr = transaction::type_id::create("tr");
     tr1 = transaction1::type_id::create("tr1");
     tr2 = transaction2::type_id::create("tr2");
     tr3 = transaction3::type_id::create("tr3");
     tr4 = transaction4::type_id::create("tr4");
     tr5 = transaction5::type_id::create("tr5");
     tr6 = transaction6::type_id::create("tr6");
     tr7 = transaction7::type_id::create("tr7");
     tr8 = transaction8::type_id::create("tr8");
     tr9 = transaction9::type_id::create("tr9");
     tr10 = transaction10::type_id::create("tr10");
     tr11 = transaction11::type_id::create("tr11");
     tr12 = transaction12::type_id::create("tr12");
     tr13 = transaction13::type_id::create("tr13");
     tr14 = transaction14::type_id::create("tr14");
     tr15 = transaction15::type_id::create("tr15");
     tr16 = transaction16::type_id::create("tr16");
     tr17 = transaction17::type_id::create("tr17");
     tr18 = transaction18::type_id::create("tr18");
     tr19 = transaction19::type_id::create("tr19");
     tr20 = transaction20::type_id::create("tr20");
     forever 
       begin
         seq_item_port.get_next_item(req);
         if($cast(tr,req)) begin
           send_to_cpp(tr.rst, tr.din);
           //`uvm_info("DRV:dff", $sformatf("rst:%0b,din:%0b,dout:%0b", tr.rst,tr.din,tr.dout), UVM_NONE);
         end
         else if($cast(tr1,req)) begin
           send_to_mul(tr1.num1,tr1.num2);
           //`uvm_info("DRV:mul",$sformatf("num1:%0d,num2:%0d,mul:%0d",tr1.num1,tr1.num2,tr1.mul),UVM_NONE);
         end
         else if($cast(tr2,req)) begin
           send_to_mux(tr2.sel,tr2.in);
           //`uvm_info("DRV:mux",$sformatf("sel:%b,in:%b,mux_out:%b",tr2.sel,tr2.in,tr2.mux_out),UVM_NONE);
         end
         else if($cast(tr3,req)) begin
           send_to_demux(tr3.demux_sel,tr3.demux_in);
           //`uvm_info("DRV:demux",$sformatf("demux_sel:%b,demux_in:%b,demux_out:%b",tr3.demux_sel,tr3.demux_in,tr3.demux_out),UVM_NONE);
         end
         else if($cast(tr4,req)) begin
           send_to_ha(tr4.ha_a,tr4.ha_b);
           //`uvm_info("DRV:ha",$sformatf("ha_a:%0b,ha_b:%0b,ha_sum:%0b,ha_cout:%0b",tr4.ha_a,tr4.ha_b,tr4.ha_sum,tr4.ha_cout),UVM_NONE);
         end
         else if($cast(tr5,req)) begin
           send_to_fa(tr5.fa_a,tr5.fa_b,tr5.fa_cin);          //`uvm_info("DRV:seq_fa",$sformatf("fa_a:%0b,fa_b:%0b,fa_cin:%0b,fa_sum:%0b,fa_cout:%0b",tr5.fa_a,tr5.fa_b,tr5.fa_cin,tr5.fa_sum,tr5.fa_cout),UVM_NONE);
         end
         else if($cast(tr6,req)) begin
           send_to_buf(tr6.buff_in);
           //`uvm_info("DRV:seq_buf",$sformatf("buff_in:%0d, buff_out:%0d",tr6.buff_in,tr6.buff_out),UVM_NONE);
         end
         else if($cast(tr7,req)) begin
           send_to_hs(tr7.hs_a,tr7.hs_b);
           //`uvm_info("DRV:ha",$sformatf("hs_a:%0b,hs_b:%0b,hs_diff:%0b,hs_bout:%0b",tr7.hs_a,tr7.hs_b,tr7.hs_diff,tr7.hs_bout),UVM_NONE);
         end
         else if($cast(tr8,req)) begin
           send_to_fs(tr8.fs_a,tr8.fs_b,tr8.fs_bin);          //`uvm_info("DRV:seq_fs",$sformatf("fs_a:%0b,fs_b:%0b,fs_bin:%0b,fs_diff:%0b,fs_bout:%0b",tr8.fs_a,tr8.fs_b,tr8.fs_bin,tr8.fs_diff,tr8.fs_bout),UVM_NONE);
         end
         else if($cast(tr9,req)) begin
           send_to_dec(tr9.dec_in);
           //`uvm_info("DRV:seq_dec",$sformatf("dec_in:%0b,dec_out:%ob",tr9.dec_in,tr9.dec_out),UVM_NONE);
         end
         else if($cast(tr10,req)) begin
           send_to_enc(tr10.enc_in);
           //`uvm_info("DRV:seq_enc",$sformatf("enc_in:%0b,enc_out:%0b",tr10.enc_in,tr10.enc_out),UVM_NONE);
         end
         else if($cast(tr11,req)) begin
           send_to_comp(tr11.comp_a,tr11.comp_b);
           //`uvm_info("DRV:seq_comp",$sformatf("comp_a:%0b,comp_b:%0b,comp_out:%0b",tr11.comp_a,tr11.comp_b,tr11.comp_out),UVM_NONE);
         end
         else if($cast(tr12,req)) begin
           send_to_tff(tr12.rst_t_ff,tr12.tin);
           //`uvm_info("DRV:seq_tff", $sformatf("rst_t_ff: %0b  tin : %0b  tout : %0b", tr12.rst_t_ff, tr12.tin, tr12.tout), UVM_NONE);
         end
         else if($cast(tr13,req)) begin
           send_to_jkff(tr13.rst_jk_ff,tr13.j,tr13.k);
           //`uvm_info("DRV:seq_jkff", $sformatf("rst_jk_ff:%0b,j:%0b,k:%0b,jk_out:%0b", tr13.rst_jk_ff, tr13.j,tr13.k,tr13.jk_out), UVM_NONE);
         end
         else if($cast(tr14,req)) begin
           send_to_srff(tr14.rst_sr_ff,tr14.s,tr14.r);
           //`uvm_info("DRV:seq_srff", $sformatf("rst_sr_ff:%0b,s:%0b,r:%0b,sr_out:%0b", tr14.rst_sr_ff, tr14.s,tr14.r,tr14.sr_out), UVM_NONE);
         end
         else if($cast(tr15,req)) begin
           send_to_d_latch(tr15.rst_d_latch,tr15.en,tr15.d_latch);
           //`uvm_info("DRV:seq_d_latch", $sformatf("rst_d_latch:%0b,en:%0b,d_latch:%0b,d_latch_out:%0b", tr15.rst_d_latch, tr15.en,tr15.d_latch,tr15.d_latch_out), UVM_NONE);
         end
         else if($cast(tr16,req)) begin
           send_to_t_latch(tr16.rst_t_latch,tr16.en_t,tr16.t_latch);
           //`uvm_info("DRV:seq_t_latch", $sformatf("rst_t_latch:%0b,en_t:%0b,t_latch:%0b,t_latch_out:%0b", tr16.rst_t_latch, tr16.en_t,tr16.t_latch,tr16.t_latch_out), UVM_NONE);
         end
         else if($cast(tr17,req)) begin
           send_to_sr_latch(tr17.rst_sr_latch,tr17.en_sr,tr17.s_l,tr17.r_l);
           //`uvm_info("DRV:seq_sr_latch", $sformatf("rst_sr_latch:%0b,en_sr:%0b,s_l:%0b,r_l:%0b,sr_latch_out:%0b", tr17.rst_sr_latch, tr17.en_sr,tr17.s_l,tr17.r_l,tr17.sr_latch_out), UVM_NONE);
         end
         else if($cast(tr18,req)) begin
           send_to_jk_latch(tr18.rst_jk_latch,tr18.en_jk,tr18.j_l,tr18.k_l);
           //`uvm_info("DRV:seq_jk_latch", $sformatf("rst_jk_latch:%0b,en_jk:%0b,j_l:%0b,k_l:%0b,jk_latch_out:%0b", tr18.rst_jk_latch, tr18.en_jk,tr18.j_l,tr18.k_l,tr18.jk_latch_out), UVM_NONE);
         end
         else if($cast(tr19,req)) begin
           send_to_counter(tr19.rstcnt);
           //`uvm_info("DRV:seq_count", $sformatf("rstcnt:%0b,count_out:%0b", tr19.rstcnt, tr19.count_out), UVM_NONE);
         end
         else if($cast(tr20,req)) begin
           send_to_siso(tr20.rstsiso,tr20.insiso);
           //`uvm_info("DRV:seq_siso", $sformatf("rstsiso:%0b,insiso:%0b,outsiso:%0b", tr20.rstsiso, tr20.insiso, tr20.outsiso), UVM_NONE);
         end
         else begin
           `uvm_error("DRV","Received unknown transaction type")
         end                                              
       seq_item_port.item_done();
       #10;
      end
   endtask
 
endclass



class agent extends uvm_agent;
`uvm_component_utils(agent)
 
function new(input string inst = "agent", uvm_component parent = null);
super.new(inst,parent);
endfunction
 
 drv d;
  uvm_sequencer#(uvm_sequence_item) seqr;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  
    d = drv::type_id::create("d",this); 
  seqr = uvm_sequencer#(uvm_sequence_item)::type_id::create("seqr", this); 
  
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
d.seq_item_port.connect(seqr.seq_item_export);
endfunction
 
endclass
 
//////////
 
class env extends uvm_env;
`uvm_component_utils(env)
 
function new(input string inst = "env", uvm_component c);
super.new(inst,c);
endfunction
 
agent a;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a = agent::type_id::create("a",this);
endfunction
 
 
endclass
 
 
//////////
class test extends uvm_test;
`uvm_component_utils(test)
 
function new(input string inst = "test", uvm_component c);
super.new(inst,c);
endfunction
 
env e;
valid_din    vdin;
rst_dff      rff;
rand_din_rst rdin;
seq_mul sqmul;
seq_mux sqmux;
seq_demux sqdemux;
seq_ha sqha;
seq_fa sqfa;
seq_buf sqbuf;
seq_hs sqhs;
seq_fs sqfs;
seq_dec sqdec;
seq_enc sqenc;
seq_comp sqcomp;
seq_tff sqtff;
seq_jkff sqjkff;
seq_srff sqsrff;
seq_d_latch sqdlatch;
seq_t_latch sqtlatch;
seq_sr_latch sqsrlatch;
seq_jk_latch sqjklatch;
seq_count sqcount;
seq_siso sqsiso;
  
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  e    = env::type_id::create("env",this);
  vdin = valid_din::type_id::create("vdin");
  rff  = rst_dff::type_id::create("rff");
  rdin = rand_din_rst::type_id::create("rdin");
  sqmul = seq_mul::type_id::create("sqmul");
  sqmux = seq_mux::type_id::create("sqmux");
  sqdemux = seq_demux::type_id::create("sqdemux");
  sqha = seq_ha::type_id::create("sqha");  
  sqfa = seq_fa::type_id::create("sqfa");  
  sqbuf= seq_buf::type_id::create("sqbuf");
  sqhs = seq_hs::type_id::create("sqhs");
  sqfs = seq_fs::type_id::create("sqfs");
  sqdec = seq_dec::type_id::create("sqdec");
  sqenc = seq_enc::type_id::create("sqenc");
  sqcomp = seq_comp::type_id::create("sqcomp");
  sqtff = seq_tff::type_id::create("sqtff");
  sqjkff = seq_jkff::type_id::create("sqjkff");
  sqsrff = seq_srff::type_id::create("sqsrff");
  sqdlatch = seq_d_latch::type_id::create("sqdlatch");
  sqtlatch = seq_t_latch::type_id::create("sqtlatch");
  sqsrlatch = seq_sr_latch::type_id::create("sqsrlatch");
  sqjklatch = seq_jk_latch::type_id::create("sqjklatch");
  sqcount = seq_count::type_id::create("sqcount");
  sqsiso = seq_siso::type_id::create("sqsiso");
endfunction
 
virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
  rff.start(e.a.seqr);
  #21;
  vdin.start(e.a.seqr);
  #60;
  rdin.start(e.a.seqr);
  #10;
  sqmul.start(e.a.seqr);
  #10;
  sqmux.start(e.a.seqr);
  #10;
  sqdemux.start(e.a.seqr);
  #10;
  sqha.start(e.a.seqr);
  #10;
  sqfa.start(e.a.seqr);
  #10;
  sqbuf.start(e.a.seqr);
  #10;
  sqhs.start(e.a.seqr);
  #10;
  sqfs.start(e.a.seqr);
  #10;
  sqdec.start(e.a.seqr);
  #10;
  sqenc.start(e.a.seqr);
  #10;
  sqcomp.start(e.a.seqr);
  #10;
  sqtff.start(e.a.seqr);
  #40;
  sqjkff.start(e.a.seqr);
  #20; 
  sqsrff.start(e.a.seqr);
  #20;
  sqdlatch.start(e.a.seqr);
  #30;
  sqtlatch.start(e.a.seqr);
  #30;
  sqsrlatch.start(e.a.seqr);
  #10;
  sqjklatch.start(e.a.seqr);
  #10;
  sqcount.start(e.a.seqr);
  #20;
  sqsiso.start(e.a.seqr);
  #20;
phase.drop_objection(this);
endtask
endclass
 
 
///////////
module tb;
  initial begin
    run_test("test"); 
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule

