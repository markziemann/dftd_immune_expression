#!/bin/bash

for BAM in $(find . | grep bam$) ; do

  BASE=$(echo $BAM | cut -d '_' -f-3)

  NAME=$BASE.bam

  mv $BAM $NAME

done

for BAM in *bam ; do

  samtools sort -@ 16 -o tmp.bam $BAM && mv tmp.bam $BAM

done

ls *bam | parallel samtools index {}
