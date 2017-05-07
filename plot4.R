source("getAndCleanData.R")

household <- cleanData()
png("output_graph/plot4.png",width = 480,height = 480)

# Separate the display in four
par(mfrow=c(2,2))

#Plot Global Active Power
plot(household$Time,household$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

#Plot Voltage
plot(household$Time,household$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

#Plot sub metering 1,2,3
plot(household$Time,household$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(household$Time,household$Sub_metering_2, type="l",col="red")
lines(household$Time,household$Sub_metering_3, type="l",col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=1, bty = "n")

#Plot GLobal Reactive power
with(household, plot(Time, Global_reactive_power, type="l", xlab="datetime"))

dev.off()