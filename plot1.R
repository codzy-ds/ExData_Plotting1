source("getAndCleanData.R")

household <- cleanData()
png("output_graph/plot1.png",width = 480,height = 480)
hist(household$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()