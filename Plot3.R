file <- 'Documents/Coursera/Exploratory Data Analysis/Wk 1 Project/household_power_consumption.txt'

# Read whole dataset
el <- read.delim(file, stringsAsFactors = FALSE, na.strings = '?', sep = ';')
# Make date time variable
el$datetime <- strptime(paste(el$Date, el$Time), format = '%d/%m/%Y %H:%M:%S')
# Subset for days of interest
e <- subset(el, as.Date(datetime) >= as.Date('2007-02-01') & as.Date(datetime) <= as.Date('2007-02-02'))

# Plot 3
png(filename = 'plot3.png', height = 480, width = 480, units = 'px')
with(e, plot(datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering',xlab = NA))
with(e, lines(datetime, Sub_metering_2, col = 'red'))
with(e, lines(datetime, Sub_metering_3, col = 'blue'))
legend('topright', legend = paste0('Sub_metering_', 1:3), lty = 1, col = c('black', 'red', 'blue'))
dev.off()