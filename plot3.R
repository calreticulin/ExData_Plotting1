#run following bash command to filter data first: 
#head -1 household_power_consumption.txt > prepared && grep -E "(^2/2/2007)|(^1/2/2007)" household_power_consumption.txt >> prepared

dat <- read.table(file="prepared", header = TRUE, sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S", tz = "CET")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

png(filename="plot3.png", width=480, height=480,units="px",bg="white")
plot(dat$Time, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dat$Time, dat$Sub_metering_2, type="l", col="red")
lines(dat$Time, dat$Sub_metering_3, type="l", col="blue")
legend("topright",lwd=c(2.5,2.5), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()