# Practice 1 (11.09.21)

# 1. Generate two Poisson random sets consisting of 200 numbers: the first set w/ mean = 0.5, the second one - w/ mean = 3. /rpois
first_set = rpois(200, 0.5)
first_set
second_set = rpois(200, 3)
second_set

# 2. Create plots with a(-) distribution(-s) of both two sets.
par(mfrow=c(2,2))
hist(first_set) # I have chosen histogram (freq. distribution) to analyze how often each value in a set of data occurs.
hist(second_set, col = "green")
plot(density(first_set), main = "Distribution density") # As it was discussed in Lecture 1, density f. is a good choice to show some distr. on a one plot at once.
lines(density(second_set), col = "green")
legend(x = "topright", legend = c("first_set", "second_set"), lty = c(1, 1), col = c("black", "green"), lwd = 2)  

# 3. Find out whether a linear dependence between these two sets exists.
sets = cbind(first_set, second_set)
plot(sets[,1],sets[,2], pch = 8, col = "grey", main = "Correlation plot", xlab = "first_set", ylab = "second_set") # plot(sets)
lm(sets[,2] ~ sets[,1])
abline(lm(sets[,2] ~ sets[,1]), col = "blue",)
text(paste("Correlation:", round(cor(sets[,1], sets[,2]), 2)), x = 2, y = 7) # x n y may be outside due to random sets formation. That is why:
cor.test(sets[,1],sets[,2]) # the more abs. value of cor. [-1,1], the stronger dependence between the sets.

# 4. Save two datasets in txt.
write.table(sets,'sets.txt')
