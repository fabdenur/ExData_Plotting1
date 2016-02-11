## loads data into data frame called "data"
data <- read.csv("household_power_consumption.txt", sep = ";")

## subsets data from days 01/02/2007 and 02/02/2007 
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## converts columns to numeric format
data$Global_active_power <- as.numeric(as.vector(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.vector(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.vector(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.vector(data$Sub_metering_3))
data$Voltage <- as.numeric(as.vector(data$Voltage))
data$Global_reactive_power <- as.numeric(as.vector(data$Global_reactive_power))

## convert Date column to date format
data$Date <- as.Date(as.vector(data$Date), "%d/%m/%Y")

## adds a date-and-time column to the data dataframe
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

## set margin size
par(mar = c(4, 4, 2, 4))

## set layout of plots
par(mfcol = c(2, 2))

## plots a red histogram of the "Global_active_power" variable with
## the x label "Global Active Power (kilowatts)" 
## and the title "GLobal Active Power"
hist(data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

## plots line graph with required Y axis label
plot(data$DateTime, data$Sub_metering_1, col = c("black", "red") , ylab = "Energy sub metering", xlab = "", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

## adds required legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(1, 1, 1),col=c("black", "red", "blue"))

## plots line graph with required Y and X axis labels
plot(data$DateTime, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

## plots line graph with required Y and X axis labels
plot(data$DateTime, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

## create PNG file called "plot4.png"
dev.copy(png,"plot4.png")
dev.off()