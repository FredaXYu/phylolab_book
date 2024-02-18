# lab07 Multiple tests

data = data.frame(group=c(rep(0,10),rep(1,10)), 
                  gene1 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=2.2, sd=1)), 
                  gene2 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=0.2, sd=1)), 
                  gene3 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=0.2, sd=1)), 
                  gene4 = c(rnorm(10, mean=0.2, sd=1), rnorm(10, mean=2.2, sd=1)))
data

# Bonferroni correction

numtest = 4
pvalue = 1:numtest
for(i in 1:numtest){
  # take the p.value from the t.test outcomes: 
  pvalue[i] = t.test(data[,i+1] ~ data[,1])$p.value
}

pvalue    # four p values

print("the Bonferroni adjusted pvalues")
pvalue*numtest

t.test(data[,i+1] ~ data[,1])
