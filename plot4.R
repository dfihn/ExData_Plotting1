dfile <- "C:/Users/DJPimpFlex/Documents/Coursera/Data Science Specialization/Exploratory_analysis/ExData_Plotting1/household_power_consumption.txt"

setwd("C:/Users/DJPimpFlex/Documents/Coursera/Data Science Specialization/Exploratory_analysis/ExData_Plotting1")

hdata <- read.table(dfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#select the range for the histogram
subdata <- hdata[hdata$Date %in% c("1/2/2007", "2/2/2007"),]
globalactivepower <- as.numeric(subdata$Global_active_power)
voltage <- as.numeric(subdata$Voltage)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)

dtime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

sub_metering1 <- as.numeric(subdata$Sub_metering_1)
sub_metering2 <- as.numeric(subdata$Sub_metering_2)
sub_metering3 <- as.numeric(subdata$Sub_metering_3)

#png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dtime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dtime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dtime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(dtime, sub_metering2, type="l", col="red")
lines(dtime, sub_metering3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       col=c("black", "red", "blue"), lty = 1, lwd = 2,bty="n")

plot(dtime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png", height= 480, width = 480)
dev.off()
