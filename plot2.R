dfile <- "C:/Users/DJPimpFlex/Documents/Coursera/Data Science Specialization/Exploratory_analysis/ExData_Plotting1/household_power_consumption.txt"

setwd("C:/Users/DJPimpFlex/Documents/Coursera/Data Science Specialization/Exploratory_analysis/ExData_Plotting1")

hdata <- read.table(dfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#select the range for the histogram
subdata <- hdata[hdata$Date %in% c("1/2/2007", "2/2/2007"),]
globalactivepower <- as.numeric(subdata$Global_active_power)

dtime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#png(globalactivepower, width = 480, height = 480)

#setting the parameters to be one row and one column
par(mfrow = c(1, 1)) 

plot(dtime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#plot (globalactivepower, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
#dev.copy(png, file="plot1.png", height=480, width=480)
#dev.off()