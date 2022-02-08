#!/bin/bash

if [ "$#" -eq "0" ]
then
    REPODIR=$PWD
else
    RASPPI=$1
fi

ssh -t pi@$RASPPI <<EOF
    mjpg_streamer -i "input_raspicam.so -fps 60 -x 480 -y 640 -rot 270 -quality 100 -awb off -awbgainR 1.0 -awbgainB 1.0" -o "output_http.so -w ./www"
EOF
