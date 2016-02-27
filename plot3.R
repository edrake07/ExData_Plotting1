setwd("~/Documents/DataScience/4_ExploratoryDataAnalysis")

# The first two rows of code will read in a text file called 'household_power_consumption' to the dataset 'dat'
dat <- read.table('household_power_consumption.txt',header=T,sep=";", na.strings = "?", skip = 66636, nrows = 2880, 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(dat) = c("Cdate", "Ctime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Creates a new varibale 'DateTime' by converting and combining the date and time variables
dat$DateTime <- strptime(paste(dat$Cdate,dat$Ctime), format = "%d/%m/%Y %H:%M:%S")

# Plots the 3 sub metering variables across time and creates a .png
plot(dat$DateTime,dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(dat$DateTime,dat$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue")
points(dat$DateTime,dat$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "", col="red")
legend("topright", legend=c("Sub_metering_1", "Sub_meeting_2", "Sub_meeting_3"), lty = c(1,1,1),col=c("black","blue","red"))
dev.copy(png, file="plot3.png")
dev.off()
