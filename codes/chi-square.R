# chi-square test

M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
M

dimnames(M) <- list(gender = c("F", "M"),
                    party = c("Democrat","Independent", "Republican"))
M

(Xsq <- chisq.test(M))  # Prints test summary
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null
Xsq$residuals  # Pearson residuals
Xsq$stdres     # standardized residuals

#==============================
# https://blog.csdn.net/ForRubyDownLoad/article/details/50776526?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522170799828916800192235521%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=170799828916800192235521&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-1-50776526-null-null.142^v99^pc_search_result_base1&utm_term=chisq.test&spm=1018.2226.3001.4187
library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)　　　
chisq.test(mytable)

