`timescale 1ns/10ps

module errorDetect_wrapper(interface In, Out, Error, input _RESET);
	e1ofN_M #(.N(2), .M(9)) In_buf ();
	e1ofN_M #(.N(2), .M(9)) Out_buf ();
	e1ofN_M #(.N(2), .M(1)) Err_buf ();
	
	full_buffer #(.W(9)) f1(In, In_buf);
	full_buffer #(.W(9)) f2(Out_buf, Out);
	full_buffer #(.W(1)) f4(Err_buf, Error);	
	
	errorDetect_cosim_wrapper err( .In(In_buf), .Out(Out_buf), .Error(Err_buf), ._RESET(_RESET) );
endmodule
