# The required library is loaded and the working directory is set to the current directory.
library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

# The NEI and SCC data are loaded into the working environment of R and a new variable is made for which the analysis would be conducted.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

# The data for Baltimore City, Maryland was selected and the sum of emissions for each year was calculated and this data is now plotted.
# Lines are added between the points to see the trend for emssions from 1999 to 2008.
BCity <- NEI %>% filter(fips == "24510")
q2 <- tapply(BCity$Emissions, BCity$year, sum)
plot(years, q2, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission in Baltimore City, Maryland", xlim = c(1998,2008))
lines(years,q2)

# The plot is now saved in the current working directory.
dev.copy(png, file = "plot2.png")
dev.off()
