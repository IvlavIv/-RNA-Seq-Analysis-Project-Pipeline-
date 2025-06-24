#!/bin/bash
mkdir -p ../data/aligned_bam

REF_genome=../genome_index/mm10/genome

for fq in ../data/raw_fastq/*.fastq
do
  base=$(basename $fq .fastq)
  hisat2 -p 4 -x $REF_genome -U $fq | \
  samtools view -@ 2 -bS - | \
  samtools sort -@ 2 -o ../data/aligned_bam/${base}_sorted.bam
  samtools index ../data/aligned_bam/${base}_sorted.bam
done
