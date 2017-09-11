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
png(filename = "plot2.png",width = 480,height = 480)
plot(power$dt,power$global_active_power,type = "l",ylab = "Glbal Active Power (kilowatts)",xlab = "")
dev.off()

