## Read unzipped text file located in Data folder separating column names
hpc4 <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000)
colnames(hpc4) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")

## View complete file outside of R for inspection
utils::View(hpc3)

## Clean data and ready for plotting
hpc4$datetime <- strptime(paste(hpc4$Date,hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc4$Date <- as.Date(hpc4$Date,format="%d/%m/%Y")

## View file outside of R for inspection to verify cleaning complete
utils::View(hpc4)

### Extract data from the dates 2007-02-01 and 2007-02-02 only
lmaHPC4 <- hpc4[hpc4$Date >= "2007-02-01" & hpc4$Date <= "2007-02-02", ]

## View new file to verify dates needed
utils::View(lmaHPC4)

## Plot the data in screen view first for visual if you want
## Zoom to view all and export as image with correct size
par(mfcol=c(2,2))

#subplot 1,1 (Global Active Power)
with(lmaHPC4, plot(y=GlobalActivePower,x=datetime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(lmaHPC4, lines(y=GlobalActivePower,x=datetime))

#subplot 2,1 (Energy sub metering)
with(lmaHPC4, plot(y=SubMetering1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering"))
with(lmaHPC4, lines(y=SubMetering1,x=datetime,col="black"))
with(lmaHPC4, lines(y=SubMetering2,x=datetime,col="red"))
with(lmaHPC4, lines(y=SubMetering3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#subplot 1,2 (Voltage)
with(lmaHPC4,plot(y=Voltage,x=datetime, type = "n" ))
with(lmaHPC4, lines(y=Voltage,x=datetime,col="black"))

#subplot 2,2 (Global Reactive Power)
with(lmaHPC4,plot(y=GlobalReactivePower,x=datetime, type = "n" ,ylab = "Globle_reactive_power"))
with(lmaHPC4, lines(y=GlobalReactivePower,x=datetime,col="black"))



## or just plot as png
## Plot the data and save the plot as plot4.png
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

#subplot 1,1 (Global Active Power)
with(lmaHPC4, plot(y=GlobalActivePower,x=datetime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(lmaHPC4, lines(y=GlobalActivePower,x=datetime))

#subplot 2,1 (Energy sub metering)
with(lmaHPC4, plot(y=SubMetering1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering"))
with(lmaHPC4, lines(y=SubMetering1,x=datetime,col="black"))
with(lmaHPC4, lines(y=SubMetering2,x=datetime,col="red"))
with(lmaHPC4, lines(y=SubMetering3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#subplot 1,2 (Voltage)
with(lmaHPC4,plot(y=Voltage,x=datetime, type = "n" ))
with(lmaHPC4, lines(y=Voltage,x=datetime,col="black"))

#subplot 2,2 (Global Reactive Power)
with(lmaHPC4,plot(y=GlobalReactivePower,x=datetime, type = "n" ,ylab = "Globle_reactive_power"))
with(lmaHPC4, lines(y=GlobalReactivePower,x=datetime,col="black"))
dev.off()




 
