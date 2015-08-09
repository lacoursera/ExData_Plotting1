## Filename: plot1.R
## Created by: lacoursera (Lara)
## This script reads in data and creates a histogram of Global active power

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
png(file="plot1.png", height=480, width=480, bg="transparent")

## Create histogram
hist(df$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Close png device
dev.off()
