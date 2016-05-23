#!/bin/tcsh

if ( $1 == "skip" ) goto compile 

set i = 1
while ( $i <= 14 )
	if($i <= 2) then
		set mask = 1000
	else if($i <= 6) then
		set mask = 1100
	else
		set mask = 1110
	endif
	
	if( ($i == 1) | ($i == 3) | ($i == 7) ) then
		set addr = 0000
	else if( ($i == 4) | ($i == 9) ) then
		set addr = 0100
	else if( ($i == 2) | ($i == 5) | ($i == 11) ) then
		set addr = 1000
	else if( ($i == 6) | ($i == 13) ) then
		set addr = 1100
	else if( $i == 8 ) then
		set addr = 0010
	else if( $i == 10) then
		set addr = 0110
	else if( $i == 12) then
		set addr = 1010
	else
		set addr = 1110
	endif
	
	set design0 = decoder
	set top_design0 = router
	set top_design = router$i
	
	/usr/bin/rm -f ${top_design}_wrapper.sv
	sed -e "s/$top_design0/$top_design/g" ${top_design0}_wrapper.sv > ${top_design}_wrapper.sv
	sed -e "s/decoder/decoder$i/g" ${top_design}_wrapper.sv > ${top_design}2_wrapper.sv
	/usr/bin/rm -f ${top_design}_wrapper.sv
	mv ${top_design}2_wrapper.sv ${top_design}_wrapper.sv
	
	foreach leaf ( 0 1 )
		find . -type d -name "*qdi" | xargs /bin/rm -rf

		if($leaf == 0) then
			set design = decoder$i
		else
			set design = decoder${i}_leaf
		endif
		
		/usr/bin/rm -f ${design}_csp.sv
		/usr/bin/rm -f ${design}.config
		/usr/bin/rm -f ${design}_wrapper.sv
		printf "%s\n" "cell=$design" "verilog=$design.rtl.sv" > ${design}.config
		
		sed -e "s/$design0/$design/g" ${design0}_wrapper.sv > ${design}_wrapper.sv
		
		sed -e "s/$design0/$design/g" ${design0}_csp.sv > ${design}_csp.sv
		sed -e "s/1001/$mask/g"  ${design}_csp.sv > ${design}2_csp.sv
		sed -e "s/0110/$addr/g" ${design}2_csp.sv > ${design}3_csp.sv
		sed -e "s/leaf = 0/leaf = $leaf/g" ${design}3_csp.sv > ${design}4_csp.sv
		
		/usr/bin/rm -f ${design}_csp.sv
		/usr/bin/rm -f ${design}2_csp.sv
		/usr/bin/rm -f ${design}3_csp.sv
		mv ${design}4_csp.sv ${design}_csp.sv
		
		echo "Checking Syntax of The Input File Using vlog ..."
		/usr/bin/rm -rf work
		vlib work
		vlog ${design}_csp.sv +incdir+$PROTEUS_PDK_PATH
		if ($status != 0) exit(1)
		echo "Running svc2rtl \n";
		/bin/rm -f svc2rtl.log
		#time svc2rtl ${design}_csp.sv ${design}.rtl.sv > svc2rtl.log
		time svc2rtl ${design}_csp.sv ${design}.rtl.sv > & /dev/null
		if ($status != 0) exit(1)
		echo "Formatting Verilog Output"
		iStyle ${design}.rtl.sv --style=ansi -s1 -M1 -m1 -E
		if ($status != 0) exit(1)
		echo "Running RC... \n";
		time proteus-a --include=${design}.config --sv=1 --task=rc --force=1
		if ($status != 0) exit(1)
		echo "Running clockfree... \n";
		time proteus-a --include=${design}.config --sv=1 --task=clockfree --force=1
		if ($status != 0) exit(1)
		echo "Running encounter... \n";
		#time proteus-a --include=${design}.config --sv=1 --task=encounter --force=1
		echo "Generating cosim wrapper... \n";
		cosim_wrapper.pl ${design}.qdi/${design}.qdi.noclk.flat.v ./${design}.qdi.noclk.flat.cosim.sv
		if ($status != 0) exit(1)
	end
	
@ i++
end

