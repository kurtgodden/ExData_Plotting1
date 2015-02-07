#plot2.R
#Create second plot for the assignment
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
###################     Make and Save Plot 2               #####################
################################################################################ 

png('plot2.png') #Save the plot to this file when done.
par(pty="s", xaxt="n")
plot(projectData$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
par(xaxt="s")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

#Don't forget this!
dev.off()

