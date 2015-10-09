
## Opens the data and subsets it to the required two dates
get.focus.data <- function()
{
    data <- read.table("C:\\Coursera\\household_power_consumption.txt", colClasses = "character" , header=TRUE, sep=";", na.strings="?")
    
    
    # subset by date
    date_col = 1
    data[,date_col] <- as.Date(data[,date_col], format="%d/%m/%Y")
    
    day1 = as.Date("2007-02-01")
    day2 = as.Date("2007-02-02")
    
    
    data[(data[,date_col] == day1) | (data[,date_col] == day2), ]
}

## Creates Plot1 from Course Project 1
create.plot1 <- function(){

    focus_data <- get.focus.data()
    
    # convert to numeric
    focus_data$Global_active_power <- as.numeric(focus_data$Global_active_power)
    
    png(filename = "plot1.png",
        width = 480, height = 480, units = "px")
    
    hist(focus_data$Global_active_power, col="red", 
         main="Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    
    dev.off()
}
