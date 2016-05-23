`timescale 1ns/10ps
//import SystemVerilogCSP::*;

`define DEST 8:5
`define DEST3 8
`define DEST2 7
`define DEST1 6
`define DEST0 5
`define DATA 4:1
`define PACKET 8:1
`define PARITY 0

module cosim_checker (interface Packet_gold, Error_gold, Packet_rtl, Error_rtl);
	parameter NODE = 0;
	parameter WIDTH = 9;
	parameter BL = 1;
	logic [WIDTH-1:0] packet_gold, packet_rtl;
	logic error_gold, error_rtl;
	logic [3:0] SrcNode = NODE;
	
	real cycleCount=0, lastRecvTime = 0, totalTime = 0, averageCycleTime = 0, averageThroughput = 0;
	integer value;

	always
	begin
		fork
			Packet_gold.Receive(packet_gold);
			Error_gold.Receive(error_gold);
			
			Packet_rtl.Receive(packet_rtl);
			Error_rtl.Receive(error_rtl);
		join
		
		if (cycleCount >= 2) begin
			totalTime += ($realtime - lastRecvTime);
			averageCycleTime = totalTime / (cycleCount-1);
		end else begin
			 averageCycleTime = $realtime - lastRecvTime;
		end
		lastRecvTime = $realtime;
		averageThroughput = cycleCount/$realtime;
	
		value = noc_cosim_tb.values.pop_front();
		if ( (packet_gold == packet_rtl) && (error_gold == error_rtl) && (packet_gold[`DEST] == SrcNode) ) begin
			$display("%m :\t%3d ns : CORRECT: Node %0d: Expected receive node: %0d, Source node: %0d", lastRecvTime, SrcNode, packet_gold[`DEST], packet_gold[`DATA]);
			
			$display("Execution cycle = %0d , Avg Cycle Time = %g , Avg Throughput = %g",
				cycleCount, averageCycleTime, averageThroughput);
		end else begin
			if(packet_gold[`DEST] != packet_rtl[`DEST]) begin
				$display("\nNode %0d: ERROR: packet_gold = %d, packet_rtl = %d\n", SrcNode, packet_gold, packet_rtl);
				$display("%m :\t%3d ns : Error: Node %0d, Received Node: %d, Expected Node: %d", lastRecvTime, SrcNode, packet_gold[`DEST], SrcNode);
				$stop();
			end else if(error_gold != error_rtl) begin
				$display("\nNode %0d: ERROR: error_gold != error_rtl\n", SrcNode);
				$stop();
			end
		end

		if( (error_gold == 1'b1) && (error_gold == error_rtl) ) begin
			$display("\nNode %0d: Parity error detected!\n", SrcNode);
		end
		
		cycleCount += 1;
	end
endmodule

module copy (interface L, interface R1, interface R2);
	parameter W = 4;
	parameter FL = 1;
	logic [W-1:0] data = 0;

	always
	begin
		L.Receive(data);
		fork
			R1.Send(data);
			R2.Send(data);
		join
	end
endmodule

module noc_cosim_tb;
	parameter WIDTH = 9;
	integer values [$] = {};

	e1ofN_M #(.N(2), .M(WIDTH)) Ain ();
	e1ofN_M #(.N(2), .M(WIDTH)) Bin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Cin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Din ();
	e1ofN_M #(.N(2), .M(WIDTH)) Ein ();
	e1ofN_M #(.N(2), .M(WIDTH)) Fin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Gin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Hin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Iin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Jin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Kin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Lin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Min ();
	e1ofN_M #(.N(2), .M(WIDTH)) Nin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Oin ();
	e1ofN_M #(.N(2), .M(WIDTH)) Pin ();
			
	e1ofN_M #(.N(2), .M(WIDTH)) Ain_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Bin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Cin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Din_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Ein_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Fin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Gin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Hin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Iin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Jin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Kin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Lin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Min_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Nin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Oin_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Pin_gold ();

	e1ofN_M #(.N(2), .M(WIDTH)) Aout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Bout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Cout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Dout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Eout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Fout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Gout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Hout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Iout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Jout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Kout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Lout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Mout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Nout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Oout_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Pout_gold ();

	e1ofN_M #(.N(2), .M(1)) Aerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Berr_gold ();
	e1ofN_M #(.N(2), .M(1)) Cerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Derr_gold ();
	e1ofN_M #(.N(2), .M(1)) Eerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Ferr_gold ();
	e1ofN_M #(.N(2), .M(1)) Gerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Herr_gold ();
	e1ofN_M #(.N(2), .M(1)) Ierr_gold ();
	e1ofN_M #(.N(2), .M(1)) Jerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Kerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Lerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Merr_gold ();
	e1ofN_M #(.N(2), .M(1)) Nerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Oerr_gold ();
	e1ofN_M #(.N(2), .M(1)) Perr_gold ();
	
	e1ofN_M #(.N(2), .M(WIDTH)) Ain_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Bin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Cin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Din_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Ein_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Fin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Gin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Hin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Iin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Jin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Kin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Lin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Min_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Nin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Oin_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Pin_rtl ();

	e1ofN_M #(.N(2), .M(WIDTH)) Aout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Bout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Cout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Dout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Eout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Fout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Gout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Hout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Iout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Jout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Kout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Lout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Mout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Nout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Oout_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Pout_rtl ();

	e1ofN_M #(.N(2), .M(1)) Aerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Berr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Cerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Derr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Eerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Ferr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Gerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Herr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Ierr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Jerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Kerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Lerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Merr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Nerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Oerr_rtl ();
	e1ofN_M #(.N(2), .M(1)) Perr_rtl ();
		
	copy #(.W(9)) c0(Ain, Ain_gold, Ain_rtl);
	copy #(.W(9)) c1(Bin, Bin_gold, Bin_rtl);
	copy #(.W(9)) c2(Cin, Cin_gold, Cin_rtl);
	copy #(.W(9)) c3(Din, Din_gold, Din_rtl);
	copy #(.W(9)) c4(Ein, Ein_gold, Ein_rtl);
	copy #(.W(9)) c5(Fin, Fin_gold, Fin_rtl);
	copy #(.W(9)) c6(Gin, Gin_gold, Gin_rtl);
	copy #(.W(9)) c7(Hin, Hin_gold, Hin_rtl);
	copy #(.W(9)) c8(Iin, Iin_gold, Iin_rtl);
	copy #(.W(9)) c9(Jin, Jin_gold, Jin_rtl);
	copy #(.W(9)) c10(Kin, Kin_gold, Kin_rtl);
	copy #(.W(9)) c11(Lin, Lin_gold, Lin_rtl);
	copy #(.W(9)) c12(Min, Min_gold, Min_rtl);
	copy #(.W(9)) c13(Nin, Nin_gold, Nin_rtl);
	copy #(.W(9)) c14(Oin, Oin_gold, Oin_rtl);
	copy #(.W(9)) c15(Pin, Pin_gold, Pin_rtl);

	cosim_checker #(.NODE(0)) dbA(.Packet_gold(Aout_gold), .Error_gold(Aerr_gold), .Packet_rtl(Aout_rtl), .Error_rtl(Aerr_rtl) );
	cosim_checker #(.NODE(1)) dbB(.Packet_gold(Bout_gold), .Error_gold(Berr_gold), .Packet_rtl(Bout_rtl), .Error_rtl(Berr_rtl) );
	cosim_checker #(.NODE(2)) dbC(.Packet_gold(Cout_gold), .Error_gold(Cerr_gold), .Packet_rtl(Cout_rtl), .Error_rtl(Cerr_rtl) );
	cosim_checker #(.NODE(3)) dbD(.Packet_gold(Dout_gold), .Error_gold(Derr_gold), .Packet_rtl(Dout_rtl), .Error_rtl(Derr_rtl) );
	cosim_checker #(.NODE(4)) dbE(.Packet_gold(Eout_gold), .Error_gold(Eerr_gold), .Packet_rtl(Eout_rtl), .Error_rtl(Eerr_rtl) );
	cosim_checker #(.NODE(5)) dbF(.Packet_gold(Fout_gold), .Error_gold(Ferr_gold), .Packet_rtl(Fout_rtl), .Error_rtl(Ferr_rtl) );
	cosim_checker #(.NODE(6)) dbG(.Packet_gold(Gout_gold), .Error_gold(Gerr_gold), .Packet_rtl(Gout_rtl), .Error_rtl(Gerr_rtl) );
	cosim_checker #(.NODE(7)) dbH(.Packet_gold(Hout_gold), .Error_gold(Herr_gold), .Packet_rtl(Hout_rtl), .Error_rtl(Herr_rtl) );
	cosim_checker #(.NODE(8)) dbI(.Packet_gold(Iout_gold), .Error_gold(Ierr_gold), .Packet_rtl(Iout_rtl), .Error_rtl(Ierr_rtl) );
	cosim_checker #(.NODE(9)) dbJ(.Packet_gold(Jout_gold), .Error_gold(Jerr_gold), .Packet_rtl(Jout_rtl), .Error_rtl(Jerr_rtl) );
	cosim_checker #(.NODE(10)) dbK(.Packet_gold(Kout_gold), .Error_gold(Kerr_gold), .Packet_rtl(Kout_rtl), .Error_rtl(Kerr_rtl) );
	cosim_checker #(.NODE(11)) dbL(.Packet_gold(Lout_gold), .Error_gold(Lerr_gold), .Packet_rtl(Lout_rtl), .Error_rtl(Lerr_rtl) );
	cosim_checker #(.NODE(12)) dbM(.Packet_gold(Mout_gold), .Error_gold(Merr_gold), .Packet_rtl(Mout_rtl), .Error_rtl(Merr_rtl) );
	cosim_checker #(.NODE(13)) dbN(.Packet_gold(Nout_gold), .Error_gold(Nerr_gold), .Packet_rtl(Nout_rtl), .Error_rtl(Nerr_rtl) );
	cosim_checker #(.NODE(14)) dbO(.Packet_gold(Oout_gold), .Error_gold(Oerr_gold), .Packet_rtl(Oout_rtl), .Error_rtl(Oerr_rtl) );
	cosim_checker #(.NODE(15)) dbP(.Packet_gold(Pout_gold), .Error_gold(Perr_gold), .Packet_rtl(Pout_rtl), .Error_rtl(Perr_rtl) );	
			
	reg _RESET;
	
	noc_gold noc_gld(Ain_gold, Bin_gold, Cin_gold, Din_gold, Ein_gold, Fin_gold, Gin_gold, Hin_gold, Iin_gold, Jin_gold, Kin_gold, Lin_gold, Min_gold, Nin_gold, Oin_gold, Pin_gold,
	Aout_gold, Bout_gold, Cout_gold, Dout_gold, Eout_gold, Fout_gold, Gout_gold, Hout_gold, Iout_gold, Jout_gold, Kout_gold, Lout_gold, Mout_gold, Nout_gold, Oout_gold, Pout_gold,
	Aerr_gold, Berr_gold, Cerr_gold, Derr_gold, Eerr_gold, Ferr_gold, Gerr_gold, Herr_gold, Ierr_gold, Jerr_gold, Kerr_gold, Lerr_gold, Merr_gold, Nerr_gold, Oerr_gold, Perr_gold
	);
	
	noc_syn n0(Ain_rtl, Bin_rtl, Cin_rtl, Din_rtl, Ein_rtl, Fin_rtl, Gin_rtl, Hin_rtl, Iin_rtl, Jin_rtl, Kin_rtl, Lin_rtl, Min_rtl, Nin_rtl, Oin_rtl, Pin_rtl,
	Aout_rtl, Bout_rtl, Cout_rtl, Dout_rtl, Eout_rtl, Fout_rtl, Gout_rtl, Hout_rtl, Iout_rtl, Jout_rtl, Kout_rtl, Lout_rtl, Mout_rtl, Nout_rtl, Oout_rtl, Pout_rtl,
	Aerr_rtl, Berr_rtl, Cerr_rtl, Derr_rtl, Eerr_rtl, Ferr_rtl, Gerr_rtl, Herr_rtl, Ierr_rtl, Jerr_rtl, Kerr_rtl, Lerr_rtl, Merr_rtl, Nerr_rtl, Oerr_rtl, Perr_rtl,
	_RESET
	);
	
	integer i;

	task sendAll(virtual interface e1ofN_M #(.N(2), .M(WIDTH)) In, input [3:0] SrcNode);
		reg [4:0] i;
		logic [WIDTH-1:0] SendValue= 0;

		begin
			$display("Sending from node %0d\n", SrcNode);
			for(i=0; i<= 15; i=i+1) begin
				if(SrcNode == i)
					i = i;
				else begin
					//$display("Sending %0d -> %0d", SrcNode, i);
					SendValue[`DEST] = i[3:0];
					SendValue[`DATA] = SrcNode;
					SendValue[`PARITY] = even_priority_bit( SendValue[`PACKET] );
					In.Send(SendValue);
					values.push_back(SendValue);
				end
				#0.1;
			end
		end
	endtask

	task sendOpposite(virtual interface e1ofN_M #(.N(2), .M(WIDTH)) In, input [3:0] SrcNode);
		reg [4:0] i;
		logic [WIDTH-1:0] SendValue= 0;

		begin
			i = 15-SrcNode;
			$display("Sending %0d -> %0d", SrcNode, i);
			SendValue[`DEST] = i[3:0];
			SendValue[`DATA] = SrcNode;
			SendValue[`PARITY] = even_priority_bit( SendValue[`PACKET] );
			In.Send(SendValue);
			values.push_back(SendValue);
		end
	endtask
	
	task sendNext(virtual interface e1ofN_M #(.N(2), .M(WIDTH)) In, input [3:0] SrcNode);
		reg [4:0] i;
		logic [WIDTH-1:0] SendValue= 0;

		begin
			i = (SrcNode+1) % 16;
			$display("Sending %0d -> %0d", SrcNode, i);
			SendValue[`DEST] = i[3:0];
			SendValue[`DATA] = SrcNode;
			SendValue[`PARITY] = even_priority_bit( SendValue[`PACKET] );
			In.Send(SendValue);
			values.push_back(SendValue);
		end
	endtask

	task sendRandom(virtual interface e1ofN_M #(.N(2), .M(WIDTH)) In, input [3:0] SrcNode);
		reg [3:0] destination;
		logic [WIDTH-1:0] SendValue= 0;

		begin
			destination = $random();
			while(destination == SrcNode) begin
				destination = $random();
			end
			SendValue[`DEST] = destination;
			SendValue[`DATA] = SrcNode;
			SendValue[`PARITY] = even_priority_bit( SendValue[`PACKET] );
			$display("Sending %0d -> %0d, packet = %b", SrcNode, destination, SendValue);
			In.Send(SendValue);
			values.push_back(SendValue);
		end
	endtask

	task errorInject(virtual interface e1ofN_M #(.N(2), .M(WIDTH)) In, input [3:0] SrcNode, input [3:0] ErrNode);
		reg [4:0] i;
		logic [WIDTH-1:0] SendValue= 0;

		begin
			$display("Sending from node %0d\n", SrcNode);
			for(i=0; i<= 15; i=i+1) begin
				if(SrcNode == i)
					i = i;
				else begin
					//$display("Sending %0d -> %0d", SrcNode, i);
					SendValue[`DEST] = i[3:0];
					SendValue[`DATA] = $random();
					SendValue[`PARITY] = even_priority_bit( SendValue[`PACKET] );
					if(i == ErrNode) begin
						$display("Injecting error in data to be received at node %0d", ErrNode);
						SendValue[2] = ~SendValue[2];
					end					
					In.Send(SendValue);
					values.push_back(SendValue);
				end
				#0.1;

			end
		end
	endtask

	initial begin
		_RESET = 0;
		
		r1_reset_d_log_0();
		r2_reset_d_log_0();
		r3_reset_d_log_0();
		r4_reset_d_log_0();
		r5_reset_d_log_0();
		r6_reset_d_log_0();
		r7_reset_d_log_0();
		r8_reset_d_log_0();
		r9_reset_d_log_0();
		r10_reset_d_log_0();
		r11_reset_d_log_0();
		r12_reset_d_log_0();
		r13_reset_d_log_0();
		r14_reset_d_log_0();
		
		r1_reset_e_log_0();
		r2_reset_e_log_0();
		r3_reset_e_log_0();
		r4_reset_e_log_0();
		r5_reset_e_log_0();
		r6_reset_e_log_0();
		r7_reset_e_log_0();
		r8_reset_e_log_0();
		r9_reset_e_log_0();
		r10_reset_e_log_0();
		r11_reset_e_log_0();
		r12_reset_e_log_0();
		r13_reset_e_log_0();
		r14_reset_e_log_0();
		
		err_reset_d_log_0();
		err_reset_e_log_0();
		
		#400;
		_RESET =  1;
		
		r1_reset_e_log_1();
		r2_reset_e_log_1();
		r3_reset_e_log_1();
		r4_reset_e_log_1();
		r5_reset_e_log_1();
		r6_reset_e_log_1();
		r7_reset_e_log_1();
		r8_reset_e_log_1();
		r9_reset_e_log_1();
		r10_reset_e_log_1();
		r11_reset_e_log_1();
		r12_reset_e_log_1();
		r13_reset_e_log_1();
		r14_reset_e_log_1();
		
		err_reset_e_log_1();
		
		#400;
		// Test 0: Measure performance
		// Node i sends to node i+1, passing through 1 router and error detect module
		repeat(5001) begin
			sendNext(Ain, 4'd0);
			//#0.1;
		end
		
		while(values.size() > 0) begin
			#0.1; // Wait until all values received
		end
		$display("\nTest 0 passed\n"); $stop();
		
				
		// Test 1: Send from each node to all other nodes, one at a time
		// Tests basic routing functionality
		sendAll(Ain, 4'd0);
		sendAll(Bin, 4'd1);
		sendAll(Cin, 4'd2);
		sendAll(Din, 4'd3);
		sendAll(Ein, 4'd4);
		sendAll(Fin, 4'd5);
		sendAll(Gin, 4'd6);
		sendAll(Hin, 4'd7);
		sendAll(Iin, 4'd8);
		sendAll(Jin, 4'd9);
		sendAll(Kin, 4'd10);
		sendAll(Lin, 4'd11);
		sendAll(Min, 4'd12);
		sendAll(Nin, 4'd13);
		sendAll(Oin, 4'd14);
		sendAll(Pin, 4'd15);
		
		while(values.size() > 0) begin
			#0.1; // Wait until all values received
		end
		$display("\nTest 1 passed\n"); $stop();		

		// Test 2: All nodes send to all opposite nodes at the same time
		// Tests some blocking within router buffers
		fork
			sendOpposite(Ain, 4'd0);
			sendOpposite(Bin, 4'd1);
			sendOpposite(Cin, 4'd2);
			sendOpposite(Din, 4'd3);
			sendOpposite(Ein, 4'd4);
			sendOpposite(Fin, 4'd5);
			sendOpposite(Gin, 4'd6);
			sendOpposite(Hin, 4'd7);
			sendOpposite(Iin, 4'd8);
			sendOpposite(Jin, 4'd9);
			sendOpposite(Kin, 4'd10);
			sendOpposite(Lin, 4'd11);
			sendOpposite(Min, 4'd12);
			sendOpposite(Nin, 4'd13);
			sendOpposite(Oin, 4'd14);
			sendOpposite(Pin, 4'd15);
		join
		
		while(values.size() > 0) begin
			#0.1; // Wait until all values received
		end
		$display("\nTest 2 passed\n"); $stop();

		// Test 3: Parity error detection
		errorInject(Ain, 4'd0, 4'd15 );
		errorInject(Bin, 4'd1, 4'd14 );
		errorInject(Cin, 4'd2, 4'd13 );
		errorInject(Din, 4'd3, 4'd12 );
		errorInject(Ein, 4'd4, 4'd11 );
		errorInject(Fin, 4'd5, 4'd10 );
		errorInject(Gin, 4'd6, 4'd9 );
		errorInject(Hin, 4'd7, 4'd8 );
		errorInject(Iin, 4'd8, 4'd7 );
		errorInject(Jin, 4'd9, 4'd6 );
		errorInject(Kin, 4'd10, 4'd5 );
		errorInject(Lin, 4'd11, 4'd4 );
		errorInject(Min, 4'd12, 4'd3 );
		errorInject(Nin, 4'd13, 4'd2 );
		errorInject(Oin, 4'd14, 4'd1 );
		errorInject(Pin, 4'd15, 4'd0 );
		
		while(values.size() > 0) begin
			#0.1; // Wait until all values received
		end
		$display("\nTest 3 passed\n"); $stop();

		// Test 4: Random send
		// Tests random blocking
		fork
			sendRandom(Ain, 4'd0);
			sendRandom(Bin, 4'd1);
			sendRandom(Cin, 4'd2);
			sendRandom(Din, 4'd3);
			sendRandom(Ein, 4'd4);
			sendRandom(Fin, 4'd5);
			sendRandom(Gin, 4'd6);
			sendRandom(Hin, 4'd7);
			sendRandom(Iin, 4'd8);
			sendRandom(Jin, 4'd9);
			sendRandom(Kin, 4'd10);
			sendRandom(Lin, 4'd11);
			sendRandom(Min, 4'd12);
			sendRandom(Nin, 4'd13);
			sendRandom(Oin, 4'd14);
			sendRandom(Pin, 4'd15);
		join
		
		while(values.size() > 0) begin
			#0.1; // Wait until all values received
		end
		$display("\nTest 4 passed\n"); $stop();

		// Test 5: Randomly backpressure design
		// Each node A through P sends a new packet in parallel to a random node
		repeat(32) begin
			fork
				sendRandom(Ain, 4'd0);
				sendRandom(Bin, 4'd1);
				sendRandom(Cin, 4'd2);
				sendRandom(Din, 4'd3);
				sendRandom(Ein, 4'd4);
				sendRandom(Fin, 4'd5);
				sendRandom(Gin, 4'd6);
				sendRandom(Hin, 4'd7);
				sendRandom(Iin, 4'd8);
				sendRandom(Jin, 4'd9);
				sendRandom(Kin, 4'd10);
				sendRandom(Lin, 4'd11);
				sendRandom(Min, 4'd12);
				sendRandom(Nin, 4'd13);
				sendRandom(Oin, 4'd14);
				sendRandom(Pin, 4'd15);
			join
			#0.1;
		end
		
		while(values.size() > 0) begin
			#0.1; // Wait until all values received
		end
		$display("\nTest 5 passed\n"); $stop();
		
		#100 $stop;
	end

	function even_priority_bit;
		input [WIDTH-2:0] in;
		begin
			even_priority_bit = ^in;
		end
	endfunction
	
	task r1_reset_d_log_0;
	begin
		n0.r1.d0.In_buf.d_log = '0;
		n0.r1.d1.In_buf.d_log = '0;
		n0.r1.d2.In_buf.d_log = '0;
	
		n0.r1.s0.In_buf.d_log = '0;
		n0.r1.s1.In_buf.d_log = '0;
		n0.r1.s2.In_buf.d_log = '0;
		
		n0.r1.m0.In0_buf.d_log = '0;
		n0.r1.m0.In1_buf.d_log = '0;
		n0.r1.m0.S_buf.d_log = '0;
		n0.r1.m1.In0_buf.d_log = '0;
		n0.r1.m1.In1_buf.d_log = '0;
		n0.r1.m1.S_buf.d_log = '0;
		n0.r1.m2.In0_buf.d_log = '0;
		n0.r1.m2.In1_buf.d_log = '0;
		n0.r1.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r1_reset_e_log_0;
	begin
		n0.r1.d0.Out0_buf.e_log = '0;
		n0.r1.d0.Out1_buf.e_log = '0;
		n0.r1.d0.S_buf.e_log = '0;
		n0.r1.d1.Out0_buf.e_log = '0;
		n0.r1.d1.Out1_buf.e_log = '0;
		n0.r1.d1.S_buf.e_log = '0;
		n0.r1.d2.Out0_buf.e_log = '0;
		n0.r1.d2.Out1_buf.e_log = '0;
		n0.r1.d2.S_buf.e_log = '0;
	
		n0.r1.s0.Out0_buf.e_log = '0;
		n0.r1.s0.Out1_buf.e_log = '0;
		n0.r1.s1.Out0_buf.e_log = '0;
		n0.r1.s1.Out1_buf.e_log = '0;
		n0.r1.s2.Out0_buf.e_log = '0;
		n0.r1.s2.Out1_buf.e_log = '0;
		
		n0.r1.m0.Out_buf.e_log = '0;
		n0.r1.m1.Out_buf.e_log = '0;
		n0.r1.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r1_reset_e_log_1;
	begin
		n0.r1.d0.Out0_buf.e_log = '1;
		n0.r1.d0.Out1_buf.e_log = '1;
		n0.r1.d0.S_buf.e_log = '1;
		n0.r1.d1.Out0_buf.e_log = '1;
		n0.r1.d1.Out1_buf.e_log = '1;
		n0.r1.d1.S_buf.e_log = '1;
		n0.r1.d2.Out0_buf.e_log = '1;
		n0.r1.d2.Out1_buf.e_log = '1;
		n0.r1.d2.S_buf.e_log = '1;
	
		n0.r1.s0.Out0_buf.e_log = '1;
		n0.r1.s0.Out1_buf.e_log = '1;
		n0.r1.s1.Out0_buf.e_log = '1;
		n0.r1.s1.Out1_buf.e_log = '1;
		n0.r1.s2.Out0_buf.e_log = '1;
		n0.r1.s2.Out1_buf.e_log = '1;
		
		n0.r1.m0.Out_buf.e_log = '1;
		n0.r1.m1.Out_buf.e_log = '1;
		n0.r1.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r2_reset_d_log_0;
	begin
		n0.r2.d0.In_buf.d_log = '0;
		n0.r2.d1.In_buf.d_log = '0;
		n0.r2.d2.In_buf.d_log = '0;
	
		n0.r2.s0.In_buf.d_log = '0;
		n0.r2.s1.In_buf.d_log = '0;
		n0.r2.s2.In_buf.d_log = '0;
		
		n0.r2.m0.In0_buf.d_log = '0;
		n0.r2.m0.In1_buf.d_log = '0;
		n0.r2.m0.S_buf.d_log = '0;
		n0.r2.m1.In0_buf.d_log = '0;
		n0.r2.m1.In1_buf.d_log = '0;
		n0.r2.m1.S_buf.d_log = '0;
		n0.r2.m2.In0_buf.d_log = '0;
		n0.r2.m2.In1_buf.d_log = '0;
		n0.r2.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r2_reset_e_log_0;
	begin
		n0.r2.d0.Out0_buf.e_log = '0;
		n0.r2.d0.Out1_buf.e_log = '0;
		n0.r2.d0.S_buf.e_log = '0;
		n0.r2.d1.Out0_buf.e_log = '0;
		n0.r2.d1.Out1_buf.e_log = '0;
		n0.r2.d1.S_buf.e_log = '0;
		n0.r2.d2.Out0_buf.e_log = '0;
		n0.r2.d2.Out1_buf.e_log = '0;
		n0.r2.d2.S_buf.e_log = '0;
	
		n0.r2.s0.Out0_buf.e_log = '0;
		n0.r2.s0.Out1_buf.e_log = '0;
		n0.r2.s1.Out0_buf.e_log = '0;
		n0.r2.s1.Out1_buf.e_log = '0;
		n0.r2.s2.Out0_buf.e_log = '0;
		n0.r2.s2.Out1_buf.e_log = '0;
		
		n0.r2.m0.Out_buf.e_log = '0;
		n0.r2.m1.Out_buf.e_log = '0;
		n0.r2.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r2_reset_e_log_1;
	begin
		n0.r2.d0.Out0_buf.e_log = '1;
		n0.r2.d0.Out1_buf.e_log = '1;
		n0.r2.d0.S_buf.e_log = '1;
		n0.r2.d1.Out0_buf.e_log = '1;
		n0.r2.d1.Out1_buf.e_log = '1;
		n0.r2.d1.S_buf.e_log = '1;
		n0.r2.d2.Out0_buf.e_log = '1;
		n0.r2.d2.Out1_buf.e_log = '1;
		n0.r2.d2.S_buf.e_log = '1;
	
		n0.r2.s0.Out0_buf.e_log = '1;
		n0.r2.s0.Out1_buf.e_log = '1;
		n0.r2.s1.Out0_buf.e_log = '1;
		n0.r2.s1.Out1_buf.e_log = '1;
		n0.r2.s2.Out0_buf.e_log = '1;
		n0.r2.s2.Out1_buf.e_log = '1;
		
		n0.r2.m0.Out_buf.e_log = '1;
		n0.r2.m1.Out_buf.e_log = '1;
		n0.r2.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r3_reset_d_log_0;
	begin
		n0.r3.d0.In_buf.d_log = '0;
		n0.r3.d1.In_buf.d_log = '0;
		n0.r3.d2.In_buf.d_log = '0;
	
		n0.r3.s0.In_buf.d_log = '0;
		n0.r3.s1.In_buf.d_log = '0;
		n0.r3.s2.In_buf.d_log = '0;
		
		n0.r3.m0.In0_buf.d_log = '0;
		n0.r3.m0.In1_buf.d_log = '0;
		n0.r3.m0.S_buf.d_log = '0;
		n0.r3.m1.In0_buf.d_log = '0;
		n0.r3.m1.In1_buf.d_log = '0;
		n0.r3.m1.S_buf.d_log = '0;
		n0.r3.m2.In0_buf.d_log = '0;
		n0.r3.m2.In1_buf.d_log = '0;
		n0.r3.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r3_reset_e_log_0;
	begin
		n0.r3.d0.Out0_buf.e_log = '0;
		n0.r3.d0.Out1_buf.e_log = '0;
		n0.r3.d0.S_buf.e_log = '0;
		n0.r3.d1.Out0_buf.e_log = '0;
		n0.r3.d1.Out1_buf.e_log = '0;
		n0.r3.d1.S_buf.e_log = '0;
		n0.r3.d2.Out0_buf.e_log = '0;
		n0.r3.d2.Out1_buf.e_log = '0;
		n0.r3.d2.S_buf.e_log = '0;
	
		n0.r3.s0.Out0_buf.e_log = '0;
		n0.r3.s0.Out1_buf.e_log = '0;
		n0.r3.s1.Out0_buf.e_log = '0;
		n0.r3.s1.Out1_buf.e_log = '0;
		n0.r3.s2.Out0_buf.e_log = '0;
		n0.r3.s2.Out1_buf.e_log = '0;
		
		n0.r3.m0.Out_buf.e_log = '0;
		n0.r3.m1.Out_buf.e_log = '0;
		n0.r3.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r3_reset_e_log_1;
	begin
		n0.r3.d0.Out0_buf.e_log = '1;
		n0.r3.d0.Out1_buf.e_log = '1;
		n0.r3.d0.S_buf.e_log = '1;
		n0.r3.d1.Out0_buf.e_log = '1;
		n0.r3.d1.Out1_buf.e_log = '1;
		n0.r3.d1.S_buf.e_log = '1;
		n0.r3.d2.Out0_buf.e_log = '1;
		n0.r3.d2.Out1_buf.e_log = '1;
		n0.r3.d2.S_buf.e_log = '1;
	
		n0.r3.s0.Out0_buf.e_log = '1;
		n0.r3.s0.Out1_buf.e_log = '1;
		n0.r3.s1.Out0_buf.e_log = '1;
		n0.r3.s1.Out1_buf.e_log = '1;
		n0.r3.s2.Out0_buf.e_log = '1;
		n0.r3.s2.Out1_buf.e_log = '1;
		
		n0.r3.m0.Out_buf.e_log = '1;
		n0.r3.m1.Out_buf.e_log = '1;
		n0.r3.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r4_reset_d_log_0;
	begin
		n0.r4.d0.In_buf.d_log = '0;
		n0.r4.d1.In_buf.d_log = '0;
		n0.r4.d2.In_buf.d_log = '0;
	
		n0.r4.s0.In_buf.d_log = '0;
		n0.r4.s1.In_buf.d_log = '0;
		n0.r4.s2.In_buf.d_log = '0;
		
		n0.r4.m0.In0_buf.d_log = '0;
		n0.r4.m0.In1_buf.d_log = '0;
		n0.r4.m0.S_buf.d_log = '0;
		n0.r4.m1.In0_buf.d_log = '0;
		n0.r4.m1.In1_buf.d_log = '0;
		n0.r4.m1.S_buf.d_log = '0;
		n0.r4.m2.In0_buf.d_log = '0;
		n0.r4.m2.In1_buf.d_log = '0;
		n0.r4.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r4_reset_e_log_0;
	begin
		n0.r4.d0.Out0_buf.e_log = '0;
		n0.r4.d0.Out1_buf.e_log = '0;
		n0.r4.d0.S_buf.e_log = '0;
		n0.r4.d1.Out0_buf.e_log = '0;
		n0.r4.d1.Out1_buf.e_log = '0;
		n0.r4.d1.S_buf.e_log = '0;
		n0.r4.d2.Out0_buf.e_log = '0;
		n0.r4.d2.Out1_buf.e_log = '0;
		n0.r4.d2.S_buf.e_log = '0;
	
		n0.r4.s0.Out0_buf.e_log = '0;
		n0.r4.s0.Out1_buf.e_log = '0;
		n0.r4.s1.Out0_buf.e_log = '0;
		n0.r4.s1.Out1_buf.e_log = '0;
		n0.r4.s2.Out0_buf.e_log = '0;
		n0.r4.s2.Out1_buf.e_log = '0;
		
		n0.r4.m0.Out_buf.e_log = '0;
		n0.r4.m1.Out_buf.e_log = '0;
		n0.r4.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r4_reset_e_log_1;
	begin
		n0.r4.d0.Out0_buf.e_log = '1;
		n0.r4.d0.Out1_buf.e_log = '1;
		n0.r4.d0.S_buf.e_log = '1;
		n0.r4.d1.Out0_buf.e_log = '1;
		n0.r4.d1.Out1_buf.e_log = '1;
		n0.r4.d1.S_buf.e_log = '1;
		n0.r4.d2.Out0_buf.e_log = '1;
		n0.r4.d2.Out1_buf.e_log = '1;
		n0.r4.d2.S_buf.e_log = '1;
	
		n0.r4.s0.Out0_buf.e_log = '1;
		n0.r4.s0.Out1_buf.e_log = '1;
		n0.r4.s1.Out0_buf.e_log = '1;
		n0.r4.s1.Out1_buf.e_log = '1;
		n0.r4.s2.Out0_buf.e_log = '1;
		n0.r4.s2.Out1_buf.e_log = '1;
		
		n0.r4.m0.Out_buf.e_log = '1;
		n0.r4.m1.Out_buf.e_log = '1;
		n0.r4.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r5_reset_d_log_0;
	begin
		n0.r5.d0.In_buf.d_log = '0;
		n0.r5.d1.In_buf.d_log = '0;
		n0.r5.d2.In_buf.d_log = '0;
	
		n0.r5.s0.In_buf.d_log = '0;
		n0.r5.s1.In_buf.d_log = '0;
		n0.r5.s2.In_buf.d_log = '0;
		
		n0.r5.m0.In0_buf.d_log = '0;
		n0.r5.m0.In1_buf.d_log = '0;
		n0.r5.m0.S_buf.d_log = '0;
		n0.r5.m1.In0_buf.d_log = '0;
		n0.r5.m1.In1_buf.d_log = '0;
		n0.r5.m1.S_buf.d_log = '0;
		n0.r5.m2.In0_buf.d_log = '0;
		n0.r5.m2.In1_buf.d_log = '0;
		n0.r5.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r5_reset_e_log_0;
	begin
		n0.r5.d0.Out0_buf.e_log = '0;
		n0.r5.d0.Out1_buf.e_log = '0;
		n0.r5.d0.S_buf.e_log = '0;
		n0.r5.d1.Out0_buf.e_log = '0;
		n0.r5.d1.Out1_buf.e_log = '0;
		n0.r5.d1.S_buf.e_log = '0;
		n0.r5.d2.Out0_buf.e_log = '0;
		n0.r5.d2.Out1_buf.e_log = '0;
		n0.r5.d2.S_buf.e_log = '0;
	
		n0.r5.s0.Out0_buf.e_log = '0;
		n0.r5.s0.Out1_buf.e_log = '0;
		n0.r5.s1.Out0_buf.e_log = '0;
		n0.r5.s1.Out1_buf.e_log = '0;
		n0.r5.s2.Out0_buf.e_log = '0;
		n0.r5.s2.Out1_buf.e_log = '0;
		
		n0.r5.m0.Out_buf.e_log = '0;
		n0.r5.m1.Out_buf.e_log = '0;
		n0.r5.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r5_reset_e_log_1;
	begin
		n0.r5.d0.Out0_buf.e_log = '1;
		n0.r5.d0.Out1_buf.e_log = '1;
		n0.r5.d0.S_buf.e_log = '1;
		n0.r5.d1.Out0_buf.e_log = '1;
		n0.r5.d1.Out1_buf.e_log = '1;
		n0.r5.d1.S_buf.e_log = '1;
		n0.r5.d2.Out0_buf.e_log = '1;
		n0.r5.d2.Out1_buf.e_log = '1;
		n0.r5.d2.S_buf.e_log = '1;
	
		n0.r5.s0.Out0_buf.e_log = '1;
		n0.r5.s0.Out1_buf.e_log = '1;
		n0.r5.s1.Out0_buf.e_log = '1;
		n0.r5.s1.Out1_buf.e_log = '1;
		n0.r5.s2.Out0_buf.e_log = '1;
		n0.r5.s2.Out1_buf.e_log = '1;
		
		n0.r5.m0.Out_buf.e_log = '1;
		n0.r5.m1.Out_buf.e_log = '1;
		n0.r5.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r6_reset_d_log_0;
	begin
		n0.r6.d0.In_buf.d_log = '0;
		n0.r6.d1.In_buf.d_log = '0;
		n0.r6.d2.In_buf.d_log = '0;
	
		n0.r6.s0.In_buf.d_log = '0;
		n0.r6.s1.In_buf.d_log = '0;
		n0.r6.s2.In_buf.d_log = '0;
		
		n0.r6.m0.In0_buf.d_log = '0;
		n0.r6.m0.In1_buf.d_log = '0;
		n0.r6.m0.S_buf.d_log = '0;
		n0.r6.m1.In0_buf.d_log = '0;
		n0.r6.m1.In1_buf.d_log = '0;
		n0.r6.m1.S_buf.d_log = '0;
		n0.r6.m2.In0_buf.d_log = '0;
		n0.r6.m2.In1_buf.d_log = '0;
		n0.r6.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r6_reset_e_log_0;
	begin
		n0.r6.d0.Out0_buf.e_log = '0;
		n0.r6.d0.Out1_buf.e_log = '0;
		n0.r6.d0.S_buf.e_log = '0;
		n0.r6.d1.Out0_buf.e_log = '0;
		n0.r6.d1.Out1_buf.e_log = '0;
		n0.r6.d1.S_buf.e_log = '0;
		n0.r6.d2.Out0_buf.e_log = '0;
		n0.r6.d2.Out1_buf.e_log = '0;
		n0.r6.d2.S_buf.e_log = '0;
	
		n0.r6.s0.Out0_buf.e_log = '0;
		n0.r6.s0.Out1_buf.e_log = '0;
		n0.r6.s1.Out0_buf.e_log = '0;
		n0.r6.s1.Out1_buf.e_log = '0;
		n0.r6.s2.Out0_buf.e_log = '0;
		n0.r6.s2.Out1_buf.e_log = '0;
		
		n0.r6.m0.Out_buf.e_log = '0;
		n0.r6.m1.Out_buf.e_log = '0;
		n0.r6.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r6_reset_e_log_1;
	begin
		n0.r6.d0.Out0_buf.e_log = '1;
		n0.r6.d0.Out1_buf.e_log = '1;
		n0.r6.d0.S_buf.e_log = '1;
		n0.r6.d1.Out0_buf.e_log = '1;
		n0.r6.d1.Out1_buf.e_log = '1;
		n0.r6.d1.S_buf.e_log = '1;
		n0.r6.d2.Out0_buf.e_log = '1;
		n0.r6.d2.Out1_buf.e_log = '1;
		n0.r6.d2.S_buf.e_log = '1;
	
		n0.r6.s0.Out0_buf.e_log = '1;
		n0.r6.s0.Out1_buf.e_log = '1;
		n0.r6.s1.Out0_buf.e_log = '1;
		n0.r6.s1.Out1_buf.e_log = '1;
		n0.r6.s2.Out0_buf.e_log = '1;
		n0.r6.s2.Out1_buf.e_log = '1;
		
		n0.r6.m0.Out_buf.e_log = '1;
		n0.r6.m1.Out_buf.e_log = '1;
		n0.r6.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r7_reset_d_log_0;
	begin
		n0.r7.d0.In_buf.d_log = '0;
		n0.r7.d1.In_buf.d_log = '0;
		n0.r7.d2.In_buf.d_log = '0;
	
		n0.r7.s0.In_buf.d_log = '0;
		n0.r7.s1.In_buf.d_log = '0;
		n0.r7.s2.In_buf.d_log = '0;
		
		n0.r7.m0.In0_buf.d_log = '0;
		n0.r7.m0.In1_buf.d_log = '0;
		n0.r7.m0.S_buf.d_log = '0;
		n0.r7.m1.In0_buf.d_log = '0;
		n0.r7.m1.In1_buf.d_log = '0;
		n0.r7.m1.S_buf.d_log = '0;
		n0.r7.m2.In0_buf.d_log = '0;
		n0.r7.m2.In1_buf.d_log = '0;
		n0.r7.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r7_reset_e_log_0;
	begin
		n0.r7.d0.Out0_buf.e_log = '0;
		n0.r7.d0.Out1_buf.e_log = '0;
		n0.r7.d0.S_buf.e_log = '0;
		n0.r7.d1.Out0_buf.e_log = '0;
		n0.r7.d1.Out1_buf.e_log = '0;
		n0.r7.d1.S_buf.e_log = '0;
		n0.r7.d2.Out0_buf.e_log = '0;
		n0.r7.d2.Out1_buf.e_log = '0;
		n0.r7.d2.S_buf.e_log = '0;
	
		n0.r7.s0.Out0_buf.e_log = '0;
		n0.r7.s0.Out1_buf.e_log = '0;
		n0.r7.s1.Out0_buf.e_log = '0;
		n0.r7.s1.Out1_buf.e_log = '0;
		n0.r7.s2.Out0_buf.e_log = '0;
		n0.r7.s2.Out1_buf.e_log = '0;
		
		n0.r7.m0.Out_buf.e_log = '0;
		n0.r7.m1.Out_buf.e_log = '0;
		n0.r7.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r7_reset_e_log_1;
	begin
		n0.r7.d0.Out0_buf.e_log = '1;
		n0.r7.d0.Out1_buf.e_log = '1;
		n0.r7.d0.S_buf.e_log = '1;
		n0.r7.d1.Out0_buf.e_log = '1;
		n0.r7.d1.Out1_buf.e_log = '1;
		n0.r7.d1.S_buf.e_log = '1;
		n0.r7.d2.Out0_buf.e_log = '1;
		n0.r7.d2.Out1_buf.e_log = '1;
		n0.r7.d2.S_buf.e_log = '1;
	
		n0.r7.s0.Out0_buf.e_log = '1;
		n0.r7.s0.Out1_buf.e_log = '1;
		n0.r7.s1.Out0_buf.e_log = '1;
		n0.r7.s1.Out1_buf.e_log = '1;
		n0.r7.s2.Out0_buf.e_log = '1;
		n0.r7.s2.Out1_buf.e_log = '1;
		
		n0.r7.m0.Out_buf.e_log = '1;
		n0.r7.m1.Out_buf.e_log = '1;
		n0.r7.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r8_reset_d_log_0;
	begin
		n0.r8.d0.In_buf.d_log = '0;
		n0.r8.d1.In_buf.d_log = '0;
		n0.r8.d2.In_buf.d_log = '0;
	
		n0.r8.s0.In_buf.d_log = '0;
		n0.r8.s1.In_buf.d_log = '0;
		n0.r8.s2.In_buf.d_log = '0;
		
		n0.r8.m0.In0_buf.d_log = '0;
		n0.r8.m0.In1_buf.d_log = '0;
		n0.r8.m0.S_buf.d_log = '0;
		n0.r8.m1.In0_buf.d_log = '0;
		n0.r8.m1.In1_buf.d_log = '0;
		n0.r8.m1.S_buf.d_log = '0;
		n0.r8.m2.In0_buf.d_log = '0;
		n0.r8.m2.In1_buf.d_log = '0;
		n0.r8.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r8_reset_e_log_0;
	begin
		n0.r8.d0.Out0_buf.e_log = '0;
		n0.r8.d0.Out1_buf.e_log = '0;
		n0.r8.d0.S_buf.e_log = '0;
		n0.r8.d1.Out0_buf.e_log = '0;
		n0.r8.d1.Out1_buf.e_log = '0;
		n0.r8.d1.S_buf.e_log = '0;
		n0.r8.d2.Out0_buf.e_log = '0;
		n0.r8.d2.Out1_buf.e_log = '0;
		n0.r8.d2.S_buf.e_log = '0;
	
		n0.r8.s0.Out0_buf.e_log = '0;
		n0.r8.s0.Out1_buf.e_log = '0;
		n0.r8.s1.Out0_buf.e_log = '0;
		n0.r8.s1.Out1_buf.e_log = '0;
		n0.r8.s2.Out0_buf.e_log = '0;
		n0.r8.s2.Out1_buf.e_log = '0;
		
		n0.r8.m0.Out_buf.e_log = '0;
		n0.r8.m1.Out_buf.e_log = '0;
		n0.r8.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r8_reset_e_log_1;
	begin
		n0.r8.d0.Out0_buf.e_log = '1;
		n0.r8.d0.Out1_buf.e_log = '1;
		n0.r8.d0.S_buf.e_log = '1;
		n0.r8.d1.Out0_buf.e_log = '1;
		n0.r8.d1.Out1_buf.e_log = '1;
		n0.r8.d1.S_buf.e_log = '1;
		n0.r8.d2.Out0_buf.e_log = '1;
		n0.r8.d2.Out1_buf.e_log = '1;
		n0.r8.d2.S_buf.e_log = '1;
	
		n0.r8.s0.Out0_buf.e_log = '1;
		n0.r8.s0.Out1_buf.e_log = '1;
		n0.r8.s1.Out0_buf.e_log = '1;
		n0.r8.s1.Out1_buf.e_log = '1;
		n0.r8.s2.Out0_buf.e_log = '1;
		n0.r8.s2.Out1_buf.e_log = '1;
		
		n0.r8.m0.Out_buf.e_log = '1;
		n0.r8.m1.Out_buf.e_log = '1;
		n0.r8.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r9_reset_d_log_0;
	begin
		n0.r9.d0.In_buf.d_log = '0;
		n0.r9.d1.In_buf.d_log = '0;
		n0.r9.d2.In_buf.d_log = '0;
	
		n0.r9.s0.In_buf.d_log = '0;
		n0.r9.s1.In_buf.d_log = '0;
		n0.r9.s2.In_buf.d_log = '0;
		
		n0.r9.m0.In0_buf.d_log = '0;
		n0.r9.m0.In1_buf.d_log = '0;
		n0.r9.m0.S_buf.d_log = '0;
		n0.r9.m1.In0_buf.d_log = '0;
		n0.r9.m1.In1_buf.d_log = '0;
		n0.r9.m1.S_buf.d_log = '0;
		n0.r9.m2.In0_buf.d_log = '0;
		n0.r9.m2.In1_buf.d_log = '0;
		n0.r9.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r9_reset_e_log_0;
	begin
		n0.r9.d0.Out0_buf.e_log = '0;
		n0.r9.d0.Out1_buf.e_log = '0;
		n0.r9.d0.S_buf.e_log = '0;
		n0.r9.d1.Out0_buf.e_log = '0;
		n0.r9.d1.Out1_buf.e_log = '0;
		n0.r9.d1.S_buf.e_log = '0;
		n0.r9.d2.Out0_buf.e_log = '0;
		n0.r9.d2.Out1_buf.e_log = '0;
		n0.r9.d2.S_buf.e_log = '0;
	
		n0.r9.s0.Out0_buf.e_log = '0;
		n0.r9.s0.Out1_buf.e_log = '0;
		n0.r9.s1.Out0_buf.e_log = '0;
		n0.r9.s1.Out1_buf.e_log = '0;
		n0.r9.s2.Out0_buf.e_log = '0;
		n0.r9.s2.Out1_buf.e_log = '0;
		
		n0.r9.m0.Out_buf.e_log = '0;
		n0.r9.m1.Out_buf.e_log = '0;
		n0.r9.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r9_reset_e_log_1;
	begin
		n0.r9.d0.Out0_buf.e_log = '1;
		n0.r9.d0.Out1_buf.e_log = '1;
		n0.r9.d0.S_buf.e_log = '1;
		n0.r9.d1.Out0_buf.e_log = '1;
		n0.r9.d1.Out1_buf.e_log = '1;
		n0.r9.d1.S_buf.e_log = '1;
		n0.r9.d2.Out0_buf.e_log = '1;
		n0.r9.d2.Out1_buf.e_log = '1;
		n0.r9.d2.S_buf.e_log = '1;
	
		n0.r9.s0.Out0_buf.e_log = '1;
		n0.r9.s0.Out1_buf.e_log = '1;
		n0.r9.s1.Out0_buf.e_log = '1;
		n0.r9.s1.Out1_buf.e_log = '1;
		n0.r9.s2.Out0_buf.e_log = '1;
		n0.r9.s2.Out1_buf.e_log = '1;
		
		n0.r9.m0.Out_buf.e_log = '1;
		n0.r9.m1.Out_buf.e_log = '1;
		n0.r9.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r10_reset_d_log_0;
	begin
		n0.r10.d0.In_buf.d_log = '0;
		n0.r10.d1.In_buf.d_log = '0;
		n0.r10.d2.In_buf.d_log = '0;
	
		n0.r10.s0.In_buf.d_log = '0;
		n0.r10.s1.In_buf.d_log = '0;
		n0.r10.s2.In_buf.d_log = '0;
		
		n0.r10.m0.In0_buf.d_log = '0;
		n0.r10.m0.In1_buf.d_log = '0;
		n0.r10.m0.S_buf.d_log = '0;
		n0.r10.m1.In0_buf.d_log = '0;
		n0.r10.m1.In1_buf.d_log = '0;
		n0.r10.m1.S_buf.d_log = '0;
		n0.r10.m2.In0_buf.d_log = '0;
		n0.r10.m2.In1_buf.d_log = '0;
		n0.r10.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r10_reset_e_log_0;
	begin
		n0.r10.d0.Out0_buf.e_log = '0;
		n0.r10.d0.Out1_buf.e_log = '0;
		n0.r10.d0.S_buf.e_log = '0;
		n0.r10.d1.Out0_buf.e_log = '0;
		n0.r10.d1.Out1_buf.e_log = '0;
		n0.r10.d1.S_buf.e_log = '0;
		n0.r10.d2.Out0_buf.e_log = '0;
		n0.r10.d2.Out1_buf.e_log = '0;
		n0.r10.d2.S_buf.e_log = '0;
	
		n0.r10.s0.Out0_buf.e_log = '0;
		n0.r10.s0.Out1_buf.e_log = '0;
		n0.r10.s1.Out0_buf.e_log = '0;
		n0.r10.s1.Out1_buf.e_log = '0;
		n0.r10.s2.Out0_buf.e_log = '0;
		n0.r10.s2.Out1_buf.e_log = '0;
		
		n0.r10.m0.Out_buf.e_log = '0;
		n0.r10.m1.Out_buf.e_log = '0;
		n0.r10.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r10_reset_e_log_1;
	begin
		n0.r10.d0.Out0_buf.e_log = '1;
		n0.r10.d0.Out1_buf.e_log = '1;
		n0.r10.d0.S_buf.e_log = '1;
		n0.r10.d1.Out0_buf.e_log = '1;
		n0.r10.d1.Out1_buf.e_log = '1;
		n0.r10.d1.S_buf.e_log = '1;
		n0.r10.d2.Out0_buf.e_log = '1;
		n0.r10.d2.Out1_buf.e_log = '1;
		n0.r10.d2.S_buf.e_log = '1;
	
		n0.r10.s0.Out0_buf.e_log = '1;
		n0.r10.s0.Out1_buf.e_log = '1;
		n0.r10.s1.Out0_buf.e_log = '1;
		n0.r10.s1.Out1_buf.e_log = '1;
		n0.r10.s2.Out0_buf.e_log = '1;
		n0.r10.s2.Out1_buf.e_log = '1;
		
		n0.r10.m0.Out_buf.e_log = '1;
		n0.r10.m1.Out_buf.e_log = '1;
		n0.r10.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r11_reset_d_log_0;
	begin
		n0.r11.d0.In_buf.d_log = '0;
		n0.r11.d1.In_buf.d_log = '0;
		n0.r11.d2.In_buf.d_log = '0;
	
		n0.r11.s0.In_buf.d_log = '0;
		n0.r11.s1.In_buf.d_log = '0;
		n0.r11.s2.In_buf.d_log = '0;
		
		n0.r11.m0.In0_buf.d_log = '0;
		n0.r11.m0.In1_buf.d_log = '0;
		n0.r11.m0.S_buf.d_log = '0;
		n0.r11.m1.In0_buf.d_log = '0;
		n0.r11.m1.In1_buf.d_log = '0;
		n0.r11.m1.S_buf.d_log = '0;
		n0.r11.m2.In0_buf.d_log = '0;
		n0.r11.m2.In1_buf.d_log = '0;
		n0.r11.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r11_reset_e_log_0;
	begin
		n0.r11.d0.Out0_buf.e_log = '0;
		n0.r11.d0.Out1_buf.e_log = '0;
		n0.r11.d0.S_buf.e_log = '0;
		n0.r11.d1.Out0_buf.e_log = '0;
		n0.r11.d1.Out1_buf.e_log = '0;
		n0.r11.d1.S_buf.e_log = '0;
		n0.r11.d2.Out0_buf.e_log = '0;
		n0.r11.d2.Out1_buf.e_log = '0;
		n0.r11.d2.S_buf.e_log = '0;
	
		n0.r11.s0.Out0_buf.e_log = '0;
		n0.r11.s0.Out1_buf.e_log = '0;
		n0.r11.s1.Out0_buf.e_log = '0;
		n0.r11.s1.Out1_buf.e_log = '0;
		n0.r11.s2.Out0_buf.e_log = '0;
		n0.r11.s2.Out1_buf.e_log = '0;
		
		n0.r11.m0.Out_buf.e_log = '0;
		n0.r11.m1.Out_buf.e_log = '0;
		n0.r11.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r11_reset_e_log_1;
	begin
		n0.r11.d0.Out0_buf.e_log = '1;
		n0.r11.d0.Out1_buf.e_log = '1;
		n0.r11.d0.S_buf.e_log = '1;
		n0.r11.d1.Out0_buf.e_log = '1;
		n0.r11.d1.Out1_buf.e_log = '1;
		n0.r11.d1.S_buf.e_log = '1;
		n0.r11.d2.Out0_buf.e_log = '1;
		n0.r11.d2.Out1_buf.e_log = '1;
		n0.r11.d2.S_buf.e_log = '1;
	
		n0.r11.s0.Out0_buf.e_log = '1;
		n0.r11.s0.Out1_buf.e_log = '1;
		n0.r11.s1.Out0_buf.e_log = '1;
		n0.r11.s1.Out1_buf.e_log = '1;
		n0.r11.s2.Out0_buf.e_log = '1;
		n0.r11.s2.Out1_buf.e_log = '1;
		
		n0.r11.m0.Out_buf.e_log = '1;
		n0.r11.m1.Out_buf.e_log = '1;
		n0.r11.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r12_reset_d_log_0;
	begin
		n0.r12.d0.In_buf.d_log = '0;
		n0.r12.d1.In_buf.d_log = '0;
		n0.r12.d2.In_buf.d_log = '0;
	
		n0.r12.s0.In_buf.d_log = '0;
		n0.r12.s1.In_buf.d_log = '0;
		n0.r12.s2.In_buf.d_log = '0;
		
		n0.r12.m0.In0_buf.d_log = '0;
		n0.r12.m0.In1_buf.d_log = '0;
		n0.r12.m0.S_buf.d_log = '0;
		n0.r12.m1.In0_buf.d_log = '0;
		n0.r12.m1.In1_buf.d_log = '0;
		n0.r12.m1.S_buf.d_log = '0;
		n0.r12.m2.In0_buf.d_log = '0;
		n0.r12.m2.In1_buf.d_log = '0;
		n0.r12.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r12_reset_e_log_0;
	begin
		n0.r12.d0.Out0_buf.e_log = '0;
		n0.r12.d0.Out1_buf.e_log = '0;
		n0.r12.d0.S_buf.e_log = '0;
		n0.r12.d1.Out0_buf.e_log = '0;
		n0.r12.d1.Out1_buf.e_log = '0;
		n0.r12.d1.S_buf.e_log = '0;
		n0.r12.d2.Out0_buf.e_log = '0;
		n0.r12.d2.Out1_buf.e_log = '0;
		n0.r12.d2.S_buf.e_log = '0;
	
		n0.r12.s0.Out0_buf.e_log = '0;
		n0.r12.s0.Out1_buf.e_log = '0;
		n0.r12.s1.Out0_buf.e_log = '0;
		n0.r12.s1.Out1_buf.e_log = '0;
		n0.r12.s2.Out0_buf.e_log = '0;
		n0.r12.s2.Out1_buf.e_log = '0;
		
		n0.r12.m0.Out_buf.e_log = '0;
		n0.r12.m1.Out_buf.e_log = '0;
		n0.r12.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r12_reset_e_log_1;
	begin
		n0.r12.d0.Out0_buf.e_log = '1;
		n0.r12.d0.Out1_buf.e_log = '1;
		n0.r12.d0.S_buf.e_log = '1;
		n0.r12.d1.Out0_buf.e_log = '1;
		n0.r12.d1.Out1_buf.e_log = '1;
		n0.r12.d1.S_buf.e_log = '1;
		n0.r12.d2.Out0_buf.e_log = '1;
		n0.r12.d2.Out1_buf.e_log = '1;
		n0.r12.d2.S_buf.e_log = '1;
	
		n0.r12.s0.Out0_buf.e_log = '1;
		n0.r12.s0.Out1_buf.e_log = '1;
		n0.r12.s1.Out0_buf.e_log = '1;
		n0.r12.s1.Out1_buf.e_log = '1;
		n0.r12.s2.Out0_buf.e_log = '1;
		n0.r12.s2.Out1_buf.e_log = '1;
		
		n0.r12.m0.Out_buf.e_log = '1;
		n0.r12.m1.Out_buf.e_log = '1;
		n0.r12.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r13_reset_d_log_0;
	begin
		n0.r13.d0.In_buf.d_log = '0;
		n0.r13.d1.In_buf.d_log = '0;
		n0.r13.d2.In_buf.d_log = '0;
	
		n0.r13.s0.In_buf.d_log = '0;
		n0.r13.s1.In_buf.d_log = '0;
		n0.r13.s2.In_buf.d_log = '0;
		
		n0.r13.m0.In0_buf.d_log = '0;
		n0.r13.m0.In1_buf.d_log = '0;
		n0.r13.m0.S_buf.d_log = '0;
		n0.r13.m1.In0_buf.d_log = '0;
		n0.r13.m1.In1_buf.d_log = '0;
		n0.r13.m1.S_buf.d_log = '0;
		n0.r13.m2.In0_buf.d_log = '0;
		n0.r13.m2.In1_buf.d_log = '0;
		n0.r13.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r13_reset_e_log_0;
	begin
		n0.r13.d0.Out0_buf.e_log = '0;
		n0.r13.d0.Out1_buf.e_log = '0;
		n0.r13.d0.S_buf.e_log = '0;
		n0.r13.d1.Out0_buf.e_log = '0;
		n0.r13.d1.Out1_buf.e_log = '0;
		n0.r13.d1.S_buf.e_log = '0;
		n0.r13.d2.Out0_buf.e_log = '0;
		n0.r13.d2.Out1_buf.e_log = '0;
		n0.r13.d2.S_buf.e_log = '0;
	
		n0.r13.s0.Out0_buf.e_log = '0;
		n0.r13.s0.Out1_buf.e_log = '0;
		n0.r13.s1.Out0_buf.e_log = '0;
		n0.r13.s1.Out1_buf.e_log = '0;
		n0.r13.s2.Out0_buf.e_log = '0;
		n0.r13.s2.Out1_buf.e_log = '0;
		
		n0.r13.m0.Out_buf.e_log = '0;
		n0.r13.m1.Out_buf.e_log = '0;
		n0.r13.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r13_reset_e_log_1;
	begin
		n0.r13.d0.Out0_buf.e_log = '1;
		n0.r13.d0.Out1_buf.e_log = '1;
		n0.r13.d0.S_buf.e_log = '1;
		n0.r13.d1.Out0_buf.e_log = '1;
		n0.r13.d1.Out1_buf.e_log = '1;
		n0.r13.d1.S_buf.e_log = '1;
		n0.r13.d2.Out0_buf.e_log = '1;
		n0.r13.d2.Out1_buf.e_log = '1;
		n0.r13.d2.S_buf.e_log = '1;
	
		n0.r13.s0.Out0_buf.e_log = '1;
		n0.r13.s0.Out1_buf.e_log = '1;
		n0.r13.s1.Out0_buf.e_log = '1;
		n0.r13.s1.Out1_buf.e_log = '1;
		n0.r13.s2.Out0_buf.e_log = '1;
		n0.r13.s2.Out1_buf.e_log = '1;
		
		n0.r13.m0.Out_buf.e_log = '1;
		n0.r13.m1.Out_buf.e_log = '1;
		n0.r13.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task r14_reset_d_log_0;
	begin
		n0.r14.d0.In_buf.d_log = '0;
		n0.r14.d1.In_buf.d_log = '0;
		n0.r14.d2.In_buf.d_log = '0;
	
		n0.r14.s0.In_buf.d_log = '0;
		n0.r14.s1.In_buf.d_log = '0;
		n0.r14.s2.In_buf.d_log = '0;
		
		n0.r14.m0.In0_buf.d_log = '0;
		n0.r14.m0.In1_buf.d_log = '0;
		n0.r14.m0.S_buf.d_log = '0;
		n0.r14.m1.In0_buf.d_log = '0;
		n0.r14.m1.In1_buf.d_log = '0;
		n0.r14.m1.S_buf.d_log = '0;
		n0.r14.m2.In0_buf.d_log = '0;
		n0.r14.m2.In1_buf.d_log = '0;
		n0.r14.m2.S_buf.d_log = '0;
	end
	endtask
	
	task r14_reset_e_log_0;
	begin
		n0.r14.d0.Out0_buf.e_log = '0;
		n0.r14.d0.Out1_buf.e_log = '0;
		n0.r14.d0.S_buf.e_log = '0;
		n0.r14.d1.Out0_buf.e_log = '0;
		n0.r14.d1.Out1_buf.e_log = '0;
		n0.r14.d1.S_buf.e_log = '0;
		n0.r14.d2.Out0_buf.e_log = '0;
		n0.r14.d2.Out1_buf.e_log = '0;
		n0.r14.d2.S_buf.e_log = '0;
	
		n0.r14.s0.Out0_buf.e_log = '0;
		n0.r14.s0.Out1_buf.e_log = '0;
		n0.r14.s1.Out0_buf.e_log = '0;
		n0.r14.s1.Out1_buf.e_log = '0;
		n0.r14.s2.Out0_buf.e_log = '0;
		n0.r14.s2.Out1_buf.e_log = '0;
		
		n0.r14.m0.Out_buf.e_log = '0;
		n0.r14.m1.Out_buf.e_log = '0;
		n0.r14.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task r14_reset_e_log_1;
	begin
		n0.r14.d0.Out0_buf.e_log = '1;
		n0.r14.d0.Out1_buf.e_log = '1;
		n0.r14.d0.S_buf.e_log = '1;
		n0.r14.d1.Out0_buf.e_log = '1;
		n0.r14.d1.Out1_buf.e_log = '1;
		n0.r14.d1.S_buf.e_log = '1;
		n0.r14.d2.Out0_buf.e_log = '1;
		n0.r14.d2.Out1_buf.e_log = '1;
		n0.r14.d2.S_buf.e_log = '1;
	
		n0.r14.s0.Out0_buf.e_log = '1;
		n0.r14.s0.Out1_buf.e_log = '1;
		n0.r14.s1.Out0_buf.e_log = '1;
		n0.r14.s1.Out1_buf.e_log = '1;
		n0.r14.s2.Out0_buf.e_log = '1;
		n0.r14.s2.Out1_buf.e_log = '1;
		
		n0.r14.m0.Out_buf.e_log = '1;
		n0.r14.m1.Out_buf.e_log = '1;
		n0.r14.m2.Out_buf.e_log = '1;
	end
	endtask
	
	task err_reset_d_log_0;
	begin
		n0.e0.In_buf.d_log = '0;
		n0.e1.In_buf.d_log = '0;
		n0.e2.In_buf.d_log = '0;
		n0.e3.In_buf.d_log = '0;
		n0.e4.In_buf.d_log = '0;
		n0.e5.In_buf.d_log = '0;
		n0.e6.In_buf.d_log = '0;
		n0.e7.In_buf.d_log = '0;
		n0.e8.In_buf.d_log = '0;
		n0.e9.In_buf.d_log = '0;
		n0.e10.In_buf.d_log = '0;
		n0.e11.In_buf.d_log = '0;
		n0.e12.In_buf.d_log = '0;
		n0.e13.In_buf.d_log = '0;
		n0.e14.In_buf.d_log = '0;
		n0.e15.In_buf.d_log = '0;
	end
	endtask
	
	task err_reset_e_log_0;
	begin
		n0.e0.Out_buf.e_log = '0;
		n0.e0.Err_buf.e_log = '0;
		n0.e1.Out_buf.e_log = '0;
		n0.e1.Err_buf.e_log = '0;
		n0.e2.Out_buf.e_log = '0;
		n0.e2.Err_buf.e_log = '0;
		n0.e3.Out_buf.e_log = '0;
		n0.e3.Err_buf.e_log = '0;
		n0.e4.Out_buf.e_log = '0;
		n0.e4.Err_buf.e_log = '0;
		n0.e5.Out_buf.e_log = '0;
		n0.e5.Err_buf.e_log = '0;
		n0.e6.Out_buf.e_log = '0;
		n0.e6.Err_buf.e_log = '0;
		n0.e7.Out_buf.e_log = '0;
		n0.e7.Err_buf.e_log = '0;
		n0.e8.Out_buf.e_log = '0;
		n0.e8.Err_buf.e_log = '0;
		n0.e9.Out_buf.e_log = '0;
		n0.e9.Err_buf.e_log = '0;
		n0.e10.Out_buf.e_log = '0;
		n0.e10.Err_buf.e_log = '0;
		n0.e11.Out_buf.e_log = '0;
		n0.e11.Err_buf.e_log = '0;
		n0.e12.Out_buf.e_log = '0;
		n0.e12.Err_buf.e_log = '0;
		n0.e13.Out_buf.e_log = '0;
		n0.e13.Err_buf.e_log = '0;
		n0.e14.Out_buf.e_log = '0;
		n0.e14.Err_buf.e_log = '0;
		n0.e15.Out_buf.e_log = '0;
		n0.e15.Err_buf.e_log = '0;
	end
	endtask
	
	task err_reset_e_log_1;
	begin
		n0.e0.Out_buf.e_log = '1;
		n0.e0.Err_buf.e_log = '1;
		n0.e1.Out_buf.e_log = '1;
		n0.e1.Err_buf.e_log = '1;
		n0.e2.Out_buf.e_log = '1;
		n0.e2.Err_buf.e_log = '1;
		n0.e3.Out_buf.e_log = '1;
		n0.e3.Err_buf.e_log = '1;
		n0.e4.Out_buf.e_log = '1;
		n0.e4.Err_buf.e_log = '1;
		n0.e5.Out_buf.e_log = '1;
		n0.e5.Err_buf.e_log = '1;
		n0.e6.Out_buf.e_log = '1;
		n0.e6.Err_buf.e_log = '1;
		n0.e7.Out_buf.e_log = '1;
		n0.e7.Err_buf.e_log = '1;
		n0.e8.Out_buf.e_log = '1;
		n0.e8.Err_buf.e_log = '1;
		n0.e9.Out_buf.e_log = '1;
		n0.e9.Err_buf.e_log = '1;
		n0.e10.Out_buf.e_log = '1;
		n0.e10.Err_buf.e_log = '1;
		n0.e11.Out_buf.e_log = '1;
		n0.e11.Err_buf.e_log = '1;
		n0.e12.Out_buf.e_log = '1;
		n0.e12.Err_buf.e_log = '1;
		n0.e13.Out_buf.e_log = '1;
		n0.e13.Err_buf.e_log = '1;
		n0.e14.Out_buf.e_log = '1;
		n0.e14.Err_buf.e_log = '1;
		n0.e15.Out_buf.e_log = '1;
		n0.e15.Err_buf.e_log = '1;
	end
	endtask
endmodule

