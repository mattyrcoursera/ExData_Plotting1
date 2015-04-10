plot1 <- function() {
    # read subset of data from file (assume it exists in cwd)
    # skip/nrows predetermined to match 2/1/2007-2/2/2007
    data <- read.table("household_power_consumption.txt",
                       header=FALSE,
                       sep=";",
                       skip=66637,
                       nrows=2880,
                       na.strings="?",
                       col.names=c("Date",
                                   "Time",
                                   "Global_active_power",
                                   "Global_reactive_power",
                                   "Voltage",
                                   "Global_intensity",
                                   "Sub_metering_1",
                                   "Sub_metering_2",
                                   "Sub_metering_3"),
                       colClasses=c(rep("character", 2),
                                    rep("numeric", 7)))

    # plot directly to png
    png(filename="plot1.png",width=480,height=480)
    
    hist(data$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red")
    
    dev.off()
}