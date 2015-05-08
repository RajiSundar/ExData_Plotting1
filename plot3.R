## Graph datetime on x axis and sub metering 1, 2,& 3  on y axis.

## Read the dataset 
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

##New var using the dates & times in the required format called DateTime; change Date var to date class
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$DateTime)

## Extract data from the dates 2007-02-01 and 2007-02-02.
data <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

# Graph 3 - Multiple variables(4) in the same graph
png(file="plot3.png",width=480,height=480)
with (data, 
{ plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") 
  lines(DateTime, Sub_metering_2,col="Red")
  lines(DateTime, Sub_metering_3, col="Blue")
}
)
legend("topright", lwd=1, col=c("Black", "Red", "Blue") ,legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
