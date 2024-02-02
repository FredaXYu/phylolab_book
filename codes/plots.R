# plots

par(mfrow=c(2,1))
curve(dnorm(x), from=-4, to=4, main="Standard Normal PDF", col="blue")
curve(pnorm(x), from=-4, to=4, main="Standard Normal CDF", col="blue")

print("=====================")

par(mfrow=c(2,1))
curve(dgamma(x,shape=2), 0, 10, main="Gamma PDF",col="blue")
curve(pgamma(x,shape=2), 0, 10, main="Gamma CDF",col="blue")

print("=====================")



