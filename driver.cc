//driver.cc file

#include <svdpi.h>
#include <iostream>
using namespace std;

unsigned char rst;
unsigned char din;
unsigned char dout;
unsigned char num1;
unsigned char num2;
unsigned char sel;
unsigned char in;
unsigned char demux_sel;
unsigned char demux_in;
unsigned char ha_a;
unsigned char ha_b;
unsigned char fa_a;
unsigned char fa_b;
unsigned char fa_cin;
unsigned char buff_in;
unsigned char hs_a;
unsigned char hs_b;
unsigned char fs_a;
unsigned char fs_b;
unsigned char fs_bin;
unsigned char dec_in;
unsigned char enc_in;
unsigned char comp_a;
unsigned char comp_b;
unsigned char rst_t_ff;
unsigned char tin;
unsigned char rst_jk_ff;
unsigned char j;
unsigned char k;
unsigned char rst_sr_ff;
unsigned char s;
unsigned char r;
unsigned char rst_d_latch;
unsigned char en;
unsigned char d_latch;
unsigned char rst_t_latch;
unsigned char en_t;
unsigned char t_latch;
unsigned char rst_sr_latch;
unsigned char en_sr;
unsigned char s_l;
unsigned char r_l;
unsigned char rst_jk_latch;
unsigned char en_jk;
unsigned char j_l;
unsigned char k_l;
unsigned char rstcnt;
unsigned char rstsiso;
unsigned char insiso;

extern "C" void send_to_cpp(unsigned char rst1, unsigned char din1) {
    rst=rst1;
    din=din1;
       
    //printf("Received transaction data from SystemVerilog:\n");
    //printf("rst1: %d, din1: %d\n", rst1, din1);
    
}

extern "C" void drsignals(unsigned char *r, unsigned char *d) {
    *r = rst;  // Update the rst
    *d = din;  // Update the din
      //printf("Driving signals--: rst: %d, din: %d\n", rst, din);
}

extern "C" void send_to_mul(unsigned char numa, unsigned char numb) {
  num1=numa;
  num2=numb;
  //printf("Received mul data from SystemVerilog:\n");
  //printf("num1: %d, num2: %d\n", num1, num2);
}

extern "C" void drsignals1(unsigned char *n1 , unsigned char *n2) {
  *n1 = num1;
  *n2 = num2;
  //printf("Driving signals--: num1: %d, num2: %d\n", num1, num2);
}

extern "C" void send_to_mux(unsigned char sel1, unsigned char in1) {
  sel = sel1;
  in = in1;
}

extern "C" void drsignals2(unsigned char *s1, unsigned char *i1) {
  *s1 = sel;
  *i1 = in;
}

extern "C" void send_to_demux(unsigned char demux_sel1,unsigned char demux_in1){
  demux_sel = demux_sel1;
  demux_in = demux_in1;
}

extern "C" void drsignals3(unsigned char *ds1, unsigned char *di1){
  *ds1 = demux_sel;
  *di1 = demux_in;
}

extern "C" void send_to_ha(unsigned char ha_a1, unsigned char ha_b1){
  ha_a = ha_a1;
  ha_b = ha_b1;
}

extern "C" void drsignals4(unsigned char *ha1, unsigned char *hb1){
  *ha1 = ha_a;
  *hb1 = ha_b;
}
  
extern "C" void send_to_fa(unsigned char fa_a1, unsigned char fa_b1, unsigned char fa_cin1){
  fa_a = fa_a1;
  fa_b = fa_b1;
  fa_cin = fa_cin1;
}

extern "C" void drsignals5(unsigned char *fa1, unsigned char *fb1, unsigned char *fcin1){
  *fa1 = fa_a;
  *fb1 = fa_b;
  *fcin1 = fa_cin;
}

extern "C" void send_to_buf(unsigned char buff_in1){
  buff_in = buff_in1;
}

extern "C" void drsignals6(unsigned char *buf1){
  *buf1 = buff_in;
}

extern "C" void send_to_hs(unsigned char hs_a1, unsigned char hs_b1){
  hs_a = hs_a1;
  hs_b = hs_b1;
}

extern "C" void drsignals7(unsigned char *hsa1, unsigned char *hsb1){
  *hsa1 = hs_a;
  *hsb1 = hs_b;
}
  
  
extern "C" void send_to_fs(unsigned char fs_a1, unsigned char fs_b1, unsigned char fs_bin1){
  fs_a = fs_a1;
  fs_b = fs_b1;
  fs_bin = fs_bin1;
}

