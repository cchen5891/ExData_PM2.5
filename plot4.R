# Download raw data
# fnameRawData <- "rawData.zip"
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
# unzip(fnameRawData, list = TRUE) # check the content of zip file
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Plot4:
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)
png(file="plot4.png", width=640, height=640)
p <- ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US PM2.5 coal emission by yype and year")) +
  xlab("Year") +
  ylab(expression("US PM2.5 coal emission [Ton]")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold")
)
print(p)
dev.off()