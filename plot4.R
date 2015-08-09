## Filename: plot4.R
## Created by: lacoursera (Lara)
## This script reads in data and creates 4 plots

## Read in full data set
dfall <- read.csv("./data/household_power_consumption.txt", 
                  stringsAsFactors=FALSE, sep=";", na.strings="?")

## Convert Date column to Date format
dfall$Date<-as.Date(dfall$Date,format="%d/%m/%Y")

## Subset to relevant dates, remove full data frame, clear memory
df <- dfall[dfall$Date >= "2007-02-01" & dfall$Date <= "2007-02-02",]
rm(dfall)
gc()

## Create DateTime column from Date and Time vars
df$DateTime<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

## Open png device
png(file="plot4.png", height=480, width=480, bg="transparent")

## Create plot
par(mfrow = c(2,2))
with(df, plot(DateTime,Global_active_power,
              type="l",
              ylab="Global Active Power",xlab=""))

with(df, plot(DateTime,Voltage,
              type="l",
              ylab="Voltage",xlab="datetime"))


with(df, plot(DateTime,Sub_metering_1,
              type="l",
              col="black",
              ylab="Energy sub metering",xlab=""))
with(df, lines(DateTime,Sub_metering_2,col="red"))
with(df, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",
       lty=c(1,1),
       bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


with(df, plot(DateTime,Global_reactive_power,
              type="l",
              ylab="Global_reactive_power",xlab="datetime"))

## Close png device
dev.off()
