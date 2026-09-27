1. write the .v file and the .cst file to make sure the command to scan the file to generate the json 
	.v is the verilog file that is the as main code as in c file , and the .cst is presenting the rounting file .
 
2. use the 'yosys' command to generate the xxx.json
	yosys -p "read_verilog leds.v; synth_gowin -json leds.json"

3. use the 'nextpnr=hinbaechel-gowin' command to generate the  pnrxxx.json to plece the wire inside the FPGA "GW1NZ-LV1QN48C6/I5".  
	nextpnr-himbaechel-gowin --json leds.json --write pnrleds.json --device GW1NZ-LV1QN48C6/I5 --vopt cst=tangnano1K.cst

4. to generate the bitstream .  (which the chip only can read the file bitsteam)
	gowin_pack -d GW1NZ-LV1QN48C6/I5 -o pack.fs pnrleds.json  

5. the least step is to load the .fs to FPGA   
	openFPGALoader -b tangnano1k pack.fs
to load to the flash  
	openFPGALoader -b tangnano1k -f pack.fs
