

// Generated by cosim_wrapper.pl to be used for cosim

module decoder13_cosim_wrapper(interface In, interface Out0, interface Out1, interface S, input _RESET);

 decoder13 decoder13_expanded (In.e[0] , In.e[1] , In.e[2] , In.e[3] , In.e[4] , In.e[5] 
 , In.e[6] , In.e[7] , In.e[8] , Out0.d[0][0] , Out0.d[0][1] , Out0.d[0][2] 
 , Out0.d[0][3] , Out0.d[0][4] , Out0.d[0][5] , Out0.d[0][6] , Out0.d[0][7] , Out0.d[0][8] 
 , Out0.d[1][0] , Out0.d[1][1] , Out0.d[1][2] , Out0.d[1][3] , Out0.d[1][4] , Out0.d[1][5] 
 , Out0.d[1][6] , Out0.d[1][7] , Out0.d[1][8] , Out1.d[0][0] , Out1.d[0][1] , Out1.d[0][2] 
 , Out1.d[0][3] , Out1.d[0][4] , Out1.d[0][5] , Out1.d[0][6] , Out1.d[0][7] , Out1.d[0][8] 
 , Out1.d[1][0] , Out1.d[1][1] , Out1.d[1][2] , Out1.d[1][3] , Out1.d[1][4] , Out1.d[1][5] 
 , Out1.d[1][6] , Out1.d[1][7] , Out1.d[1][8] , S.d[0][0] , S.d[1][0] , In.d[0][0] 
 , In.d[0][1] , In.d[0][2] , In.d[0][3] , In.d[0][4] , In.d[0][5] , In.d[0][6] 
 , In.d[0][7] , In.d[0][8] , In.d[1][0] , In.d[1][1] , In.d[1][2] , In.d[1][3] 
 , In.d[1][4] , In.d[1][5] , In.d[1][6] , In.d[1][7] , In.d[1][8] , Out0.e[0] 
 , Out0.e[1] , Out0.e[2] , Out0.e[3] , Out0.e[4] , Out0.e[5] , Out0.e[6] 
 , Out0.e[7] , Out0.e[8] , Out1.e[0] , Out1.e[1] , Out1.e[2] , Out1.e[3] 
 , Out1.e[4] , Out1.e[5] , Out1.e[6] , Out1.e[7] , Out1.e[8] , S.e[0] 
 , _RESET );

endmodule

// Generated by E-GRAPH (EGS) v0.01

