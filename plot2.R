setwd("~/Documents/DataScience/4_ExploratoryDataAnalysis")

# The first two rows of code will read in a text file called 'household_power_consumption' to the dataset 'dat'
dat <- read.table('household_power_consumption.txt',header=T,sep=";", na.strings = "?", skip = 66636, nrows = 2880, 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(dat) = c("Cdate", "Ctime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Creates a new varibale 'DateTime' by converting and combining the date and time variables
dat$DateTime <- strptime(paste(dat$Cdate,dat$Ctime), format = "%d/%m/%Y %H:%M:%S")

# Plots a line graph of Global_active_power and prints to a .png
plot(dat$DateTime,dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png")
dev.off()