# homework 06 hypothesis testing
# 15 Feb 2024

#=================================================================
# breast-cancer.csv
# The dataset includes three variables – 
# tumor size, breast (left or right), and class (recurrent or no-recurrent).

data <- read.csv("../data/breast-cancer.csv", header=TRUE)   
data

typeof(data)   # list

# Null hypothesis: 
# The tumor size is the same between the left and the right breast. 
# Alternative hypothesis: 
# The tumor size is different between the left and the right breast.
# Test statistic: 
# Using two sample two sided T test - t=(x1 bar - x2 bar)/sqrt(s1 square / n1 + s2 square / n2)

x = data[,1]
x[1]
a = rep(0, length(x))  # initialisation of a vector
b = rep(0, length(x))  # initialisation of a vector

for(i in 1:length(x)){
  # delete the quotation marks, if find: 
  x_no_quotation = gsub("'", "", x[i])
  # string split based on - 
  x_num = strsplit(x_no_quotation, split="-")
  # store the two numbers into different vectors
  w = x_num[[1]][1]
  v = x_num[[1]][2]
  # translate into numeric type: 
  a[i] = as.numeric(w)
  b[i] = as.numeric(v)
}

mean_ab = rep(0, length(x))
for(i in 1:length(x)){
  mean_ab[i] = (a[i] + b[i]) / 2
}

left = mean_ab[data[,2]=="left"]     # very useful!!!!!!!
right = mean_ab[data[,2]=="right"]

t.test(left, right, alternative = "two.sided")

# p-value = 0.4043
# 95 percent confidence interval:
# -3.518883  1.422457

# conclusion: 
# The left and right are not significantly different from each other. 
# Because p-value > 0.05, we cannot reject the null hypothesis. There is no evidence in the data 
# to indicate that the tumor size of the left breast is different from the tumor size of
# the right breast. 

#=================================================================

recurrent = mean_ab[data[,3]=="recurrence-events"]     # very useful!!!!!!!
no_recurrent = mean_ab[data[,3]=="no-recurrence-events"]
t.test(recurrent, no_recurrent, alternative = "two.sided")

# conclusion: 
# The recurrent and no-recurrent are significantly different from each other. 
# Because p-value < 0.05, we reject the null hypothesis
# and conclude that the tumor size of the recurrent class is significantly different from
# the tumor size of the no-recurrent class. 

#=================================================================


