#!/bin/bash

NUM=$1

/home/dnasko/bin/clustalw2 \
-infile=/data/dnasko/phage_proteomic_tree/serc_build_0.00001/02-blast_split/fasta.${NUM} \
-outfile=/data/dnasko/phage_proteomic_tree/serc_build_0.00001/04-clustalw/clustalw.${NUM} \
-output=phylip \
-newtree=/data/dnasko/phage_proteomic_tree/serc_build_0.00001/04a-dnd/tree.${NUM}.dnd -align -QUIET
