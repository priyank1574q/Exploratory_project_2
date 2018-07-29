setwd("exdata_2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

q1 <- tapply(NEI$Emission, NEI$year, sum)
plot(years, q1, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From All Sources", xlim = c(1998,2008))
lines(years,q1)
dev.copy(png, file = "plot1.png")
dev.off()