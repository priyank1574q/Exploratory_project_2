library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

BCity <- NEI %>% filter(fips == "24510")
q2 <- tapply(BCity$Emissions, BCity$year, sum)
plot(years, q2, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission in Baltimore City, Maryland", xlim = c(1998,2008))
lines(years,q2)
dev.copy(png, file = "plot2.png")
dev.off()