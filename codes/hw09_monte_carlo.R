# homework 09 monte carlo

# 1. 
# uniform distribution
x = runif(10000,1,2)
g = log(x)*exp(-x^2) 
mean(g) #0.03260937 

x = runif(10000000,-1000,1000) 
g = 2000*log(abs(x)+1)*exp(-x^2)
mean(g)

# 2. 
nsim = 10000 
estimator = 1:nsim 
for(i in 1:nsim){ 
  x = rchisq(100, df=3) 
  estimator[i] = mean(x) 
} 
var(estimator) #0.059 


# 3. 


