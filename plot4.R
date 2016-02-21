setwd("~/Documents/DataScience/4_ExploratoryDataAnalysis")

dat <- read.table('household_power_consumption.txt',header=T,sep=";", stringsAsFactors = F,na.strings = "?")
dat[,1] <- as.Date(dat[,1],'%d/%m/%Y') 
dat2 <- dat[dat[,1]>="2007-02-01",]
dat2 <- dat2[dat2[,1]<="2007-02-02",] 
# dat2[,2] <- format(strptime(dat2[,2],format = "%H:%M:%S", tz=""),"%T")
dat_test <- strptime(dat2[,2],format = "%H:%M:%S", tz="")
dat_test <- as.data.frame(dat_test)
dat2[,2] <- dat_test

dat3 <- dat2[order(dat2[,2]),]
dat3 <- dat3[1:1440,]

par(mfrow=c(2,2))
plot(dat3[,2],dat3[,3], type = "l", ylab = "Global Active Power", xlab = "")
plot(dat3[,2],dat3$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
plot(dat3[,2],dat3$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(dat3[,2],dat3$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue")
points(dat3[,2],dat3$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "", col="red")
legend("topright", legend=c("Sub_metering_1", "Sub_meeting_2", "Sub_meeting_3"), lty = c(1,1,1),col=c("black","blue","red"), cex=0.2)
plot(dat3[,2],dat3[,4],xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.copy(png, file="plot4.png")
dev.off()