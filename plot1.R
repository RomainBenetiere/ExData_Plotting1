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

##### Plot 1

hist(HPC$Global_active_power, col=rgb(204/255,30/255,0/255,255/255,names=NULL,1),
     main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

dev.copy(png,file="plot1.png")
dev.off()