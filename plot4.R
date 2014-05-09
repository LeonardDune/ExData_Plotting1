myData <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData1 <- subset(myData, Date == as.Date("2007-02-01"))
myData2 <- subset(myData, Date == as.Date("2007-02-02"))
myData <- rbind(myData1, myData2)
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
par(ps = 12, cex = 1, cex.main = 1)
with(myData, {
  #plot 1 - upperleft
  plot(DateTime, Global_active_power, main = "", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #plot 2 - lowerleft
  plot(DateTime, Voltage, main = "", type = "l", xlab ="datetime", ylab = "Voltage")

  #plot 3 - upperright
  plot(DateTime, Sub_metering_1, main = "", type = "l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "blue")
  lines(DateTime, Sub_metering_3, col = "red")
  par(mar = c(1,1,1,1))
  legend("topright", lty = c(1, 1, 1), border = NULL, pch = NULL, seg.len = 3, cex = 0.5, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  #plot 4 - lowerrigth
  par(mar = c(4,4,2,1))
  plot(DateTime, Global_reactive_power, main = "", type = "l", xlab ="datetime", ylab = "Global_reactive_power")

})
dev.copy(png, "plot4.png")
dev.off()