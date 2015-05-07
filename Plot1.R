## Obtaining complete dataset
data_full <- read.csv("/Users/arunpanangat/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Creation of required subsets in data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Date Conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Creation of Plot 1
hist(data$Global_active_power, main="Global Active Power", col.main="red", font.main=4
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving output
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
