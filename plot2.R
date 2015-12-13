# Read data
fname <- "household_power_consumption.txt"
mydata <- read.table(fname, header = TRUE, sep = ";", na.strings = "?")

# Subset only the relevant days
mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

# Prepare the data
mydata$Date <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

# Initialise device
png("plot2.png", width = 480, height = 480)

# Plot
with(mydata, plot(mydata$Date, mydata$Global_active_power,
                  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Save plot to file
dev.off()
