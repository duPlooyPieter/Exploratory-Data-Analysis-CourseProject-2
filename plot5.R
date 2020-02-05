
setwd("H:/My Drive/Coursera/Data Science/4. Exploratory Data Analysis/Week 4 - Case Studies/Course Project")
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

car_data <- subset(NEI, NEI$fips=="24510" & NEI$type=="ON-ROAD")

emmissions_summary <- aggregate(Emissions ~ year, car_data, sum)

png(filename = "plot5.png")
plot(emmissions_summary$year, emmissions_summary$Emissions,
     type = "o",
     xlab = "Year",
     ylab = "Emissions (t)",
     main = "PM2.5 Emissions from motor vehicles in Baltimore City",
     col = "blue")
dev.off()