#!/bin/bash

wget -qO- "$1" | \
 grep -oP 'href="\K[^" ]+' | grep artist |grep songs | \
 sed -e 's/\/artist\///' \
     -e 's/-[0-9]*\/songs\//\t/' \
     -e 's/-[0-9]*$//' \
     -e 's/-/ /g'> data/"$2".list

 wc "$2".playlist

 awk 'FNR==NR{existing[$0]; next} !($0 in existing)' "$2".playlist data/"$2".list >> "$2".playlist 

 wc "$2".playlist
