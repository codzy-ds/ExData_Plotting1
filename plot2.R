source("getAndCleanData.R")

household <- cleanData()
png("output_graph/plot2.png",width = 480,height = 480)
plot(household$Time,household$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()