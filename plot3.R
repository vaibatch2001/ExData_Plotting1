input <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
input2 <- input[which(input$Date == "1/2/2007" | input$Date == "2/2/2007"),]
DateTime <- paste(input2$Date,input2$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
input2$DateTime <- DateTime 

png('plot3.png')
plot(input2$DateTime,input2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(input2$DateTime,input2$Sub_metering_2,col="red")
lines(input2$DateTime,input2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()