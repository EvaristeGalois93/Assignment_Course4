# plot 6 function

plot6 = function(x){
  
  label_names = c("Baltimore", "LA")
  # then plot
  g = qplot(year, Emissions, data = x, facets = .~fips,
            main = "Vehicle Emissions: Baltimore vs LA")

  ggsave(plot=g, filename="plot6.png")
  
}