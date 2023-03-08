# Download raw data
# fnameRawData <- "rawData.zip"
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
# unzip(fnameRawData, list = TRUE) # check the content of zip file
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Plot5:
baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)
png(file="plot5.png", width=640, height=640)
p <- ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore PM2.5 motor vehicle emissions by year")) +
  xlab("Year") +
  ylab(expression("PM2.5 motor vehicle emissions [Ton]")
)
print(p)
dev.off()