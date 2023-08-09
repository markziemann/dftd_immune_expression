
#!/bin/bash

OLDREF=ref/Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.all.fa.idx

REF=ref2/seq.fa.idx

for FQZ1 in fastq/*_R1_001.fastq.gz ; do

  FQZ2=$(echo $FQZ1 | sed 's#_R1_#_R2_#' )

  BASE=$(echo $FQZ1 | cut -d '_' -f-3)

  skewer -q 10 -t 16 $FQZ1 $FQZ2

  FQ1=$(echo $FQZ1 | sed 's#.gz$#-trimmed-pair1.fastq#')
  FQ2=$( echo $FQ1 | sed 's#pair1.fastq#pair2.fastq#' )

  kallisto quant \
  --pseudobam  \
  -i $REF \
  -o ${FQ1}_kal -t 16 $FQ1 $FQ2

  rm $FQ1 $FQ2

done


for TSV in fastq/*/abundance.tsv ; do
  NAME=$(echo $TSV | cut -d '_' -f1) ; cut -f1,4 $TSV | sed 1d | sed "s#^#${NAME}\t#"
done | gzip > 3col.tsv.gz
