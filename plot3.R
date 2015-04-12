hpowerc <- "household_power_consumption.txt"
hpowerc <- read.table(hpowerc, header=T, sep=";", stringsAsFactors=F, dec=".")
retrievedData <- hpowerc[hpowerc$Date %in% c("1/2/2007","2/2/2007") ,]


#str(retrievedDataData)
dateandtime <- strptime(paste(retrievedData$Date, retrievedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(retrievedData$Global_active_power)
subMetering1 <- as.numeric(retrievedData$Sub_metering_1)
subMetering2 <- as.numeric(retrievedData$Sub_metering_2)
subMetering3 <- as.numeric(retrievedData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="green")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("yellow", "red", "green"))
dev.off()
