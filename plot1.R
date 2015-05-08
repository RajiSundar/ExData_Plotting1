## Read the dataset 
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))

##New var using the dates & times in the required format called DateTime; change Date var to date class
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$DateTime)

## Extract data from the dates 2007-02-01 and 2007-02-02.
data <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

##Construct graph and save to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()