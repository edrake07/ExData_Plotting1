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
plot(dat3[,2],dat3[,3], type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png")
dev.off()
