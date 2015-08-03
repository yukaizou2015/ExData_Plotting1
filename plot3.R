library(sqldf)
setwd("C:/Users/vhasfczouy/Desktop/Coursera/exdata-data-household_power_consumption")
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep = ";")
setwd("C:/Users/vhasfczouy/Desktop/Coursera/ExData_Plotting1")

date_time <- with(data, paste(Date, Time))
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data2 <- data.frame(data, date_time)
Thu <- data2$date_time[1]
Fri <- data2$date_time[length(data2$date_time)/2]
Sat <- data2$date_time[length(data2$date_time)]

png(file = "plot3.png", width = 480, height = 480)
with(data2, plot(date_time, Sub_metering_1, type = 'l', xaxt = 'n', xlab = NA, ylab = 'Energy sub metering', bg = NA))
lines(data2$date_time, data2$Sub_metering_2, col = 'red')
lines(data2$date_time, data2$Sub_metering_3, col = 'blue')
axis(1, at = c(Thu, Fri, Sat), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()