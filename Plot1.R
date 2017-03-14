file <- 'Documents/Coursera/Exploratory Data Analysis/Wk 1 Project/household_power_consumption.txt'

# Read whole dataset
el <- read.delim(file, stringsAsFactors = FALSE, na.strings = '?', sep = ';')
# Make date time variable
el$datetime <- strptime(paste(el$Date, el$Time), format = '%d/%m/%Y %H:%M:%S')
# Subset for days of interest
e <- subset(el, as.Date(datetime) >= as.Date('2007-02-01') & as.Date(datetime) <= as.Date('2007-02-02'))

## Plot 1
png(filename = 'plot1.png', height = 480, width = 480, units = 'px')
hist(e$Global_active_power, col = 'red', main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')
dev.off()