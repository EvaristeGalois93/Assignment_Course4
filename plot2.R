# plot 2 function

plot2 = function(x){
  
  # transform data-frame
  x = transform(x, year = factor(year))
  
  # first open png connection
  png(filename = "Plot2.png", width = 480, height = 480, units = "px")
  
  # then plot boxplots
  # I chose log boxplot since the normal plot takes too much time
  boxplot(log10(Emissions) ~ year, x, xlab = "year", ylab = "log_Emissions",
          main = "Emissions in Baltimore")
  
  # close connection      
  dev.off()
  
}