# The required library is loaded and the working directory is set to the current directory.
library(dplyr)
library(ggplot2)
setwd("exdata_2Fdata%2FNEI_data")

# The NEI and SCC data are loaded into the working environment of R and a new variable is made for which the analysis would be conducted.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

# The data for Baltimore City, Maryland was selected.
# The data is grouped by type and year and the sum of each was calculated and this data is now plotted.
# Note - The data could have been plotted as a panel plot in which each type of emission would have its own plow, it is mentioned as comment below.
# Lines are added between the points to see the trend for each type of emssion from 1999 to 2008.
data <- NEI %>% filter(fips == "24510") %>% group_by(type, year) %>% summarize(eSum = sum(Emissions))
# ggplot(data, aes(year, eSum)) + facet_grid(.~type) + geom_line() + geom_point() + labs(x = "Year", y = "Emission") + ggtitle("Emission in Baltimore City, Maryland") + theme(axis.text.x = element_text(angle = 90))
ggplot(data, aes(year, eSum)) + geom_line(aes(color = type)) + geom_point(aes(color = type)) + labs(x = "Year", y = "Emission") + ggtitle("Emission in Baltimore City, Maryland")

# The plot is now saved in the current working directory.
dev.copy(png, file = "plot3.png")
dev.off()
