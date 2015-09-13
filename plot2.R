#Full data set
data_full <- read.csv("C:/Users/vivek/datasciencecoursera/expdata/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# sub settign the fulldata to extarct the desired data set
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Saving to file & set up the plot 1 dim
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="figure/plot2.png", height=480, width=480)
dev.off()