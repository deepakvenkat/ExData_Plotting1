#Read data function reads the data
#This is used to read the data in a global variable
# so that we don't need to read the data each time 
#during development. 
source("readData.R")
plot2 <- function () {
  if(is.null(household)) {
    household <- readData()
  }
  #Subset the data as character.
  subdata <- household[household$Date %in% c("1/2/2007", "2/2/2007"), ]
  #Create a new col with a POSIXlt class
  # inorder to make use of the weekdays options provided by it. 
  subdata$DateNTime <- as.POSIXlt(paste(as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time, sep=" "))
  png(filename = "plot2.png", width = 480, height = 480)
  #Plot with type = l for the lines. 
  plot(subdata$DateNTime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}

#Calling the function so that 
# sourcing the file produces the plot. 
plot2()