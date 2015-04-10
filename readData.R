## downloads and processes data for the plotting functions

readData <- function (download=FALSE) {
  
  
  if (download) {
    url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    zipfile = "household_power_consumption.zip"
    if (file.exists(zipfile)) {
      file.remove(zipfile)
    }
    
    download.file(url,dest=zipfile);
    unzip(zipfile)
  }
  
  raw <- read.table(file,
                    header=T,sep=";",colClasses=c(rep("character",2),rep("numeric",7)),
                    na.strings="?")
 
  
  raw$Date <- as.Date(raw$Date,"%d/%m/%Y")

  ## filter the dataset
  date1 = as.Date("2007-02-01")
  date2 = as.Date("2007-02-02")
  data <- raw[raw$Date>=date1 & raw$Date<=date2,]
  
  ## add date time
  data$Timestamp <- strptime(paste(as.character(data$Date),data$Time),format="%Y-%m-%d %H:%M:%S")
  raw <- NULL
  data

}

## global stuff

Sys.setlocale(locale="C")
file = "household_power_consumption.txt"
