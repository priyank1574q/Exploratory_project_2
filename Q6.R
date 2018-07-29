library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

code <- SCC[grep("[Vv]ehicle", SCC$Short.Name),1]
new_NEI <- NEI[(NEI$SCC %in% code),]

BC <- new_NEI %>% filter(fips == "24510")
LA <- new_NEI %>% filter(fips == "06037")

dataBC <- tapply(VBC$Emission, BC$year, sum)
dataLA <- tapply(VLA$Emission, LA$year, sum)

par(mfrow = c(1,2))
plot(years, dataBC, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From Motor Vehicle Sources", xlim = c(1998,2008))
lines(years, dataBC)
plot(years, dataLA, pch = 19, xlab = "Year", ylab = "Emissions", xlim = c(1998,2008))
lines(years, dataLA)
dev.copy(png, file = "plot6.png")
dev.off()