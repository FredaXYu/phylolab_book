# homework 07 multiple tests, Bonferroni correction

# a) gene1 associated with cancer
# It is actually to test whether the two groups are the same or not

gene_data = read.csv("../data/gene_expression.csv", header=TRUE)
gene_data[1:20,2]
t.test(gene_data[1:20,2], gene_data[21:40,2], alternative = "two.sided")

# p value = 0.6589 > 0.05, so we cannot reject the null hypothesis that the two groups are the same
# Therefore, the normal group and the cancer group can be seen as the same in gene 1. 
# Therefore, gene 1 is not associated with cancer. 

# b) 
cols = ncol(gene_data)    # that should be 100. Here we do not use 'magical numbers', so write the expression

# Method 1: using the all NA pre-allocation

qualified_genes <- rep(NA, cols-1)   # pre-allocation
for(i in 1:(cols-1)){
  p_value = t.test(gene_data[1:20,(i+1)], gene_data[21:40,(i+1)], alternative = "two.sided")$p.value
  if(p_value <= 0.05){
    # reject the null hypothesis that normal and cancer are the same
    # that's to say, the gene is associated with cancer
    qualified_genes[i] <- colnames(gene_data)[i+1] 
  }
}
qualified_genes

# Method 2: using append to the vector, but that spends more time

qualified_genes2 <- vector()   # pre-allocation
for(i in 1:(cols-1)){
  p_value = t.test(gene_data[1:20,(i+1)], gene_data[21:40,(i+1)], alternative = "two.sided")$p.value
  if(p_value <= 0.05){
    # reject the null hypothesis that normal and cancer are the same
    # that's to say, the gene is associated with cancer
    qualified_genes2 <- c(qualified_genes2, colnames(gene_data)[i+1]) 
  }
}
qualified_genes2

# Method 3: Using which()
pvalue = 1:100  # pre-allocation
for(i in 1:(cols-1)){
  pvalue[i] = t.test(gene_data[1:20,(i+1)], gene_data[21:40,(i+1)], alternative = "two.sided")$p.value
}
which(pvalue <= 0.05)   # get the index

# c) 

Bon_genes <- vector()   # pre-allocation
for(i in 1:(cols-1)){
  p_value = t.test(gene_data[1:20,(i+1)], gene_data[21:40,(i+1)], alternative = "two.sided")$p.value
  adjusted_p = p.adjust(p_value, method = "bonferroni", n = cols)
  if(adjusted_p <= 0.05){
    # reject the null hypothesis that normal and cancer are the same
    # that's to say, the gene is associated with cancer
    Bon_genes <- c(Bon_genes, colnames(gene_data)[i+1]) 
  }
}
Bon_genes

# A better way: using which()
pvalue_bon = p.adjust(pvalue, method="bonferroni")
which(pvalue_bon <= 0.05)


# d) 

FDR_genes <- vector()   # pre-allocation
for(i in 1:(cols-1)){
  p_value = t.test(gene_data[1:20,(i+1)], gene_data[21:40,(i+1)], alternative = "two.sided")$p.value
  fdr_p = p.adjust(p_value, method = "BH", n = cols)
  if(fdr_p <= 0.05){
    # reject the null hypothesis that normal and cancer are the same
    # that's to say, the gene is associated with cancer
    FDR_genes <- c(FDR_genes, colnames(gene_data)[i+1]) 
  }
}
FDR_genes
# Wrong answer??????????????????????????????????

# Method 2: using which()
pvalue_fdr = p.adjust(pvalue, method = "BH")
which(pvalue_fdr <= 0.05)
