cat tf.bed | awk '{if($4 =="NFKB") print}' > tf.nfkb.bed
