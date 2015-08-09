
frmDt <- as.Date("2007-02-01")
toDt <- as.Date("2007-02-03")
dt <- read.table(".//ExploratoryDataAnalysis_Project1//exdata-data-household_power_consumption//household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

dt <- within(dt,DateTime <- strptime(paste0(Date,Time), "%d/%m/%Y %H:%M:%S"))
subdt <- subset(dt,as.Date(DateTime) >= frmDt & as.Date(DateTime) < toDt)
subdt <- within(subdt,WeekDay <- weekdays(as.Date(Date)))

png(filename = "plot1.png",width = 480, height = 480,units = "px")

hist(subdt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
