if (!dir.exists("~/exdata015_exdark")) {
    dir.create("~/exdata015_exdark")
}
setwd("~/exdata015_exdark")
#Created temp folder for the task

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "consumption.zip", method = "curl")
cons <- read.table(unz("consumption.zip", "household_power_consumption.txt"), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

df <-cons[cons$Date == "1/2/2007" | cons$Date == "2/2/2007", ]

png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 2)
dev.off()
