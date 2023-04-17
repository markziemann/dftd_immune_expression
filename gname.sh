#!/bin/bash

grep '>' Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.all.fa \
| sed 's/ gene:/\n/' | cut -d '.' -f1 | tr -d '>' \
| paste - - > Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.all.tx2gene.tsv

grep '>' Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.all.fa \
| grep 'gene_symbol:' | sed 's/gene:/\n/' | sed 's/gene_symbol:/\n/' \
| cut -d ' ' -f1 | cut -d '.' -f1 | tr -d '>' | paste - - - \
| cut -f2- > Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.all.geneid2symbol.tsv
