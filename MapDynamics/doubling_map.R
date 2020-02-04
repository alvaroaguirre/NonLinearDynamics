# Doubling map dynamics
# F(xt+1) = 2 xt mod 1

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
plot(time, double_map, sub = paste("Iterations to converge:", which.min(test1)),
     xlab = "Iterations", ylab = "Xt", main = paste("Double map with initial condition X0:", x0),
     xlim = c(0,100), type = "l")

# In a digital computer, the trajectory for any x0~U[0,1] will converge to 0 in a short number of steps
# This is NOT mathematically correct
# Consider x0 = 1/3, you can easily see that the map will infinitely move between 1/3 and 2/3 in a closed 2-period loop
# Since the computer works with finite-memory floating-points, it cannot represent numbers like 1/3 or pi
# The map ran on an irrational like pi/4 should behave chaotically, and not converge either

# Then what does the computer give us?
# Let's see what happens to any initial condition between 0 and 1 with step 10e-5
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
     main = "Convergence of doubling map to zero", xlab = "Starting point",
     ylab = "Iterations", sub = "Doubling map: F(xt+1) = 2 xt mod 1") 


