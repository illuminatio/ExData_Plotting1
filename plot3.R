if (!dir.exists("~/exdata015_exdark")) {
    dir.create("~/exdata015_exdark")
}
setwd("~/exdata015_exdark")
#Created temp folder for the task

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "consumption.zip", method = "curl")
cons <- read.table(unz("consumption.zip", "household_power_consumption.txt"), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

df <-cons[cons$Date == "1/2/2007" | cons$Date == "2/2/2007", ] 
df$POSIXDate <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(df$POSIXDate, df$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering", col = "black")
lines(df$POSIXDate, df$Sub_metering_2, col = "red")
lines(df$POSIXDate, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "blue", "red"))
dev.off()
