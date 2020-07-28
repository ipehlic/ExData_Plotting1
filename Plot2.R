
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
       plot(Global_active_power~Datetime, type="l",
            xlab="", ylab="Global Active Power (kilowatts)")
})

#create a PNG file 
png("plot2.png", width=480, height=480)
dev.off()