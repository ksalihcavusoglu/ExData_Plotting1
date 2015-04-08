# if necessary download and extract data
file_name <- "household_power_consumption.txt"
link <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

if (!file.exists(file_name))
{
  temp <- tempfile()
  download.file(link,temp)
  unzip(temp)
  unlink(temp)
}

# get only 1 and 2 february 2007 with sqldf
require("sqldf")
library(sqldf)
# read only related data
hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "with DMY as(
                              select *, substr(Date, 0, instr(Date,'/')) as Day, substr(substr(Date, instr(Date,'/') + 1), 0, instr(substr(Date, instr(Date,'/') + 1),'/')) as month, substr(substr(Date, instr(Date,'/') + 1),instr(substr(Date, instr(Date,'/') + 1),'/')  + 1) as year from file
                          )
                          select * from DMY where year = '2007' and month = '2' and (day = '1' or day = '2')", sep=";", row.names = FALSE)
# make string data datetime
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep= " "), format="%d/%m/%Y %H:%M:%S")
# in order to plot 3 which requires subsetting melt Sub_metering as varible
hpcNew <- hpc[, c("DateTime", "Sub_metering_1","Sub_metering_2","Sub_metering_3")]
hpcMelt <- melt(hpcNew, id = c("DateTime"))

# for first 3 plots just one plot
par(mfrow = c(1,1))

# export
png(file="plot4.png", width=480, height=480)

#plot 4
par(mfrow= c(2,2))
plot( Global_active_power ~ DateTime, hpc, type="s", col="black", xlab="", ylab="Global Active Power")
plot(Voltage ~ DateTime, hpc, type="s")
require("reshape2")
library(reshape2)
with(hpcMelt, plot(DateTime, variable, ylim= range(hpcMelt$value), main="", type="n", ylab="Enegy sub metering"))
with(subset(hpcMelt, variable=="Sub_metering_1"), lines(value ~ DateTime, type = "s", col="black"))
with(subset(hpcMelt, variable=="Sub_metering_2"), lines(value ~ DateTime , type = "s", col="red"))
with(subset(hpcMelt, variable=="Sub_metering_3"), lines(value ~ DateTime , type = "s", col="blue"))
legend("topright", lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ DateTime, hpc, type="s")

dev.off()

# remove objects
rm(hpcMelt, hpcNew, hpc)