`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
`E1OFN_M(2,1)
`E1OFN_M(2,4)

module router(interface
C1in, C2in, Pin,
C1out, C2out, Pout,
C2_sel0, P_sel0, C1_Grant,
C1_sel0, P_sel1, C2_Grant,
C1_sel1, C2_sel1, P_Grant,
input _RESET
);
	parameter WIDTH = 9;
	
	e1ofN_M #(.N(2), .M(1)) C1_S ();
	e1ofN_M #(.N(2), .M(1)) C2_S ();
	e1ofN_M #(.N(2), .M(1)) P_S ();

	e1ofN_M #(.N(2), .M(WIDTH)) C1_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C1_1 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_1 ();
	e1ofN_M #(.N(2), .M(WIDTH)) P_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) P_1 ();

	decoder_leaf_cosim_wrapper dec_C1(.In(C1in), .Out0(C1_0), .Out1(C1_1), .S(C1_S), ._RESET(_RESET) );
	decoder_leaf_cosim_wrapper dec_C2(.In(C2in), .Out0(C2_0), .Out1(C2_1), .S(C2_S), ._RESET(_RESET) );
	decoder_parent_cosim_wrapper dec_P(.In(Pin), .Out0(P_0), .Out1(P_1), .S(P_S), ._RESET(_RESET) );

	special_split_cosim_wrapper sp_C1(.In(C1_S), .Out0(C1_sel0), .Out1(C1_sel1), ._RESET(_RESET) );
	special_split_cosim_wrapper sp_C2(.In(C2_S), .Out0(C2_sel0), .Out1(C2_sel1), ._RESET(_RESET) );
	special_split_cosim_wrapper sp_P(.In(P_S), .Out0(P_sel0), .Out1(P_sel1), ._RESET(_RESET) );
	
	merge_cosim_wrapper merge_P(.In0(C1_1), .In1(C2_1), .S(P_Grant), .Out(Pout), ._RESET(_RESET) );
	merge_cosim_wrapper merge_C1(.In0(C2_0), .In1(P_0), .S(C1_Grant), .Out(C1out), ._RESET(_RESET) );
	merge_cosim_wrapper merge_C2(.In0(C1_0), .In1(P_1), .S(C2_Grant), .Out(C2out), ._RESET(_RESET) );
endmodule

