hpowerc <- "household_power_consumption.txt"
hpowerc <- read.table(hpowerc, header=T, sep=";", stringsAsFactors=F, dec=".")
retrievedData <- hpowerc[hpowerc$Date %in% c("1/2/2007","2/2/2007") ,]
ActivePower <- as.numeric(retrievedData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
