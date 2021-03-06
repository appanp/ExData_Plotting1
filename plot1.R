# Source for the plot plot1.png from the input file:
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
                           "%m/%d/%Y %H:%M:%S")
hist(h_pc$Global_active_power,
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)',
     col='red')
dev.copy(png,file='./figure/plot1.png')
dev.off()

