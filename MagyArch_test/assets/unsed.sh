#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#2f2b26/g' \
         -e 's/rgb(100%,100%,100%)/#c3cdc8/g' \
    -e 's/rgb(50%,0%,0%)/#2f2b26/g' \
     -e 's/rgb(0%,50%,0%)/#ffff00/g' \
 -e 's/rgb(0%,50.196078%,0%)/#ffff00/g' \
     -e 's/rgb(50%,0%,50%)/#2f2b26/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#2f2b26/g' \
     -e 's/rgb(0%,0%,50%)/#2e8b57/g' \
	"$@"
