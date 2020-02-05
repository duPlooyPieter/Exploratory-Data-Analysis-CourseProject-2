
setwd("H:/My Drive/Coursera/Data Science/4. Exploratory Data Analysis/Week 4 - Case Studies/Course Project")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emmissions_summary <- aggregate(Emissions ~ year, NEI, sum)

library(RColorBrewer)
coul <- brewer.pal(5, "Set1")
                 
png("plot1.png", width=480, height=480)


barplot(height=emmissions_summary$Emissions/1000, 
        names.arg=emmissions_summary$year, 
        xlab="Year", 
        ylab='Emissions (t/1000)',
        main='PM2.5 Emmissions by Year', 
        col=coul
        )
dev.off()
