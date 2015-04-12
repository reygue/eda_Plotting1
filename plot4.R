hpowerc <- "household_power_consumption.txt"
hpowerc <- read.table(hpowerc, header=T, sep=";", stringsAsFactors=F, dec=".")
retrievedData <- hpowerc[hpowerc$Date %in% c("1/2/2007","2/2/2007") ,]

dateandtime <- strptime(paste(retrievedData$Date, retrievedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(retrievedData$Global_active_power)
ReactivePower <- as.numeric(retrievedData$Global_reactive_power)
voltage <- as.numeric(retrievedData$Voltage)
subMetering1 <- as.numeric(retrievedData$Sub_metering_1)
subMetering2 <- as.numeric(retrievedData$Sub_metering_2)
subMetering3 <- as.numeric(retrievedData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateandtime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateandtime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="green")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "green"), bty="o")

plot(dateandtime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()