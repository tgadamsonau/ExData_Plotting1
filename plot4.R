url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


temp <- tempfile()
download.file(url,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), 
                   sep=";", 
                   header=T,
                   stringsAsFactors = F)
unlink(temp)



data$Date<-as.Date(data$Date, "%d/%m/%Y")

sub<-subset(data, Date==as.Date("01/02/2007", "%d/%m/%Y")|Date==as.Date("02/02/2007", "%d/%m/%Y"))

sub$TimeDate<- paste(sub$Date, sub$Time, sep=" ")



par(mfrow=c(2,2))


plot(y=sub$Global_active_power, 
     x=sub$TimeDate, 
     type="l", 
     xlab="", 
     ylab="Global active power (kilowatts)")

plot(y=sub$Voltage, 
     x=sub$TimeDate, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")



plot(y=sub$Sub_metering_1,
     x=sub$TimeDate,
     type="l",
     xlab="", 
     ylab="Energy sub metering")
lines(y=sub$Sub_metering_2,
      x=sub$TimeDate,
      col="red")
lines(y=sub$Sub_metering_3,
      x=sub$TimeDate,
      col="blue")
legend(x="topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex=0.8, bty = "n")


plot(y=sub$Global_reactive_power, 
     x=sub$TimeDate, 
     type="l", 
     xlab="datetime", 
     ylab="Global reactive power")
