`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
`E1OFN_M(2,1)
`E1OFN_M(2,4)

module merge_wrapper(interface In0, In1, S, Out, input _RESET);
	e1ofN_M #(.N(2), .M(9)) In0_buf ();
	e1ofN_M #(.N(2), .M(9)) In1_buf ();
	e1ofN_M #(.N(2), .M(1)) S_buf ();
	e1ofN_M #(.N(2), .M(9)) Out_buf ();
	
	full_buffer #(.W(9)) f1(In0, In0_buf);
	full_buffer #(.W(9)) f2(In1, In1_buf);
	full_buffer #(.W(1)) f3(S,   S_buf);
	full_buffer #(.W(9)) f4(Out_buf, Out);
	
	merge_cosim_wrapper merge_rtl( .In0(In0_buf), .In1(In1_buf), .S(S_buf), .Out(Out_buf), ._RESET(_RESET) );
endmodule
