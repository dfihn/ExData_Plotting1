dfile <- "C:/Users/DJPimpFlex/Documents/Coursera/Data Science Specialization/Exploratory_analysis/ExData_Plotting1/household_power_consumption.txt"

setwd("C:/Users/DJPimpFlex/Documents/Coursera/Data Science Specialization/Exploratory_analysis/ExData_Plotting1")

hdata <- read.table(dfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#select the range for the histogram
subdata <- hdata[hdata$Date %in% c("1/2/2007", "2/2/2007"),]
globalactivepower <- as.numeric(subdata$Global_active_power)

dtime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

sub_metering1 <- as.numeric(subdata$Sub_metering_1)
sub_metering2 <- as.numeric(subdata$Sub_metering_2)
sub_metering3 <- as.numeric(subdata$Sub_metering_3)

#with(subdata,{
  #plot(dtime, sub_metering1, type = "l", ylab = "Energy Submetering", xlab = "")
#lines(dtime, sub_metering2, type = "l", col = 'red')
  #lines(dtime, sub_metering3, type = "l", col = 'blue')
#})

#setting the parameters to be one row and one column
par(mfrow = c(1, 1)) 

plot(dtime, sub_metering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dtime, sub_metering2, type = "l", col = 'red')
lines(dtime, sub_metering3, type = "l", col = 'blue')

legend("topright", col = c("black","red", "blue"), lty = 1, lwd = 2, 
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

#legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),lty = 1, lwd = 2.5, col = c("black, "red", "blue"))

dev.copy(png, file = "plot4.png", height= 480, width = 480)
dev.off()

