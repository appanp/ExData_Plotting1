# Source for the plot plot3.png from the input file:
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
par(mfrow = c(1, 1))
# DOES NOT WORK
#with(h_pc, plot(Sub_metering_1+Sub_metering_2+Sub_metering_3 ~ h_pc$date_time,
#     data=h_pc, type='l', xlab=''))
plot(h_pc$date_time,h_pc$Sub_metering_1,type='l',xlab='',ylab='Energy Sub-metering',col='black')
lines(h_pc$date_time,h_pc$Sub_metering_2,type='l',col='red')
lines(h_pc$date_time,h_pc$Sub_metering_3,type='l',col='blue')
legend("topright",legend=colnames(h_pc)[7:9],col=c("black","red","blue"),bg='white',lwd=2)
dev.copy(png,file='./figure/plot3.png')
dev.off()