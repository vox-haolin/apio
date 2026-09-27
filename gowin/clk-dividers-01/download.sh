#!/bin/bash
if [ -z "$1" ]; then
    echo "用法：$0 <名字>"
    exit 1
fi

NAME=$1
echo "名字是：$NAME"
# 下面用 $NAME 去替换你想替换的地方

yosys -p "read_verilog *.v ; synth_gowin -json $1.json" 
nextpnr-himbaechel-gowin --json $1.json --write pnr$1.json --device GW1NZ-LV1QN48C6/I5 --vopt cst=$1.cst
gowin_pack -d GW1NZ-LV1QN48C6/I5 -o pack.fs pnr$1.json
openFPGALoader -b tangnano1k pack.fs
