#!/bin/bash
#Connection via FTP
GTF=../annotation/Mus_musculus.GRCm38.102.gtf
mkdir -p ../data/counts
#6 kernels will be used
featureCounts -T 6 \
  -a $GTF \
  -o ../data/counts/counts.txt \
  ../data/aligned_bam/*_sorted.bam
