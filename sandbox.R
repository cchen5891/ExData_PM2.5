# Download raw data
fnameRawData <- "rawData.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", fnameRawData)
unzip("my_data.zip", list = TRUE) # check the content of zip file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot1: Total NEI emission
totalNEIYear <- aggregate(Emissions ~ year, NEI, sum)

plot(totalNEIYear$year, 
  totalNEIYear$Emissions,
  type = "o",
  col = "blue", 
  main = expression("Total US PM2.5 emissions by year"), 
  xlab = "Year",
  ylab = expression("PM2.5 emissions [Ton]")
)

# Plot2: Total NEI emissions in Baltimore
totalNEIBaltimore = subset(NEI, fips == "24510")
totalNEIBaltimoreYear <- aggregate(Emissions ~ year, totalNEIBaltimore, sum)

plot(totalNEIBaltimoreYear$year, 
  totalNEIBaltimoreYear$Emissions,
  type = "o",
  col = "blue", 
  main = expression("Total Baltimore PM2.5 emissions by year"), 
  xlab = "Year",
  ylab = expression("PM2.5 emissions [Ton]")
)

# Plot3: Total NEI emissions in Baltimore for different types
totalNEIBaltimoreYearType <- aggregate(Emissions ~ year + type, NEI, sum)

ggplot(totalNEIBaltimoreYearType, 
  aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore PM2.5 emissions by type and year")) +
  ylab(expression("Total Baltimore PM2.5 emissions [Ton]")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold")
)

# Plot4:
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US PM2.5 coal emission by yype and year")) +
  xlab("Year") +
  ylab(expression("US PM2.5 coal emission [Ton]")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold")
)

# Plot5:
baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore PM2.5 motor vehicle emissions by year")) +
  xlab("Year") +
  ylab(expression("PM2.5 motor vehicle emissions [Ton]")
)

# Plot6:
baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)

ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles PM2.5 motor vehicle emissions by year")) +
  xlab("Year") +
  ylab(expression("PM2.5 motor vehicle emissions [Ton]")) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold")
) 