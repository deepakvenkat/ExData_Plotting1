#Read data function reads the data
#This is used to read the data in a global variable
# so that we don't need to read the data each time 
#during development. 
source("readData.R")
plot1 <- function () {
  if(is.null(household)) {
    household <- readData()
  }

 subdata = household[household$Date %in% c("1/2/2007", "2/2/2007"), ]
 png(filename = "plot1.png", width = 480, height = 480)
 hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
      ylab = "Frequency", main = "Globacl Active Power")
 dev.off()
}