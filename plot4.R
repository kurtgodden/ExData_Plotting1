#plot4.R
#Create fourth plot for the assignment
################################################################################
#######          Read in data using column classes to optimize           #######
################################################################################

#Note: a local copy of the dataset was placed into my working directory
colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
                "numeric", "numeric", "numeric")
rawData <- read.table("household_power_consumption.txt", header=TRUE, 
                      sep=";", na.strings="?", nrows=2100000, 
                      colClasses=colClasses)
# Convert Date var to Date format, and Time var to POSIXlt 
rawData$Date <- as.Date(rawData$Date, format="%d/%m/%Y")
rawData$Time <- strptime(rawData$Time, format="%H:%M:%S")
#Now get only Feb 1,2 data from 2007
projectData <- rawData[grep("2007-02-01|2007-02-02", rawData$Date),]

################################################################################
###################     Make and Save Plot 4               #####################
################################################################################ 

png('plot4.png') #Save the plot to this file when done.
par(pty="m", xaxt="n", mfcol=c(2,2)) #fill the 2x2 grid by columns

#First plot
plot(projectData$Global_active_power, type="l", xlab="",
     ylab="Global Active Power", lwd=2)
par(xaxt="s")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

#Second plot
par(pty="m", xaxt="n")
plot(projectData$Sub_metering_1, lwd=2,
     type="l", xlab="", ylab="Energy sub metering")
par(xaxt="s")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))
lines(projectData$Sub_metering_2, type="l", col="red")
lines(projectData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2, bty="n",
       col=c("black", "red", "blue"))

#Third plot
par(pty="m", xaxt="n")
plot(projectData$Voltage, type="l", xlab="datetime", lwd=2,
     ylab="Voltage")
par(xaxt="s")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

#Fourth plot
par(pty="m", xaxt="n")
plot(projectData$Global_reactive_power, type="l", xlab="datetime", lwd=2,
     ylab="Global_reactive_power")
par(xaxt="s")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

#Don't forget this!
dev.off()


