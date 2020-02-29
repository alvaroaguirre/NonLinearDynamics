rm(list = ls())

library(animation)
source("delayplot_art.R")

x <- scan('sloth.dat')
nm <- 'art.gif'

delayplot_art(x, 210)

saveGIF(
  {
    for (i in 1:1023) 
      delayplot_art(x, i)
  },
  loop=TRUE,interval=0.05, movie.name = nm,
  ani.height = 500, ani.width = 500, ani.res = 100,
  clean = TRUE)
dev.off()


# Pride data
nm <- 'lorenz.gif'
y <- scan('pride.dat')
delayplot_art2(y, 1)
saveGIF(
  {
    for (i in 1:64) 
      delayplot_art2(y, i)
  },
  loop=TRUE,interval=0.1, movie.name = nm,
  clean = TRUE)
dev.off()

delayplot_art2(y, 12)


# Save inidivual frame in HD
png("lorenz_frame12.png", units="in", width=5, height=5, res=600)
delayplot_art2(y, 12)
dev.off()

png("unravel_369.png", units="in", width=5, height=5, res=600)
delayplot_art(x, 369)
dev.off()
