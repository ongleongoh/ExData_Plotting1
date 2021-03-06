## Course Project 1
## Put "household_power_consumption.txt" in local working directory

# Read dataset from household_power_consumption.txt into csv
filename <- "household_power_consumption.txt"
rt <- read.csv(filename, na="?", header=TRUE, sep=";",
               colClasses=c("character", "character", "numeric", "numeric", 
                            "numeric", "numeric", "numeric", "numeric", "numeric"))
df <- subset(rt, rt=="1/2/2007" | rt =="2/2/2007")     ## subset only  "1/2/2007" and "2/2/2007"
x <- paste(df$Date, df$Time)                           ## concatenate Date and Time
df$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")        ## Format the Timestamp.

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename="plot3.png", width=480, height=480)
plot(df$DateTime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off() 