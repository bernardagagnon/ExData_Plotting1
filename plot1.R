## Creates plot1
##   call with toFile = FALSE to send to screen or to compose within another device

source("readData.R")

plot1 <- function (data = NULL, toFile=T) {
  
  if (is.null(data)) {
    data <- readData (!file.exists(file))
  }
  
  if (toFile) {
    png ("plot1.png",width=480,height=480)
  }
  
  hist(data$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)", col="red")
  
  if (toFile) {
    dev.off()
  }
}

