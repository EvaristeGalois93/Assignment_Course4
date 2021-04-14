# The overall goal of this assignment is to explore the National Emissions Inventory 
# database and see what it say about fine particulate matter pollution in the 
# United states over the 10-year period 1999-2008. You may use any R package you 
# want to support your analysis.

library(ggplot2)
setwd("C:/Users/luca-/Desktop/Data_Science/Course4_ExploratoryDataAnalysis/Working_Material/Assignment")

unzip("./exdata_data_NEI_data.zip", exdir = "./data")

NEI = readRDS("./data/summarySCC_PM25.rds")
SCC = readRDS("./data/Source_Classification_Code.rds")

NEI99 = subset(NEI, year == 1999)
NEI02 = subset(NEI, year == 2002)
NEI05 = subset(NEI, year == 2005)
NEI08 = subset(NEI, year == 2008)

# =========================================================================
# Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.
# =========================================================================
source("./plot1.R")
plot1(NEI)

# =========================================================================
# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# fips == "24510" from 1999 to 2008? Use the base plotting system to make a plot 
# answering this question.
# =========================================================================
Baltimore = subset(NEI, fips == "24510")

source("./plot2.R")
plot2(Baltimore)

# =========================================================================
# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# =========================================================================
source("./plot3.R")
plot3(Baltimore)

# =========================================================================
# Question 4
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?
# =========================================================================

# first look for coal combustion-related sources in SCC
coal_source = SCC[grepl("Coal", SCC$EI.Sector), ]

# then filter NEI per SCC code
coal_total = subset(NEI, SCC %in% coal_source$SCC)

source("./plot4.R")
plot4(coal_total)

# =========================================================================
# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# =========================================================================

# first look for moto vehicles combustion-related sources in SCC
vehicles = SCC[grepl("Vehicle", SCC$EI.Sector), ]

# then filter NEI per SCC code
Baltimore_vehic = subset(Baltimore, SCC %in% vehicles$SCC)

source("./plot5.R")
plot5(Baltimore_vehic)

# =========================================================================
# Question 5
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California fips == "06037". 
# Which city has seen greater changes over time in motor vehicle emissions?
# =========================================================================

LA = subset(NEI, fips == "06037")
LA_vehic = subset(LA, SCC %in% vehicles$SCC)

LA_vehic$fips = "LA"
Baltimore_vehic$fips = "Baltimore"

cities = rbind(Baltimore_vehic, LA_vehic)

# feed both cities to the plot function
source("./plot6.R")
plot6(cities)
