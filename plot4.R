setwd("~/Desktop/Coursera/4_explore/Project 1")
dat <- read.table("household_power_consumption.txt", sep = ";", nrows = 500, na.strings = "?", skip = 0, stringsAsFactors=FALSE)
colnames(dat) <- dat[1,]
dat <- dat[-1,]
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$DT <- strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")
d1 <- dat[dat$Date %in% c(as.Date("16/12/2006", "%d/%m/%Y"), as.Date("17/12/2006", "%d/%m/%Y")),]

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with (d1, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with (d1, plot(DT, Voltage, type = "l", xlab = "", ylab = "Voltage"))
with (d1, {
  plot(DT, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(DT, Sub_metering_2, type = "l", col = "red") 
  lines(DT, Sub_metering_3, type = "l", col = "blue") 
})
legend("topright", lty = 1 , col = c("black", "red", "blue"), bty = "n", legend = c("Sub_mtering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side=2, at=seq(0,30,b=10))
with (d1, plot(DT, Global_reactive_power, type = "l", xlab = "", ylab = "Global_reacctive_power"))
dev.off()