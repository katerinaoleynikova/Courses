# Homework 1
# Deadline 15 September at 23:59

# 1. Read the data (hw1.txt) that contain the three colum. w gene expression level (each gene - each column) at dif.condit.
data <- read.table("hw1.txt")
data

# 2.1 Find out whether there are any gene expression dependencies in any pair of genes.
par(mfrow=c(3,1))
d1 <- data[, c("CPY14")]
d2 <- data[, c("RMD4")]
d3 <- data[, c("htVWQ")]
set_12 = cbind(d1,d2)
plot(set_12[,1],set_12[,2], col = "blue", main = "Correlation plot CPY14-RMD4 genes", xlab = "CPY14", ylab = "RMD4")
lm(set_12[,2] ~ set_12[,1])
abline(lm(set_12[,2] ~ set_12[,1]))
text(paste("Correlation:", round(cor(set_12[,1], set_12[,2]), 2)), x = 50, y = 220)
cor.test(set_12[,1],set_12[,2]) # the more abs. value of cor. [-1,1], the stronger dependence between the sets.
# 0.83 - strong correlation -> there is direct (positive) gene expression dependence in gene pair CPY14-RMD4.
set_23 = cbind(d2,d3)
plot(set_23[,1],set_23[,2], col = "red", main = "Correlation plot RMD4-htVWQ genes", xlab = "RMD4", ylab = "htVWQ")
lm(set_23[,2] ~ set_23[,1])
abline(lm(set_23[,2] ~ set_23[,1]))
text(paste("Correlation:", round(cor(set_23[,1], set_23[,2]), 2)), x = 300, y = 275)
cor.test(set_23[,1],set_23[,2])
# -0.13 - weak negative correlation -> there is negative gene expression dependence in gene pair RMD4-htVWQ.
set_13 = cbind(d1,d3)
plot(set_13[,1],set_13[,2], col = "green", main = "Correlation plot CPY14-htVWQ genes", xlab = "CPY14", ylab = "htVWQ")
lm(set_13[,2] ~ set_13[,1])
abline(lm(set_13[,2] ~ set_13[,1]))
text(paste("Correlation:", round(cor(set_13[,1], set_13[,2]), 2)), x = 160, y = 334)
cor.test(set_13[,1],set_13[,2])
# -0.13 - weak negative correlation -> there is negative gene expression dependence in gene pair CPY14-htVWQ.

# 2.2 Find out whether there are any gene expression differences in any pair of genes.
mean(d1)
mean(d2)
mean(d3)
t.test(set_12[,1],set_12[,2])
t.test(set_23[,1],set_23[,2])
t.test(set_13[,1],set_13[,2])
t.test(set_12[,1],set_12[,2])$p.value # 0.001649145 < 0.05 -> null hypoth. (dif. in means equals 0) is rejected. -> alternative hypoth. (dif. in means is not 0 -> there is dif. in means)
t.test(set_23[,1],set_23[,2])$p.value # 0.000168951 < 0.05 -> null hypoth. (dif. in means equals 0) is rejected. -> alternative hypoth. (dif. in means is not 0 -> there is dif. in means)
t.test(set_13[,1],set_13[,2])$p.value # 0.239674 > 0.05 -> null hypoth. (dif. in means equals 0) is accepted.

# Conclusion 1: CPY14-RMD4 have the strong dependence only.
# Conclusion 2: There are gene expression differences between CPY14-RMD4 and RMD4-htVWQ gene pairs.
