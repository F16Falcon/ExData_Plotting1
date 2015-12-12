# Required Libraries
library(sqldf)
library("lubridate", lib.loc="\\\\america/chisomd/Documents/R/R-3.2.2/library")

setwd("C:/Users/Derek/Desktop/Assignment 3/Data")
power<-read.csv.sql("C:/Users/Derek/Desktop/Assignment 3/Data/household_power_consumption.txt",sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")

# Plot 2 PNG
z<-dmy_hms(paste(power$Date, power$Time))
png("plot2.png", width=480, height=480)
with(power,plot(z,Global_active_power, type="l",ann=FALSE))
title(ylab= "Global Active Power (kilowatts)")
dev.off()