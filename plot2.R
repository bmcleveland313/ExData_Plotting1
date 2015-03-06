test <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?")
test$Date <- as.character(test$Date)
test$Date <- as.Date(test$Date, format = "%d/%m/%Y")
test <- test[which(test$Date == "2007-02-01" | test$Date == "2007-02-02"),]
test$weekday <- weekdays(test$Date, abbreviate = TRUE)
test$datetimechar <- paste(as.character(test$Date),as.character(test$Time), sep = " ")
test$datetime <- strptime(test$datetimechar, format="%Y-%m-%d %H:%M:%S")

#Plot 2

plot(test$datetime,test$Global_active_power, type = "l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()