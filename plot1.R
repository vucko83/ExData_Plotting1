power<-read.table("household_power_consumption.txt",header=T,sep=";",na = "?")
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
subpower <-power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

subpower$Global_active_power <- as.numeric(as.character(subpower$Global_active_power))

subpower<- transform(subpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png",width = 480, height = 480,units = "px", bg = "transparent")

hist(subpower$Global_active_power, col="red",xlab="Global Active Power(kilowatts)", main="Global Active Power")

dev.off()


