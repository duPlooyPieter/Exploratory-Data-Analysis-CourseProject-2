
setwd("H:/My Drive/Coursera/Data Science/4. Exploratory Data Analysis/Week 4 - Case Studies/Course Project")
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

car_data <- subset(NEI, NEI$fips=="24510" |
                           NEI$fips=="06037" &
                           NEI$type=="ON-ROAD")

emmissions_summary <- aggregate(Emissions ~ year + fips, car_data, sum)

png(filename = "plot6.png")
qplot(year, Emissions, data = emmissions_summary, color = fips, geom = "line") +
        ggtitle("PM2.5 Emissions from motor vehicles in Baltimore (24510) and LA (06037)") + 
        ylab("Emissions (t)") + 
        xlab("Year") 
dev.off()