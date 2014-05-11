### Exploratory Data Analysis
### Coursera, Spring 2014
### Peer assessment 1; Plot 4

file.path <- "C:\\Users\\SJS\\Documents\\Coursera\\EDA\\Project1\\ExData_Plotting1"
setwd(file.path)

# read data
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))

# create a POSIXct Date-Time variable
ndate <- as.Date(as.character(hpc$Date), format="%d/%m/%Y")
ndt <- paste(ndate, as.character(hpc$Time), sep=",")
ndtposix <- as.POSIXct(strptime(ndt, format="%Y-%m-%d,%H:%M:%S"))
hpc$Date.Time <- ndtposix

# plot 4
png("plot4.png", width = 480, height = 480, pointsize=12)

margins <- par()$mar
margins[1] <- 5.1   # bottom
margins[3] <- 1.1   # top
par(mfrow=c(2,2), mar=margins)
# plot upleft
with(hpc, plot(Date.Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
# plot upright
with(hpc, plot(Date.Time, Voltage, type="l", yaxt="n", xlab="datetime", ylab="Voltage"))
axis(2, at=seq(234, 246, by=2),labels=c("234", "", "238", "", "242", "", "246"), col.axis="black", las=0)
# plot botleft
with(hpc, plot(Date.Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc, lines(Date.Time, Sub_metering_2, col="red"))
with(hpc, lines(Date.Time, Sub_metering_3, col="blue"))
with(hpc, legend(x="topright", bty="n", legend=c(names(hpc)[7:9]), lty=1, lwd=2, col=c("black", "red", "blue")))
# plot botright
with(hpc, plot(Date.Time, Global_reactive_power, type="l", xlab="datetime"))

dev.off()
