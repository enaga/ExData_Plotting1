
frmDt <- as.Date("2007-02-01")
toDt <- as.Date("2007-02-03")
dt <- read.table(".//ExploratoryDataAnalysis_Project1//exdata-data-household_power_consumption//household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

dt <- within(dt,DateTime <- strptime(paste0(Date,Time), "%d/%m/%Y %H:%M:%S"))
subdt <- subset(dt,as.Date(DateTime) >= frmDt & as.Date(DateTime) < toDt)
subdt <- within(subdt,WeekDay <- weekdays(as.Date(Date)))

png(filename = "plot4.png",width = 480, height = 480,units = "px")

par(mfrow = c(2,2))
with(subdt,{
  plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(DateTime,Voltage,xlab="datetime",type="l")

  plot(DateTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2,type="l",col="red")
  lines(DateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",bty="n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime,Global_reactive_power,xlab="datetime",type="l")
})

dev.off()
