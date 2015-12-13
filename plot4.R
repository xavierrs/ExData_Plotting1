# Read data
fname <- "household_power_consumption.txt"
mydata <- read.table(fname, header = TRUE, sep = ";", na.strings = "?")

# Subset only the relevant days
mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

# Prepare the data
mydata$Date <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

# Initialise device
png("plot4.png", width = 480, height = 480)

# Plot
with(mydata, {
    # Subplot 1
    plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

    # Subplot 2
    plot(Date, Voltage, type = "l", ylab = "Global Active Power")
    
    # Subplot 3
    plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    
    lines(Date, Sub_metering_2, type = "l", col = "red")
    lines(Date, Sub_metering_3, type = "l", col = "blue")
    
    # Subplot 3
    legend("topright", lty = c(1, 1, 1), bty = "n", col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Date, Global_reactive_power, type = "l")
})

# Save plot to file
dev.off()
