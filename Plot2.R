draw.x.axis <- function()
{
    x_point1 = 1
    x_point2 = nrow(sorted_focus_data)/2
    x_point3 = nrow(sorted_focus_data)
    
    axis(1, at=c(x_point1, x_point2, x_point3), c("Thu", "Fri", "Sat"))
}


sort.data <- function(focus_data)
{
    # calc full time (date + time) so that we could sort by it
    focus_data$Full_time <- strptime(paste(as.character(focus_data$Date), focus_data$Time), 
                                     format="%Y-%m-%d %H:%M:%S")
    
    # sort by time
    focus_data[order(focus_data$Full_time),]
}

create.plot2 <- function()
{
    source("Plot1.R")
    
    focus_data <- get.focus.data()
    
    # convert the columns
    focus_data$Global_active_power <- as.numeric(focus_data$Global_active_power)
    
    # could use day of week to label x axis, but it would not have Saturnday points
    # so I'll just hard-code Thu, Fri and Sat
    # focus_data$Day_of_week <- substring(weekdays(focus_data$Date), 1, 3)
    
    sorted_focus_data <- sort.data(focus_data)
    
    # open device
    png(filename = "plot2.png",
        width = 480, height = 480, units = "px")
    
    # empty plot
    plot(sorted_focus_data$Global_active_power, 
         type="n", xaxt="n", 
         ylab = "Global Active Power (kilowatts)", xlab="")
    
    # graph
    lines(sorted_focus_data$Global_active_power)
    
    # x axis
    draw.x.axis()
    
    dev.off()
}