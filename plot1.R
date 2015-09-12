## Load dplyr package
library(dplyr)

#Read in data  
HPC_table <- read.table("ExploratoryDataAnalysis/Project1/ElectricPowerConsumptionDownload/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## subset it with dplyr::filter
HPC_Needed <- filter(HPC_table, Date == "1/2/2007" | Date == "2/2/2007")

## Fit plot size to elements.
par(mar = c(4,4,1,1))

## Plot Histogram.
hist(
    HPC_Needed$Global_active_power,           # Global Active Power freq vector
    main = "Global Active Power",             # Main Title
    col = "red",                              # Bar Color
    xlab = "Global Active Power (kilowatts)", # X axis label
    ylim = c(0,1250),                         # Y axis limit
    xlim = c(0,6),                            # X axis limit
    las = 0,                                  # Set labels to read parallel to their axis
    breaks = 12                               # Specify number of bars to seperate frequency into
)