Lines <- readLines("household_power_consumption.txt")
sublines <- grep("^[12]/2/2007", substr(Lines,1,8))
name <- strsplit(Lines[1],";")[[1]]
data <- read.table(text = Lines[sublines], header = T, col.names = name, sep = ";", stringsAsFactors = F)

dev.cur()
datetime <- strptime(paste(data$Date, data$Time, sep =" "), format = "%d/%m/%Y %H:%M:%S")
png("Plot2.png", width = 480, height = 480)
plot(datetime, data$Global_active_power, type = "l", ylab = "Global Active Power(Kilowatts)", xlab = "")
dev.off()