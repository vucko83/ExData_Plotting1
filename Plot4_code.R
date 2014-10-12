power<-read.table("household_power_consumption.txt",header=T,sep=";")
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
subpower <-power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

subpower$Global_active_power <- as.numeric(as.character(subpower$Global_active_power))
subpower<- transform(subpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subpower$Sub_metering_1 <- as.numeric(as.character(subpower$Sub_metering_1))
subpower$Sub_metering_2 <- as.numeric(as.character(subpower$Sub_metering_2))
subpower$Sub_metering_3 <- as.numeric(as.character(subpower$Sub_metering_3))
subpower$Voltage<-as.numeric(as.character(subpower$Voltage))

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow=c(2,2))
#plot frist
plot(subpower$timestamp,subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot second
plot(subpower$timestamp, subpower$Voltage,type="l",xlab="datetime",ylab="Voltage")


#plot third
plot(subpower$timestamp,subpower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subpower$timestamp,subpower$Sub_metering_2, type="l", col="red")
lines(subpower$timestamp,subpower$Sub_metering_3, type="l", col="blue")
legend("topright", bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)

subpower$Global_active_power<-as.numeric(as.character(subpower$Global_active_power))
#plot forth
plot(subpower$timestamp,subpower$Global_active_power,type="l",xlab="datetime",ylab="Global active power")

dev.off()
