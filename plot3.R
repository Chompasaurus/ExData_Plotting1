## Load dplyr package
library(dplyr)

#Read in data  
HPC_table <- read.table("ExploratoryDataAnalysis/Project1/ElectricPowerConsumptionDownload/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## subset it with dplyr::filter
HPC_Needed <- filter(HPC_table, Date == "1/2/2007" | Date == "2/2/2007")

## mutate to add combined DateTime Column
HPC_Needed <- mutate(HPC_Needed, DateTime = paste(HPC_Needed$Date,HPC_Needed$Time))

## convert the DateTime column to POSIXlt/POSIXt
HPC_Needed$DateTime <- strptime(HPC_Needed$DateTime, format =  "%d/%m/%Y %H:%M:%S")

## Set Plot graphic margins
par(mar = c(2,4,0,0))

## Plot 3 seperate sub meter readings across 2-day period
plot(
      HPC_Needed$DateTime,                  ## X vectors
      HPC_Needed$Sub_metering_1,            ## Y vectors
    type = "l",                            ## Specify line graph 
    ylab = "Energy sub metering",          ## Y axis label
    xlab = "",                             ## Remove X axis label
    col = "black"
)

## Add legend to plot
legend("topright",lwd = 1, cex = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

## Add Sub meter 2 and 3 as seperate lines to the existing plot
lines(HPC_Needed$DateTime, y = HPC_Needed$Sub_metering_2, col = "red")
lines(HPC_Needed$DateTime, y = HPC_Needed$Sub_metering_3 , col = "blue")

