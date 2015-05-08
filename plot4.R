## Multiple plots on the same graph

## Read the dataset 
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

##New var using the dates & times in the required format called DateTime; change Date var to date class
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$DateTime)

## Extract data from the dates 2007-02-01 and 2007-02-02.
data <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

# Graph 4 Multiple plots on the same page, mfrow = plot 2 row, 2 cols, fill by row
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

with (data,
{   plot(DateTime, y= Global_active_power, xlab="", ylab="Global Active Power",type="l")
    plot(DateTime, y= Voltage, xlab="datetime", ylab="Voltage", type="l" )
    plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") 
    lines(DateTime, Sub_metering_2,col="Red")
    lines(DateTime, Sub_metering_3, col="Blue")
    legend("topright", lwd=1, col=c("Black", "Red", "Blue") ,legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(DateTime, Global_reactive_power,xlab="datetime", type="l", )
}
)

dev.off()