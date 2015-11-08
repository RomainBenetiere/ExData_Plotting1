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

##### Plot 2

plot(HPC$Global_active_power~as.POSIXct(paste(HPC$Date,HPC$Time)),type="n",ylab="",xlab="")
title(ylab="Global Active Power (kilowatts)")
lines(HPC$Global_active_power~as.POSIXct(paste(HPC$Date,HPC$Time)))

dev.copy(png,file="plot2.png")
dev.off()
