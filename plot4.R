Sys.setlocale(locale = "C")

myData <- read.table("household_power_consumption.txt", header = T, sep = ";")

plotData <- subset(myData, myData$Date == "1/2/2007" | myData$Date == "2/2/2007")

png(filename="plot4.png")

plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power")

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Voltage), dec = ".")), type = "l", xlab = "datetime", ylab = "Voltage")

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_1), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

points(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_2), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "red")

points(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_3), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_reactive_power), dec = ".")), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

Sys.setlocale(locale = "")