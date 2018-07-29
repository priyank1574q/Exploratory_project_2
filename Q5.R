# The required library is loaded and the working directory is set to the current directory.
library(dplyr)
setwd("exdata_2Fdata%2FNEI_data")

# The NEI and SCC data are loaded into the working environment of R and a new variable is made for which the analysis would be conducted.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
years <- c("1999","2002","2005","2008")

# The data for Baltimore City, Maryland was selected.
# Then data for emission caused by vehicle is selected and then the total emmision in each year is calculated.
# Lines are added between the points to see the trend for coal emmision from 1999 to 2008.
BC <- NEI %>% filter(fips == "24510")
code <- SCC[grep("[Vv]ehicle", SCC$Short.Name),1]
vehData <- BC[(BC$SCC %in% code),]
data <- tapply(vehData$Emission, vehData$year, sum)
plot(years, data, pch = 19, xlab = "Year", ylab = "Emissions", main = "Emission From Motor Vehicle Sources", xlim = c(1998,2008))
lines(years, data)

# The plot is now saved in the current working directory.
dev.copy(png, file = "plot5.png")
dev.off()
