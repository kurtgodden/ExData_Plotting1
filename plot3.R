#plot3.R
#Create third plot for the assignment
################################################################################
#######          Read in data using column classes to optimize           #######
################################################################################

#Note: a local copy of the dataset was placed into my working directory
colClasses <- c("character", "character", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric", "numeric")
rawData <- read.table("household_power_consumption.txt", header=TRUE, 
                      sep=";", na.strings="?", nrows=2100000, 
                      colClasses=colClasses)
# Convert Date var to Date format, and Time var to POSIXlt 
rawData$Date <- as.Date(rawData$Date, format="%d/%m/%Y")
rawData$Time <- strptime(rawData$Time, format="%H:%M:%S")
#Now get only Feb 1,2 data from 2007
projectData <- rawData[grep("2007-02-01|2007-02-02", rawData$Date),]

################################################################################
###################     Make and Save Plot 3               #####################
################################################################################

png('plot3.png') #Save the plot to this file when done.

par(pty="m", xaxt="n")
#Create initial plot with submetering 1
plot(projectData$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
#Replace the default x axis with custom ticks and labels
par(xaxt="s")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))
#Add submetering 2/3 on top of the first
lines(projectData$Sub_metering_2, type="l", col="red")
lines(projectData$Sub_metering_3, type="l", col="blue")
#Add legend to finish
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2,
       col=c("black", "red", "blue"))
#Don't forget this!
dev.off()


