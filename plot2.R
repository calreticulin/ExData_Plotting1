#run following bash command to filter data first: 
#head -1 household_power_consumption.txt > prepared && grep -E "(^2/2/2007)|(^1/2/2007)" household_power_consumption.txt >> prepared

dat <- read.table(file="prepared", header = TRUE, sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S", tz = "CET")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

png(filename="plot2.png", width=480, height=480,units="px",bg="white")
plot(dat$Time, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
