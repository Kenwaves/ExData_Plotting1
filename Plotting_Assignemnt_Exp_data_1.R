rfile <- "household_power_consumption.txt"
feb2 <- "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')"
data <- read.csv.sql(rfile, sql = feb2, sep = ";", header = TRUE)
closeAllConnections()

data$DateTime <- strptime(paste(data$Date,data$Time), format = 
                              "%d/%m/%Y %H:%M:%S")

##Plot 1
hist(data$Global_active_power, col = "red", main = 
         "Global Active Power", xlab = 
         "Global Active Power (kilowatts)", ylim = c(1,1200))
dev.copy(png,file = "plot1.png", width = 480, height = 480)
dev.off()

##Plot2
plot(data$DateTime,data$Global_active_power,type = 'l', xlab ="",
     ylab = "Global Active Power(kilowatts)", xaxt = "n")
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))
dev.copy(png,file = "plot2.png", width = 480, height = 480)
dev.off()

##Plot3
plot(data$DateTime,data$Sub_metering_1, type = "l",  xlab ="",
     ylab = "Energy sub metering", xaxt = "n")
legend("topright", legend = 
           c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black","red", "blue"), lty = 1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
axis(1,at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))
dev.copy(png,file = "plot3.png", width = 480, height = 480)
dev.off()

##Plot4
par(mfrow =c(2,2))
plot(data$DateTime,data$Global_active_power,type = "l", xlab = "",
     ylab = "Global Active Power", xaxt = "n")
axis(1,at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))

plot(data$DateTime,data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage", xaxt = "n")
axis(1,at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
     labels = c("Thu", "Fri", "Sat"))

plot(data$DateTime,data$Sub_metering_1, type = "l",  xlab ="", 
     ylab = "Energy sub metering", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",legend = 
           c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black","red", "blue"), lty = 1,bty = "n", cex = 0.5)

plot(data$DateTime,data$Global_reactive_power, type = "l", xlab = 
         "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(1,at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
     labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()