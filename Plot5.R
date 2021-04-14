# plot 5 function

plot5 = function(x){
  
  # then plot
  g = qplot(year, Emissions, data = x,
            main = "Vehicles' Emissions in Baltimore")
  
  ggsave(plot=g, filename="plot5.png")
  
}