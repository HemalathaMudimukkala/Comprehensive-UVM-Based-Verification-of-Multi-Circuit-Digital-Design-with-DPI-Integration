//design.sv file
module all_cir(input clk,input rst,input din,  output reg dout,
               input [3:0] num1,input [3:0] num2, output reg [7:0] mul,
               input [1:0] sel,input [3:0] in,output reg mux_out,
               input [1:0] demux_sel,input demux_in,output reg [3:0] demux_out,
               input ha_a,input ha_b,output reg ha_sum,ha_cout,
              input fa_a,input fa_b,input fa_cin,output reg fa_sum,fa_cout,
               input [3:0] buff_in, output reg [3:0] buff_out,
              input hs_a,input hs_b,output reg hs_diff,hs_bout,
              input fs_a,input fs_b,input fs_bin,output reg fs_diff,fs_bout,
               input [1:0] dec_in, output reg [3:0] dec_out,
               input [3:0] enc_in,output reg [1:0] enc_out,
               input comp_a, input comp_b, output reg [2:0] comp_out,
              input rst_t_ff, input tin,  output reg tout,
              input rst_jk_ff, input j,input k, output reg jk_out,
              input rst_sr_ff, input s,input r, output reg sr_out,
              input rst_d_latch,input d_latch, input en, output reg d_latch_out,
              input rst_t_latch,input t_latch, input en_t, output reg t_latch_out,
              input rst_sr_latch,input en_sr,input s_l,input r_l, output reg sr_latch_out,
              input rst_jk_latch,input en_jk,input j_l,input k_l, output reg jk_latch_out,
               input rstcnt, output reg [3:0] count_out,
              input rstsiso,input insiso,output reg outsiso);
  
  // D-flip flop
  always@(posedge clk)
    begin
      if(rst)
        dout <= 1'b0;
      else
        dout <= din;
    end
  
  // Multiplier
  always@(*)
    begin
      mul = num1 * num2;
    end
  
  // 4 to 1 Multiplexer
  always@(*)
    begin
      case(sel)
        2'b00:mux_out=in[0];
        2'b01:mux_out=in[1];
        2'b10:mux_out=in[2];
        2'b11:mux_out=in[3];
        default:mux_out=0;
      endcase
    end
  
  // 1 to 4 Demultiplexer
  always@(*)
    begin
      case(demux_sel)
        2'b00:begin
          demux_out[0] = demux_in;
          demux_out[3:1]= 0;
        end
        2'b01:begin
          demux_out[0] = 0;
          demux_out[1] = demux_in;
          demux_out[3:2] = 0;
        end
        2'b10:begin
          demux_out[1:0] = 0;
          demux_out[2] = demux_in;
          demux_out[3] = 0;
        end
        2'b11:begin
          demux_out[2:0] = 0;
          demux_out[3] = demux_in;
        end
        default:demux_out=4'b0000;
      endcase
    end
  
  //Half adder
  always@(*)
    begin
      ha_sum = ha_a ^ ha_b;
      ha_cout = ha_a & ha_b;
    end
  
  //Full adder
  always@(*)
    begin
      fa_sum = fa_a ^ fa_b ^ fa_cin;
      fa_cout = (fa_a & fa_b) | (fa_b & fa_cin) | (fa_cin & fa_a) ;
    end
  
  //Buffer
  always@(*)
    begin
      buff_out = buff_in;
    end 
  
  //Half subtractor
  always@(*)
    begin
      hs_diff = hs_a ^ hs_b;
      hs_bout = (~hs_a) & hs_b;
    end
  
  //Full subtractor
  always@(*)
    begin
      fs_diff = fs_a ^ fs_b ^ fs_bin;
      fs_bout = ( ((~fs_a) & fs_b) | (fs_b & fs_bin) | (fs_bin & (~fs_a)) );
    end
  
  // 2 to 4 Decoder
  always@(*)
    begin
      case(dec_in)
        2'b00: dec_out = 4'b0001;
        2'b01: dec_out = 4'b0010;
        2'b10: dec_out = 4'b0100;
        2'b11: dec_out = 4'b1000;
        default:dec_out = 4'b0000;
      endcase
    end
   
  // 4 to 2 Encoder
  always@(*)
    begin
      case(enc_in)
        4'b0001: enc_out = 2'b00;
        4'b0010: enc_out = 2'b01;
        4'b0100: enc_out = 2'b10;
        4'b1000: enc_out = 2'b11;
        default:enc_out = 2'bxx;
      endcase
    end
  
  // 1-bit Comparator
  always@(*)
    begin
      //y[2] = comp_a<comp_b  y[1] = comp_a==comp_b  y[0]=comp_a>comp_b
      if(comp_a > comp_b)
        comp_out = 3'b001;
      else if(comp_a == comp_b)
        comp_out = 3'b010;
      else if(comp_a < comp_b)
        comp_out = 3'b100;
      else
        comp_out = 3'b000;
    end
  
  // T- flip flop
  always@(posedge clk)
    begin
      if(rst_t_ff)
        tout <= 1'b0;
      else
        begin
          if(tin)
            tout <= ~tout;
          else
            tout <= tout;
        end
    end
  
  // jk flip flop
  always@(posedge clk)
    begin
      if(rst_jk_ff)
        jk_out <= 0;
      else begin
        case({j,k})
          2'b00: jk_out <= jk_out;
          2'b01: jk_out <= 0;
          2'b10: jk_out <= 1;
          2'b11: jk_out <= ~jk_out;
          default: jk_out <=1'bx;
        endcase
      end
    end
  
  // sr flip flop
  always@(posedge clk)
    begin
      if(rst_sr_ff)
        sr_out <= 0;
      else begin
        case({s,r})
          2'b00: sr_out <= sr_out;
          2'b01: sr_out <= 0;
          2'b10: sr_out <= 1;
          2'b11: sr_out <= 1'bx;
          default: sr_out <= 1'bx;
        endcase
      end
    end
  
  // d latch
  always@(en or rst_d_latch or d_latch)
    begin
      if(rst_d_latch)
        d_latch_out <= 0;
      else begin
        if(en)
          d_latch_out <= d_latch;
        else
          d_latch_out <= d_latch_out;
      end
    end

  // T latch
  always@(en_t or rst_t_latch or t_latch)
    begin
      if(rst_t_latch)
        t_latch_out <= 0;
      else begin
        if(en_t && t_latch==0)
          t_latch_out <= t_latch_out;
        else if(en_t && t_latch==1)
          t_latch_out <= ~t_latch_out;
        else
          t_latch_out <= t_latch_out;
      end
    end
  
  // sr latch
  always@(en_sr or rst_sr_latch or s_l or r_l)
    begin
      if(rst_sr_latch)
        sr_latch_out <= 0;
      else begin
        if(en_sr) begin
          case({s_l,r_l})
            2'b00:sr_latch_out <= sr_latch_out;
            2'b01:sr_latch_out <= 0;
            2'b10:sr_latch_out <= 1;
            2'b11:sr_latch_out <= 1'bx;
            default:sr_latch_out <= 1'bx;
          endcase
        end
        else
          sr_latch_out <= sr_latch_out;
      end
    end 
  
   
  // jk latch
  always@(en_jk or rst_jk_latch or j_l or k_l)
    begin
      if(rst_jk_latch)
        jk_latch_out <= 0;
      else begin
        if(en_jk) begin
          case({j_l,k_l})
            2'b00:jk_latch_out <= jk_latch_out;
            2'b01:jk_latch_out <= 0;
            2'b10:jk_latch_out <= 1;
            2'b11:jk_latch_out <= ~jk_latch_out ;
            default:jk_latch_out <= 1'bx;
          endcase
        end
        else
          jk_latch_out <= jk_latch_out;
      end
    end
  
  // 4 bit counter 
  always@(posedge clk)
    begin
      if(rstcnt)
        count_out<=0;
      else
        count_out <= count_out+1;
    end
  
  // 4 bit serial in serial out siso
  reg [3:0] tmp;
  always@(posedge clk)
    begin
      if(rstsiso) begin
        tmp<= 4'b0000;
      end
      
      else 
        begin
          tmp <= tmp<<1;
          tmp[0] <= insiso;
          outsiso <= tmp[3];
        end
      
    end
          
