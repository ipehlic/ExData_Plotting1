
#read the data 
epc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
              check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#read the data for selected dates 
epc_sub <- subset(epc, Date %in% c("1/2/2007","2/2/2007"))
epc_sub$Date <- as.Date(epc_sub$Date, format="%d/%m/%Y")
d_time <- paste(as.Date(epc_sub$Date), epc_sub$Time)
epc_sub$Datetime <- as.POSIXct(d_time)

#create a plot
with(epc_sub, { 
       plot(Sub_metering_1~Datetime, type = "l", 
            xlab="", ylab = "Energey sub metering")
       lines(Sub_metering_2~Datetime, col='red')
       lines(Sub_metering_3~Datetime, col='blue')
})
legend("topright", lwd = 2, lty = 1, cex = 0.70, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#create a PNG file 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()