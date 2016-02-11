## loads data into data frame called "data"
data <- read.csv("household_power_consumption.txt", sep = ";")

## subsets data from days 01/02/2007 and 02/02/2007 
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## convert Global_active_power column to numeric format
data$Global_active_power <- as.numeric(as.vector(data$Global_active_power))

## set margin size
par(mar = rep(4, 4))

## plots a red histogram of the "Global_active_power" variable with
## the x label "Global Active Power (kilowatts)" 
## and the title "GLobal Active Power"
hist(data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

## create PNG file called "plot1.png"
dev.copy(png,"plot1.png")
dev.off()