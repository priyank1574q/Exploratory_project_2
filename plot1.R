# The working directory is set to the current directory.
setwd("exdata_2Fdata%2FNEI_data")

# The NEI and SCC data are loaded into the working environment of R and a new variable is made for which the analysis would be conducted.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

# The sum of emission for each year is now calculated and this data is now plotted. Lines are added between the points to see the trend for emssions from 1999 to 2008.
q1 <- tapply(NEI$Emission, NEI$year, sum)
plot(years, q1, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From All Sources", xlim = c(1998,2008))
lines(years,q1)

# The plot is now saved in the current working directory.
dev.copy(png, file = "plot1.png")
dev.off()
