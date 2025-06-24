library(clusterProfiler)
library(org.Mm.eg.db)
res <- read.csv("../results/DESeq2/results.csv", row.names = 1)

resSig <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
resSig <- resSig[!is.na(resSig$padj), ]
genes <- rownames(resSig)

entrez_ids <- mapIds(org.Mm.eg.db, keys = genes, column = "ENTREZID", keytype = "ENSEMBL", multiVals = "first")
entrez_ids <- na.omit(entrez_ids)

#GO enrichment 
ego <- enrichGO(gene = entrez_ids, OrgDb = org.Mm.eg.db, keyType = "ENTREZID", ont = "BP", readable = TRUE)
write.csv(as.data.frame(ego), "../results/enrichment/GO_enrichment.csv")

#KEGG enrichment
kegg <- enrichKEGG(gene = entrez_ids, organism = "mmu")
write.csv(as.data.frame(kegg), "../results/enrichment/KEGG_enrichment.csv")
