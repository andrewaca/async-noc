

// Generated by cosim_wrapper.pl to be used for cosim

module decoder12_leaf_cosim_wrapper(interface In, interface Out0, interface Out1, interface S, input _RESET);

 decoder12_leaf decoder12_leaf_expanded (In.e[0] , In.e[1] , In.e[2] , In.e[3] , In.e[4] , In.e[5] 
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

module decoder12_leaf (\In_e[0] , \In_e[1] , \In_e[2] , \In_e[3] , \In_e[4] , \In_e[5] , \In_e[6] , \In_e[7] , \In_e[8] , 
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
  wire   \S_d[0][0] , \S_d[1][0] , \c0.e , \c1.e , \c2.e , \c24.e , \c25.e , \c26.e , \c27.e , \c28.e , \c29.e , \c3.e , \c30.e ;
  wire   \c31.e , \c32.e , \c4.e , \c5.e , \c6.e , \c7.e , \c8.e , \d[0].0 , \d[0].1 , \d[1].0 , \d[1].1 , \d[2].0 , \d[2].1 ;
  wire   \d[3].0 , \d[3].1 , \d[4].0 , \d[4].1 , \d[5].0 , \d[5].1 , \d[6].0 , \d[6].1 , \d[6]_57.e , \d[6]_SX0_iter2.0 ;
  wire   \d[6]_SX0_iter2.1 , \d[7].0 , \d[7].1 , \d[7]_58.e , \d[7]_SX0_iter2.0 , \d[7]_SX0_iter2.1 , \d[8].0 , \d[8].1 ;
  wire   \d[8]_59.e , \d[8]_SX0_iter2.0 , \d[8]_SX0_iter2.1 , \decoder12_leaf_RTL_BODY.n_0.0 , \decoder12_leaf_RTL_BODY.n_0.1 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_54.e , \decoder12_leaf_RTL_BODY.n_0_55.e , \decoder12_leaf_RTL_BODY.n_0_56.e ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX0_a.0 , \decoder12_leaf_RTL_BODY.n_0_FX0_a.1 , \decoder12_leaf_RTL_BODY.n_0_FX0_b.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX0_b.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_60.e , \decoder12_leaf_RTL_BODY.n_0_FX1_61.e ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_62.e , \decoder12_leaf_RTL_BODY.n_0_FX1_63.e , \decoder12_leaf_RTL_BODY.n_0_FX1_64.e ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_65.e , \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_0.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_0.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_1.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_1.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_2.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_2.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_3.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_3.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_4.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_4.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_a.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX1_a.1 , \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 , \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX2_42.e , \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 , \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 , \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 , \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.0 ;
  wire   \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.1 , \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.e , \n_53.0 , \n_53.1 , \n_54.0 ;
  wire   \n_54.1 , \n_55.0 , \n_55.1 , \n_56.0 , \n_56.1 , \n_57.0 , \n_57.1 , \n_58.0 , \n_58.1 , \n_59.0 , \n_59.1 , \n_60.0 ;
  wire   \n_60.1 , \n_72.0 , \n_72.1 , \n_73.0 , \n_73.1 , \n_74.0 , \n_74.1 , \n_75.0 , \n_75.1 , \n_76.0 , \n_76.1 , \n_77.0 ;
  wire   \n_77.1 , \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_SX0_iter2_0e ;
  wire   \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_SX0_iter2_1e ;
  wire   \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_0e , \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_1e ;
  wire   \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_0e , \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_1e ;
  wire   \pchb_cloud_23_inst_go , \pchb_cloud_23_inst_valid_out_0 , \pchb_cloud_49_inst_go , \pchb_cloud_49_inst_valid_out_0 ;
  wire   \pchb_cloud_49_inst_valid_out_1 , \pchb_cloud_50_inst_go , \pchb_cloud_50_inst_valid_out_0 ;
  wire   \pchb_cloud_50_inst_valid_out_1 , \pchb_cloud_50_inst_valid_out_2 , \pchb_cloud_50_inst_valid_out_3 ;
  wire   \pchb_cloud_51_inst_go , \pchb_cloud_51_inst_valid_out_0 , \pchb_cloud_51_inst_valid_out_1 ;
  wire   \pchb_cloud_51_inst_valid_out_2 , \pchb_cloud_51_inst_valid_out_3 , \pchb_cloud_52_inst_go ;
  wire   \pchb_cloud_52_inst_valid_out_0 , \pchb_cloud_52_inst_valid_out_1 , \pchb_cloud_52_inst_valid_out_2 ;
  wire   \pchb_cloud_52_inst_valid_out_3 ;

  trireg \c23.e , \c49.e , \c50.e , \c51.e , \c52.e , \pchb_cfbuf_53_FX_inst_en0 , \pchb_cfbuf_53_FX_inst_en1 ;
  trireg \pchb_cfbuf_54_FX_inst_en0 , \pchb_cfbuf_54_FX_inst_en1 , \pchb_cfbuf_55_FX_inst_en0 , \pchb_cfbuf_55_FX_inst_en1 ;
  trireg \pchb_cloud_23_inst_en0 , \pchb_cloud_39_inst_en0 , \pchb_cloud_40_inst_en0 , \pchb_cloud_41_inst_en0 ;
  trireg \pchb_cloud_49_inst_en0 , \pchb_cloud_50_inst_en0 , \pchb_cloud_50_inst_en3 , \pchb_cloud_51_inst_en0 ;
  trireg \pchb_cloud_51_inst_en3 , \pchb_cloud_52_inst_en0 , \pchb_cloud_52_inst_en3 ;



  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_0_inst_Out0_SEND.send.bits[0].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[0] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2.1 ), 
    .\E.e ( \c0.e ), 
    .\L[0].0 ( \n_77.0 ), 
    .\L[0].1 ( \n_77.1 ), 
    .\R.0 ( \Out0_d[0][0] ), 
    .\R.1 ( \Out0_d[1][0] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_1_inst_Out0_SEND.send.bits[1].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[1] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_0.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_0.1 ), 
    .\E.e ( \c1.e ), 
    .\L[0].0 ( \n_76.0 ), 
    .\L[0].1 ( \n_76.1 ), 
    .\R.0 ( \Out0_d[0][1] ), 
    .\R.1 ( \Out0_d[1][1] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_2_inst_Out0_SEND.send.bits[2].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[2] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_1.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_1.1 ), 
    .\E.e ( \c2.e ), 
    .\L[0].0 ( \n_75.0 ), 
    .\L[0].1 ( \n_75.1 ), 
    .\R.0 ( \Out0_d[0][2] ), 
    .\R.1 ( \Out0_d[1][2] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_3_inst_Out0_SEND.send.bits[3].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[3] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_2.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_2.1 ), 
    .\E.e ( \c3.e ), 
    .\L[0].0 ( \n_74.0 ), 
    .\L[0].1 ( \n_74.1 ), 
    .\R.0 ( \Out0_d[0][3] ), 
    .\R.1 ( \Out0_d[1][3] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_4_inst_Out0_SEND.send.bits[4].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[4] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_3.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_3.1 ), 
    .\E.e ( \c4.e ), 
    .\L[0].0 ( \n_73.0 ), 
    .\L[0].1 ( \n_73.1 ), 
    .\R.0 ( \Out0_d[0][4] ), 
    .\R.1 ( \Out0_d[1][4] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_5_inst_Out0_SEND.send.bits[5].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[5] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_4.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_4.1 ), 
    .\E.e ( \c5.e ), 
    .\L[0].0 ( \n_72.0 ), 
    .\L[0].1 ( \n_72.1 ), 
    .\R.0 ( \Out0_d[0][5] ), 
    .\R.1 ( \Out0_d[1][5] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_6_inst_Out0_SEND.send.bits[6].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[6] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\E.e ( \c6.e ), 
    .\L[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\L[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\R.0 ( \Out0_d[0][6] ), 
    .\R.1 ( \Out0_d[1][6] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_7_inst_Out0_SEND.send.bits[7].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[7] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\E.e ( \c7.e ), 
    .\L[0].0 ( \c7.e ), 
    .\L[0].1 ( 1'b0 ), 
    .\R.0 ( \Out0_d[0][7] ), 
    .\R.1 ( \Out0_d[1][7] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_8_inst_Out0_SEND.send.bits[8].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out0_e[8] ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\E.e ( \c8.e ), 
    .\L[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\L[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\R.0 ( \Out0_d[0][8] ), 
    .\R.1 ( \Out0_d[1][8] ));
  \synthesis.qdi.logic3.LOGIC3_01.4 \decoder12_leaf_RTL_BODY.g2 ( 
    .V ( \pchb_cloud_23_inst_valid_out_0 ), 
    .en ( \pchb_cloud_23_inst_en0 ), 
    .\A[0].0 ( \d[8].1 ), 
    .\A[0].1 ( \d[8].0 ), 
    .\A[1].0 ( \d[6].1 ), 
    .\A[1].1 ( \d[6].0 ), 
    .\A[2].0 ( \d[7].0 ), 
    .\A[2].1 ( \d[7].1 ), 
    .\X.0 ( \decoder12_leaf_RTL_BODY.n_0.0 ), 
    .\X.1 ( \decoder12_leaf_RTL_BODY.n_0.1 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder12_leaf_RTL_BODY.g2 ( 
    .x ( \pchb_cloud_23_inst_en0 ), 
    .\a[3] ( \pchb_cloud_23_inst_go ), 
    .\a[0] ( \decoder12_leaf_RTL_BODY.n_0_56.e ), 
    .\a[1] ( \decoder12_leaf_RTL_BODY.n_0_54.e ), 
    .\a[2] ( \decoder12_leaf_RTL_BODY.n_0_55.e ));
  \synthesis.qdi.special.CTRL31.2 \pchb_cloud_23_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_23_inst_go ), 
    .Ae ( \c23.e ), 
    .\A[0].0 ( \d[8].0 ), 
    .\A[0].1 ( \d[8].1 ), 
    .\A[1].0 ( \d[6].0 ), 
    .\A[1].1 ( \d[6].1 ), 
    .\A[2].0 ( \d[7].0 ), 
    .\A[2].1 ( \d[7].1 ), 
    .\V[0] ( \pchb_cloud_23_inst_valid_out_0 ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_24_inst_Out1_SEND.send.bits[0].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[0] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.1 ), 
    .\E.e ( \c24.e ), 
    .\L[0].0 ( \n_60.0 ), 
    .\L[0].1 ( \n_60.1 ), 
    .\R.0 ( \Out1_d[0][0] ), 
    .\R.1 ( \Out1_d[1][0] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_25_inst_Out1_SEND.send.bits[1].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[1] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.1 ), 
    .\E.e ( \c25.e ), 
    .\L[0].0 ( \n_59.0 ), 
    .\L[0].1 ( \n_59.1 ), 
    .\R.0 ( \Out1_d[0][1] ), 
    .\R.1 ( \Out1_d[1][1] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_26_inst_Out1_SEND.send.bits[2].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[2] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.1 ), 
    .\E.e ( \c26.e ), 
    .\L[0].0 ( \n_58.0 ), 
    .\L[0].1 ( \n_58.1 ), 
    .\R.0 ( \Out1_d[0][2] ), 
    .\R.1 ( \Out1_d[1][2] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_27_inst_Out1_SEND.send.bits[3].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[3] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.1 ), 
    .\E.e ( \c27.e ), 
    .\L[0].0 ( \n_57.0 ), 
    .\L[0].1 ( \n_57.1 ), 
    .\R.0 ( \Out1_d[0][3] ), 
    .\R.1 ( \Out1_d[1][3] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_28_inst_Out1_SEND.send.bits[4].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[4] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.1 ), 
    .\E.e ( \c28.e ), 
    .\L[0].0 ( \n_56.0 ), 
    .\L[0].1 ( \n_56.1 ), 
    .\R.0 ( \Out1_d[0][4] ), 
    .\R.1 ( \Out1_d[1][4] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_29_inst_Out1_SEND.send.bits[5].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[5] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.1 ), 
    .\E.e ( \c29.e ), 
    .\L[0].0 ( \n_55.0 ), 
    .\L[0].1 ( \n_55.1 ), 
    .\R.0 ( \Out1_d[0][5] ), 
    .\R.1 ( \Out1_d[1][5] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_30_inst_Out1_SEND.send.bits[6].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[6] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.1 ), 
    .\E.e ( \c30.e ), 
    .\L[0].0 ( \n_54.0 ), 
    .\L[0].1 ( \n_54.1 ), 
    .\R.0 ( \Out1_d[0][6] ), 
    .\R.1 ( \Out1_d[1][6] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_31_inst_Out1_SEND.send.bits[7].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[7] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\E.e ( \c31.e ), 
    .\L[0].0 ( \d[7]_SX0_iter2.0 ), 
    .\L[0].1 ( \d[7]_SX0_iter2.1 ), 
    .\R.0 ( \Out1_d[0][7] ), 
    .\R.1 ( \Out1_d[1][7] ));
  \synthesis.qdi.special.SEND_1of2.2 \pchb_cloud_32_inst_Out1_SEND.send.bits[8].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \Out1_e[8] ), 
    .\E.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.0 ), 
    .\E.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.1 ), 
    .\E.e ( \c32.e ), 
    .\L[0].0 ( \n_53.0 ), 
    .\L[0].1 ( \n_53.1 ), 
    .\R.0 ( \Out1_d[0][8] ), 
    .\R.1 ( \Out1_d[1][8] ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_33_inst_In_RECEIVE.recv.bits[0].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][0] ), 
    .\L.1 ( \In_d[1][0] ), 
    .\L.e ( \In_e[0] ), 
    .\R.0 ( \d[0].0 ), 
    .\R.1 ( \d[0].1 ), 
    .\R.e ( \c51.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_34_inst_In_RECEIVE.recv.bits[1].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][1] ), 
    .\L.1 ( \In_d[1][1] ), 
    .\L.e ( \In_e[1] ), 
    .\R.0 ( \d[1].0 ), 
    .\R.1 ( \d[1].1 ), 
    .\R.e ( \c52.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_35_inst_In_RECEIVE.recv.bits[2].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][2] ), 
    .\L.1 ( \In_d[1][2] ), 
    .\L.e ( \In_e[2] ), 
    .\R.0 ( \d[2].0 ), 
    .\R.1 ( \d[2].1 ), 
    .\R.e ( \c52.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_36_inst_In_RECEIVE.recv.bits[3].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][3] ), 
    .\L.1 ( \In_d[1][3] ), 
    .\L.e ( \In_e[3] ), 
    .\R.0 ( \d[3].0 ), 
    .\R.1 ( \d[3].1 ), 
    .\R.e ( \c51.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_37_inst_In_RECEIVE.recv.bits[4].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][4] ), 
    .\L.1 ( \In_d[1][4] ), 
    .\L.e ( \In_e[4] ), 
    .\R.0 ( \d[4].0 ), 
    .\R.1 ( \d[4].1 ), 
    .\R.e ( \c50.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_38_inst_In_RECEIVE.recv.bits[5].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][5] ), 
    .\L.1 ( \In_d[1][5] ), 
    .\L.e ( \In_e[5] ), 
    .\R.0 ( \d[5].0 ), 
    .\R.1 ( \d[5].1 ), 
    .\R.e ( \c50.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_39_inst_In_RECEIVE.recv.bits[6].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][6] ), 
    .\L.1 ( \In_d[1][6] ), 
    .\L.e ( \In_e[6] ), 
    .\R.0 ( \d[6].0 ), 
    .\R.1 ( \d[6].1 ), 
    .\R.e ( \pchb_cloud_39_inst_en0 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cloud_39_inst_In_RECEIVE.recv.bits[6].recv_companion0 ( 
    .x ( \pchb_cloud_39_inst_en0 ), 
    .\a[0] ( \c23.e ), 
    .\a[1] ( \d[6]_57.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_40_inst_In_RECEIVE.recv.bits[7].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][7] ), 
    .\L.1 ( \In_d[1][7] ), 
    .\L.e ( \In_e[7] ), 
    .\R.0 ( \d[7].0 ), 
    .\R.1 ( \d[7].1 ), 
    .\R.e ( \pchb_cloud_40_inst_en0 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cloud_40_inst_In_RECEIVE.recv.bits[7].recv_companion0 ( 
    .x ( \pchb_cloud_40_inst_en0 ), 
    .\a[0] ( \c23.e ), 
    .\a[1] ( \d[7]_58.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_41_inst_In_RECEIVE.recv.bits[8].recv ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \In_d[0][8] ), 
    .\L.1 ( \In_d[1][8] ), 
    .\L.e ( \In_e[8] ), 
    .\R.0 ( \d[8].0 ), 
    .\R.1 ( \d[8].1 ), 
    .\R.e ( \pchb_cloud_41_inst_en0 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cloud_41_inst_In_RECEIVE.recv.bits[8].recv_companion0 ( 
    .x ( \pchb_cloud_41_inst_en0 ), 
    .\a[0] ( \c23.e ), 
    .\a[1] ( \d[8]_59.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cloud_42_inst_S_SEND.send.bits[0].send ( 
    ._RESET ( _RESET ), 
    .\R.e ( \S_e ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX2_42.e ), 
    .\R.0 ( \S_d[0][0] ), 
    .\R.1 ( \S_d[1][0] ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g550 ( 
    .V ( \pchb_cloud_49_inst_valid_out_0 ), 
    .en ( \pchb_cloud_49_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\A[1].0 ( \d[8]_SX0_iter2.1 ), 
    .\A[1].1 ( \d[8]_SX0_iter2.0 ), 
    .\X.0 ( \n_53.0 ), 
    .\X.1 ( \n_53.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g553 ( 
    .V ( \pchb_cloud_49_inst_valid_out_1 ), 
    .en ( \pchb_cloud_49_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\A[1].0 ( \d[6]_SX0_iter2.1 ), 
    .\A[1].1 ( \d[6]_SX0_iter2.0 ), 
    .\X.0 ( \n_54.0 ), 
    .\X.1 ( \n_54.1 ));
  \synthesis.qdi.special.CTRL32.2 \pchb_cloud_49_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_49_inst_go ), 
    .Ae ( \c49.e ), 
    .\A[0].0 ( \d[6]_SX0_iter2.0 ), 
    .\A[0].1 ( \d[6]_SX0_iter2.1 ), 
    .\A[1].0 ( \d[8]_SX0_iter2.0 ), 
    .\A[1].1 ( \d[8]_SX0_iter2.1 ), 
    .\A[2].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\A[2].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\V[0] ( \pchb_cloud_49_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_49_inst_valid_out_1 ));
  \synthesis.qdi.special.CTREE3.2 \ctreedecoder12_leaf_RTL_BODY.g550 ( 
    .\a[0] ( \pchb_cloud_49_inst_go ), 
    .\a[1] ( \c32.e ), 
    .\a[2] ( \c30.e ), 
    .x ( \pchb_cloud_49_inst_en0 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g547 ( 
    .V ( \pchb_cloud_50_inst_valid_out_0 ), 
    .en ( \pchb_cloud_50_inst_en0 ), 
    .\A[0].0 ( \d[5].1 ), 
    .\A[0].1 ( \d[5].0 ), 
    .\A[1].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\A[1].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\X.0 ( \n_72.0 ), 
    .\X.1 ( \n_72.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g548 ( 
    .V ( \pchb_cloud_50_inst_valid_out_2 ), 
    .en ( \pchb_cloud_50_inst_en0 ), 
    .\A[0].0 ( \d[4].1 ), 
    .\A[0].1 ( \d[4].0 ), 
    .\A[1].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\A[1].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\X.0 ( \n_73.0 ), 
    .\X.1 ( \n_73.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g554 ( 
    .V ( \pchb_cloud_50_inst_valid_out_1 ), 
    .en ( \pchb_cloud_50_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\A[1].0 ( \d[5].1 ), 
    .\A[1].1 ( \d[5].0 ), 
    .\X.0 ( \n_55.0 ), 
    .\X.1 ( \n_55.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g555 ( 
    .V ( \pchb_cloud_50_inst_valid_out_3 ), 
    .en ( \pchb_cloud_50_inst_en3 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\A[1].0 ( \d[4].1 ), 
    .\A[1].1 ( \d[4].0 ), 
    .\X.0 ( \n_56.0 ), 
    .\X.1 ( \n_56.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder12_leaf_RTL_BODY.g555 ( 
    .x ( \pchb_cloud_50_inst_en3 ), 
    .\a[0] ( \pchb_cloud_50_inst_go ), 
    .\a[1] ( \c28.e ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_50_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_50_inst_go ), 
    .Ae ( \c50.e ), 
    .\A[0].0 ( \d[4].0 ), 
    .\A[0].1 ( \d[4].1 ), 
    .\A[1].0 ( \d[5].0 ), 
    .\A[1].1 ( \d[5].1 ), 
    .\A[2].0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\A[2].1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\V[0] ( \pchb_cloud_50_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_50_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_50_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_50_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder12_leaf_RTL_BODY.g547 ( 
    .\a[0] ( \pchb_cloud_50_inst_go ), 
    .\a[1] ( \c29.e ), 
    .\a[2] ( \c5.e ), 
    .\a[3] ( \c4.e ), 
    .x ( \pchb_cloud_50_inst_en0 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g549 ( 
    .V ( \pchb_cloud_51_inst_valid_out_0 ), 
    .en ( \pchb_cloud_51_inst_en0 ), 
    .\A[0].0 ( \d[0].1 ), 
    .\A[0].1 ( \d[0].0 ), 
    .\A[1].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\X.0 ( \n_77.0 ), 
    .\X.1 ( \n_77.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g551 ( 
    .V ( \pchb_cloud_51_inst_valid_out_2 ), 
    .en ( \pchb_cloud_51_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].0 ( \d[3].1 ), 
    .\A[1].1 ( \d[3].0 ), 
    .\X.0 ( \n_57.0 ), 
    .\X.1 ( \n_57.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g552 ( 
    .V ( \pchb_cloud_51_inst_valid_out_3 ), 
    .en ( \pchb_cloud_51_inst_en3 ), 
    .\A[0].0 ( \d[3].1 ), 
    .\A[0].1 ( \d[3].0 ), 
    .\A[1].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\X.0 ( \n_74.0 ), 
    .\X.1 ( \n_74.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder12_leaf_RTL_BODY.g552 ( 
    .x ( \pchb_cloud_51_inst_en3 ), 
    .\a[0] ( \pchb_cloud_51_inst_go ), 
    .\a[1] ( \c3.e ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g559 ( 
    .V ( \pchb_cloud_51_inst_valid_out_1 ), 
    .en ( \pchb_cloud_51_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].0 ( \d[0].1 ), 
    .\A[1].1 ( \d[0].0 ), 
    .\X.0 ( \n_60.0 ), 
    .\X.1 ( \n_60.1 ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_51_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_51_inst_go ), 
    .Ae ( \c51.e ), 
    .\A[0].0 ( \d[0].0 ), 
    .\A[0].1 ( \d[0].1 ), 
    .\A[1].0 ( \d[3].0 ), 
    .\A[1].1 ( \d[3].1 ), 
    .\A[2].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\A[2].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\V[0] ( \pchb_cloud_51_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_51_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_51_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_51_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder12_leaf_RTL_BODY.g549 ( 
    .\a[0] ( \pchb_cloud_51_inst_go ), 
    .\a[1] ( \c27.e ), 
    .\a[2] ( \c24.e ), 
    .\a[3] ( \c0.e ), 
    .x ( \pchb_cloud_51_inst_en0 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g556 ( 
    .V ( \pchb_cloud_52_inst_valid_out_0 ), 
    .en ( \pchb_cloud_52_inst_en0 ), 
    .\A[0].0 ( \d[2].1 ), 
    .\A[0].1 ( \d[2].0 ), 
    .\A[1].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\X.0 ( \n_75.0 ), 
    .\X.1 ( \n_75.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g557 ( 
    .V ( \pchb_cloud_52_inst_valid_out_1 ), 
    .en ( \pchb_cloud_52_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].0 ( \d[2].1 ), 
    .\A[1].1 ( \d[2].0 ), 
    .\X.0 ( \n_58.0 ), 
    .\X.1 ( \n_58.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g558 ( 
    .V ( \pchb_cloud_52_inst_valid_out_2 ), 
    .en ( \pchb_cloud_52_inst_en0 ), 
    .\A[0].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\A[0].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].0 ( \d[1].1 ), 
    .\A[1].1 ( \d[1].0 ), 
    .\X.0 ( \n_59.0 ), 
    .\X.1 ( \n_59.1 ));
  \synthesis.qdi.logic2.LOGIC2_1.2 \decoder12_leaf_RTL_BODY.g560 ( 
    .V ( \pchb_cloud_52_inst_valid_out_3 ), 
    .en ( \pchb_cloud_52_inst_en3 ), 
    .\A[0].0 ( \d[1].1 ), 
    .\A[0].1 ( \d[1].0 ), 
    .\A[1].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\A[1].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\X.0 ( \n_76.0 ), 
    .\X.1 ( \n_76.1 ));
  \synthesis.qdi.special.CTREE2.2 \ctreedecoder12_leaf_RTL_BODY.g560 ( 
    .x ( \pchb_cloud_52_inst_en3 ), 
    .\a[0] ( \pchb_cloud_52_inst_go ), 
    .\a[1] ( \c1.e ));
  \synthesis.qdi.special.CTRL34.2 \pchb_cloud_52_inst_controller ( 
    ._RESET ( _RESET ), 
    .en ( \pchb_cloud_52_inst_go ), 
    .Ae ( \c52.e ), 
    .\A[0].0 ( \d[1].0 ), 
    .\A[0].1 ( \d[1].1 ), 
    .\A[1].0 ( \d[2].0 ), 
    .\A[1].1 ( \d[2].1 ), 
    .\A[2].0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\A[2].1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\V[0] ( \pchb_cloud_52_inst_valid_out_0 ), 
    .\V[1] ( \pchb_cloud_52_inst_valid_out_1 ), 
    .\V[2] ( \pchb_cloud_52_inst_valid_out_2 ), 
    .\V[3] ( \pchb_cloud_52_inst_valid_out_3 ));
  \synthesis.qdi.special.CTREE4.2 \ctreedecoder12_leaf_RTL_BODY.g556 ( 
    .\a[0] ( \pchb_cloud_52_inst_go ), 
    .\a[1] ( \c26.e ), 
    .\a[2] ( \c25.e ), 
    .\a[3] ( \c2.e ), 
    .x ( \pchb_cloud_52_inst_en0 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cfbuf_53_FX_inst_Le_merge ( 
    .x ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.e ), 
    .\a[0] ( \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_SX0_iter2_0e ), 
    .\a[1] ( \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_SX0_iter2_1e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_53_FX_inst_Re_a_merge ( 
    .x ( \pchb_cfbuf_53_FX_inst_en0 ), 
    .\a[0] ( \c32.e ), 
    .\a[1] ( \c30.e ), 
    .\a[2] ( \c29.e ), 
    .\a[3] ( \c28.e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_53_FX_inst_Re_b_merge ( 
    .x ( \pchb_cfbuf_53_FX_inst_en1 ), 
    .\a[0] ( \c27.e ), 
    .\a[1] ( \c26.e ), 
    .\a[2] ( \c25.e ), 
    .\a[3] ( \c24.e ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.1 ), 
    .\L.e ( \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_SX0_iter2_0e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_a.1 ), 
    .\R.e ( \pchb_cfbuf_53_FX_inst_en0 ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_buf2 ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.1 ), 
    .\L.e ( \pchb_cfbuf_53_FX_inst_decoder12_leaf_RTL_BODY.n_0_SX0_iter2_1e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX0_b.1 ), 
    .\R.e ( \pchb_cfbuf_53_FX_inst_en1 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cfbuf_54_FX_inst_Le_merge ( 
    .x ( \decoder12_leaf_RTL_BODY.n_0_54.e ), 
    .\a[0] ( \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_0e ), 
    .\a[1] ( \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_1e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_54_FX_inst_Re_a_merge ( 
    .x ( \pchb_cfbuf_54_FX_inst_en0 ), 
    .\a[0] ( \decoder12_leaf_RTL_BODY.n_0_FX1_65.e ), 
    .\a[1] ( \decoder12_leaf_RTL_BODY.n_0_FX1_64.e ), 
    .\a[2] ( \decoder12_leaf_RTL_BODY.n_0_FX1_63.e ), 
    .\a[3] ( \decoder12_leaf_RTL_BODY.n_0_FX1_62.e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_54_FX_inst_Re_b_merge ( 
    .x ( \pchb_cfbuf_54_FX_inst_en1 ), 
    .\a[0] ( \decoder12_leaf_RTL_BODY.n_0_FX1_61.e ), 
    .\a[1] ( \decoder12_leaf_RTL_BODY.n_0_FX1_60.e ), 
    .\a[2] ( \c52.e ), 
    .\a[3] ( \c51.e ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0.1 ), 
    .\L.e ( \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_0e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.1 ), 
    .\R.e ( \pchb_cfbuf_54_FX_inst_en0 ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_buf2 ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0.1 ), 
    .\L.e ( \pchb_cfbuf_54_FX_inst_decoder12_leaf_RTL_BODY.n_0_1e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\R.e ( \pchb_cfbuf_54_FX_inst_en1 ));
  \synthesis.qdi.special.CTREE2.2 \pchb_cfbuf_55_FX_inst_Le_merge ( 
    .x ( \decoder12_leaf_RTL_BODY.n_0_55.e ), 
    .\a[0] ( \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_0e ), 
    .\a[1] ( \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_1e ));
  \synthesis.qdi.special.CTREE3.2 \pchb_cfbuf_55_FX_inst_Re_a_merge ( 
    .x ( \pchb_cfbuf_55_FX_inst_en0 ), 
    .\a[0] ( \c50.e ), 
    .\a[1] ( \c49.e ), 
    .\a[2] ( \decoder12_leaf_RTL_BODY.n_0_FX2_42.e ));
  \synthesis.qdi.special.CTREE4.2 \pchb_cfbuf_55_FX_inst_Re_b_merge ( 
    .x ( \pchb_cfbuf_55_FX_inst_en1 ), 
    .\a[0] ( \c31.e ), 
    .\a[1] ( \c8.e ), 
    .\a[2] ( \c7.e ), 
    .\a[3] ( \c6.e ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0.1 ), 
    .\L.e ( \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_0e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_a.1 ), 
    .\R.e ( \pchb_cfbuf_55_FX_inst_en0 ));
  \synthesis.qdi.special.BUF.6 \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_buf2 ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0.1 ), 
    .\L.e ( \pchb_cfbuf_55_FX_inst_decoder12_leaf_RTL_BODY.n_0_1e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX2_b.1 ), 
    .\R.e ( \pchb_cfbuf_55_FX_inst_en1 ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_56_SX_inst_decoder12_leaf_RTL_BODY.n_0_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_56.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.1 ), 
    .\R.e ( \decoder12_leaf_RTL_BODY.n_0_SX0_iter2.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_57_SX_inst_d[6]_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \d[6].0 ), 
    .\L.1 ( \d[6].1 ), 
    .\L.e ( \d[6]_57.e ), 
    .\R.0 ( \d[6]_SX0_iter2.0 ), 
    .\R.1 ( \d[6]_SX0_iter2.1 ), 
    .\R.e ( \c49.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_58_SX_inst_d[7]_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \d[7].0 ), 
    .\L.1 ( \d[7].1 ), 
    .\L.e ( \d[7]_58.e ), 
    .\R.0 ( \d[7]_SX0_iter2.0 ), 
    .\R.1 ( \d[7]_SX0_iter2.1 ), 
    .\R.e ( \c31.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_59_SX_inst_d[8]_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \d[8].0 ), 
    .\L.1 ( \d[8].1 ), 
    .\L.e ( \d[8]_59.e ), 
    .\R.0 ( \d[8]_SX0_iter2.0 ), 
    .\R.1 ( \d[8]_SX0_iter2.1 ), 
    .\R.e ( \c49.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_60_SX_inst_decoder12_leaf_RTL_BODY.n_0_FX1_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX1_60.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2.1 ), 
    .\R.e ( \c0.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_61_SX_inst_decoder12_leaf_RTL_BODY.n_0_FX1_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_b.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX1_61.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_0.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_0.1 ), 
    .\R.e ( \c1.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_62_SX_inst_decoder12_leaf_RTL_BODY.n_0_FX1_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX1_62.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_1.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_1.1 ), 
    .\R.e ( \c2.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_63_SX_inst_decoder12_leaf_RTL_BODY.n_0_FX1_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX1_63.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_2.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_2.1 ), 
    .\R.e ( \c3.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_64_SX_inst_decoder12_leaf_RTL_BODY.n_0_FX1_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX1_64.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_3.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_3.1 ), 
    .\R.e ( \c4.e ));
  \synthesis.qdi.special.BUF.2 \pchb_cfbuf_65_SX_inst_decoder12_leaf_RTL_BODY.n_0_FX1_buf ( 
    ._RESET ( _RESET ), 
    .\L.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.0 ), 
    .\L.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_a.1 ), 
    .\L.e ( \decoder12_leaf_RTL_BODY.n_0_FX1_65.e ), 
    .\R.0 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_4.0 ), 
    .\R.1 ( \decoder12_leaf_RTL_BODY.n_0_FX1_SX0_iter2_4.1 ), 
    .\R.e ( \c5.e ));

endmodule
