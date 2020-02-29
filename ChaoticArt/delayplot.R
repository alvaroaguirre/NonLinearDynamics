library(scales)

delayplot_art<-function(x,d)
{
  par(bg = "#14213D")
  plot(x[1:(length(x)-d)],x[(1+d):length(x)], 
       bty="n", xaxt = 'n', yaxt = 'n', xlab="", ylab="",
       col = "#FCA311")
}



delayplot_art2<-function(x,d)
{
  par(bg = "#2C302E")
  plot(x[1:(length(x)-d)],x[(1+d):length(x)], 
       bty="n", xaxt = 'n', yaxt = 'n', xlab="", ylab="",
       col = alpha("#D8D78F", alpha = 0.1), pch = 19)
}

