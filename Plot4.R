

create.plot4<- function()
{
    source("Plot1.R")
    source("Plot2.R")
    
    focus_data <- get.focus.data()
    
    # convert the columns
    focus_data$Global_active_power <- as.numeric(focus_data$Global_active_power)
    focus_data$Voltage <- as.numeric(focus_data$Voltage)
    focus_data$Sub_metering_1 <- as.numeric(focus_data$Sub_metering_1)
    focus_data$Sub_metering_2 <- as.numeric(focus_data$Sub_metering_2)
    focus_data$Sub_metering_3 <- as.numeric(focus_data$Sub_metering_3)
    focus_data$Global_reactive_power <- as.numeric(focus_data$Global_reactive_power)
    

    # sort by time
    sorted_focus_data <- sort.data(focus_data)
    
    
    # open device
    png(filename = "plot4.png",
       width = 480, height = 480, units = "px")
    
    par(mfrow=c(2,2))
    
    
    # -----------------Global Active Power-----------
    plot(sorted_focus_data$Global_active_power, 
         type="n", xaxt="n", ylab = "Global Active Power", xlab="")
    lines(sorted_focus_data$Global_active_power, col="black")
    draw.x.axis()
    
    # -----------------Voltage------------------------
    plot(sorted_focus_data$Voltage, 
         type="n", xaxt="n", ylab = "Voltage", xlab="datetime")
    lines(sorted_focus_data$Voltage, col="black")
    draw.x.axis()
    
    
    #  -----------------Submetering-------------------
    # empty plot
    plot(sorted_focus_data$Sub_metering_1, 
         type="n", xaxt="n", ylab = "Energy sub metering", xlab="")
    
    # graph
    lines(sorted_focus_data$Sub_metering_1, col="black")
    lines(sorted_focus_data$Sub_metering_2, col="red")
    lines(sorted_focus_data$Sub_metering_3, col="blue")
    
    # x axis
    draw.x.axis()
    
    legend(x=1000, y=40,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n",
           lty=c(1, 1, 1),
           lwd=c(2, 2, 2),
           col=c("black", "red", "blue"),
           y.intersp=0.9,
           pt.cex=1,
           cex=0.9
           ) 
    
    # -----------------Reactive------------------------
    plot(sorted_focus_data$Global_reactive_power, 
         type="n", xaxt="n", 
         ylab = "Global_reactive_power", xlab="datetime")
    lines(sorted_focus_data$Global_reactive_power, col="black")
    draw.x.axis()
    
    dev.off()
}