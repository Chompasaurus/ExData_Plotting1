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

## Plot Global Active Power across 2-day period
plot(
    HPC_Needed$DateTime,                        ## X vector
    HPC_Needed$Global_active_power,             ## Y vector
    type = "l",                                 ## Specify line graph 
    ylab = "Global Active Power (kilowatts)",   ## Y axis label
    xlab = "",                                   ## Remove X axis label
    mar = c(0,0,0,0)                            ## Set Plot graphic margins 
)