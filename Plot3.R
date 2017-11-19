library(lubridate)

## read the data for household power consumption as hpc
hpc <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE)
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)
start_date <- ymd("2007-02-01")
end_date <- ymd("2007-02-02")

hpcsub <- hpc[hpc$Date >= start_date & hpc$Date <= end_date,]
hpcsub$datetime <- with(hpcsub,hpcsub$Date+hpcsub$Time)

hpcsub$wkday <- wday(hpcsub$Date,label=TRUE,abbr=TRUE)

plot(hpcsub$datetime, hpcsub$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(hpcsub$datetime, hpcsub$Sub_metering_2, type="l", col="red")
lines(hpcsub$datetime, hpcsub$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, filename="Plot3.png", width=480, height=480)
dev.off()
