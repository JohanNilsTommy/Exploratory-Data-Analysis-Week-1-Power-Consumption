household_power_consumption <- read.csv("~/R/Exploratory Data Analysis/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings="?")

# load csv not as factors, ; separator and ?=NA

power_subset <- subset(household_power_consumption, Date == "1/2/2007"| Date == "2/2/2007")

# sub set data

power_subset$nGlobal_active_power<-as.numeric(power_subset$Global_active_power) 

# active power as numeric

power_subset$nSub_metering_3<-as.numeric(power_subset$Sub_metering_3) 

# nSub as numeric

par(mfrow = c(1,1),mar=c(4,4,4,4))

power_subset$dDate <- as.Date(power_subset$Date, format="%d/%m/%Y")

# Date as date format

power_subset$DateTime <- paste(as.Date(power_subset$dDate), power_subset$Time)

#  concatonate date & time

power_subset$DateTime2 <- as.POSIXct(power_subset$DateTime)

# date & time concatonate as date time format 

plot(power_subset$Sub_metering_1 ~ power_subset$DateTime2, ylab = "Energy sub metering",xlab="", type = "l")
lines(power_subset$Sub_metering_2 ~ power_subset$DateTime2, col = 'Red')
lines(power_subset$Sub_metering_3 ~ power_subset$DateTime2, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# line plot datetime with sub_metering in subset inc legend