########## Define working directory

getwd()
setwd("G:/RExploratory")

########## Loading packages

library(pryr)
library(datasets)

########## Load file

HPC <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")

summary(HPC)

class(HPC$Date)
class(HPC$Time)

str(as.Date)
?as.Date

########## Set date and date subset

HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")

head(HPC)

HPC<-HPC[(HPC$Date=="2007-02-01"|HPC$Date=="2007-02-02"),]

head(HPC)

##### Plot 4

par(mfrow=c(2,2), mar=c(4,5,4,2))

plot(HPC$Global_active_power~as.POSIXct(paste(HPC$Date,HPC$Time)),type="n",ylab="",xlab="")
title(ylab="Global Active Power")
lines(HPC$Global_active_power~as.POSIXct(paste(HPC$Date,HPC$Time)))

plot(HPC$Voltage~as.POSIXct(paste(HPC$Date,HPC$Time)),type="n",xlab="",ylab="")
title(ylab="Voltage",xlab="datetime")
lines(HPC$Voltage~as.POSIXct(paste(HPC$Date,HPC$Time)))

plot(HPC$Sub_metering_1~as.POSIXct(paste(HPC$Date,HPC$Time)),type="n",ylab="",xlab="")
title(ylab="Energy sub metering")
lines(HPC$Sub_metering_1~as.POSIXct(paste(HPC$Date,HPC$Time)),col="black")
lines(HPC$Sub_metering_2~as.POSIXct(paste(HPC$Date,HPC$Time)),col="red")
lines(HPC$Sub_metering_3~as.POSIXct(paste(HPC$Date,HPC$Time)),col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(HPC$Global_reactive_power~as.POSIXct(paste(HPC$Date,HPC$Time)),type="n",xlab="",ylab="")
title(ylab="Global_reactive_power",xlab="datetime")
lines(HPC$Global_reactive_power~as.POSIXct(paste(HPC$Date,HPC$Time)))

dev.copy(png,file="plot4.png")
dev.off()