## Read unzipped text file located in Data folder separating column names
hpc3 <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000)
colnames(hpc3) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")

## View complete file outside of R for inspection
utils::View(hpc3)

## Clean data and ready for plotting
hpc3$datetime <- strptime(paste(hpc3$Date,hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc3$Date <- as.Date(hpc3$Date,format="%d/%m/%Y")

## View file outside of R for inspection to verify cleaning complete
utils::View(hpc3)

### Extract data from the dates 2007-02-01 and 2007-02-02 only
lmaHPC3 <- hpc3[hpc3$Date >= "2007-02-01" & hpc3$Date <= "2007-02-02", ]

## View new file to verify dates needed
utils::View(lmaHPC3)

## Plot the data in screen view first for visual if you want
## Zoom to view all and export as image with correct size
with(lmaHPC3, plot(y=SubMetering1,x=datetime, type = "n",main="Energy Sub Metering - Days",xlab ="", ylab="Energy sub metering"))
with(lmaHPC3, lines(y=SubMetering1,x=datetime,col="black"))
with(lmaHPC3, lines(y=SubMetering2,x=datetime,col="red"))
with(lmaHPC3, lines(y=SubMetering3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

     
## or just plot as png
## Plot the data and save the plot as plot3.png
png(filename = "plot3.png", width = 480, height = 480)
with(lmaHPC3, plot(y=SubMetering1,x=datetime, type = "n",main="Energy Sub Metering - Days",xlab ="", ylab="Energy sub metering"))
with(lmaHPC3, lines(y=SubMetering1,x=datetime,col="black"))
with(lmaHPC3, lines(y=SubMetering2,x=datetime,col="red"))
with(lmaHPC3, lines(y=SubMetering3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()




 
