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
