### Exploratory Data Analysis
### Coursera, Spring 2014
### Peer assessment 1; Plot 1

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

# plot 1
file.path <- "C:\\Users\\SJS\\Documents\\Coursera\\EDA\\Project1\\ExData_Plotting1"
setwd(file.path)
png("plot1.png", width = 480, height = 480, pointsize=11)
with(hpc, hist(Global_active_power, font.axis=2, font.lab=2, xlab="Global Active Power (kilowatts)", 
               col="red", main="Global Active Power"))
dev.off()
