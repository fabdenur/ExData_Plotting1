## loads data into data frame called "data"
data <- read.csv("household_power_consumption.txt", sep = ";")

## subsets data from days 01/02/2007 and 02/02/2007 
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## convert Global_active_power column to numeric format
data$Global_active_power <- as.numeric(as.vector(data$Global_active_power))

## convert Date column to date format
data$Date <- as.Date(as.vector(data$Date), "%d/%m/%Y")

## adds a date-and-time column to the data dataframe
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

## set margin size
par(mar = rep(4, 4))

## plots line graph with required Y axis label
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

## create PNG file called "plot2.png"
dev.copy(png,"plot2.png")
dev.off()