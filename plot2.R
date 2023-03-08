# Download raw data
# fnameRawData <- "rawData.zip"
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
# unzip(fnameRawData, list = TRUE) # check the content of zip file
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Plot2: Total NEI emissions in Baltimore
totalNEIBaltimore = subset(NEI, fips == "24510")
totalNEIBaltimoreYear <- aggregate(Emissions ~ year, totalNEIBaltimore, sum)
png(file="plot2.png", width=640, height=640)
plot(totalNEIBaltimoreYear$year, 
     totalNEIBaltimoreYear$Emissions,
     type = "o",
     col = "blue", 
     main = expression("Total Baltimore PM2.5 emissions by year"), 
     xlab = "Year",
     ylab = expression("PM2.5 emissions [Ton]")
)

dev.off()