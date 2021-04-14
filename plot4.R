# plot 4 function

plot4 = function(x){
  
  # transform matrix
  x = transform(x, year = factor(year))
  
  # first open png connection
  png(filename = "Plot4.png", width = 480, height = 480, units = "px")
  
  # then plot boxplots
  # I chose log boxplot since the normal plot takes too much time
  plot(Emissions ~ year, x, xlab = "year", ylab = "Emissions",
          main = "Coal combustion-related Emissions")

  # close connection      
  dev.off()
  
}