# Middle Thirds map and generation of the Cantor set

# Define the map
delay_middle_third <- function(x) {
  if (is.na(x)) {
    return(NA)
  } else if (x < 0.5) {
    a = 3*x
    if (a <= 1) {
      return(a)
    } else {
      return(NA)
    }
  } else {
    b = 3*(1-x)
    if (b <= 1) {
      return(b)
    } else {
      return(NA)
    }
  }
}

# Layers of Cantor set
layers <- 10

# Sequence of initial conditions
initial_cond <- seq(0,1,0.0001) 

# Matrix to store iterations
dyn <- matrix(NA, ncol = length(initial_cond), nrow = layers)
dyn[1,] <- initial_cond
for (i in 2:layers) {
  for (j in 1:length(initial_cond)) {
    dyn[i,j] = delay_middle_third(dyn[i-1,j])
  }
}

# Keep non-NAs and assign them a numeric value to plot
cantor <- !is.na(dyn)
cantor[cantor == FALSE] <- NA
for (i in 1:layers) {
  cantor[i,] = ((layers+1)-i)*0.1*cantor[i,]
}

# Plot
plot(initial_cond, cantor[1,], type = "l", ylim = c(0,1.2), 
     main = "Cantor set generated by middle-thirds map.", 
     sub = paste("Layers:", layers), xlab = "Initial condition", ylab = "Cantor layers")
for(i in 2:layers) {
  lines(initial_cond, cantor[i,])
}

