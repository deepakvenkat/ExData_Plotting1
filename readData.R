readData <- function () {
  data <- read.table("household_power_consumption.txt", header = TRUE, 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.string="?") 
}