module decoder13 (\In_e[0] , \In_e[1] , \In_e[2] , \In_e[3] , \In_e[4] , \In_e[5] , \In_e[6] , \In_e[7] , \In_e[8] , 
  \Out0_d[0][0] , \Out0_d[0][1] , \Out0_d[0][2] , \Out0_d[0][3] , \Out0_d[0][4] , \Out0_d[0][5] , \Out0_d[0][6] , \Out0_d[0][7] , 
  \Out0_d[0][8] , \Out0_d[1][0] , \Out0_d[1][1] , \Out0_d[1][2] , \Out0_d[1][3] , \Out0_d[1][4] , \Out0_d[1][5] , \Out0_d[1][6] , 
  \Out0_d[1][7] , \Out0_d[1][8] , \Out1_d[0][0] , \Out1_d[0][1] , \Out1_d[0][2] , \Out1_d[0][3] , \Out1_d[0][4] , \Out1_d[0][5] , 
  \Out1_d[0][6] , \Out1_d[0][7] , \Out1_d[0][8] , \Out1_d[1][0] , \Out1_d[1][1] , \Out1_d[1][2] , \Out1_d[1][3] , \Out1_d[1][4] , 
  \Out1_d[1][5] , \Out1_d[1][6] , \Out1_d[1][7] , \Out1_d[1][8] , \S_d[0][0] , \S_d[1][0] , \In_d[0][0] , \In_d[0][1] , 
  \In_d[0][2] , \In_d[0][3] , \In_d[0][4] , \In_d[0][5] , \In_d[0][6] , \In_d[0][7] , \In_d[0][8] , \In_d[1][0] , \In_d[1][1] , 
  \In_d[1][2] , \In_d[1][3] , \In_d[1][4] , \In_d[1][5] , \In_d[1][6] , \In_d[1][7] , \In_d[1][8] , \Out0_e[0] , \Out0_e[1] , 
  \Out0_e[2] , \Out0_e[3] , \Out0_e[4] , \Out0_e[5] , \Out0_e[6] , \Out0_e[7] , \Out0_e[8] , \Out1_e[0] , \Out1_e[1] , 
  \Out1_e[2] , \Out1_e[3] , \Out1_e[4] , \Out1_e[5] , \Out1_e[6] , \Out1_e[7] , \Out1_e[8] , \S_e , _RESET );
  input  \In_d[0][0] , \In_d[0][1] , \In_d[0][2] , \In_d[0][3] , \In_d[0][4] , \In_d[0][5] , \In_d[0][6] , \In_d[0][7] ;
  input  \In_d[0][8] , \In_d[1][0] , \In_d[1][1] , \In_d[1][2] , \In_d[1][3] , \In_d[1][4] , \In_d[1][5] , \In_d[1][6] ;
  input  \In_d[1][7] , \In_d[1][8] , \Out0_e[0] , \Out0_e[1] , \Out0_e[2] , \Out0_e[3] , \Out0_e[4] , \Out0_e[5] , \Out0_e[6] ;
  input  \Out0_e[7] , \Out0_e[8] , \Out1_e[0] , \Out1_e[1] , \Out1_e[2] , \Out1_e[3] , \Out1_e[4] , \Out1_e[5] , \Out1_e[6] ;
  input  \Out1_e[7] , \Out1_e[8] , \S_e , _RESET ;

  output \In_e[0] , \In_e[1] , \In_e[2] , \In_e[3] , \In_e[4] , \In_e[5] , \In_e[6] , \In_e[7] , \In_e[8] , \Out0_d[0][0] ;
  output \Out0_d[0][1] , \Out0_d[0][2] , \Out0_d[0][3] , \Out0_d[0][4] , \Out0_d[0][5] , \Out0_d[0][6] , \Out0_d[0][7] ;
  output \Out0_d[0][8] , \Out0_d[1][0] , \Out0_d[1][1] , \Out0_d[1][2] , \Out0_d[1][3] , \Out0_d[1][4] , \Out0_d[1][5] ;
  output \Out0_d[1][6] , \Out0_d[1][7] , \Out0_d[1][8] , \Out1_d[0][0] , \Out1_d[0][1] , \Out1_d[0][2] , \Out1_d[0][3] ;
  output \Out1_d[0][4] , \Out1_d[0][5] , \Out1_d[0][6] , \Out1_d[0][7] , \Out1_d[0][8] , \Out1_d[1][0] , \Out1_d[1][1] ;
  output \Out1_d[1][2] , \Out1_d[1][3] , \Out1_d[1][4] , \Out1_d[1][5] , \Out1_d[1][6] , \Out1_d[1][7] , \Out1_d[1][8] ;
  output \S_d[0][0] , \S_d[1][0] ;

  wire   \In_e[0] , \In_e[1] , \In_e[2] , \In_e[3] , \In_e[4] , \In_e[5] , \In_e[6] , \In_e[7] , \In_e[8] , \Out0_d[0][0] ;
  wire   \Out0_d[0][1] , \Out0_d[0][2] , \Out0_d[0][3] , \Out0_d[0][4] , \Out0_d[0][5] , \Out0_d[0][6] , \Out0_d[0][7] ;
  wire   \Out0_d[0][8] , \Out0_d[1][0] , \Out0_d[1][1] , \Out0_d[1][2] , \Out0_d[1][3] , \Out0_d[1][4] , \Out0_d[1][5] ;
  wire   \Out0_d[1][6] , \Out0_d[1][7] , \Out0_d[1][8] , \Out1_d[0][0] , \Out1_d[0][1] , \Out1_d[0][2] , \Out1_d[0][3] ;
  wire   \Out1_d[0][4] , \Out1_d[0][5] , \Out1_d[0][6] , \Out1_d[0][7] , \Out1_d[0][8] , \Out1_d[1][0] , \Out1_d[1][1] ;
  wire   \Out1_d[1][2] , \Out1_d[1][3] , \Out1_d[1][4] , \Out1_d[1][5] , \Out1_d[1][6] , \Out1_d[1][7] , \Out1_d[1][8] ;
  wire   \S_d[0][0] , \S_d[1][0] , \c17.e , \c18.e , \c19.e , \c20.e , \c21.e , \c22.e , \c23.e , \c24.e , \c25.e , \c26.e ;
  wire   \c27.e , \c28.e , \c29.e , \c30.e , \c31.e , \c32.e , \c33.e , \c34.e , \d[0].0 , \d[0].1 , \d[1].0 , \d[1].1 ;
  wire   \d[2].0 , \d[2].1 , \d[3].0 , \d[3].1 , \d[4].0 , \d[4].1 , \d[6].0 , \d[6].1 , \d[7].0 , \d[7].1 , \d[8].0 , \d[8].1 ;
  wire   \n_54.0 , \n_54.1 , \n_55.0 , \n_55.1 , \n_56.0 , \n_56.1 , \n_57.0 , \n_57.1 , \n_58.0 , \n_58.1 , \n_59.0 , \n_59.1 ;
  wire   \n_60.0 , \n_60.1 , \n_61.0 , \n_61.1 , \n_72.0 , \n_72.1 , \n_74.0 , \n_74.1 , \n_75.0 , \n_75.1 , \n_76.0 , \n_76.1 ;
  wire   \n_77.0 , \n_77.1 , \n_78.0 , \n_78.1 , \n_79.0 , \n_79.1 , \n_80.0 , \n_80.1 , \n_83.0 , \n_83.1 , \n_83_56.e ;
  wire   \n_83_57.e , \n_83_59.e , \n_83_60.e , \n_83_FX0.0 , \n_83_FX0.1 , \n_83_FX1.0 , \n_83_FX1.1 , \n_83_FX2_a.0 ;
  wire   \n_83_FX2_a.1 , \n_83_FX2_b.0 , \n_83_FX2_b.1 , \n_83_FX3_16.e , \n_83_FX3_a.0 , \n_83_FX3_a.1 , \n_83_FX3_b.0 ;
  wire   \n_83_FX3_b.1 , \n_83_SX0_iter2.0 , \n_83_SX0_iter2.1 , \n_83_SX0_iter2.e , \pchb_cfbuf_58_FX_inst_n_83_SX0_iter2_0e ;
  wire   \pchb_cfbuf_58_FX_inst_n_83_SX0_iter2_1e , \pchb_cfbuf_59_FX_inst_n_83_0e , \pchb_cfbuf_59_FX_inst_n_83_1e ;
  wire   \pchb_cloud_52_inst_go , \pchb_cloud_52_inst_valid_out_0 , \pchb_cloud_52_inst_valid_out_1 ;
  wire   \pchb_cloud_52_inst_valid_out_2 , \pchb_cloud_52_inst_valid_out_3 , \pchb_cloud_53_inst_go ;
  wire   \pchb_cloud_53_inst_valid_out_0 , \pchb_cloud_53_inst_valid_out_1 , \pchb_cloud_53_inst_valid_out_2 ;
  wire   \pchb_cloud_53_inst_valid_out_3 , \pchb_cloud_54_inst_go , \pchb_cloud_54_inst_valid_out_0 ;
  wire   \pchb_cloud_54_inst_valid_out_1 , \pchb_cloud_54_inst_valid_out_2 , \pchb_cloud_54_inst_valid_out_3 ;
  wire   \pchb_cloud_55_inst_go , \pchb_cloud_55_inst_valid_out_0 , \pchb_cloud_55_inst_valid_out_1 ;
  wire   \pchb_cloud_55_inst_valid_out_2 , \pchb_cloud_55_inst_valid_out_3 ;

  trireg \c52.e , \c53.e , \c54.e , \c55.e , \pchb_cfbuf_56_FX_inst_en0 , \pchb_cfbuf_57_FX_inst_en0 ;
  trireg \pchb_cfbuf_58_FX_inst_en0 , \pchb_cfbuf_58_FX_inst_en1 , \pchb_cfbuf_59_FX_inst_en0 , \pchb_cfbuf_59_FX_inst_en1 ;
  trireg \pchb_cloud_40_inst_en0 , \pchb_cloud_52_inst_en0 , \pchb_cloud_52_inst_en3 , \pchb_cloud_53_inst_en0 ;
  trireg \pchb_cloud_53_inst_en3 , \pchb_cloud_54_inst_en0 , \pchb_cloud_54_inst_en3 , \pchb_cloud_55_inst_en0 ;
  trireg \pchb_cloud_55_inst_en3 ;



  \synthesis.qdi.special.BUF.2 \pchb_cloud_16_inst_S_SEND.send.bits[0].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \S_e ), 
    .\L.0 ( \n_83_FX3_b.0 ), 
    .\L.1 ( \n_83_FX3_b.1 ), 
    .\L.e ( \n_83_FX3_16.e ), 
    .\R.0 ( \S_d[0][0] ), 
    .\R.1 ( \S_d[1][0] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_17_inst_Out1_SEND.send.bits[0].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[0] ), 
    .\E.0 ( \n_83_FX2_b.0 ), 
    .\E.1 ( \n_83_FX2_b.1 ), 
    .\E.e ( \c17.e ), 
    .\L[0].0 ( \n_61.0 ), 
    .\L[0].1 ( \n_61.1 ), 
    .\R.0 ( \Out1_d[0][0] ), 
    .\R.1 ( \Out1_d[1][0] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_18_inst_Out1_SEND.send.bits[1].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[1] ), 
    .\E.0 ( \n_83_FX2_b.0 ), 
    .\E.1 ( \n_83_FX2_b.1 ), 
    .\E.e ( \c18.e ), 
    .\L[0].0 ( \n_60.0 ), 
    .\L[0].1 ( \n_60.1 ), 
    .\R.0 ( \Out1_d[0][1] ), 
    .\R.1 ( \Out1_d[1][1] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_19_inst_Out1_SEND.send.bits[2].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[2] ), 
    .\E.0 ( \n_83_FX2_b.0 ), 
    .\E.1 ( \n_83_FX2_b.1 ), 
    .\E.e ( \c19.e ), 
    .\L[0].0 ( \n_59.0 ), 
    .\L[0].1 ( \n_59.1 ), 
    .\R.0 ( \Out1_d[0][2] ), 
    .\R.1 ( \Out1_d[1][2] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_20_inst_Out1_SEND.send.bits[3].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[3] ), 
    .\E.0 ( \n_83_FX2_b.0 ), 
    .\E.1 ( \n_83_FX2_b.1 ), 
    .\E.e ( \c20.e ), 
    .\L[0].0 ( \n_58.0 ), 
    .\L[0].1 ( \n_58.1 ), 
    .\R.0 ( \Out1_d[0][3] ), 
    .\R.1 ( \Out1_d[1][3] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_21_inst_Out1_SEND.send.bits[4].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[4] ), 
    .\E.0 ( \n_83_FX2_a.0 ), 
    .\E.1 ( \n_83_FX2_a.1 ), 
    .\E.e ( \c21.e ), 
    .\L[0].0 ( \n_57.0 ), 
    .\L[0].1 ( \n_57.1 ), 
    .\R.0 ( \Out1_d[0][4] ), 
    .\R.1 ( \Out1_d[1][4] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_22_inst_Out1_SEND.send.bits[5].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[5] ), 
    .\E.0 ( \n_83_FX3_b.0 ), 
    .\E.1 ( \n_83_FX3_b.1 ), 
    .\E.e ( \c22.e ), 
    .\L[0].0 ( \n_83_FX3_b.0 ), 
    .\L[0].1 ( \n_83_FX3_b.1 ), 
    .\R.0 ( \Out1_d[0][5] ), 
    .\R.1 ( \Out1_d[1][5] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_23_inst_Out1_SEND.send.bits[6].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[6] ), 
    .\E.0 ( \n_83_FX2_a.0 ), 
    .\E.1 ( \n_83_FX2_a.1 ), 
    .\E.e ( \c23.e ), 
    .\L[0].0 ( \n_56.0 ), 
    .\L[0].1 ( \n_56.1 ), 
    .\R.0 ( \Out1_d[0][6] ), 
    .\R.1 ( \Out1_d[1][6] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_24_inst_Out1_SEND.send.bits[7].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[7] ), 
    .\E.0 ( \n_83_FX2_a.0 ), 
    .\E.1 ( \n_83_FX2_a.1 ), 
    .\E.e ( \c24.e ), 
    .\L[0].0 ( \n_55.0 ), 
    .\L[0].1 ( \n_55.1 ), 
    .\R.0 ( \Out1_d[0][7] ), 
    .\R.1 ( \Out1_d[1][7] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_25_inst_Out1_SEND.send.bits[8].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[8] ), 
    .\E.0 ( \n_83_FX2_a.0 ), 
    .\E.1 ( \n_83_FX2_a.1 ), 
    .\E.e ( \c25.e ), 
    .\L[0].0 ( \n_54.0 ), 
    .\L[0].1 ( \n_54.1 ), 
    .\R.0 ( \Out1_d[0][8] ), 
    .\R.1 ( \Out1_d[1][8] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_26_inst_Out0_SEND.send.bits[0].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[0] ), 
    .\E.1 ( \n_83_FX1.0 ), 
    .\E.0 ( \n_83_FX1.1 ), 
    .\E.e ( \c26.e ), 
    .\L[0].0 ( \n_80.0 ), 
    .\L[0].1 ( \n_80.1 ), 
    .\R.0 ( \Out0_d[0][0] ), 
    .\R.1 ( \Out0_d[1][0] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_27_inst_Out0_SEND.send.bits[1].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[1] ), 
    .\E.1 ( \n_83_FX1.0 ), 
    .\E.0 ( \n_83_FX1.1 ), 
    .\E.e ( \c27.e ), 
    .\L[0].0 ( \n_79.0 ), 
    .\L[0].1 ( \n_79.1 ), 
    .\R.0 ( \Out0_d[0][1] ), 
    .\R.1 ( \Out0_d[1][1] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_28_inst_Out0_SEND.send.bits[2].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[2] ), 
    .\E.1 ( \n_83_FX1.0 ), 
    .\E.0 ( \n_83_FX1.1 ), 
    .\E.e ( \c28.e ), 
    .\L[0].0 ( \n_78.0 ), 
    .\L[0].1 ( \n_78.1 ), 
    .\R.0 ( \Out0_d[0][2] ), 
    .\R.1 ( \Out0_d[1][2] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_29_inst_Out0_SEND.send.bits[3].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[3] ), 
    .\E.1 ( \n_83_FX1.0 ), 
    .\E.0 ( \n_83_FX1.1 ), 
    .\E.e ( \c29.e ), 
    .\L[0].0 ( \n_77.0 ), 
    .\L[0].1 ( \n_77.1 ), 
    .\R.0 ( \Out0_d[0][3] ), 
    .\R.1 ( \Out0_d[1][3] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_30_inst_Out0_SEND.send.bits[4].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[4] ), 
    .\E.1 ( \n_83_FX0.0 ), 
    .\E.0 ( \n_83_FX0.1 ), 
    .\E.e ( \c30.e ), 
    .\L[0].0 ( \n_76.0 ), 
    .\L[0].1 ( \n_76.1 ), 
    .\R.0 ( \Out0_d[0][4] ), 
    .\R.1 ( \Out0_d[1][4] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_31_inst_Out0_SEND.send.bits[5].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[5] ), 
    .\E.1 ( \n_83_FX3_b.0 ), 
    .\E.0 ( \n_83_FX3_b.1 ), 
    .\E.e ( \c31.e ), 
    .\L[0].0 ( \c31.e ), 
    .\L[0].1 ( 1'b0 ), 
    .\R.0 ( \Out0_d[0][5] ), 
    .\R.1 ( \Out0_d[1][5] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_32_inst_Out0_SEND.send.bits[6].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[6] ), 
    .\E.1 ( \n_83_FX0.0 ), 
    .\E.0 ( \n_83_FX0.1 ), 
    .\E.e ( \c32.e ), 
    .\L[0].0 ( \n_75.0 ), 
    .\L[0].1 ( \n_75.1 ), 
    .\R.0 ( \Out0_d[0][6] ), 
    .\R.1 ( \Out0_d[1][6] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_33_inst_Out0_SEND.send.bits[7].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[7] ), 
    .\E.1 ( \n_83_FX0.0 ), 
    .\E.0 ( \n_83_FX0.1 ), 
    .\E.e ( \c33.e ), 
    .\L[0].0 ( \n_74.0 ), 
    .\L[0].1 ( \n_74.1 ), 
    .\R.0 ( \Out0_d[0][7] ), 
    .\R.1 ( \Out0_d[1][7] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_34_inst_Out0_SEND.send.bits[8].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[8] ), 
    .\E.1 ( \n_83_FX0.0 ), 
    .\E.0 ( \n_83_FX0.1 ), 
    .\E.e ( \c34.e ), 
    .\L[0].0 ( \n_72.0 ), 
    .\L[0].1 ( \n_72.1 ), 
    .\R.0 ( \Out0_d[0][8] ), 
    .\R.1 ( \Out0_d[1][8] ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_35_inst_In_RECEIVE.recv.bits[0].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][0] ), 
    .\L.1 ( \In_d[1][0] ), 
    .\L.e ( \In_e[0] ), 
    .\R.0 ( \d[0].0 ), 
    .\R.1 ( \d[0].1 ), 
    .\R.e ( \c54.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_36_inst_In_RECEIVE.recv.bits[1].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][1] ), 
    .\L.1 ( \In_d[1][1] ), 
    .\L.e ( \In_e[1] ), 
    .\R.0 ( \d[1].0 ), 
    .\R.1 ( \d[1].1 ), 
    .\R.e ( \c53.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_37_inst_In_RECEIVE.recv.bits[2].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][2] ), 
    .\L.1 ( \In_d[1][2] ), 
    .\L.e ( \In_e[2] ), 
    .\R.0 ( \d[2].0 ), 
    .\R.1 ( \d[2].1 ), 
    .\R.e ( \c55.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_38_inst_In_RECEIVE.recv.bits[3].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][3] ), 
    .\L.1 ( \In_d[1][3] ), 
    .\L.e ( \In_e[3] ), 
    .\R.0 ( \d[3].0 ), 
    .\R.1 ( \d[3].1 ), 
    .\R.e ( \c54.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_39_inst_In_RECEIVE.recv.bits[4].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][4] ), 
    .\L.1 ( \In_d[1][4] ), 
    .\L.e ( \In_e[4] ), 
    .\R.0 ( \d[4].0 ), 
    .\R.1 ( \d[4].1 ), 
    .\R.e ( \c53.e ));
  \synthesis.qdi.special.BUF.4 \pchb_cloud_40_inst_In_RECEIVE.recv.bits[5].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][5] ), 
    .\L.1 ( \In_d[1][5] ), 
    .\L.e ( \In_e[5] ), 
    .\R.0 ( \n_83.0 ), 
    .\R.1 ( \n_83.1 ), 
    .\R.e ( \pchb_cloud_40_inst_en0 ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cloud_40_inst_In_RECEIVE.recv.bits[5].recv_companion0 ( 
    .x ( \pchb_cloud_40_inst_en0 ), 
    .\a[0] ( \n_83_56.e ), 
    .\a[1] ( \n_83_57.e ), 
    .\a[2] ( \n_83_60.e ), 
    .\a[3] ( \n_83_59.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_41_inst_In_RECEIVE.recv.bits[6].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][6] ), 
    .\L.1 ( \In_d[1][6] ), 
    .\L.e ( \In_e[6] ), 
    .\R.0 ( \d[6].0 ), 
    .\R.1 ( \d[6].1 ), 
    .\R.e ( \c55.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_42_inst_In_RECEIVE.recv.bits[7].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][7] ), 
    .\L.1 ( \In_d[1][7] ), 
    .\L.e ( \In_e[7] ), 
    .\R.0 ( \d[7].0 ), 
    .\R.1 ( \d[7].1 ), 
    .\R.e ( \c52.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_43_inst_In_RECEIVE.recv.bits[8].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][8] ), 
    .\L.1 ( \In_d[1][8] ), 
    .\L.e ( \In_e[8] ), 
    .\R.0 ( \d[8].0 ), 
    .\R.1 ( \d[8].1 ), 
    .\R.e ( \c52.e ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g548 ( 
    .V ( \pchb_cloud_52_inst_valid_out_0 ), 
    .en ( \pchb_cloud_52_inst_en0 ), 
    .\A[0].0 ( \d[8].1 ), 
    .\A[0].1 ( \d[8].0 ), 
    .\A[1].0 ( \n_83_FX3_b.0 ), 
    .\A[1].1 ( \n_83_FX3_b.1 ), 
    .\X.0 ( \n_72.0 ), 
    .\X.1 ( \n_72.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g549 ( 
    .V ( \pchb_cloud_52_inst_valid_out_2 ), 
    .en ( \pchb_cloud_52_inst_en0 ), 
    .\A[0].0 ( \d[7].1 ), 
    .\A[0].1 ( \d[7].0 ), 
    .\A[1].0 ( \n_83_FX3_b.0 ), 
    .\A[1].1 ( \n_83_FX3_b.1 ), 
    .\X.0 ( \n_74.0 ), 
    .\X.1 ( \n_74.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g555 ( 
    .V ( \pchb_cloud_52_inst_valid_out_1 ), 
    .en ( \pchb_cloud_52_inst_en0 ), 
    .\A[0].0 ( \n_83_FX3_b.1 ), 
    .\A[0].1 ( \n_83_FX3_b.0 ), 
    .\A[1].0 ( \d[8].1 ), 
    .\A[1].1 ( \d[8].0 ), 
    .\X.0 ( \n_54.0 ), 
    .\X.1 ( \n_54.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g557 ( 
    .V ( \pchb_cloud_52_inst_valid_out_3 ), 
    .en ( \pchb_cloud_52_inst_en3 ), 
    .\A[0].0 ( \n_83_FX3_b.1 ), 
    .\A[0].1 ( \n_83_FX3_b.0 ), 
    .\A[1].0 ( \d[7].1 ), 
    .\A[1].1 ( \d[7].0 ), 
    .\X.0 ( \n_55.0 ), 
    .\X.1 ( \n_55.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder13_RTL_BODY.g557 ( 
    .x ( \pchb_cloud_52_inst_en3 ), 
    .\a[0] ( \pchb_cloud_52_inst_go ), 
    .\a[1] ( \c24.e ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_52_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_52_inst_go ), 
    .Ae ( \c52.e ), 
    .\A[0].0 ( \d[7].0 ), 
    .\A[0].1 ( \d[7].1 ), 
    .\A[1].0 ( \d[8].0 ), 
    .\A[1].1 ( \d[8].1 ), 
    .\A[2].0 ( \n_83_FX3_b.0 ), 
    .\A[2].1 ( \n_83_FX3_b.1 ), 
    .\V[0] ( \pchb_cloud_52_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_52_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_52_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_52_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder13_RTL_BODY.g548 ( 
    .\a[0] ( \pchb_cloud_52_inst_go ), 
    .\a[1] ( \c25.e ), 
    .\a[2] ( \c34.e ), 
    .\a[3] ( \c33.e ), 
    .x ( \pchb_cloud_52_inst_en0 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g550 ( 
    .V ( \pchb_cloud_53_inst_valid_out_0 ), 
    .en ( \pchb_cloud_53_inst_en0 ), 
    .\A[0].0 ( \n_83_FX3_a.1 ), 
    .\A[0].1 ( \n_83_FX3_a.0 ), 
    .\A[1].0 ( \d[1].1 ), 
    .\A[1].1 ( \d[1].0 ), 
    .\X.0 ( \n_60.0 ), 
    .\X.1 ( \n_60.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g551 ( 
    .V ( \pchb_cloud_53_inst_valid_out_2 ), 
    .en ( \pchb_cloud_53_inst_en0 ), 
    .\A[0].0 ( \d[4].1 ), 
    .\A[0].1 ( \d[4].0 ), 
    .\A[1].0 ( \n_83_FX3_a.0 ), 
    .\A[1].1 ( \n_83_FX3_a.1 ), 
    .\X.0 ( \n_76.0 ), 
    .\X.1 ( \n_76.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g558 ( 
    .V ( \pchb_cloud_53_inst_valid_out_3 ), 
    .en ( \pchb_cloud_53_inst_en3 ), 
    .\A[0].0 ( \n_83_FX3_a.1 ), 
    .\A[0].1 ( \n_83_FX3_a.0 ), 
    .\A[1].0 ( \d[4].1 ), 
    .\A[1].1 ( \d[4].0 ), 
    .\X.0 ( \n_57.0 ), 
    .\X.1 ( \n_57.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder13_RTL_BODY.g558 ( 
    .x ( \pchb_cloud_53_inst_en3 ), 
    .\a[0] ( \pchb_cloud_53_inst_go ), 
    .\a[1] ( \c21.e ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g563 ( 
    .V ( \pchb_cloud_53_inst_valid_out_1 ), 
    .en ( \pchb_cloud_53_inst_en0 ), 
    .\A[0].0 ( \d[1].1 ), 
    .\A[0].1 ( \d[1].0 ), 
    .\A[1].0 ( \n_83_FX3_a.0 ), 
    .\A[1].1 ( \n_83_FX3_a.1 ), 
    .\X.0 ( \n_79.0 ), 
    .\X.1 ( \n_79.1 ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_53_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_53_inst_go ), 
    .Ae ( \c53.e ), 
    .\A[0].0 ( \d[1].0 ), 
    .\A[0].1 ( \d[1].1 ), 
    .\A[1].0 ( \d[4].0 ), 
    .\A[1].1 ( \d[4].1 ), 
    .\A[2].0 ( \n_83_FX3_a.0 ), 
    .\A[2].1 ( \n_83_FX3_a.1 ), 
    .\V[0] ( \pchb_cloud_53_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_53_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_53_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_53_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder13_RTL_BODY.g550 ( 
    .\a[0] ( \pchb_cloud_53_inst_go ), 
    .\a[1] ( \c18.e ), 
    .\a[2] ( \c30.e ), 
    .\a[3] ( \c27.e ), 
    .x ( \pchb_cloud_53_inst_en0 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g552 ( 
    .V ( \pchb_cloud_54_inst_valid_out_0 ), 
    .en ( \pchb_cloud_54_inst_en0 ), 
    .\A[0].0 ( \n_83_FX3_a.1 ), 
    .\A[0].1 ( \n_83_FX3_a.0 ), 
    .\A[1].0 ( \d[3].1 ), 
    .\A[1].1 ( \d[3].0 ), 
    .\X.0 ( \n_58.0 ), 
    .\X.1 ( \n_58.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g553 ( 
    .V ( \pchb_cloud_54_inst_valid_out_2 ), 
    .en ( \pchb_cloud_54_inst_en0 ), 
    .\A[0].0 ( \d[0].1 ), 
    .\A[0].1 ( \d[0].0 ), 
    .\A[1].0 ( \n_83_FX3_a.0 ), 
    .\A[1].1 ( \n_83_FX3_a.1 ), 
    .\X.0 ( \n_80.0 ), 
    .\X.1 ( \n_80.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g556 ( 
    .V ( \pchb_cloud_54_inst_valid_out_1 ), 
    .en ( \pchb_cloud_54_inst_en0 ), 
    .\A[0].0 ( \d[3].1 ), 
    .\A[0].1 ( \d[3].0 ), 
    .\A[1].0 ( \n_83_FX3_a.0 ), 
    .\A[1].1 ( \n_83_FX3_a.1 ), 
    .\X.0 ( \n_77.0 ), 
    .\X.1 ( \n_77.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g562 ( 
    .V ( \pchb_cloud_54_inst_valid_out_3 ), 
    .en ( \pchb_cloud_54_inst_en3 ), 
    .\A[0].0 ( \n_83_FX3_a.1 ), 
    .\A[0].1 ( \n_83_FX3_a.0 ), 
    .\A[1].0 ( \d[0].1 ), 
    .\A[1].1 ( \d[0].0 ), 
    .\X.0 ( \n_61.0 ), 
    .\X.1 ( \n_61.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder13_RTL_BODY.g562 ( 
    .x ( \pchb_cloud_54_inst_en3 ), 
    .\a[0] ( \pchb_cloud_54_inst_go ), 
    .\a[1] ( \c17.e ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_54_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_54_inst_go ), 
    .Ae ( \c54.e ), 
    .\A[0].0 ( \d[0].0 ), 
    .\A[0].1 ( \d[0].1 ), 
    .\A[1].0 ( \d[3].0 ), 
    .\A[1].1 ( \d[3].1 ), 
    .\A[2].0 ( \n_83_FX3_a.0 ), 
    .\A[2].1 ( \n_83_FX3_a.1 ), 
    .\V[0] ( \pchb_cloud_54_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_54_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_54_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_54_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder13_RTL_BODY.g552 ( 
    .\a[0] ( \pchb_cloud_54_inst_go ), 
    .\a[1] ( \c20.e ), 
    .\a[2] ( \c29.e ), 
    .\a[3] ( \c26.e ), 
    .x ( \pchb_cloud_54_inst_en0 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g554 ( 
    .V ( \pchb_cloud_55_inst_valid_out_0 ), 
    .en ( \pchb_cloud_55_inst_en0 ), 
    .\A[0].0 ( \n_83_FX3_a.1 ), 
    .\A[0].1 ( \n_83_FX3_a.0 ), 
    .\A[1].0 ( \d[6].1 ), 
    .\A[1].1 ( \d[6].0 ), 
    .\X.0 ( \n_56.0 ), 
    .\X.1 ( \n_56.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g559 ( 
    .V ( \pchb_cloud_55_inst_valid_out_1 ), 
    .en ( \pchb_cloud_55_inst_en0 ), 
    .\A[0].0 ( \d[6].1 ), 
    .\A[0].1 ( \d[6].0 ), 
    .\A[1].0 ( \n_83_FX3_a.0 ), 
    .\A[1].1 ( \n_83_FX3_a.1 ), 
    .\X.0 ( \n_75.0 ), 
    .\X.1 ( \n_75.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g560 ( 
    .V ( \pchb_cloud_55_inst_valid_out_2 ), 
    .en ( \pchb_cloud_55_inst_en0 ), 
    .\A[0].0 ( \d[2].1 ), 
    .\A[0].1 ( \d[2].0 ), 
    .\A[1].0 ( \n_83_FX3_a.0 ), 
    .\A[1].1 ( \n_83_FX3_a.1 ), 
    .\X.0 ( \n_78.0 ), 
    .\X.1 ( \n_78.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder13_RTL_BODY.g561 ( 
    .V ( \pchb_cloud_55_inst_valid_out_3 ), 
    .en ( \pchb_cloud_55_inst_en3 ), 
    .\A[0].0 ( \n_83_FX3_a.1 ), 
    .\A[0].1 ( \n_83_FX3_a.0 ), 
    .\A[1].0 ( \d[2].1 ), 
    .\A[1].1 ( \d[2].0 ), 
    .\X.0 ( \n_59.0 ), 
    .\X.1 ( \n_59.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder13_RTL_BODY.g561 ( 
    .x ( \pchb_cloud_55_inst_en3 ), 
    .\a[0] ( \pchb_cloud_55_inst_go ), 
    .\a[1] ( \c19.e ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_55_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_55_inst_go ), 
    .Ae ( \c55.e ), 
    .\A[0].0 ( \d[2].0 ), 
    .\A[0].1 ( \d[2].1 ), 
    .\A[1].0 ( \d[6].0 ), 
    .\A[1].1 ( \d[6].1 ), 
    .\A[2].0 ( \n_83_FX3_a.0 ), 
    .\A[2].1 ( \n_83_FX3_a.1 ), 
    .\V[0] ( \pchb_cloud_55_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_55_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_55_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_55_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder13_RTL_BODY.g554 ( 
    .\a[0] ( \pchb_cloud_55_inst_go ), 
    .\a[1] ( \c23.e ), 
    .\a[2] ( \c32.e ), 
    .\a[3] ( \c28.e ), 
    .x ( \pchb_cloud_55_inst_en0 ));
  \synthesis.qdi.special.BUF.4 \pchb_cfbuf_56_FX_inst_n_83_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83.0 ), 
    .\L.1 ( \n_83.1 ), 
    .\L.e ( \n_83_56.e ), 
    .\R.0 ( \n_83_FX0.0 ), 
    .\R.1 ( \n_83_FX0.1 ), 
    .\R.e ( \pchb_cfbuf_56_FX_inst_en0 ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_56_FX_inst_n_83_buf_companion0 ( 
    .x ( \pchb_cfbuf_56_FX_inst_en0 ), 
    .\a[0] ( \c34.e ), 
    .\a[1] ( \c33.e ), 
    .\a[2] ( \c32.e ), 
    .\a[3] ( \c30.e ));
  \synthesis.qdi.special.BUF.4 \pchb_cfbuf_57_FX_inst_n_83_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83.0 ), 
    .\L.1 ( \n_83.1 ), 
    .\L.e ( \n_83_57.e ), 
    .\R.0 ( \n_83_FX1.0 ), 
    .\R.1 ( \n_83_FX1.1 ), 
    .\R.e ( \pchb_cfbuf_57_FX_inst_en0 ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_57_FX_inst_n_83_buf_companion0 ( 
    .x ( \pchb_cfbuf_57_FX_inst_en0 ), 
    .\a[0] ( \c29.e ), 
    .\a[1] ( \c28.e ), 
    .\a[2] ( \c27.e ), 
    .\a[3] ( \c26.e ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cfbuf_58_FX_inst_Le_merge ( 
    .x ( \n_83_SX0_iter2.e ), 
    .\a[0] ( \pchb_cfbuf_58_FX_inst_n_83_SX0_iter2_0e ), 
    .\a[1] ( \pchb_cfbuf_58_FX_inst_n_83_SX0_iter2_1e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_58_FX_inst_Re_a_merge ( 
    .x ( \pchb_cfbuf_58_FX_inst_en0 ), 
    .\a[0] ( \c25.e ), 
    .\a[1] ( \c24.e ), 
    .\a[2] ( \c23.e ), 
    .\a[3] ( \c21.e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_58_FX_inst_Re_b_merge ( 
    .x ( \pchb_cfbuf_58_FX_inst_en1 ), 
    .\a[0] ( \c20.e ), 
    .\a[1] ( \c19.e ), 
    .\a[2] ( \c18.e ), 
    .\a[3] ( \c17.e ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_58_FX_inst_n_83_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83_SX0_iter2.0 ), 
    .\L.1 ( \n_83_SX0_iter2.1 ), 
    .\L.e ( \pchb_cfbuf_58_FX_inst_n_83_SX0_iter2_0e ), 
    .\R.0 ( \n_83_FX2_a.0 ), 
    .\R.1 ( \n_83_FX2_a.1 ), 
    .\R.e ( \pchb_cfbuf_58_FX_inst_en0 ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_58_FX_inst_n_83_buf2 ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83_SX0_iter2.0 ), 
    .\L.1 ( \n_83_SX0_iter2.1 ), 
    .\L.e ( \pchb_cfbuf_58_FX_inst_n_83_SX0_iter2_1e ), 
    .\R.0 ( \n_83_FX2_b.0 ), 
    .\R.1 ( \n_83_FX2_b.1 ), 
    .\R.e ( \pchb_cfbuf_58_FX_inst_en1 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cfbuf_59_FX_inst_Le_merge ( 
    .x ( \n_83_59.e ), 
    .\a[0] ( \pchb_cfbuf_59_FX_inst_n_83_0e ), 
    .\a[1] ( \pchb_cfbuf_59_FX_inst_n_83_1e ));
  \synthesis.qdi.special.CTREE3.2 \pchb_cfbuf_59_FX_inst_Re_a_merge ( 
    .x ( \pchb_cfbuf_59_FX_inst_en0 ), 
    .\a[0] ( \c55.e ), 
    .\a[1] ( \c54.e ), 
    .\a[2] ( \c53.e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_59_FX_inst_Re_b_merge ( 
    .x ( \pchb_cfbuf_59_FX_inst_en1 ), 
    .\a[0] ( \c52.e ), 
    .\a[1] ( \c31.e ), 
    .\a[2] ( \c22.e ), 
    .\a[3] ( \n_83_FX3_16.e ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_59_FX_inst_n_83_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83.0 ), 
    .\L.1 ( \n_83.1 ), 
    .\L.e ( \pchb_cfbuf_59_FX_inst_n_83_0e ), 
    .\R.0 ( \n_83_FX3_a.0 ), 
    .\R.1 ( \n_83_FX3_a.1 ), 
    .\R.e ( \pchb_cfbuf_59_FX_inst_en0 ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_59_FX_inst_n_83_buf2 ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83.0 ), 
    .\L.1 ( \n_83.1 ), 
    .\L.e ( \pchb_cfbuf_59_FX_inst_n_83_1e ), 
    .\R.0 ( \n_83_FX3_b.0 ), 
    .\R.1 ( \n_83_FX3_b.1 ), 
    .\R.e ( \pchb_cfbuf_59_FX_inst_en1 ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_60_SX_inst_n_83_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \n_83.0 ), 
    .\L.1 ( \n_83.1 ), 
    .\L.e ( \n_83_60.e ), 
    .\R.0 ( \n_83_SX0_iter2.0 ), 
    .\R.1 ( \n_83_SX0_iter2.1 ), 
    .\R.e ( \n_83_SX0_iter2.e ));

endmodule
