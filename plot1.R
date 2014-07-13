myData <- read.table("household_power_consumption.txt", header = T, sep = ";")

plotData <- subset(myData, myData$Date == "1/2/2007" | myData$Date == "2/2/2007")

png(filename="plot1.png")

hist(as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), main = "Global Active Power", breaks = 14, xlab = "Global Active Power (kilowatts)", col = "red", xaxp = c(0, 6, 3))

dev.off()