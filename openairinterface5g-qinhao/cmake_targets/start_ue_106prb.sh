#!/bin/bash
##
sudo cp DpssSeq2048.txt dpssSeq.txt


sudo ./ran_build/build/nr-uesoftmodem -r 106 --numerology 1 --band 78 -C 3619200000 -s 516 --sa --ue-fo-compensation --nokrnmod 1 -O ~/openairinterface_w25/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/ue_oai.conf --usrp-args "addr=192.168.20.2,clock_source=internal,time_source=internal"   --ue-txgain 35 --ue-rxgain 70 --ue-timing-correction-disable 1  --dlsch-parallel 16 --ue-timing-correction-disable 1 --rfsimu-if-enable 0 --ue-txgain 35 --ue-rxgain 65 --doppler-shift 55000 --usrp-freq-off -1550

# 信道模拟器测试时需要加上 --rfsimu-if-enable 1
# 选择性删去 --doppler-shift 0

# --ue-timing-correction-disable 1 需要始终存在

