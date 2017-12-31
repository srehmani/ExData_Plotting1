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
## plot 1
########################################################

#convert global active power to numeric data type
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)

#generate histogram
hist(hpcData$Global_active_power, main = "Global Active Power", col="Red", xlab = "Global Active Power ( kilowatts )", ylab = "Frequency")

## Export chart to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



