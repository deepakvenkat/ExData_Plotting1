#Read data function reads the data
#This is used to read the data in a global variable
# so that we don't need to read the data each time 
#during development. 
source("readData.R")
plot4 <- function () {
  if(is.null(household)) {
    household <- readData()
  }

  subdata <- household[household$Date %in% c("1/2/2007", "2/2/2007"), ]
  subdata$DateNTime <- as.POSIXlt(paste(as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time, sep=" "))
  #Slightly bigger png file in order to fit all the four graphs. 
  png(filename = "plot4.png", width = 960, height = 960)
  par(mfrow = c(2, 2))
  #Top Left : Global active power
  plot(subdata$DateNTime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  #Top Right : Voltage
  plot(subdata$DateNTime, subdata$Voltage, type="l", xlab="", ylab="Voltage")
  #Bottom Left : Sub Metering
  plot(subdata$DateNTime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering", col = "black")
  lines(subdata$DateNTime, subdata$Sub_metering_2, col = "red")
  lines(subdata$DateNTime, subdata$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), col = c("black", "red", "blue"), lwd = 1)
  #Bottom Right : Global Reactive Power
  plot(subdata$DateNTime, subdata$Global_reactive_power, type="l", xlab="", ylab="Global_Reactive_Power")
  dev.off()
} 