`timescale 1ns/10ps

module router11_wrapper(interface
C1in, C2in, Pin,
C1out, C2out, Pout,
C2_sel0, P_sel0, C1_Grant,
C1_sel0, P_sel1, C2_Grant,
C1_sel1, C2_sel1, P_Grant,
input _RESET
);

	e1ofN_M #(.N(2), .M(1)) C1_S ();
	e1ofN_M #(.N(2), .M(1)) C2_S ();
	e1ofN_M #(.N(2), .M(1)) P_S ();
	e1ofN_M #(.N(2), .M(9)) C1_0 ();
	e1ofN_M #(.N(2), .M(9)) C1_1 ();
	e1ofN_M #(.N(2), .M(9)) C2_0 ();
	e1ofN_M #(.N(2), .M(9)) C2_1 ();
	e1ofN_M #(.N(2), .M(9)) P_0 ();
	e1ofN_M #(.N(2), .M(9)) P_1 ();

	decoder11_wrapper 	  d0(.In(Pin) , .Out0(P_0) , .Out1(P_1) , .S(P_S) , ._RESET(_RESET) );
	decoder11_leaf_wrapper d1(.In(C1in), .Out0(C1_0), .Out1(C1_1), .S(C1_S), ._RESET(_RESET) );
	decoder11_leaf_wrapper d2(.In(C2in), .Out0(C2_0), .Out1(C2_1), .S(C2_S), ._RESET(_RESET) );

	special_split_wrapper s0(.In(P_S), .Out0(P_sel0), .Out1(P_sel1), ._RESET(_RESET) );
	special_split_wrapper s1(.In(C1_S), .Out0(C1_sel0), .Out1(C1_sel1), ._RESET(_RESET) );
	special_split_wrapper s2(.In(C2_S), .Out0(C2_sel0), .Out1(C2_sel1), ._RESET(_RESET) );
		
	merge_wrapper m0(.In0(C1_1), .In1(C2_1), .S(P_Grant), .Out(Pout), ._RESET(_RESET) );
	merge_wrapper m1(.In0(C2_0), .In1(P_0), .S(C1_Grant), .Out(C1out), ._RESET(_RESET) );
	merge_wrapper m2(.In0(C1_0), .In1(P_1), .S(C2_Grant), .Out(C2out), ._RESET(_RESET) );
endmodule
