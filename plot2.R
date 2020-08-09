# Code for creating plot2.png

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
png("plot2.png")
plot(feb07$Date,
     feb07$Global_active_power,
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
