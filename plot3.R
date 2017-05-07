source("getAndCleanData.R")

household <- cleanData()
png("output_graph/plot3.png",width = 480,height = 480)
plot(household$Time,household$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(household$Time,household$Sub_metering_2, type="l",col="red")
lines(household$Time,household$Sub_metering_3, type="l",col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=1)
dev.off()
