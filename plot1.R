#Read in data, subset it and coerce to a usable class.
HPC_table <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
HPC_Needed <- filter(HPC_table, Date == "2/1/2007" | Date == "2/2/2007")
GAP_Numeric <- as.numeric(as.character(HPC_Needed$Global_Active_Power))

# Fit plot size to elements.
par(mar = c(4,4,1,0))

# Plot Histogram.
hist(
    GAP_Numeric,                              # Global Active Power
    main = "Global Active Power",             # Main Title
    col = "red",                              # Bar Color
    xlab = "Global Active Power (kilowatts)", # X axis label
    ylim = c(0,1250),                         # Y axis limit
    xlim = c(0,6),
    las = 1
)