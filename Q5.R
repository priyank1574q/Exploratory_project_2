library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

BC <- NEI %>% filter(fips == "24510")
code <- SCC[grep("[Vv]ehicle", SCC$Short.Name),1]
vehData <- BC[(BC$SCC %in% code),]
data <- tapply(vehData$Emission, vehData$year, sum)
plot(years, data, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From Motor Vehicle Sources", xlim = c(1998,2008))
lines(years, data)
dev.copy(png, file = "plot5.png")
dev.off()