endmodule


//next module...................


module recieve_data;

  logic clk;
  logic rst;
  logic din;
  wire dout;
  logic [3:0] num1;
  logic [3:0] num2;
  wire [7:0] mul;
  logic [1:0] sel;
  logic [3:0] in;
  wire mux_out;
  logic [1:0] demux_sel;
  logic demux_in;
  wire [3:0] demux_out;
  logic ha_a;
  logic ha_b;
  wire ha_sum;
  wire ha_cout;
  logic fa_a;
  logic fa_b;
  logic fa_cin;
  wire fa_sum;
  wire fa_cout;
  logic [3:0] buff_in;
  wire [3:0] buff_out;
  logic hs_a,hs_b;
  wire hs_diff,hs_bout;
  logic fs_a;
  logic fs_b;
  logic fs_bin;
  wire fs_diff;
  wire fs_bout;
  logic [1:0] dec_in;
  wire [3:0] dec_out;
  logic [3:0] enc_in;
  wire [1:0] enc_out;
  logic comp_a;
  logic comp_b;
  wire [2:0] comp_out;
  logic rst_t_ff;
  logic tin;
  wire tout;
  logic rst_jk_ff;
  logic j;
  logic k;
  wire jk_out;
  logic s;
  logic r;
  logic rst_sr_ff;
  wire sr_out;
  logic rst_d_latch;
  logic d_latch;
  logic en;
  wire d_latch_out;
  logic rst_t_latch;
  logic t_latch;
  logic en_t;
  wire t_latch_out;
  logic rst_sr_latch;
  logic en_sr;
  logic s_l;
  logic r_l;
  wire sr_latch_out;
  logic rst_jk_latch;
  logic en_jk;
  logic j_l;
  logic k_l;
  wire jk_latch_out;
  logic rstcnt;
  wire [3:0] count_out;
  logic rstsiso;
  logic insiso;
  wire outsiso;
  
  
  all_cir dut (.clk(clk), .rst(rst), .din(din), .dout(dout),
               .num1(num1),.num2(num2),.mul(mul),
               .sel(sel),.in(in),.mux_out(mux_out),
               .demux_sel(demux_sel),.demux_in(demux_in),.demux_out(demux_out),
               .ha_a(ha_a),.ha_b(ha_b),.ha_sum(ha_sum),.ha_cout(ha_cout),
               .fa_a(fa_a),.fa_b(fa_b),.fa_cin(fa_cin),.fa_sum(fa_sum),.fa_cout(fa_cout),
               .buff_in(buff_in),.buff_out(buff_out),
               .hs_a(hs_a),.hs_b(hs_b),.hs_diff(hs_diff),.hs_bout(hs_bout),
               .fs_a(fs_a),.fs_b(fs_b),.fs_bin(fs_bin),.fs_diff(fs_diff),.fs_bout(fs_bout),
               .dec_in(dec_in),.dec_out(dec_out),
               .enc_in(enc_in),.enc_out(enc_out),
               .comp_a(comp_a),.comp_b(comp_b),.comp_out(comp_out),
               .rst_t_ff(rst_t_ff),.tin(tin),.tout(tout),
               .rst_jk_ff(rst_jk_ff),.j(j),.k(k),.jk_out(jk_out),
               .rst_sr_ff(rst_sr_ff),.s(s),.r(r),.sr_out(sr_out),
               .rst_d_latch(rst_d_latch),.d_latch(d_latch),.en(en),.d_latch_out(d_latch_out),
               .rst_t_latch(rst_t_latch),.t_latch(t_latch),.en_t(en_t),.t_latch_out(t_latch_out),
               .rst_sr_latch(rst_sr_latch),.en_sr(en_sr),.s_l(s_l),.r_l(r_l),.sr_latch_out(sr_latch_out),
               .rst_jk_latch(rst_jk_latch),.en_jk(en_jk),.j_l(j_l),.k_l(k_l),.jk_latch_out(jk_latch_out),
               .rstcnt(rstcnt),.count_out(count_out),
               .rstsiso(rstsiso),.insiso(insiso),.outsiso(outsiso));

  
