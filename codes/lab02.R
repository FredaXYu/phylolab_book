# lab 02  https://book.phylolab.net/binf8441/lab2.html

sample(x=1:3, size = 1, replace=FALSE, prob = c(1/3,1/3,1/3))

sample(x=1:3, size = 2, replace=FALSE, prob = c(1/3,1/3,1/3))

sample(x=1:3, size = 2, replace=TRUE, prob = c(1/3,1/3,1/3))

outcome = sample(x=c(0,1), size = 5, replace=TRUE, prob=rep(0.5,2))
outcome
print(paste("The count of heads is", sum(outcome)))

