# hw08

# 1. 

data = read.table("../data/poverty.txt", 
                  sep="\t", header=T)
data

data[,2:3]   # the 2 and 3 columns

plot(data[,3] ~ data[,2], xlab='poverty', ylab='birth rate', 
      pch = 19, col = "brown")
abline(lm(data[,3] ~ data[,2], data=data), col='red')  # the regression line

#-----------------
result = lm(data[,3] ~ data[,2], data=data)
summary(result)   # use 'summary' to see the whole explanation 
#-----------------

# The estimate 1.3733 of the coefficient 𝑏 is significantly greater than 0 with the pvalue
# < 0.01, indicating that the birth rate and the poverty rate are positively correlated, i.e.,
# the birth rate increases as the poverty rate increases.

# We conclude that the birth rate and the poverty rate are positively correlated which
# can be modeled by a linear regression 𝑌 = 4.26 + 1.37𝑋 where Y is the birth rate
# and X is the poverty rate. We can use this linear equation to predict the birth rate for a
# new poverty rate. 

#==============================================
# 2. 
x = c(0.1, 0.2, 0.45, 0.13, 0.08, 0.52, 0.34, 1.04, 0.93, 0.03)
err = rnorm(10, mean=0, sd=sqrt(1.4))
a = 3
b = 0
y = a + b * x + err
y
plot(y ~ x, xlab='x', ylab='y', 
     pch = 19, col = "brown")
abline(lm(y~x, data=data), col='red')  # the regression line

result = lm(y~x)
summary(result)

# H0: b=0    H1: b!=0
# p-value = 0.888 > 0.05
# We 
