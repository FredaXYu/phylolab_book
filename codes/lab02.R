# lab 02  https://book.phylolab.net/binf8441/lab2.html

sample(x=1:3, size = 1, replace=FALSE, prob = c(1/3,1/3,1/3))

sample(x=1:3, size = 2, replace=FALSE, prob = c(1/3,1/3,1/3))

sample(x=1:3, size = 2, replace=TRUE, prob = c(1/3,1/3,1/3))

outcome = sample(x=c(0,1), size = 5, replace=TRUE, prob=rep(0.5,2))
outcome
print(paste("The count of heads is", sum(outcome)))

#----------------------

nsim = 1000
result = rep(0,nsim)   # initialisation
for(i in 1:nsim){
  outcome = sample(x=c(0,1), size = 5, replace=TRUE, prob=rep(0.5,2))
  result[i] = sum(outcome)   # how many 1 in the five numbers
}
table(result)
barplot(table(result))

#-----
# Alternative, we may simulate random numbers from the binomial distribution with
# n = 5 and p = 0.5
result = rbinom(1000, size=5, p=0.5)
table(result)
barplot(table(result))

#=================================

seq = "AGCCCGGGTTTACCCTTGGGAAAATTGCCCCAGTGACCCCT"
x = unlist(strsplit(seq,split=""))
print(x)
print(typeof(x))

#proportions of A, C, G, T
sum(x=='A')/length(x)
sum(x=='C')/length(x)
sum(x=='G')/length(x)
sum(x=='T')/length(x)

#select a nucleotide
position=sample(1:length(x),size=1)   # select the index
x[position]    # use index to select the nucleotide

#sample 10 nucleotides without replacement
position = sample(1:length(x),size=10)
data = x[position]   # here omit the for loop
data
print("the proportions of A, C, G, T in the sample of 10 nucleotides")
sum(data=='A')/10
sum(data=='C')/10
sum(data=='G')/10
sum(data=='T')/10

#sample 100 nucleotides with replacement
position = sample(1:length(x),size=100,replace=TRUE)
data = x[position]
print("the proportions of A, C, G, T in the sample of 100 nucleotides")
sum(data=='A')/100
sum(data=='C')/100
sum(data=='G')/100
sum(data=='T')/100

#==============================
# binomial
rbinom(n=10, size=5, prob=0.5)
# poisson
rpois(n=10, lambda=3.5)

#
#

# We may generate a random number from an interval [a, b] using the R function runif().

runif(4, min=0, max=2)

data = rnorm(10, mean=4.5, sd=sqrt(2))
data
print(paste("the sample average:",mean(data)))


#============================

# The R function scan() can read text files into R. FASTA format

x = scan("https://book.phylolab.net/binf8441/data/lab2_test.fasta", what="character",sep="\n")

#count the number of >
index = grep(">",x)   # find

index
typeof(index)

nseq = length(index)   # how many > 
print(paste("the number of sequences:",nseq))

#get sequences
seq=rep("",length(index))
for(i in 1:length(index)){
  if(i < length(index)){
    # the sequence is the character after > and before the next > 
    seq[i] = paste(x[(index[i]+1):(index[i+1]-1)],collapse="",sep="")
  }else{
    # the last one, read through all after >
    seq[i] = paste(x[(index[i]+1):length(x)],collapse="",sep="")
  }
}

print(paste(seq[2], typeof(seq)))

#sequence length
seqlength = nchar(seq[1])
print(paste("the sequence length is",seqlength))

#proportions
prop = matrix(0,nrow=nseq,ncol=4)  
row.names(prop) = paste("seq",1:nseq,sep="")   # seq1   seq2    seq3   ...
for(i in 1:nseq){
  s = unlist(strsplit(seq[i],split=""))
  prop[i,] = c(sum(s=='a'), sum(s=='c'), sum(s=='g'), sum(s=='t'))/seqlength
}
print("the proportions of a, c, g, t in each sequence")
prop






