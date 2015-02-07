#Read data function reads the data
#This is used to read the data in a global variable
# so that we don't need to read the data each time 
#during development. 
source("readData.R")
plot1 <- function () {
  ## Check to see if the household global object is present.
  if(is.null(household)) {
    household <- readData()
  }

 #subset the data with the dates as character.
 subdata = household[household$Date %in% c("1/2/2007", "2/2/2007"), ]
 #Open a png file to create the plot. 
 png(filename = "plot1.png", width = 480, height = 480)
 hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
      ylab = "Frequency", main = "Globacl Active Power")
 dev.off()
}

#Calling the function so that 
# sourcing the file produces the plot. 
plot1()