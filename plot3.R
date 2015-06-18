library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep = ";")
date_time <- with(data, paste(Date, Time))
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data <- data.frame(data, date_time)
Thu <- data$date_time[1]
Fri <- data$date_time[length(data$date_time)/2]
Sat <- data$date_time[length(data$date_time)]

png(file = "plot3.png")
with(data, plot(date_time, Sub_metering_1, type = 'l', col = 'gray', xaxt = 'n', xlab = NA, ylab = 'Energy sub metering', bg = NA))
lines(data$date_time, data$Sub_metering_2, col = 'red')
lines(data$date_time, data$Sub_metering_3, col = 'blue')
axis(1, at = c(Thu, Fri, Sat), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7, pt.cex = 1, lty = 1, col = c("gray", "red", "blue"))
dev.off()