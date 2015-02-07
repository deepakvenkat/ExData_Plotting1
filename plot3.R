#Read data function reads the data
#This is used to read the data in a global variable
# so that we don't need to read the data each time 
#during development. 
source("readData.R")
plot3 <- function () {
  if(is.null(household)) {
    household <- readData()
  }
  
  subdata <- household[household$Date %in% c("1/2/2007", "2/2/2007"), ]
  subdata$DateNTime <- as.POSIXlt(paste(as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time, sep=" "))
  
  png(filename = "plot3.png", width = 480, height = 480)
  #Adding sub metering 1 as the first line
  plot(subdata$DateNTime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering", col = "black")
  #Adding more lines to the plot
  lines(subdata$DateNTime, subdata$Sub_metering_2, col = "red")
  lines(subdata$DateNTime, subdata$Sub_metering_3, col = "blue")
  #Add legend to the plot. 
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), col = c("black", "red", "blue"), lwd = 1)
  dev.off()
} 

#Calling the function so that 
# sourcing the file produces the plot. 
plot3()