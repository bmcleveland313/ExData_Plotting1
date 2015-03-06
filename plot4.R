test <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?")
test$Date <- as.character(test$Date)
test$Date <- as.Date(test$Date, format = "%d/%m/%Y")
test <- test[which(test$Date == "2007-02-01" | test$Date == "2007-02-02"),]
test$weekday <- weekdays(test$Date, abbreviate = TRUE)
test$datetimechar <- paste(as.character(test$Date),as.character(test$Time), sep = " ")
test$datetime <- strptime(test$datetimechar, format="%Y-%m-%d %H:%M:%S")

#Plot 4
par(mfrow = c(2, 2))

plot(test$datetime,test$Global_active_power, type = "l", xlab="",ylab = "Global Active Power (kilowatts)")

plot(test$datetime,test$Voltage, type = "l", xlab = "datetime",ylab = "Voltage")

with(test,plot(datetime,Sub_metering_1,xlab="", ylab = "Energy sub metering",type = "l"))
lines(test$datetime,test$Sub_metering_2, col = "red")
lines(test$datetime,test$Sub_metering_3, col = "blue")
legend("topright", bty = "n",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(test$datetime,test$Global_reactive_power, type = "l", xlab="datetime",ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off()