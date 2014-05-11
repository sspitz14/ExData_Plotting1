### Exploratory Data Analysis
### Coursera, Spring 2014
### Peer assessment 1; Plot 3

file.path <- "C:\\Users\\SJS\\Documents\\Coursera\\EDA\\Project1"
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

# plot 3
file.path <- "C:\\Users\\SJS\\Documents\\Coursera\\EDA\\Project1\\ExData_Plotting1"
setwd(file.path)

png("plot3.png", width = 480, height = 480, pointsize=12)

with(hpc, plot(Date.Time, Sub_metering_1, type="l", font.axis=2, font.lab=2, xlab="", ylab="Energy sub metering"))
with(hpc, lines(Date.Time, Sub_metering_2, col="red"))
with(hpc, lines(Date.Time, Sub_metering_3, col="blue"))
with(hpc, legend(x="topright", legend=c(names(hpc)[7:9]), lty=1, lwd=2, col=c("black", "red", "blue")))

dev.off()
