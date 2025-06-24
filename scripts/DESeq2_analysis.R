library(DESeq2)

#Getting rid of metadata in the beginning
counts <- read.delim("../data/counts/counts.txt", comment.char = "#", row.names = 1)
counts <- counts[ ,6:ncol(counts)]

#counts file needs to be trimmed 
colnames(counts) <- gsub(".*SRR", "SRR", colnames(counts))
colnames(counts) <- gsub("_sorted.bam", "", colnames(counts))

#Expirement conditions
colData <- data.frame(
  row.names = colnames(counts),
  condition = c("lactation 2 day", "virgin", "pregnancy 18.5 day", "pregnancy 18.5 day", "lactation 2 day", "lactation 2 day"),
  immunophenotype = c("luminal", "basal", "basal", "basal", "basal", "basal")
)

#DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = gen_counts,
                              colData = colData,
                              design = ~ condition + immunophenotype)

#Filtration + analyze beginning
dds <- dds[ rowSums(counts(dds)) > 10, ]
dds <- DESeq(dds)

#Getting results
res <- results(dds, contrast = c("condition", "pregnancy 18.5 day", "lactation 2 day"))
