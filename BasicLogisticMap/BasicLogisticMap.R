############# Basic Logistic Map ###############

# We will play around with the logistic map: xt+1 = axt(1-xt)
# Let's build some graphics to study the dynamics of the system with different initial conditions and parameter values

##### Compile functions
source('logistic.R') # Function that creates the vector of states of the system under the map
source('delayplot.R') # The Delay Plot shows where xt+1 is going to be based on xt
source('autoCC.R') # Autocorrelation function for up to 50 lags

# Initial condition of a = 3.7 and x0 in Unif(0,1)

a=3.7 
x0 <- runif(1) 
x=logistic(x0,a,1024) ## generate data
plot(x)
delayplot(x,1) ## delay plot with lag 1
autoCC(x,50) ## find the autocorrelation up to lag 50
plot(autoCC(x,50)) #plot the autocorrelation up to lag 50
hist(x) ## make a histogram

# Let's build a function to get the four graphs 
logist <- function(x0, a) {
  x = logistic(x0, a, 1024)
  par(mfrow = c(2, 2))
  plot(x, main="Time series")
  delayplot(x,1)
  plot(autoCC(x,50), main="Autocorrelation up to 50 lags")
  hist(x)
  par(mfrow=c(1,1))
}

# Now let's play around with different values of x0 and a:

# 1. x0 < 0 and a in (0,4)
x0 <- runif(1, -1, 0)
a <-runif(1,0,4)
logist(x0,a)

# 2. x0 in (0,1) and a > 0
x0 <- runif(1)
a <-runif(1,0,4)
logist(x0,a)

# 3. x0 in (0,1) and a < 0
x0 <- runif(1)
a <-runif(1,-1,0)
logist(x0,a)

# 4. x0 in (0,1) and a in (0,1)
x0 <- runif(1)
a <-runif(1,0,1)
logist(x0,a)

# 5. x0 in (0,1) and a in (1,3)
x0 <- runif(1)
a <-runif(1,1,3)
logist(x0,a)

# 6. x0 in (0,1) and a = 1 + sqrt(6)
x0 <- runif(1)
a <- 1 + sqrt(6)
logist(x0,a)

# 7. x0 in (0,1) and a = 3.5685
x0 <- runif(1)
a <- 3.5685
logist(x0,a)

# 8. x0 in (0,1) and a = 4
x0 <- runif(1)
a <- 4
logist(x0,a)


# Iterations until separated 

# For this part, let's consider a initial condition x0 and a perturbation epsilon.
# We want to see, based on the size of epsilon, how many iterations does it take for the states of the system to be separated by some positive distance (here 0.5)

# Function takes x0: initial value, a: parameter, epsilon: maximum distance of perturbation
# separated_by: the distance between states, t: number of iterations after 1024

iterations_separate <- function(x0, a, epsilon, separated_by = 0.5, t = 1024) {
  e = runif(1,0,epsilon)
  x = logistic(x0, a, t)
  xe = x0 + e
  x_e = logistic(xe, a, t)
  dif = abs(x - xe)
  if (max(dif) < 0.5) {
    return(cat("No separation in", t, "iterations"))
  } else {
    return(min(which(dif >= 0.5)))
  }
}

iterations_separate(x0 = 0.01, a = 3, epsilon = 0.001, t=2048)
