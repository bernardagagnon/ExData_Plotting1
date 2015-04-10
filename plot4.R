source("readData.R")

## Creates plot4
##   call with toFile = FALSE to send to screen or to compose within another device

plot4 <- function (data = NULL, toFile=T) {
  
  if (is.null(data)) {
    data <- readData (!file.exists(file))
  }
  
  if (toFile) {
    png ("plot4.png",width=480,height=480)
  }
  
  par(mfcol=c(2,2))
  
  plot2(data,F)
  plot3(data,F,legendbty="n")
  
  
  plot(data$Timestamp, data$Voltage,
       xlab="datetime",
       ylab="Voltage", type="l")
  
  
  plot(data$Timestamp, data$Global_reactive_power,
       xlab="datetime",
       ylab="Global_reactive_power", type="l")
  
  if (toFile) {
    dev.off()
  }
}
