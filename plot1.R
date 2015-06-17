library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep = ";")
x <- data$Global_active_power
png(file = "plot1.png")
hist(x, main = "Global Active Power", xlab = "global Active Power (kilowatts)", col = "red", bg = "transparent")
dev.off()