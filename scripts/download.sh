#!/bin/bash
mkdir -p ../data/raw_fastq

for srr in SRR1552449 SRR1552451 SRR1552452 SRR1552453 SRR1552454 SRR1552455
do
  fasterq-dump $srr -O ../data/raw_fastq
  #use --split-files if reads are not single-end
done
