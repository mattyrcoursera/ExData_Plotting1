plot4 <- function() {
    data <- loadplotdata()
    
    # plot directly to png
    png(filename="plot4.png",width=480,height=480)
    
    # 2x2 plots, cols first
    par(mfcol=c(2,2))
    
    # same as plot 2 but different label (upper left)
    plot(data$DateTime, data$Global_active_power,
         type="l",
         main=NULL,
         xlab="",
         ylab="Global Active Power")
    
    # same as plot 3 but now box around legend (lower left)
    plot(data$DateTime, data$Sub_metering_1,
         type="l",
         main=NULL,
         xlab="",
         ylab="Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2,
          col="red")
    lines(data$DateTime, data$Sub_metering_3,
          col="blue")
    legend("topright",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"),
           lwd=1,
           bty="n")

    # new plot (upper right)
    plot(data$DateTime, data$Voltage,
         type="l",
         main=NULL,
         xlab="datetime",
         ylab="Voltage")
    
    # last new plot (lower right)
    plot(data$DateTime, data$Global_reactive_power,
         type="l",
         main=NULL,
         xlab="datetime",
         ylab="Global_reactive_power")
    
    dev.off()
}

# this is copied to each file just to isolate each plot run
loadplotdata <- function() {
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
    # convert dates
    data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
    
    data
}