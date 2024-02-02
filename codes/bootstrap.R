# Ch 11 bootstrap

# Parametric bootstrap

nbootstrap = 1000
ave = 1:nbootstrap

for(i in 1:nbootstrap){
  x = rnorm(10, mean=129.81, sd=sqrt(6.49))
  ave[i] = mean(x)
}

print(paste("the variance of the sample average is",var(ave)))

#------------------

new = c(42.1 , 41.3 , 42.4 , 43.2 , 41.8 , 42.7 , 43.8 , 42.5 , 43.1 , 44.0)
old = c(41.0 , 41.8 , 42.8 , 42.3 , 42.7 , 43.6 , 43.3 , 43.5 , 41.7 , 44.1)

# estimate mu and variance
mu = mean(c(new,old))
va = var(c(new,old))

print(paste("the estimate of mu is", mu))
print(paste("the estimate of variance is", va))

# approximate the null distribution of the test statistic t
teststat = mean(new)-mean(old)
nbootstrap = 1000
t_bootstrap = 1:nbootstrap

for(i in 1:nbootstrap){
  x = rnorm(10, mean = mu, sd = sqrt(va))
  y = rnorm(10, mean = mu, sd = sqrt(va))
  t_bootstrap[i] = mean(x)-mean(y)
}

# find the 2.5% and 97.5% quantile
critical_value = quantile(t_bootstrap, p=c(0.025,0.975))
print(paste("the 2.5% quantile:", critical_value[1]))
print(paste("the 97.5% quantile:",critical_value[2]))
print(paste("test statistic:",teststat))

if(teststat < critical_value[1] | teststat>critical_value[2]){
  print("We reject the null hypothesis")
}else{
  print("We cannot reject the null hypothesis")
}

print("=====================================")

#====================================

# non-parametric bootstrap

data = c(125.2028,128.9885,131.3598,126.8757, 128.8428,128.8664,133.3717,131.3412,132.6467,130.6033)
nbootstrap = 1000
ave = 1:nbootstrap

for(i in 1:nbootstrap){
  x = sample(data, 10, replace=TRUE)
  ave[i] = mean(x)
}

print(paste("the variance of the sample average is",var(ave)))

#------------------------

new = c(42.1 , 41.3 , 42.4 , 43.2 , 41.8 , 42.7 , 43.8 , 42.5 , 43.1 , 44.0)
old = c(41.0 , 41.8 , 42.8 , 42.3 , 42.7 , 43.6 , 43.3 , 43.5 , 41.7 , 44.1)

all = c(new,old)

# approximate the null distribution of the test statistic t
teststat = mean(new)-mean(old)
nbootstrap = 1000
t_bootstrap = 1:nbootstrap

for(i in 1:nbootstrap){
  x = sample(all, 10, replace=TRUE)
  y = sample(all, 10, replace=TRUE)
  t_bootstrap[i] = mean(x)-mean(y)
}

# find the 2.5% and 97.5% quantile
critical_value = quantile(t_bootstrap, p=c(0.025,0.975))
print(paste("the 2.5% quantile:", critical_value[1]))
print(paste("the 97.5% quantile:",critical_value[2]))
print(paste("test statistic:",teststat))

if(teststat < critical_value[1] | teststat>critical_value[2]){
  print("We reject the null hypothesis")
}else{
  print("We cannot reject the null hypothesis")
}



