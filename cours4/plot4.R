##exporting data 
power<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
#change names of columns
names(power)<-tolower(names(power))
power$date<-as.Date(power$date,format="%d/%m/%Y")
#taking requested dates
power<-filter(power,date>="2007-02-01" & date<="2007-02-02")
##adding a new column to show complete date
power$dt<-paste(power$date,power$time)
power$dt<-strptime(power$dt,format="%Y-%m-%d %H:%M:%S")

#transorming variable to numeric
power$global_active_power<-as.numeric(as.character(power$global_active_power))
power$sub_metering_1<-as.numeric(as.character(power$sub_metering_1))
power$sub_metering_2<-as.numeric(as.character(power$sub_metering_2))
power$sub_metering_3<-as.numeric(as.character(power$sub_metering_3))
#plotting data
png(filename = "plot4.png",width = 480,height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(power$dt,power$global_active_power,type = "l",ylab = "Glbal Active Power (kilowatts)",xlab = "")
plot(power$dt,power$voltage,type = "l",ylab = "Voltage",xlab = "datetime")
plot(power$dt,power$sub_metering_1,type="l",main = "",ylab = "Energy sub metring",xlab = "")
lines(power$dt,power$sub_metering_2,type="l",col="red")
lines(power$dt,power$sub_metering_3,type="l",col="blue")
legend("topright", lwd=c(2.5,2.5,2.5), col = c("black","red","blue"), legend = c("sub_metering 1", "sub_metering 2","sub_metering 3"))
plot(power$dt,power$global_reactive_power,type = "l",ylab = "Glbal_reactive_power",xlab = "datetime")
dev.off()