# Required Libraries
library(sqldf)
library("lubridate", lib.loc="\\\\america/chisomd/Documents/R/R-3.2.2/library")

setwd("C:/Users/Derek/Desktop/Assignment 3/Data")
power<-read.csv.sql("C:/Users/Derek/Desktop/Assignment 3/Data/household_power_consumption.txt",sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")

# Plot 4 PNG
z<-dmy_hms(paste(power$Date, power$Time))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar= c(4,4,4,2))

with(power,plot(z,Global_active_power, type="l",ann=FALSE))
title(ylab= "Global Active Power")

with(power,plot(z,Voltage, type="l",ann=FALSE))
title(ylab= "Voltage")
title(xlab= "datetime")

with(power,plot(z,Sub_metering_1, type="l",ann=FALSE))
lines(z,power$Sub_metering_2, col="red")
lines(z,power$Sub_metering_3, col="blue")
title(ylab= "Energy sub metering")
legend("topright", bty= "n", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(power,plot(z,Global_reactive_power, type="l",ann=FALSE))
title(ylab= "Global_reactive_power")
title(xlab= "datetime")
dev.off()