extern "C" void drsignals8(unsigned char *fsa1, unsigned char *fsb1, unsigned char *fsbin1){
  *fsa1 = fs_a;
  *fsb1 = fs_b;
  *fsbin1 = fs_bin;
}
extern "C" void send_to_dec(unsigned char dec_in1){
  dec_in = dec_in1;
}

extern "C" void drsignals9(unsigned char *decin1){
  *decin1 = dec_in;
}
extern "C" void send_to_enc(unsigned char enc_in1){
  enc_in = enc_in1;
}

extern "C" void drsignals10(unsigned char *encin1){
  *encin1 = enc_in;
}
extern "C" void send_to_comp(unsigned char comp_a1, unsigned char comp_b1){
  comp_a = comp_a1;
  comp_b = comp_b1;
}

extern "C" void drsignals11(unsigned char *compa1, unsigned char *compb1){
  *compa1 = comp_a;
  *compb1 = comp_b;
}
extern "C" void send_to_tff(unsigned char rst1, unsigned char tin1) {
    rst_t_ff=rst1;
    tin=tin1;
}

extern "C" void drsignals12(unsigned char *rs, unsigned char *t) {
    *rs = rst_t_ff;  
    *t = tin;  
}
extern "C" void send_to_jkff(unsigned char rst1, unsigned char j1, unsigned char k1) {
    rst_jk_ff=rst1;
    j=j1;
    k=k1; 
}

extern "C" void drsignals13(unsigned char *rsj, unsigned char *jin, unsigned char *kin) {
    *rsj = rst_jk_ff;  
    *jin= j;  
    *kin= k;
}
extern "C" void send_to_srff(unsigned char rst1, unsigned char s1, unsigned char r1) {
    rst_sr_ff=rst1;
    s=s1;
    r=r1; 
}

extern "C" void drsignals14(unsigned char *rss, unsigned char *sin, unsigned char *rin) {
    *rss = rst_sr_ff;  
    *sin= s;  
    *rin= r;
}
extern "C" void send_to_d_latch(unsigned char rst1, unsigned char en1, unsigned char d_latch1) {
    rst_d_latch=rst1;
    en=en1;
    d_latch=d_latch1; 
}

extern "C" void drsignals15(unsigned char *rst_d, unsigned char *en_d, unsigned char *d_lat) {
    *rst_d = rst_d_latch;  
    *en_d= en;  
    *d_lat= d_latch;
}
extern "C" void send_to_t_latch(unsigned char rst1, unsigned char en1, unsigned char t_latch1) {
    rst_t_latch=rst1;
    en_t=en1;
    t_latch=t_latch1; 
}

extern "C" void drsignals16(unsigned char *rst_t, unsigned char *ent, unsigned char *t_lat) {
    *rst_t = rst_t_latch;  
    *ent= en_t;  
    *t_lat= t_latch;
}
extern "C" void send_to_sr_latch(unsigned char rst1, unsigned char en1, unsigned char s_latch1,unsigned char r_latch1) {
    rst_sr_latch=rst1;
    en_sr=en1;
    s_l=s_latch1;
    r_l=r_latch1;
}

extern "C" void drsignals17(unsigned char *rst_sr, unsigned char *ensr, unsigned char *s_lat, unsigned char *r_lat) {
    *rst_sr = rst_sr_latch;  
    *ensr= en_sr;  
    *s_lat= s_l;
    *r_lat= r_l;
}
extern "C" void send_to_jk_latch(unsigned char rst1, unsigned char en1, unsigned char j_latch1,unsigned char k_latch1) {
    rst_jk_latch=rst1;
    en_jk=en1;
    j_l=j_latch1;
    k_l=k_latch1;
}

extern "C" void drsignals18(unsigned char *rst_jk, unsigned char *enjk, unsigned char *j_lat, unsigned char *k_lat) {
    *rst_jk = rst_jk_latch;  
    *enjk= en_jk;  
    *j_lat= j_l;
    *k_lat= k_l;
}
extern "C" void send_to_counter(unsigned char rstcnt1) {
    rstcnt=rstcnt1;
}

extern "C" void drsignals19(unsigned char *rst_count) {
    *rst_count = rstcnt;  
}

extern "C" void send_to_siso(unsigned char rstsiso1, unsigned char insiso1) {
    rstsiso=rstsiso1;
    insiso=insiso1;
}

extern "C" void drsignals20(unsigned char *rst_siso, unsigned char *in_siso) {
    *rst_siso= rstsiso;  
    *in_siso= insiso;  
}

