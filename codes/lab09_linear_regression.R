# lab09 linear regressions
# https://book.phylolab.net/binf8441/lab9.html

x = rnorm(100, mean=3, sd=1)    # random numbers from normal distribution
error = rnorm(100, mean=0, sd=2)  # random numbers from normal distribution
y = 2.1+1.25*x+error

data=data.frame(cbind(x,y))

data

result = lm(data$y~data$x)

result

summary(result)

#----------
par(mfrow=c(2,2))   # four plots

plot(x,y,pch=16)
abline(result,col="brown")  # the fitness line

plot(result$residuals)
abline(a=0,b=0, col="brown")  # the fitness line

hist(result$residuals)

qqnorm(result$residuals, pch=16)
qqline(result$residuals, col = "brown")  # the fitness line

#--------------------

shapiro.test(result$residuals)

x_new = 0.7
y_new = result$coefficients[1]+result$coefficients[2]*x_new
y_new

#===========================
# Fitting quadratic relationships
x = rnorm(100, mean=0, sd=1)
y = 2.1+1.25*x^2+error
data=data.frame(cbind(x,y))
result = lm(data$y~data$x)
summary(result)

#==============================

# Multiple linear regression

x1 = rnorm(100, mean=3, sd=1)
x2 = rnorm(100, mean=2.5, sd=2.1)

error = rnorm(100, mean=0, sd=2)
y = 2.1 + 1.25*x1 - 3*x2 + error

data=data.frame(cbind(y,x1,x2))
plot(data)

#-----------

result = lm(y~x1+x2,data=data)
summary(result)

#-------------
# residual plot: 

par(mfrow=c(2,2))
plot(result$residuals)
abline(a=0,b=0, col="red")
hist(result$residuals)
qqnorm(result$residuals, pch=16)
qqline(result$residuals, col = "brown")

#--------------
# Checking the normality assumption
shapiro.test(result$residuals)




