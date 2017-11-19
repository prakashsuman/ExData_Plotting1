
library(lubridate)

## read the data for household power consumption as hpc
hpc <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE)
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)
start_date <- ymd("2007-02-01")
end_date <- ymd("2007-02-02")

hpcsub <- hpc[hpc$Date >= start_date & hpc$Date <= end_date,]
        
hpcsub$Global_active_power <- as.numeric(hpcsub$Global_active_power)
hpcsub$Global_active_power_kw <- hpcsub$Global_active_power/1000

hist(hpcsub$Global_active_power_kw,col="red", xlim=c(0,6), xlab="Global Active Power(Kilowatts)", ylab="Frequency", main="Global Active Power")

dev.copy(png, filename="Plot1.png", width=480, height=480)
dev.off()
