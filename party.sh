#!/usr/bin/env bash
image="$1"
tempdir="$(uuidgen)"
mkdir "$tempdir"
for ((i=1;i<=200;i=$i+12));
do
    convert "$image" -modulate 100,100,$i "$tempdir/$(printf "%05d" $i).gif"
done
convert -delay 4 -loop 0   $tempdir/*.gif "party-${image%.*}.gif"
rm -rf $tempdir
