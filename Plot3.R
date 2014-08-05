#Plot3.R
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

#Stage 4: Save Plot3 to a .png file.

png("C:/Users/Brian/Documents/Plots/plot3.png")
par(mar = c(2,4,2,2), cex = 1.2)
plot(data3$DT,data3$Sub_metering_1, type = "l", 
     cex.lab = 1, cex.axis = .75,
     xlab = "", ylab = "Energy sub metering")
lines(data3$DT,data3$Sub_metering_2, type = "l", col = "red")
lines(data3$DT,data3$Sub_metering_3, type = "l", col = "blue")
legend("topright", # places a legend at the appropriate place 
       c( "Sub_metering_1" , "Sub_metering_2" ,  "Sub_metering_3" ), # puts text in the legend
       lty = c(1,1), # gives the legend appropriate symbols (lines)
       cex = .85,
       lwd = c(1,1),col=c("black","red", "blue")) # gives the legend lines the correct color and width
dev.off()