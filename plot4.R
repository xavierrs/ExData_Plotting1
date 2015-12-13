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
par(mfrow = c(2,2))
# Subplot 1
plot(mydata$Date, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Subplot 2
plot(mydata$Date, mydata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Subplot 3
plot(mydata$Date, mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(mydata$Date, mydata$Sub_metering_2, type = "l", col = "red")
lines(mydata$Date, mydata$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = c(1, 1, 1), bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Subplot 4
plot(mydata$Date, mydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Save plot to file
dev.off()
