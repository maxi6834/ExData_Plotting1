

create.plot3 <- function()
{
    source("Plot1.R")
    source("Plot2.R")
    
    focus_data <- get.focus.data()
    
    # convert the columns
    focus_data$Sub_metering_1 <- as.numeric(focus_data$Sub_metering_1)
    focus_data$Sub_metering_2 <- as.numeric(focus_data$Sub_metering_2)
    focus_data$Sub_metering_3 <- as.numeric(focus_data$Sub_metering_3)
    
    
    # sort by time
    sorted_focus_data <- sort.data(focus_data)
    
    
    # open device
    png(filename = "plot3.png",
        width = 480, height = 480, units = "px")
    
    # empty plot
    plot(sorted_focus_data$Sub_metering_1, 
         type="n", xaxt="n", ylab = "Energy sub metering", xlab="")
    
    # graph
    lines(sorted_focus_data$Sub_metering_1, col="black")
    lines(sorted_focus_data$Sub_metering_2, col="red")
    lines(sorted_focus_data$Sub_metering_3, col="blue")
    
    # x axis
    draw.x.axis()
    
    legend(x="topright",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=c(1, 1, 1),
           lwd=c(2, 2, 2),
           col=c("black", "red", "blue")) 
    
    dev.off()
}