#!/bin/bash
mkdir -p ../results/fastqc
#Quality contol
fastqc ../data/raw_fastq/*.fastq -o ../results/fastqc
#Trimming if necessary
fastp fastp -i ... -o ...trimmed.fastq -h fastp_report.html -j fastp_report.json
