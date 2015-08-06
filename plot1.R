library(proto, lib.loc = "//R01SFCHSM03.r01.med.va.gov/homedir$/vhasfczouy/My Documents/Coursera/library/")
library(sqldf, lib.loc = "//R01SFCHSM03.r01.med.va.gov/homedir$/vhasfczouy/My Documents/Coursera/library/")

# Import Data
setwd("C:/Users/vhasfczouy/Desktop/Coursera/exdata-data-household_power_consumption")
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep = ";")
setwd("C:/Users/vhasfczouy/Desktop/Coursera/ExData_Plotting1")

x <- data$Global_active_power # Extract global active power out and assign to a variable x
png("plot1.png", width = 480, height = 480) # Initialize graphic device for png, set output filename, width, and height
        par(bg = NA) # Make the background transparent
        hist(x, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") # Plot the histogram
dev.off() # Turn off the graphic device