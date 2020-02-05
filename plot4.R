
setwd("H:/My Drive/Coursera/Data Science/4. Exploratory Data Analysis/Week 4 - Case Studies/Course Project")
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_class_code <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_emissions_data <- NEI[NEI$SCC %in% coal_class_code$SCC, ]

emmissions_summary <- aggregate(Emissions ~ year, coal_emissions_data, sum)

png(filename = "plot4.png")
plot(emmissions_summary$year, emmissions_summary$Emissions, type = "o",
     xlab = "Year",
     ylab = "Emissions (t)",
     main = "Coal Related Emissions of PM2.5 across the United States", 
     col=coul)
dev.off()