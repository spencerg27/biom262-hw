#!/bin/bash
#PBS -q hotel
##PBS -N tf_binding.sh
#PBS -l nodes=1:ppn=1
#PBS -l walltime=0:50:00
#PBS -o tf_binding.sh.o
#PBS -e tf_binding.sh.e
#PBS -M e1luo@ucsd.edu,ecwheele@ucsd.edu,spgoodman@ucsd.edu
#PBS -m abe
cd /home/ecwheele/biom262/code/biom262-2016/weeks/week01/data


awk -F "\t" '{if($4 == "NFKB") {print $0}}' tf.bed > tf.nfkb.bed

awk -F "\t" '{if($3 == "transcript") {print $0}}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf 
#EXERCISE3 (include loading of biotools)
module load biotools

bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
#Exercise 4: Use bedtools intersect to overlap TFs with promoter
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
#Exercise 5: Use bedtools getfasta to extract sequences
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s  -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta

echo "Hello I am a message in standard out (stdout)" 
echo "Hello I am a message in standard error (stderr)" >&2


