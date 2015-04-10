source("readData.R")

## Creates plot2
##   call with toFile = FALSE to send to screen or to compose within another device

plot2 <- function (data = NULL, toFile=T) {
  
  if (is.null(data)) {
    data <- readData (!file.exists(file))
  }
  
  if (toFile) {
     png ("plot2.png",width=480,height=480)
  }
  
  plot(data$Timestamp, data$Global_active_power,
       xlab="",
       ylab="Global Active Power (kilowatts)", type="l")
  
  if (toFile) {
    dev.off()
  }
}

