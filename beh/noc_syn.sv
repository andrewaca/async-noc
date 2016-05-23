`timescale 1ns/10ps

module noc_syn(interface Ain, Bin, Cin, Din, Ein, Fin, Gin, Hin, Iin, Jin, Kin, Lin, Min, Nin, Oin, Pin,
Aout, Bout, Cout, Dout, Eout, Fout, Gout, Hout, Iout, Jout, Kout, Lout, Mout, Nout, Oout, Pout,
Aerr, Berr, Cerr, Derr, Eerr, Ferr, Gerr, Herr, Ierr, Jerr, Kerr, Lerr, Merr, Nerr, Oerr, Perr,
input _RESET
);
	e1ofN_M #(.N(2), .M(9)) p1out_p2in ();
	e1ofN_M #(.N(2), .M(9)) p2out_p1in ();
	e1ofN_M #(.N(2), .M(9)) p3in ();
	e1ofN_M #(.N(2), .M(9)) p3out ();
	e1ofN_M #(.N(2), .M(9)) p4in ();
	e1ofN_M #(.N(2), .M(9)) p4out ();
	e1ofN_M #(.N(2), .M(9)) p5in ();
	e1ofN_M #(.N(2), .M(9)) p5out ();
	e1ofN_M #(.N(2), .M(9)) p6in ();
	e1ofN_M #(.N(2), .M(9)) p6out ();
	e1ofN_M #(.N(2), .M(9)) p7in ();
	e1ofN_M #(.N(2), .M(9)) p7out ();
	e1ofN_M #(.N(2), .M(9)) p8in ();
	e1ofN_M #(.N(2), .M(9)) p8out ();
	e1ofN_M #(.N(2), .M(9)) p9in ();
	e1ofN_M #(.N(2), .M(9)) p9out ();
	e1ofN_M #(.N(2), .M(9)) p10in ();
	e1ofN_M #(.N(2), .M(9)) p10out ();
	e1ofN_M #(.N(2), .M(9)) p11in ();
	e1ofN_M #(.N(2), .M(9)) p11out ();
	e1ofN_M #(.N(2), .M(9)) p12in ();
	e1ofN_M #(.N(2), .M(9)) p12out ();
	e1ofN_M #(.N(2), .M(9)) p13in ();
	e1ofN_M #(.N(2), .M(9)) p13out ();
	e1ofN_M #(.N(2), .M(9)) p14in ();
	e1ofN_M #(.N(2), .M(9)) p14out ();
	
	e1ofN_M #(.N(2), .M(9)) Aout_mid ();
	e1ofN_M #(.N(2), .M(9)) Bout_mid ();
	e1ofN_M #(.N(2), .M(9)) Cout_mid ();
	e1ofN_M #(.N(2), .M(9)) Dout_mid ();
	e1ofN_M #(.N(2), .M(9)) Eout_mid ();
	e1ofN_M #(.N(2), .M(9)) Fout_mid ();
	e1ofN_M #(.N(2), .M(9)) Gout_mid ();
	e1ofN_M #(.N(2), .M(9)) Hout_mid ();
	e1ofN_M #(.N(2), .M(9)) Iout_mid ();
	e1ofN_M #(.N(2), .M(9)) Jout_mid ();
	e1ofN_M #(.N(2), .M(9)) Kout_mid ();
	e1ofN_M #(.N(2), .M(9)) Lout_mid ();
	e1ofN_M #(.N(2), .M(9)) Mout_mid ();
	e1ofN_M #(.N(2), .M(9)) Nout_mid ();
	e1ofN_M #(.N(2), .M(9)) Oout_mid ();
	e1ofN_M #(.N(2), .M(9)) Pout_mid ();
	
	e1ofN_M #(.N(2), .M(1)) arb0 ();
	e1ofN_M #(.N(2), .M(1)) arb1 ();
	e1ofN_M #(.N(2), .M(1)) arb2 ();
	e1ofN_M #(.N(2), .M(1)) arb3 ();
	e1ofN_M #(.N(2), .M(1)) arb4 ();
	e1ofN_M #(.N(2), .M(1)) arb5 ();
	e1ofN_M #(.N(2), .M(1)) arb6 ();
	e1ofN_M #(.N(2), .M(1)) arb7 ();
	e1ofN_M #(.N(2), .M(1)) arb8 ();
	e1ofN_M #(.N(2), .M(1)) arb9 ();
	e1ofN_M #(.N(2), .M(1)) arb10 ();
	e1ofN_M #(.N(2), .M(1)) arb11 ();
	e1ofN_M #(.N(2), .M(1)) arb12 ();
	e1ofN_M #(.N(2), .M(1)) arb13 ();
	e1ofN_M #(.N(2), .M(1)) arb14 ();
	e1ofN_M #(.N(2), .M(1)) arb15 ();
	e1ofN_M #(.N(2), .M(1)) arb16 ();
	e1ofN_M #(.N(2), .M(1)) arb17 ();
	e1ofN_M #(.N(2), .M(1)) arb18 ();
	e1ofN_M #(.N(2), .M(1)) arb19 ();
	e1ofN_M #(.N(2), .M(1)) arb20 ();
	e1ofN_M #(.N(2), .M(1)) arb21 ();
	e1ofN_M #(.N(2), .M(1)) arb22 ();
	e1ofN_M #(.N(2), .M(1)) arb23 ();
	e1ofN_M #(.N(2), .M(1)) arb24 ();
	e1ofN_M #(.N(2), .M(1)) arb25 ();
	e1ofN_M #(.N(2), .M(1)) arb26 ();
	e1ofN_M #(.N(2), .M(1)) arb27 ();
	e1ofN_M #(.N(2), .M(1)) arb28 ();
	e1ofN_M #(.N(2), .M(1)) arb29 ();
	e1ofN_M #(.N(2), .M(1)) arb30 ();
	e1ofN_M #(.N(2), .M(1)) arb31 ();
	e1ofN_M #(.N(2), .M(1)) arb32 ();
	e1ofN_M #(.N(2), .M(1)) arb33 ();
	e1ofN_M #(.N(2), .M(1)) arb34 ();
	e1ofN_M #(.N(2), .M(1)) arb35 ();
	e1ofN_M #(.N(2), .M(1)) arb36 ();
	e1ofN_M #(.N(2), .M(1)) arb37 ();
	e1ofN_M #(.N(2), .M(1)) arb38 ();
	e1ofN_M #(.N(2), .M(1)) arb39 ();
	e1ofN_M #(.N(2), .M(1)) arb40 ();
	e1ofN_M #(.N(2), .M(1)) arb41 ();
	e1ofN_M #(.N(2), .M(1)) arb42 ();
	e1ofN_M #(.N(2), .M(1)) arb43 ();
	e1ofN_M #(.N(2), .M(1)) arb44 ();
	e1ofN_M #(.N(2), .M(1)) arb45 ();
	e1ofN_M #(.N(2), .M(1)) arb46 ();
	e1ofN_M #(.N(2), .M(1)) arb47 ();
	e1ofN_M #(.N(2), .M(1)) arb48 ();
	e1ofN_M #(.N(2), .M(1)) arb49 ();
	e1ofN_M #(.N(2), .M(1)) arb50 ();
	e1ofN_M #(.N(2), .M(1)) arb51 ();
	e1ofN_M #(.N(2), .M(1)) arb52 ();
	e1ofN_M #(.N(2), .M(1)) arb53 ();
	e1ofN_M #(.N(2), .M(1)) arb54 ();
	e1ofN_M #(.N(2), .M(1)) arb55 ();
	e1ofN_M #(.N(2), .M(1)) arb56 ();
	e1ofN_M #(.N(2), .M(1)) arb57 ();
	e1ofN_M #(.N(2), .M(1)) arb58 ();
	e1ofN_M #(.N(2), .M(1)) arb59 ();
	e1ofN_M #(.N(2), .M(1)) arb60 ();
	e1ofN_M #(.N(2), .M(1)) arb61 ();
	e1ofN_M #(.N(2), .M(1)) arb62 ();
	e1ofN_M #(.N(2), .M(1)) arb63 ();
	e1ofN_M #(.N(2), .M(1)) arb64 ();
	e1ofN_M #(.N(2), .M(1)) arb65 ();
	e1ofN_M #(.N(2), .M(1)) arb66 ();
	e1ofN_M #(.N(2), .M(1)) arb67 ();
	e1ofN_M #(.N(2), .M(1)) arb68 ();
	e1ofN_M #(.N(2), .M(1)) arb69 ();
	e1ofN_M #(.N(2), .M(1)) arb70 ();
	e1ofN_M #(.N(2), .M(1)) arb71 ();
	e1ofN_M #(.N(2), .M(1)) arb72 ();
	e1ofN_M #(.N(2), .M(1)) arb73 ();
	e1ofN_M #(.N(2), .M(1)) arb74 ();
	e1ofN_M #(.N(2), .M(1)) arb75 ();
	e1ofN_M #(.N(2), .M(1)) arb76 ();
	e1ofN_M #(.N(2), .M(1)) arb77 ();
	e1ofN_M #(.N(2), .M(1)) arb78 ();
	e1ofN_M #(.N(2), .M(1)) arb79 ();
	e1ofN_M #(.N(2), .M(1)) arb80 ();
	e1ofN_M #(.N(2), .M(1)) arb81 ();
	e1ofN_M #(.N(2), .M(1)) arb82 ();
	e1ofN_M #(.N(2), .M(1)) arb83 ();
	e1ofN_M #(.N(2), .M(1)) arb84 ();
	e1ofN_M #(.N(2), .M(1)) arb85 ();
	e1ofN_M #(.N(2), .M(1)) arb86 ();
	e1ofN_M #(.N(2), .M(1)) arb87 ();
	e1ofN_M #(.N(2), .M(1)) arb88 ();
	e1ofN_M #(.N(2), .M(1)) arb89 ();
	e1ofN_M #(.N(2), .M(1)) arb90 ();
	e1ofN_M #(.N(2), .M(1)) arb91 ();
	e1ofN_M #(.N(2), .M(1)) arb92 ();
	e1ofN_M #(.N(2), .M(1)) arb93 ();
	e1ofN_M #(.N(2), .M(1)) arb94 ();
	e1ofN_M #(.N(2), .M(1)) arb95 ();
	e1ofN_M #(.N(2), .M(1)) arb96 ();
	e1ofN_M #(.N(2), .M(1)) arb97 ();
	e1ofN_M #(.N(2), .M(1)) arb98 ();
	e1ofN_M #(.N(2), .M(1)) arb99 ();
	e1ofN_M #(.N(2), .M(1)) arb100 ();
	e1ofN_M #(.N(2), .M(1)) arb101 ();
	e1ofN_M #(.N(2), .M(1)) arb102 ();
	e1ofN_M #(.N(2), .M(1)) arb103 ();
	e1ofN_M #(.N(2), .M(1)) arb104 ();
	e1ofN_M #(.N(2), .M(1)) arb105 ();
	e1ofN_M #(.N(2), .M(1)) arb106 ();
	e1ofN_M #(.N(2), .M(1)) arb107 ();
	e1ofN_M #(.N(2), .M(1)) arb108 ();
	e1ofN_M #(.N(2), .M(1)) arb109 ();
	e1ofN_M #(.N(2), .M(1)) arb110 ();
	e1ofN_M #(.N(2), .M(1)) arb111 ();
	e1ofN_M #(.N(2), .M(1)) arb112 ();
	e1ofN_M #(.N(2), .M(1)) arb113 ();
	e1ofN_M #(.N(2), .M(1)) arb114 ();
	e1ofN_M #(.N(2), .M(1)) arb115 ();
	e1ofN_M #(.N(2), .M(1)) arb116 ();
	e1ofN_M #(.N(2), .M(1)) arb117 ();
	e1ofN_M #(.N(2), .M(1)) arb118 ();
	e1ofN_M #(.N(2), .M(1)) arb119 ();
	e1ofN_M #(.N(2), .M(1)) arb120 ();
	e1ofN_M #(.N(2), .M(1)) arb121 ();
	e1ofN_M #(.N(2), .M(1)) arb122 ();
	e1ofN_M #(.N(2), .M(1)) arb123 ();
	e1ofN_M #(.N(2), .M(1)) arb124 ();
	e1ofN_M #(.N(2), .M(1)) arb125 ();
	
	arbiter a0( arb0, arb1, arb2 );
	arbiter a1( arb3, arb4, arb5 );
	arbiter a2( arb6, arb7, arb8 );
	arbiter a3( arb9, arb10, arb11 );
	arbiter a4( arb12, arb13, arb14 );
	arbiter a5( arb15, arb16, arb17 );
	arbiter a6( arb18, arb19, arb20 );
	arbiter a7( arb21, arb22, arb23 );
	arbiter a8( arb24, arb25, arb26 );
	arbiter a9( arb27, arb28, arb29 );
	arbiter a10( arb30, arb31, arb32 );
	arbiter a11( arb33, arb34, arb35 );
	arbiter a12( arb36, arb37, arb38 );
	arbiter a13( arb39, arb40, arb41 );
	arbiter a14( arb42, arb43, arb44 );
	arbiter a15( arb45, arb46, arb47 );
	arbiter a16( arb48, arb49, arb50 );
	arbiter a17( arb51, arb52, arb53 );
	arbiter a18( arb54, arb55, arb56 );
	arbiter a19( arb57, arb58, arb59 );
	arbiter a20( arb60, arb61, arb62 );
	arbiter a21( arb63, arb64, arb65 );
	arbiter a22( arb66, arb67, arb68 );
	arbiter a23( arb69, arb70, arb71 );
	arbiter a24( arb72, arb73, arb74 );
	arbiter a25( arb75, arb76, arb77 );
	arbiter a26( arb78, arb79, arb80 );
	arbiter a27( arb81, arb82, arb83 );
	arbiter a28( arb84, arb85, arb86 );
	arbiter a29( arb87, arb88, arb89 );
	arbiter a30( arb90, arb91, arb92 );
	arbiter a31( arb93, arb94, arb95 );
	arbiter a32( arb96, arb97, arb98 );
	arbiter a33( arb99, arb100, arb101 );
	arbiter a34( arb102, arb103, arb104 );
	arbiter a35( arb105, arb106, arb107 );
	arbiter a36( arb108, arb109, arb110 );
	arbiter a37( arb111, arb112, arb113 );
	arbiter a38( arb114, arb115, arb116 );
	arbiter a39( arb117, arb118, arb119 );
	arbiter a40( arb120, arb121, arb122 );
	arbiter a41( arb123, arb124, arb125 );
			
	router1_wrapper r1(.C1in(p3out), .C1out(p3in), .C2in(p4out), .C2out(p4in), .Pin(p2out_p1in), .Pout(p1out_p2in),
		.C2_sel0(arb0),	.P_sel0(arb1), .C1_Grant(arb2), .C1_sel0(arb3), .P_sel1(arb4), .C2_Grant(arb5), .C1_sel1(arb6), .C2_sel1(arb7), .P_Grant(arb8), ._RESET(_RESET) );
	router2_wrapper r2(.C1in(p5out), .C1out(p5in), .C2in(p6out), .C2out(p6in), .Pin(p1out_p2in), .Pout(p2out_p1in),
	 	.C2_sel0(arb9), .P_sel0(arb10), .C1_Grant(arb11), .C1_sel0(arb12), .P_sel1(arb13), .C2_Grant(arb14), .C1_sel1(arb15), .C2_sel1(arb16), .P_Grant(arb17), ._RESET(_RESET) );
	router3_wrapper r3(.C1in(p7out), .C1out(p7in), .C2in(p8out), .C2out(p8in), .Pin(p3in), .Pout(p3out),  
		.C2_sel0(arb18), .P_sel0(arb19), .C1_Grant(arb20), .C1_sel0(arb21), .P_sel1(arb22), .C2_Grant(arb23), .C1_sel1(arb24), .C2_sel1(arb25), .P_Grant(arb26), ._RESET(_RESET) );
	router4_wrapper r4(.C1in(p9out), .C1out(p9in), .C2in(p10out), .C2out(p10in), .Pin(p4in), .Pout(p4out),  	
	 	.C2_sel0(arb27), .P_sel0(arb28), .C1_Grant(arb29), .C1_sel0(arb30), .P_sel1(arb31), .C2_Grant(arb32), .C1_sel1(arb33), .C2_sel1(arb34), .P_Grant(arb35), ._RESET(_RESET) );
	router5_wrapper r5(.C1in(p11out), .C1out(p11in), .C2in(p12out), .C2out(p12in), .Pin(p5in), .Pout(p5out),  
	 	.C2_sel0(arb36), .P_sel0(arb37), .C1_Grant(arb38), .C1_sel0(arb39), .P_sel1(arb40), .C2_Grant(arb41), .C1_sel1(arb42), .C2_sel1(arb43), .P_Grant(arb44), ._RESET(_RESET) );
	router6_wrapper r6(.C1in(p13out), .C1out(p13in), .C2in(p14out), .C2out(p14in), .Pin(p6in), .Pout(p6out),  
	 	.C2_sel0(arb45), .P_sel0(arb46), .C1_Grant(arb47), .C1_sel0(arb48), .P_sel1(arb49), .C2_Grant(arb50), .C1_sel1(arb51), .C2_sel1(arb52), .P_Grant(arb53), ._RESET(_RESET) );
	
	
	router7_wrapper r7(.C1in(Ain), .C1out(Aout_mid), .C2in(Bin), .C2out(Bout_mid), .Pin(p7in), .Pout(p7out),
		.C2_sel0(arb54), .P_sel0(arb55), .C1_Grant(arb56), .C1_sel0(arb57), .P_sel1(arb58), .C2_Grant(arb59), .C1_sel1(arb60), .C2_sel1(arb61), .P_Grant(arb62), ._RESET(_RESET) );
	errorDetect_wrapper e0(.In(Aout_mid), .Out(Aout), .Error(Aerr), ._RESET(_RESET) );
	errorDetect_wrapper e1(.In(Bout_mid), .Out(Bout), .Error(Berr), ._RESET(_RESET) );
	
	router8_wrapper r8(.C1in(Cin), .C1out(Cout_mid), .C2in(Din), .C2out(Dout_mid), .Pin(p8in), .Pout(p8out),
	 	.C2_sel0(arb63), .P_sel0(arb64), .C1_Grant(arb65), .C1_sel0(arb66), .P_sel1(arb67), .C2_Grant(arb68), .C1_sel1(arb69), .C2_sel1(arb70), .P_Grant(arb71), ._RESET(_RESET) );
	errorDetect_wrapper e2(.In(Cout_mid), .Out(Cout), .Error(Cerr), ._RESET(_RESET) );
	errorDetect_wrapper e3(.In(Dout_mid), .Out(Dout), .Error(Derr), ._RESET(_RESET) );
	
	router9_wrapper r9(.C1in(Ein), .C1out(Eout_mid), .C2in(Fin), .C2out(Fout_mid), .Pin(p9in), .Pout(p9out),
	 	.C2_sel0(arb72), .P_sel0(arb73), .C1_Grant(arb74), .C1_sel0(arb75), .P_sel1(arb76), .C2_Grant(arb77), .C1_sel1(arb78), .C2_sel1(arb79), .P_Grant(arb80), ._RESET(_RESET) );
	errorDetect_wrapper e4(.In(Eout_mid), .Out(Eout), .Error(Eerr), ._RESET(_RESET) );
	errorDetect_wrapper e5(.In(Fout_mid), .Out(Fout), .Error(Ferr), ._RESET(_RESET) );
	
	router10_wrapper r10(.C1in(Gin), .C1out(Gout_mid), .C2in(Hin), .C2out(Hout_mid), .Pin(p10in), .Pout(p10out),
	 	.C2_sel0(arb81), .P_sel0(arb82), .C1_Grant(arb83), .C1_sel0(arb84), .P_sel1(arb85), .C2_Grant(arb86), .C1_sel1(arb87), .C2_sel1(arb88), .P_Grant(arb89), ._RESET(_RESET) );
	errorDetect_wrapper e6(.In(Gout_mid), .Out(Gout), .Error(Gerr), ._RESET(_RESET) );
	errorDetect_wrapper e7(.In(Hout_mid), .Out(Hout), .Error(Herr), ._RESET(_RESET) );
	
	router11_wrapper r11(.C1in(Iin), .C1out(Iout_mid), .C2in(Jin), .C2out(Jout_mid), .Pin(p11in), .Pout(p11out),
	 	.C2_sel0(arb90), .P_sel0(arb91), .C1_Grant(arb92), .C1_sel0(arb93), .P_sel1(arb94), .C2_Grant(arb95), .C1_sel1(arb96), .C2_sel1(arb97), .P_Grant(arb98), ._RESET(_RESET) );
	errorDetect_wrapper e8(.In(Iout_mid), .Out(Iout), .Error(Ierr), ._RESET(_RESET) );
	errorDetect_wrapper e9(.In(Jout_mid), .Out(Jout), .Error(Jerr), ._RESET(_RESET) );
	
	router12_wrapper r12(.C1in(Kin), .C1out(Kout_mid), .C2in(Lin), .C2out(Lout_mid), .Pin(p12in), .Pout(p12out),
		.C2_sel0(arb99), .P_sel0(arb100), .C1_Grant(arb101), .C1_sel0(arb102), .P_sel1(arb103), .C2_Grant(arb104), .C1_sel1(arb105), .C2_sel1(arb106), .P_Grant(arb107), ._RESET(_RESET) );
	errorDetect_wrapper e10(.In(Kout_mid), .Out(Kout), .Error(Kerr), ._RESET(_RESET) );
	errorDetect_wrapper e11(.In(Lout_mid), .Out(Lout), .Error(Lerr), ._RESET(_RESET) );
	
	router13_wrapper r13(.C1in(Min), .C1out(Mout_mid), .C2in(Nin), .C2out(Nout_mid), .Pin(p13in), .Pout(p13out),
	 	.C2_sel0(arb108), .P_sel0(arb109), .C1_Grant(arb110), .C1_sel0(arb111), .P_sel1(arb112), .C2_Grant(arb113), .C1_sel1(arb114), .C2_sel1(arb115), .P_Grant(arb116), ._RESET(_RESET) );
	errorDetect_wrapper e12(.In(Mout_mid), .Out(Mout), .Error(Merr), ._RESET(_RESET) );
	errorDetect_wrapper e13(.In(Nout_mid), .Out(Nout), .Error(Nerr), ._RESET(_RESET) );
	
	router14_wrapper r14(.C1in(Oin), .C1out(Oout_mid), .C2in(Pin), .C2out(Pout_mid), .Pin(p14in), .Pout(p14out),
	 	.C2_sel0(arb117), .P_sel0(arb118), .C1_Grant(arb119), .C1_sel0(arb120), .P_sel1(arb121), .C2_Grant(arb122), .C1_sel1(arb123), .C2_sel1(arb124), .P_Grant(arb125), ._RESET(_RESET) );
	errorDetect_wrapper e14(.In(Oout_mid), .Out(Oout), .Error(Oerr), ._RESET(_RESET) );
	errorDetect_wrapper e15(.In(Pout_mid), .Out(Pout), .Error(Perr), ._RESET(_RESET) );
endmodule


