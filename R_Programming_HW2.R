# Homework 2

# 1. Evaluate empirically that a dot which is randomly and evenly distributed across the square [-1,1]*[-1,1]
# would be distant from the coordinate center at no more than 1. Use 10,000 tosses.
n = 10000
a = runif(n, min = -1, max = 1)
b = runif(n, min = -1, max = 1)
square = cbind(a,b)
par(mfrow=c(1,2))
plot(square)

circle = a^2 + b^2 <= 1
cumsum_circle = cumsum(circle)
estimated_probability = cumsum_circle/1:n

geom = cbind(square, circle, cumsum_circle, estimated_probability)
probability = geom[n,"estimated_probability"] # in my case it equals 0.786

# 2. Using the results from the previous step give an assessment for pi value.
# probability for a dot to be in a circle = S_circle/ S_square = pi*r^2/(2r)^2 = pi/4 =>
# empirical value of pi equals 
pis = estimated_probability*4
values = cbind(geom, pis)
empirical_pi = values[n, "pis"]
empirical_pi # in my case it is 3.14

# 3. Create a plot to show a dependence of pi value on a number of tosses.
plot(pis, xlab = "Tosses", ylab = "Empirical pi values")
abline(h = pi, col = "green")
