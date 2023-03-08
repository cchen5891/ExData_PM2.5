# Download raw data
# fnameRawData <- "rawData.zip"
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
# unzip(fnameRawData, list = TRUE) # check the content of zip file
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Plot1: Total NEI emission
totalNEIYear <- aggregate(Emissions ~ year, NEI, sum)
png(file="plot1.png", width=640, height=640)
plot(totalNEIYear$year, 
     totalNEIYear$Emissions,
     type = "o",
     col = "blue", 
     main = expression("Total US PM2.5 emissions by year"), 
     xlab = "Year",
     ylab = expression("PM2.5 emissions [Ton]")
)

dev.off()