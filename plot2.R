## Read input data and filter by required dates
input <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
input2 <- input[which(input$Date == "1/2/2007" | input$Date == "2/2/2007"),]

## Add DateTime to the filtered input
DateTime <- paste(input2$Date,input2$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
input2$DateTime <- DateTime 

## Generate the plot and export to PNG
png('plot2.png')
plot(input2$DateTime, input2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()