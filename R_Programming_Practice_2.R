# Practice 2 (18.09.21)

# 1. Generate one random value /rnorm.
x = rnorm(1)
x

# 2. Count sin of the value by Taylor Series.
k = c(0:34)
f = (-1)^(k)*x^(2*k+1)/factorial(2*k+1)
cumsum(f)
sin_x = cumsum(f)

# 3. Check series convergence by illustration of it.
y = abs(sin_x-sin(x)) # abs value of error.
y
plot(k, y, log='y', type = 'l') # the higher k the lower y (the lower error) -> it means the better approximation (~ convergence).

# Conclusion: log y decreases -> y decreases [log y ~ y] -> Taylor series convergence [to the sine f.] is proved.