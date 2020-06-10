# Sierpiński triangle - A chaotic game

# Randomly set three points to serve as vertices: A, B, C
# Start from a random point in the convex hull of A, B and C
# In every iteration:
# 1) Get random number between 1 and 3
# 2) Depending on the outcome, move halfway towards point A, B, or C

library(uniformly)
library(ggplot2)
library(gganimate)

# Create three vertices
a <- c(runif(1), runif(1)) # Assign 1
b <- c(runif(1), runif(1)) # Assign 2
c <- c(runif(1), runif(1)) # Assign 3
vrtx <- rbind(a, b, c)

# Specify iterations
N = 10000
iter <- matrix(NA, nrow = N, ncol = 2)

# Initial condition
ic <- runif_in_triangle(1, a, b, c)
iter[1,] <- ic

# Create step function
one_step <- function(x0){
  rndm = sample(3,1)
  if (rndm == 1) {
    x1 = c(mean(c(x0[1], a[1])), mean(c(x0[2], a[2])))
  } else if (rndm == 2) {
    x1 = c(mean(c(x0[1], b[1])), mean(c(x0[2], b[2])))
  } else if (rndm == 3) {
    x1 = c(mean(c(x0[1], c[1])), mean(c(x0[2], c[2])))
  }
  return(x1)
}

# Populate iteration matrix
for (i in 2:N) {
  iter[i,] = one_step(iter[i-1,])
}

# Transform into data frame
iter <- as.data.frame(iter[5:dim(iter)[1],])
colnames(iter) <- c("x", "y")
iter$nrow <- seq.int(nrow(iter))

# Static plot
p <- ggplot(iter, aes(x = x, y = y, group = nrow)) + 
  geom_point(shape = 20, size = 0.5, colour = "#F6F7EB") +
  theme_bw() + 
  theme(axis.line=element_blank(),axis.text.x=element_blank(),
        axis.text.y=element_blank(),axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),legend.position="none",
        panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),plot.background=element_rect(fill = "#393E41"))

plot(p)

# Animate it!

anim <- p + 
  transition_reveal(iter$nrow)
anim  

anim_save("sierpinski.gif")
