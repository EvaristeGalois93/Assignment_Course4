# plot 3 function

plot3 = function(x){
  
  # then plot
  g = qplot(year, Emissions, data = x, facets = .~type,
        main = "Emissions in Baltimore by type of source")

  ggsave(plot=g, filename="plot3.png")
  
}