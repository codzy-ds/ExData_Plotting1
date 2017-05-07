cleanData <- function() {
  if(!file.exists("data/subset_household.txt")) {
    subset_household <- cleanTotalDataset()
  } else {
    subset_household <- loadSubset()
  }
  subset_household
}

downloadAndExtract <- function() {
  if(!file.exists("data")) {
    dir.create("data")
  }
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data/powerConsumption.zip")
  unzip("data/powerConsumption.zip", exdir = "data")
}

cleanTotalDataset <- function() {
  downloadAndExtract()
  household <- read.csv("data/household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE, na.strings = "NA")
  household$Date <- as.Date(household$Date,"%d/%m/%Y")
  subset_hous <- subset(household,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
  subset_hous$Time <- strptime(paste(subset_hous$Date, subset_hous$Time),format="%Y-%m-%d %H:%M:%S")
  write.csv(subset_hous,file="data/subset_household.txt")
  subset_hous
}

loadSubset <- function() {
  houshold <- read.csv("data/subset_household.txt")
  houshold$Date <- as.Date(houshold$Date)
  houshold$Time <- strptime(houshold$Time, "%Y-%m-%d %H:%M:%S")
  houshold
}