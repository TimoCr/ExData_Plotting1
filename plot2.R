# Configure environment
rm(list=ls())
setwd("C:/Users/Timo/Desktop/Prog/Coursera/Exploratory Data Analysis/Woche 1/Datasets")

# Importing the data
data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Convert the Date variable to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Create subset
subset <- data[data$Date=="2007/02/01"|data$Date=="2007/02/02",]

# Create lineplot
png(filename="plot2.png", width=480, height=480)
x <- strptime(paste(subset$Date,subset$Time), "%Y-%m-%d %H:%M:%S")
y <- subset$Global_active_power
plot(x,y,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
