hpowerc <- "household_power_consumption.txt"
hpowerc <- read.table(hpowerc, header=T, sep=";", stringsAsFactors=F, dec=".")
retrievedData <- hpowerc[hpowerc$Date %in% c("1/2/2007","2/2/2007") ,]

dateandtime <- strptime(paste(retrievedData$Date, retrievedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(retrievedData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateandtime, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
