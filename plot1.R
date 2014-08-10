## Read unzipped text file located in Data folder separating column names
hpc <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000)
colnames(hpc) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")

## View complete file outside of R for inspection
utils::View(hpc)

## Clean data and ready for plotting
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

## View file outside of R for inspection to verify cleaning complete
utils::View(hpc)

### Extract data from the dates 2007-02-01 and 2007-02-02 only
lmaHPC <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ]

## View new file to verify dates needed
utils::View(lmaHPC)

## Plot the data in screen view first for visual if you want
## Zoom to view all and export as image with correct size
hist(lmaHPC$GlobalActivePower,col="red",main="Global Active Power",  lwd="2", ylab="Frequency", xlab="Global Active Power (kilowatts)")

## or just plot as png
## Plot the data and save the plot as plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(lmaHPC$GlobalActivePower,col="red",main="Global Active Power",  lwd="2", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()
