# Download raw data
# fnameRawData <- "rawData.zip"
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
# unzip(fnameRawData, list = TRUE) # check the content of zip file
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Plot3: Total NEI emissions in Baltimore for different types
totalNEIBaltimoreYearType <- aggregate(Emissions ~ year + type, NEI, sum)
png(file="plot3.png", width=640, height=640)
p <- ggplot(totalNEIBaltimoreYearType, 
  aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore PM2.5 emissions by type and year")) +
  ylab(expression("Total Baltimore PM2.5 emissions [Ton]")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold")
)
print(p)
dev.off()