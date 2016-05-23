#!/bin/tcsh

echo "Compiling the post synthesis top level file in Modelsim"

# Copy to current folder to fix _LOCK error in Modelsim
if (! -d ./svclib) then 
	cp -r $PROTEUS_PDK_PATH/svclib .
	chmod -R 744 svclib
endif

if (! -d ./qdi.synth) then 
	cp -r $PROTEUS_PDK_PATH/qdi.synth .
	chmod -R 744 qdi.synth
endif

find . -type d -name "*qdi" | xargs /bin/rm -rf
/usr/bin/rm -rf work
vlib work

vlog ./beh/router_gold.sv +incdir+$PROTEUS_PDK_PATH
vlog ./beh/noc_gold.sv +incdir+$PROTEUS_PDK_PATH

vlog ./syn/errorDetect.qdi.noclk.flat.cosim.sv +incdir+$PROTEUS_PDK_PATH
vlog ./syn/errorDetect_wrapper.sv +incdir+$PROTEUS_PDK_PATH

vlog ./syn/merge.qdi.noclk.flat.cosim.sv +incdir+$PROTEUS_PDK_PATH
vlog ./syn/merge_wrapper.sv +incdir+$PROTEUS_PDK_PATH

vlog ./syn/special_split.qdi.noclk.flat.cosim.sv +incdir+$PROTEUS_PDK_PATH
vlog ./syn/special_split_wrapper.sv +incdir+$PROTEUS_PDK_PATH

set i = 1
while ( $i <= 14 )
	vlog "./syn/decoder${i}.qdi.noclk.flat.cosim.sv" +incdir+$PROTEUS_PDK_PATH
	vlog "./syn/decoder${i}_leaf.qdi.noclk.flat.cosim.sv" +incdir+$PROTEUS_PDK_PATH
	
	vlog "./syn/decoder${i}_wrapper.sv" +incdir+$PROTEUS_PDK_PATH
	vlog "./syn/decoder${i}_leaf_wrapper.sv" +incdir+$PROTEUS_PDK_PATH
	
	vlog "./syn/router${i}_wrapper.sv" +incdir+$PROTEUS_PDK_PATH
@ i++
end

vlog ./beh/noc_syn.sv +incdir+$PROTEUS_PDK_PATH

vlog noc_tb.sv +incdir+$PROTEUS_PDK_PATH

echo "Creating Modelsim do file"
/usr/bin/rm run.do
echo "cd `pwd`" > run.do
echo "vsim work.noc_cosim_tb -novopt -L ./qdi.synth -L ./svclib" >> run.do 
echo "Successful Synthesis & Compilation!"
vsim -do run.do

last:
