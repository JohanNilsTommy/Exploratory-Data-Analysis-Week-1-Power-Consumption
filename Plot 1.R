household_power_consumption <- read.csv("~/R/Exploratory Data Analysis/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings="?")

# load csv not as factors, ; separator and ?=NA

power_subset <- subset(household_power_consumption, Date == "1/2/2007"| Date == "2/2/2007")

# sub set data

power_subset$nGlobal_active_power<-as.numeric(power_subset$Global_active_power) 

# active power as numeric

power_subset$nSub_metering_3<-as.numeric(power_subset$Sub_metering_3) 

# nSub as numeric

par(mfrow = c(1,1),mar=c(4,4,4,4))

hist(power_subset$nGlobal_active_power, col = "red", main = "Global Active Power", breaks=20, ylab="Frequency", xlab="Global Active Power (kilowatts)")

#  histogram on active power in subset