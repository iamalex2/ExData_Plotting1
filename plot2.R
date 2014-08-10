## Read unzipped text file located in Data folder separating column names
hpc2 <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000)
colnames(hpc2) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")

## View complete file outside of R for inspection
utils::View(hpc2)

## Clean data and ready for plotting
hpc2$datetime <- strptime(paste(hpc2$Date,hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc2$Date <- as.Date(hpc2$Date,format="%d/%m/%Y")

## View file outside of R for inspection to verify cleaning complete
utils::View(hpc2)

### Extract data from the dates 2007-02-01 and 2007-02-02 only
lmaHPC2 <- hpc2[hpc2$Date >= "2007-02-01" & hpc2$Date <= "2007-02-02", ]

## View new file to verify dates needed
utils::View(lmaHPC2)

## Plot the data in screen view first for visual if you want
## Zoom to view all and export as image with correct size
with(lmaHPC2, plot(y=GlobalActivePower,x=datetime,type ="n", main="Global Active Power-Days", xlab="", ylab="Global Active Power (kilowatts)"))
with(lmaHPC2, lines(y=GlobalActivePower,x=datetime))
     
## or just plot as png
## Plot the data and save the plot as plot2.png
png(filename = "plot2.png", width = 480, height = 480)
with(lmaHPC2, plot(y=GlobalActivePower,x=datetime, type = "n", main="Global Active Power-Days", xlab ="", ylab="Global Active Power (kilowatts)"))
with(lmaHPC2, lines(y=GlobalActivePower,x=datetime))
dev.off()



 
