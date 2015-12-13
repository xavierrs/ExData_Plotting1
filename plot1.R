# Read data
fname <- "household_power_consumption.txt"
mydata <- read.table(fname, header = TRUE, sep = ";", na.strings = "?")

# Subset only the relevant days
mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

# Initialise device
png("plot1.png", width = 480, height = 480)

# Plot
with(mydata, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))

# Save plot to file
dev.off()
