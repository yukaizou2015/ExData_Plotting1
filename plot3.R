library(proto, lib.loc = "//R01SFCHSM03.r01.med.va.gov/homedir$/vhasfczouy/My Documents/Coursera/library/")
library(sqldf, lib.loc = "//R01SFCHSM03.r01.med.va.gov/homedir$/vhasfczouy/My Documents/Coursera/library/")

# Import Data
setwd("C:/Users/vhasfczouy/Desktop/Coursera/exdata-data-household_power_consumption")
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep = ";")
setwd("C:/Users/vhasfczouy/Desktop/Coursera/ExData_Plotting1")

date_time <- with(data, paste(Date, Time)) # Paste the Date and Time values together and assign to variable date_time
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S") # Re-format the date and time
data2 <- data.frame(data, date_time) # Make a data frame for data and date_time and assign to variable data2
        Thu <- data2$date_time[1] # Assign the first value of the date_time to variable Thu
        Fri <- data2$date_time[length(data2$date_time)/2] # Assign the middle value of the date_time to variable Fri
        Sat <- data2$date_time[length(data2$date_time)] # Assign the last value of the date_time to variable Sat

png(file = "plot3.png", width = 480, height = 480) # Initialize graphic device for png, set output filename, width, and height
        par(bg = NA) # Make the background transparent
        with(data2, plot(date_time, Sub_metering_1, type = 'l', xaxt = 'n',
                         xlab = NA, ylab = 'Energy sub metering')) # Make the first line plot
        axis(1, at = c(Thu, Fri, Sat), labels = c("Thu", "Fri", "Sat")) # Rename the x axis
        lines(data2$date_time, data2$Sub_metering_2, col = 'red') # Add the second line plot
        lines(data2$date_time, data2$Sub_metering_3, col = 'blue') # Add the third line plot
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty = 1, col = c("black", "red", "blue")) # Make a legend at the topright corner
dev.off() # Turn off the graphic device