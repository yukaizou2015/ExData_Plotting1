library(proto, lib.loc = "//R01SFCHSM03.r01.med.va.gov/homedir$/vhasfczouy/My Documents/Coursera/library/")
library(sqldf, lib.loc = "//R01SFCHSM03.r01.med.va.gov/homedir$/vhasfczouy/My Documents/Coursera/library/")

# Import Data
setwd("C:/Users/vhasfczouy/Desktop/Coursera/exdata-data-household_power_consumption")
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep = ";")
setwd("C:/Users/vhasfczouy/Desktop/Coursera/ExData_Plotting1")

date_time <- with(data, paste(Date, Time)) # Paste the Date and Time values together and assign to variable date_time
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S") # Re-format the date and time
data2 <- data.frame(data, date_time) # Make a data frame for data and date_time and assign to variable data2

png(file = "plot2.png", width = 480, height = 480) # Initialize graphic device for png, set output filename, width, and height
        par(bg = NA) # Make the background transparent
        plot(data2$date_time, data2$Global_active_power, type = "l", 
             xlab = NA, ylab = "Global Active Power (kilowatts)", xaxt = 'n') # Plot the line graph for the change of global active power by date
        axis(1, at = c(data2$date_time[1],data2$date_time[length(data2$date_time)/2],
                       data2$date_time[length(data2$date_time)]), labels = c("Thu", "Fri", "Sat")) # Rename the x axis
dev.off() # Turn off the graphic device