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

##### Plot 3

plot(HPC$Sub_metering_1~as.POSIXct(paste(HPC$Date,HPC$Time)),type="n",ylab="",xlab="")
title(ylab="Energy sub metering")
lines(HPC$Sub_metering_1~as.POSIXct(paste(HPC$Date,HPC$Time)),col="black")
lines(HPC$Sub_metering_2~as.POSIXct(paste(HPC$Date,HPC$Time)),col="red")
lines(HPC$Sub_metering_3~as.POSIXct(paste(HPC$Date,HPC$Time)),col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()