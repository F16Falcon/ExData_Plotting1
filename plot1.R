# Required Libraries
library(sqldf)

setwd("C:/Users/Derek/Desktop/Assignment 3/Data")
power<-read.csv.sql("C:/Users/Derek/Desktop/Assignment 3/Data/household_power_consumption.txt",sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")

# Plot 1 PNG
png("plot1.png", width=480, height=480)
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
