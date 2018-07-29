library(dplyr)
library(ggplot2)
setwd("exdata_2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

data <- NEI %>% filter(fips == "24510") %>% group_by(type, year) %>% summarize(eSum = sum(Emissions))
##ggplot(data, aes(year, eSum)) + facet_grid(.~type) + geom_line() + geom_point() + labs(x = "Year", y = "Emission") + ggtitle("Emission in Baltimore City, Maryland") + theme(axis.text.x = element_text(angle = 90))
ggplot(data, aes(year, eSum)) + geom_line(aes(color = type)) + geom_point(aes(color = type)) + labs(x = "Year", y = "Emission") + ggtitle("Emission in Baltimore City, Maryland")
dev.copy(png, file = "plot3.png")
dev.off()