import "DPI-C" function void drsignals(output bit rst, output bit din);

import "DPI-C" function void drsignals1(output bit [3:0] num1, output bit [3:0] num2);
  
import "DPI-C" function void drsignals2(output bit [1:0] sel, output bit [3:0] in);

import "DPI-C" function void drsignals3(output bit [1:0] demux_sel, output bit demux_in);
  
import "DPI-C" function void drsignals4(output bit ha_a, output bit ha_b);
  
import "DPI-C" function void drsignals5(output bit fa_a, output bit fa_b, output bit fa_cin);
  
import "DPI-C" function void drsignals6(output bit [3:0] buff_in);
  
import "DPI-C" function void drsignals7(output bit hs_a, output bit hs_b);
  
import "DPI-C" function void drsignals8(output bit fs_a, output bit fs_b, output bit fs_bin);
  
import "DPI-C" function void drsignals9(output bit [1:0] dec_in);
  
import "DPI-C" function void drsignals10(output bit [3:0] enc_in);

import "DPI-C" function void drsignals11(output bit comp_a, output bit comp_b);
  
  import "DPI-C" function void drsignals12(output bit rst_t_ff, output bit tin);
  
import "DPI-C" function void drsignals13(output bit rst_jk_ff, output bit j, output bit k);
  
import "DPI-C" function void drsignals14(output bit rst_sr_ff, output bit s, output bit r);
 
