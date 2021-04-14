# plot 1 function

plot1 = function(x){
  
  # transform matrix
  x = transform(x, year = factor(year))
  
  # first open png connection
  png(filename = "Plot1.png", width = 480, height = 480, units = "px")

  # then plot boxplots
  # I chose log boxplot since the normal plot takes too much time
  boxplot(log10(Emissions) ~ year, x, xlab = "year", ylab = "log_Emissions",
          main = "Total Emissions")
  
  # close connection      
  dev.off()
  
}