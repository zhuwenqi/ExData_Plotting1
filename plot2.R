Sys.setlocale(locale = "C")

myData <- read.table("household_power_consumption.txt", header = T, sep = ";")

plotData <- subset(myData, myData$Date == "1/2/2007" | myData$Date == "2/2/2007")

png(filename="plot2.png")

plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

Sys.setlocale(locale = "")