library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

code <- SCC[grep("[Cc]oal", SCC$Short.Name),1]
coalData <- NEI[(NEI$SCC %in% code),]
data <- tapply(coalData$Emission, coalData$year, sum)
plot(years, data, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From Coal Sources", xlim = c(1998,2008))
lines(years, data)
dev.copy(png, file = "plot4.png")
dev.off()