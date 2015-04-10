source("readData.R")

## Creates plot3
##   call with toFile = FALSE to send to screen or to compose within another device

plot3 <- function (data = NULL, toFile=T, legendbty="o") {
  
  if (is.null(data)) {
    data <- readData (!file.exists(file))
  }
  
  if (toFile) {
     png ("plot3.png",width=480,height=480)
  }
  
  plot(data$Timestamp, data$Sub_metering_1,
       xlab="",
       ylab="Energy sub metering", type="l")

  lines(data$Timestamp, data$Sub_metering_2, col="red")
  lines(data$Timestamp, data$Sub_metering_3, col="blue")
  
  legend ("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      col=c("black","red","blue"), lty=1,
                      bty=legendbty)
  
  if (toFile) {
     dev.off()
  }
}

