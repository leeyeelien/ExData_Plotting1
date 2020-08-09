# Code for creating plot3.png

library (dplyr)

# Read the tdata
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Read the data from the 1st and 2nd Feb 2007
feb07 <- filter(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

# Convert variables to the right types
feb07 = mutate(feb07, DateTime = paste(feb07$Date,feb07$Time))
feb07$Date <- strptime(feb07$DateTime,format="%d/%m/%Y %H:%M:%S")
feb07$Global_active_power <- as.numeric(feb07$Global_active_power)

# Construct a plot as a PNG file
png("plot3.png")
with (feb07, plot (Date,
                   Sub_metering_1, 
                   type="l", xlab="", 
                   ylab="Energy sub metering"))
with (feb07, points (Date,Sub_metering_2, type="l",col="red"))
with (feb07, points (Date,Sub_metering_3, type="l",col="blue"))
legend ("topright", 
        lty=1, 
        col=c("black","red","blue"),
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
