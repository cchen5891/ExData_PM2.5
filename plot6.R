# Download raw data
# fnameRawData <- "rawData.zip"
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
# unzip(fnameRawData, list = TRUE) # check the content of zip file
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Plot6:
baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)
png(file="plot6.png", width=640, height=640)
p <- ggplot(
  baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles PM2.5 motor vehicle emissions by year")) +
  xlab("Year") +
  ylab(expression("PM2.5 motor vehicle emissions [Ton]")) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold")
)
print(p)
dev.off()