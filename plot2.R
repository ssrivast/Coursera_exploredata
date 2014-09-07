setwd("~/Desktop/Coursera/4_explore/Project 1")
dat <- read.table("household_power_consumption.txt", sep = ";", nrows = 500, na.strings = "?", skip = 0, stringsAsFactors=FALSE)
colnames(dat) <- dat[1,]
dat <- dat[-1,]
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$DT <- strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")
d1 <- dat[dat$Date %in% c(as.Date("16/12/2006", "%d/%m/%Y"), as.Date("17/12/2006", "%d/%m/%Y")),]

png(file = "plot2.png", width = 480, height = 480)
with (d1, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()