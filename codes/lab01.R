# Link: https://book.phylolab.net/binf8441/lab1.html
# Created time: 13 Jan 2024

x <- 3 
x
x <- 2:5 
x
x[2]

x <- "I am a student" 
x
x[3]

x <- matrix(1:12, nrow=3, ncol=4)
x
x[1,2]
x[1,]  # the first row
x[,2]  # the second column
x[3, 3] <- 4.5   
x   # the entire third column will be shown as float! 

x <- list()    # list can combine different data types
x[[1]] = "I am a student"   # double brackets: the first element in the list
x[[2]] = 123   # the second element in the list
x

x=1:3
x*4 
exp(x) 
log(x) 
subset(x, x>=2)  # subset is useful! 

x=matrix(1,3,3) 
y=matrix(2,3,3) 
x %*% y 
x * y 

d = runif(10)   # generate 10 random numbers from [0, 1]
d

x= rep("",3)   # repeat the empty string for three times
x[1]  = "I am a graduate student"
x[2] = "who am I?" 
x[3] = "who are you?" 

nchar(x[1])   # the number of characters
substring(x[1],1,3)   # cut a substring
strsplit(x[2], split=" ")   # string split based on spaces
paste("a","hello",sep="") 
grep("who",x) 
gsub("graduate","undergraduate",x) 
toupper(x) 
tolower(x)

data=read.csv("https://book.phylolab.net/binf8441/data/lab1_data.csv") 
data
data[,1] = data[,1] * 10 
write.csv(data,"../results/newdata.csv", row.names=F) 

# flow control: 
x=1 
y=2 
x==y 
x != y
(x==1) || (y==2) 
(x==0) && (y==2) 

# loops: 
x = runif(10, min=0, max=1) 
x

sum=0 
for(i in 1:10){
  sum=sum+x[i]
} 
sum 

x = 1:10
product = 1 
for(i in 1:10){
  product=product*x[i] 
}
product 


x = c(5,3,7,2)
n = length(x) 
for(i in 1:(n-1)){ 
  for(j in i:n){ 
    if(x[i]>x[j]){ 
      y=x[i] 
      x[i]=x[j] 
      x[j]=y 
    } 
  } 
} 
x

my_sum = function(x){ 
  n = length(x)
  sum=0 
  for(i in 1:n){
    sum = sum + x[i] 
  } 
  sum 
}

x = 1:50
my_sum(x)
