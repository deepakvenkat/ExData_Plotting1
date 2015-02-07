#Read data function reads the data
#This is used to read the data in a global variable
# so that we don't need to read the data each time 
#during development. 
source("readData.R")
plot2 <- function () {
  if(is.null(household)) {
    household <- readData()
  }
  
  subdata <- household[household$Date %in% c("1/2/2007", "2/2/2007"), ]
  subdata$DateNTime <- as.POSIXlt(paste(as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time, sep=" "))
  png(filename = "plot2.png", width = 480, height = 480)
  plot(subdata$DateNTime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}