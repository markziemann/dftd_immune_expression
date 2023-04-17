#!/bin/bash

# https://developer.basespace.illumina.com/docs/content/documentation/cli/cli-overview#Install
# https://developer.basespace.illumina.com/docs/content/documentation/cli/cli-examples#Downloadalldatasetsassociatedwithabiosample

~/bin/bs list datasets | grep L00 | cut -d ' ' -f2 > datasets.txt


for DATA in $(cat datasets.txt) ; do

  echo $DATA

  ~/bin/bs download dataset -n $DATA

done

