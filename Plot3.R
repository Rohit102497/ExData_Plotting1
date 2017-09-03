Lines <- readLines("household_power_consumption.txt")
sublines <- grep("^[12]/2/2007", substr(Lines,1,8))
name <- strsplit(Lines[1],";")[[1]]
data <- read.table(text = Lines[sublines], header = T, col.names = name, sep = ";", stringsAsFactors = F)

datetime <- strptime(paste(data$Date, data$Time, sep =" "), format = "%d/%m/%Y %H:%M:%S")

dev.cur()
png("Plot3.png", width = 480, height = 480)
plot(datetime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()