
# unlist

l.ex <- list(a = list(1:5, LETTERS[1:5]), b = "Z", c = NA)
n <- unlist(l.ex, recursive = FALSE)
typeof(n)
typeof(n[1])
typeof(n[[1]])
unlist(l.ex, recursive = TRUE)

i <- '34-68'
# delete the ''
i_no_quotation = gsub("'", "", i)
i_no_quotation
# string split based on - 
i_num = strsplit(i_no_quotation, split="-")
i_num
typeof(i_num)
typeof(i_num[1])
typeof(i_num[[1]])
i_num[[1]]
i_num[[1]][1]
i_num[[1]][2]
typeof(i_num[[1]][1])
# store the two numbers into different vectors
a = i_num[[1]][1]
b = i_num[[1]][2]
a
b
# translate into numeric type: 
a = as.numeric(a)
b = as.numeric(b)
a
b