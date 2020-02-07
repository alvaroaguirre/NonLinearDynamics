# Doubling map dynamics
# Xt+1 = 2 Xt mod 1

# Define the map
doubling_map <- function(ic, t) {
  x = rep(NA, t)
  x[1] = ic
  for (i in 2:t) {
    x[i] = 2*x[i-1] %% 1
  }
  return(x)
}

# Plot dynamics
t <- 1024 # Number of iterations
time <- seq(t) # Sequence to use as time index
x0 <- runif(1) # Initial condition, drawn from a Uniform(0,1)
double_map <- doubling_map(x0, t) # Call the map
plot(time, double_map, sub = paste("Iterations to converge:", which.min(double_map)),
     xlab = "Iterations", ylab = "Xt", main = paste("Double map with initial condition X0:", x0),
     xlim = c(0,100), type = "l")
points(time, double_map, pch = 20, cex=0.75)

# In a digital computer, the trajectory for any x0~U[0,1] will converge to 0 in a short number of steps
# This is NOT mathematically correct
# Consider x0 = 1/3, you can easily see that the map will infinitely move between 1/3 and 2/3 in a closed 2-period loop
# Since the computer works with finite-memory floating-points, it cannot represent numbers like 1/3 or pi
# The map ran on an irrational like pi/4 should behave chaotically, and not converge either

# Then what does the computer give us?
# Let's see what happens to any initial condition between 0 and 1 with step 10e-4
initial_cond <- seq(0,1,0.0001)

# Does it converge to zero?
converge_to_zero <- function(ic) {
  x = doubling_map(ic, 1024)
  if (sum(match(x,0), na.rm=TRUE) > 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Apply function to all initial conditions
zero_convergence <- unlist(lapply(initial_cond, converge_to_zero))
# Notice all initial values converge to zero
sum(zero_convergence)/length(zero_convergence) 

# How long does it take to converge?
convergence <- rep(NA, length(initial_cond))
for (i in 1:length(initial_cond)) {
  convergence[i] = which.min(doubling_map(initial_cond[i], t))
}
plot(initial_cond, convergence, cex=0.5,
     main = "Convergence of digital doubling map to zero", xlab = "Initial condition",
     ylab = "Iterations", sub = "Vertical lines at inverse of powers of 2") 


# Further analysis based on comments by Prof. Leonard Smith -----------------------

# Where does the max number of iterations decrease?
powers <- rep(NA, 5)
for (i in 1:length(powers)) {
  powers[i] = 1/(2^i)
}
abline(v = powers)

# It happens at powers of two! Interesting...
# Math explanation:
# Note that in binary 1/2 = 0.1, 1/4 = 0.01, 1/8 = 0.001, 1/16 = 0.0001
# Consider 0.51 -> 0.10000010, 0.49 -> 0.01111101
# 0.24 -> 0.00111101, 0.26 -> 0.01000010
# 0.124 -> 0.00011111, 0.126 -> 0.00100000
# You flip between zeros and ones after i 0s, where i is the power of two that generates middle point

# Can you represent 1/3 in binary? No binary representation!

# Consider going from 1 to 0. Every time you cross a vertical line, you add a zero to the binary representation
# This means you need one more doubling! Hence the increase in iterations needed.

# Repeat the graph with a pseudo random number generator

initial_cond <- runif(10000)
zero_convergence <- unlist(lapply(initial_cond, converge_to_zero))
sum(zero_convergence)/length(zero_convergence) 

# How long does it take to converge?
convergence <- rep(NA, length(initial_cond))
for (i in 1:length(initial_cond)) {
  convergence[i] = which.min(doubling_map(initial_cond[i], t)[2:t])
}
plot(initial_cond, convergence, cex=0.5,
     main = "Convergence of digital doubling map to zero", xlab = "Initial condition",
     ylab = "Iterations", sub = "Vertical lines at inverse of powers of 2") 

abline(v = powers)