import "DPI-C" function void drsignals15(output bit rst_d_latch, output bit en, output bit d_latch);
  
import "DPI-C" function void drsignals16(output bit rst_t_latch, output bit en_t, output bit t_latch);
  
import "DPI-C" function void drsignals17(output bit rst_sr_latch, output bit en_sr, output bit s_l,output bit r_l);
  
import "DPI-C" function void drsignals18(output bit rst_jk_latch, output bit en_jk, output bit j_l,output bit k_l);
  
import "DPI-C" function void drsignals19(output bit rstcnt);
  
import "DPI-C" function void drsignals20(output bit rstsiso, output bit insiso);

  initial begin
    clk = 0;
    rst = 0;
    din = 0;
    num1 = 0;
    num2 = 0;
    sel=2'b00;
    in=4'b0000;
    demux_sel=2'b00;
    demux_in=0;
    ha_a=0;
    ha_b=0;
    fa_a=0;
    fa_b=0;
    fa_cin=0;
    buff_in=4'b0000;
    hs_a = 0;
    hs_b = 0;
    fs_a=0;
    fs_b=0;
    fs_bin=0;
    dec_in=2'b00;
    enc_in=4'b0000;
    comp_a = 0;
    comp_b = 0;
    rst_t_ff=0;tin = 0;
    rst_jk_ff=0;j=0;k=0;
    rst_sr_ff=0;s=0;r=0;
    rst_d_latch=0;en=0;d_latch=0;
    rst_t_latch=0;t_latch=0;en_t=0;
    s_l=0;r_l=0;en_sr=0;rst_sr_latch=0;
    j_l=0;k_l=0;en_jk=0;rst_jk_latch=0;
    rstcnt=0;
    rstsiso=0; insiso=0;
  end
  /*
  initial begin
    $monitor("dout is %0b[in DUT] ", dout);
    $monitor("mul is %0d[in DUT]  ", mul);
    $monitor("mux_out is %0b[in DUT] ",mux_out);
    $monitor("demux_out is %0b[in DUT] ",demux_out);
    $monitor("ha_sum:%0b,ha_cout:%0b[in DUT]",ha_sum,ha_cout);
    $monitor("fa_sum:%0b,fa_cout:%0b[in DUT]",fa_sum,fa_cout);
    $monitor("buff_out is %0d[in DUT] ", buff_out);
    $monitor("hs_diff:%0b,hs_bout:%0b[in DUT]",hs_diff,hs_bout);
    $monitor("fs_diff:%0b,fs_bout:%0b[in DUT]",fs_diff,fs_bout);
    $monitor("dec_out:%0b[in DUT]",dec_out);
    $monitor("enc_out:%0b[in DUT]",enc_out);
    $monitor("comp_out:%0b[in DUT]",comp_out);
    $monitor("tout is %0b[in DUT] ", tout);
    $monitor("jk_out is %0b[in DUT] ", jk_out);
    $monitor("sr_out is %0b[in DUT] ", sr_out);
    $monitor("d_latch_out is %0b[in DUT] ",d_latch_out);
    $monitor("t_latch_out is %0b[in DUT] ",t_latch_out);
    $monitor("sr_latch_out is %0b[in DUT] ", sr_latch_out);
    $monitor("jk_latch_out is %0b[in DUT] ", jk_latch_out);
    $monitor("count_out is %0d[in DUT] ", count_out);
    $monitor("outsiso is %0b[in DUT] ",outsiso);
  end
  */
  always #5 clk = ~clk;
  
  always@(posedge clk)
    begin
      drsignals(rst, din);
      drsignals1(num1, num2);
      drsignals2(sel,in);
      drsignals3(demux_sel,demux_in);
      drsignals4(ha_a,ha_b);
      drsignals5(fa_a,fa_b,fa_cin);
      drsignals6(buff_in);
      drsignals7(hs_a,hs_b);
      drsignals8(fs_a,fs_b,fs_bin);
      drsignals9(dec_in);
      drsignals10(enc_in);
      drsignals11(comp_a,comp_b);
      drsignals12(rst_t_ff, tin);
      drsignals13(rst_jk_ff, j, k);
      drsignals14(rst_sr_ff, s, r);
      drsignals15(rst_d_latch, en, d_latch);
      drsignals16(rst_t_latch, en_t, t_latch);
      drsignals17(rst_sr_latch, en_sr, s_l, r_l);
      drsignals18(rst_jk_latch, en_jk, j_l, k_l);
      drsignals19(rstcnt);
      drsignals20(rstsiso,insiso);
    end
  
    
endmodule
