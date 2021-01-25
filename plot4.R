# Configure environment
rm(list=ls())
setwd("C:/Users/Timo/Desktop/Prog/Coursera/Exploratory Data Analysis/Woche 1/Datasets")

# Importing the data
data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Convert the Date variable to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Create subset
subset <- data[data$Date=="2007/02/01"|data$Date=="2007/02/02",]

# Create 2x2 panel plot
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
x <- strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S")
y <- subset$Global_active_power
plot(x,y,type="l",xlab="",ylab="Global Active Power")
x <- strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S")
y <- subset$Voltage
plot(x,y,type="l",xlab="datetime",ylab="Voltage")
x <- strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S")
plot(x,subset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(x,subset$Sub_metering_1,col="black")
lines(x,subset$Sub_metering_2,col="red")
lines(x,subset$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
x <- strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S")
y <- subset$Global_reactive_power
plot(x,y,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()