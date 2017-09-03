Lines <- readLines("household_power_consumption.txt")
sublines <- grep("^[12]/2/2007", substr(Lines,1,8))
name <- strsplit(Lines[1],";")[[1]]
data <- read.table(text = Lines[sublines], header = T, col.names = name, sep = ";", stringsAsFactors = F)

dev.cur()
png("Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")
dev.off()