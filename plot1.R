# Code for creating plot1.png

library (dplyr)

# Read the tdata
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Read the data from the 1st and 2nd Feb 2007
power_feb07 <- filter(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

# Convert variable Date to type POSIXlt
power_feb07$Date <- strptime(power_feb07$Date,format="%d/%m/%Y")

# Construct a plot as a PNG file
png("plot1.png")
hist(power_feb07$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylim=c(0,1200))
dev.off()