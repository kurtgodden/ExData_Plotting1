#plot1.R
#Create first plot for the assignment
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
###################     Make and Save Plot 1               #####################
################################################################################ 

png('plot1.png') #Save the plot to this file when done. 
par(pty="s")
hist(projectData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="red")
#Don't forget this!
dev.off()

