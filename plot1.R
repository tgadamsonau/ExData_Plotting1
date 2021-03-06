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


hist(as.numeric(sub$Global_active_power), 
     breaks = 13,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="orangered")

axis(side=2, 
     at=c(0,200,400,600,800,1000,1200), 
     labels = c("0","200","400","600","800","1000","1200"))