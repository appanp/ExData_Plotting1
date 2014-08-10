# Source for the plot plot4.png from the input file:
# household_power_consumption.txt
# Pre-processing of the input file done using Unix commands:
# head -n 1 household_power_consumption.txt >hh_pc_subset.txt
# grep -E '^[12]/2/2007;' household_power_consumption.txt >>hh_pc_subset.txt
# 
h_pc <- read.table("./data/hh_pc_subset.txt", 
                   comment.char = "#", 
                   header = T, 
                   sep = ";", na.strings = "?")
levels(h_pc$Date)[levels(h_pc$Date)=="1/2/2007"] <- "01/02/2007"
levels(h_pc$Date)[levels(h_pc$Date)=="2/2/2007"] <- "02/02/2007"
h_pc$date_time <- strptime(paste(h_pc$Date,h_pc$Time), 
                           "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
plot(h_pc$date_time,h_pc$Global_active_power,type='l',
     xlab='',ylab='Global Active Power (kilowatts)')
plot(h_pc$date_time,h_pc$Voltage,type='l',xlab='datetime',ylab='Voltage')
# Plot the 3rd multi-line graph
plot(h_pc$date_time,h_pc$Sub_metering_1,type='l',xlab='',ylab='',col='black')
lines(h_pc$date_time,h_pc$Sub_metering_2,type='l',xlab='',ylab='',col='red')
lines(h_pc$date_time,h_pc$Sub_metering_3,type='l',xlab='',ylab='',col='blue')
legend("topright",legend=colnames(h_pc)[7:9],col=c("black","red","blue"),bg='white')
plot(h_pc$date_time,h_pc$Global_reactive_power,type='l',xlab='datetime',ylab='Global Reactive Power')
dev.copy(png,file='./figure/plot4.png')
dev.off()