# The required libraries are loaded and the working directory is set to the current directory.
library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

# The NEI and SCC data are loaded into the working environment of R and a new variable is made for which the analysis would be conducted.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

# The data for emmision caused by vehicles is selected.
code <- SCC[grep("[Vv]ehicle", SCC$Short.Name),1]
new_NEI <- NEI[(NEI$SCC %in% code),]

# The data for Baltimore City, Maryland and Los Angeles County, California is selected.
BC <- new_NEI %>% filter(fips == "24510")
LA <- new_NEI %>% filter(fips == "06037")

# The total emmision in each year for Baltimore city and Los Angeles County is calculated.
dataBC <- tapply(VBC$Emission, BC$year, sum).
dataLA <- tapply(VLA$Emission, LA$year, sum)

# The plotting space is divided into two sections for plotting the data for Baltimore City and Los Angeles County.
# The data is now plotted.
# Lines are added between the points to see the trend for emssions from 1999 to 2008.
par(mfrow = c(1,2))
plot(years, dataBC, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From Motor Vehicle Sources", xlim = c(1998,2008))
lines(years, dataBC)
plot(years, dataLA, pch = 19, xlab = "Year", ylab = "Emissions", xlim = c(1998,2008))
lines(years, dataLA)


dev.copy(png, file = "plot6.png")
dev.off()
