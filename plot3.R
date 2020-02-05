
setwd("H:/My Drive/Coursera/Data Science/4. Exploratory Data Analysis/Week 4 - Case Studies/Course Project")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emmissions_summary <- aggregate(Emissions ~ year+ type, NEI[NEI$fips=="24510", ], sum)


chart <- ggplot(emmissions_summary, aes(year, Emissions, color = type))
chart <- chart + geom_line() +
        xlab("Year") +
        ylab('Emissions (t)') +
        ggtitle('Total Emissions of PM2.5 in Baltimore City by type') 
png(filename = "plot3.png")
print(chart)
dev.off()