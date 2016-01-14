#PBS TAGS
cat tf.bed | awk '{if($4 =="NFKB") print}' > tf.nfkb.bed
awk -F "\t" '{if($3 == "transcript") {print $0}}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf 
#EXERCISE3 (include loading of biotools)
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
#Exercise 4: Use bedtools intersect to overlap TFs with promoter
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
#Exercise 5: Use bedtools getfasta to extract sequences
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s  -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
#EXERCISE6
