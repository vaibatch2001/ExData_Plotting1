## Read input data and filter by required dates
input <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
input2 <- input[which(input$Date == "1/2/2007" | input$Date == "2/2/2007"),]

## Add DateTime to the filtered input
DateTime <- paste(input2$Date,input2$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
input2$DateTime <- DateTime 

## Generate the plots and export to PNG
png('plot4.png')
par(mfrow=c(2,2))
plot(input2$DateTime, input2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(input2$DateTime, input2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(input2$DateTime,input2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(input2$DateTime,input2$Sub_metering_2,col="red")
lines(input2$DateTime,input2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), bty = "n")
plot(input2$DateTime, input2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()