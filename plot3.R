test <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?")
test$Date <- as.character(test$Date)
test$Date <- as.Date(test$Date, format = "%d/%m/%Y")
test <- test[which(test$Date == "2007-02-01" | test$Date == "2007-02-02"),]
test$weekday <- weekdays(test$Date, abbreviate = TRUE)
test$datetimechar <- paste(as.character(test$Date),as.character(test$Time), sep = " ")
test$datetime <- strptime(test$datetimechar, format="%Y-%m-%d %H:%M:%S")

#Plot 3

png("plot3.png")
with(test,plot(datetime,Sub_metering_1,xlab="", ylab = "Energy sub metering",type = "l"))
lines(test$datetime,test$Sub_metering_2, col = "red")
lines(test$datetime,test$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## Copy my plot to a PNG file
dev.off()