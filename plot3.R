## set working directory for the course project
# setwd("C:/Repo/R/projects/C04p01")
# getwd()

## download the file
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")

## unzip the file
unzip("household_power_consumption.zip")

## load data
hpcDataAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

## format date column
# head(hpcDataAll)
hpcDataAll$Date = as.Date(hpcDataAll$Date, format="%d/%m/%Y")

## create subset for analysis
hpcData <- subset(hpcDataAll, hpcDataAll$Date >= "2007-02-01" & hpcDataAll$Date <= "2007-02-02" )
#summary(hpcData$Date)

## cleanup
rm(hpcDataAll)


########################################################
## plot 3
########################################################

#convert input variables to numeric data types
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)
hpcData$Sub_metering_1 <- as.numeric(hpcData$Sub_metering_1)
hpcData$Sub_metering_2 <- as.numeric(hpcData$Sub_metering_2)
hpcData$Sub_metering_3 <- as.numeric(hpcData$Sub_metering_3)

## Combine date, time to create a new datetime column
datetime <- paste(as.Date(hpcData$Date), hpcData$Time)
hpcData$Datetime <- as.POSIXct(datetime)

#generate plot based on new dattime column.
with(hpcData, 
{
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Export chart to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



