library(pathview)

gene_fc <- resSig$log2FoldChange
names(gene_fc) <- mapIds(org.Mm.eg.db, keys = rownames(resSig), column = "ENTREZID", keytype = "ENSEMBL", multiVals = "first")
gene_fc <- na.omit(gene_fc)

#Pathview for cell cycle
pathview(gene.data = gene_fc, pathway.id = "mmu04110", species = "mmu", out.suffix = "cell_cycle_DEG")
#Pathview for cytokine-cytokine
pathview(gene.data = gene_fc, pathway.id = "mmu04060", species = "mmu", out.suffix = "cytokine_pathway")
