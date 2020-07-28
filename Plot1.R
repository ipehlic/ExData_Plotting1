
#read the data 
epc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
              check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#read the data for selected dates 
epc_sub <- subset(epc, Date %in% c("1/2/2007","2/2/2007"))
epc_sub$Date <- as.Date(epc_sub$Date, format="%d/%m/%Y")

#create a plot
hist(epc_sub$Global_active_power, main="Global Active Power", col = 'red',
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

#create a PNG file 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()