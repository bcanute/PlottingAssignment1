#Plot1.R
#Stage 1: Download the Data
data <- read.table(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
#Stage 2: Select a subset
data2 <- subset(data, c(data$Date == '1/2/2007' | data$Date == '2/2/2007'))
#Stage 3: Organise a single time series vector in POSIXlt format
data2$DT <- paste(data2$Date, data2$Time)
data2$DT <- strptime(data2$DT, "%d/%m/%Y %H:%M:%S")
data2$Date <- NULL
data2$Time <- NULL
data3 <- data2[,c("DT", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]

#Stage 4: Save Plot1 to a .png file.

png("C:/Users/Brian/Documents/Plots/plot1.png")
par(mar = c(4,4,4,4), cex = 1)
hist(data3$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()






