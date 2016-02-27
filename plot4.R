setwd("~/Documents/DataScience/4_ExploratoryDataAnalysis")

# The first two rows of code will read in a text file called 'household_power_consumption' to the dataset 'dat'
dat <- read.table('household_power_consumption.txt',header=T,sep=";", na.strings = "?", skip = 66636, nrows = 2880, 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(dat) = c("Cdate", "Ctime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Creates a new varibale 'DateTime' by converting and combining the date and time variables
dat$DateTime <- strptime(paste(dat$Cdate,dat$Ctime), format = "%d/%m/%Y %H:%M:%S")

# creates a panel of 4 .png graphs of the household power consumption dataset
par(mfrow=c(2,2))
plot(dat$DateTime,dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dat$DateTime,dat$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
plot(dat$DateTime,dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(dat$DateTime,dat$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue")
points(dat$DateTime,dat$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "", col="red")
legend("topright", legend=c("Sub_metering_1", "Sub_meeting_2", "Sub_meeting_3"), lty = c(1,1,1),col=c("black","blue","red"), cex=0.5, bty="n")
plot(dat$DateTime,dat$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.copy(png, file="plot4.png")
dev.off()