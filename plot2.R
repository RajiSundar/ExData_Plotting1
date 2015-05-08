# Line plot between datetime and global active power.

## Read the dataset 
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

##New var using the dates & times in the required format called DateTime; change Date var to date class
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$DateTime)

## Extract data from the dates 2007-02-01 and 2007-02-02.
data <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

# Graph 2 save to png file
png(file="plot2.png",width=480,height=480)
plot(data$DateTime, y= data$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)",type="l")
dev.off()