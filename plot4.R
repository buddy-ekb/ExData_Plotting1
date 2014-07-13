# because my locale is not English-speaking one
Sys.setlocale("LC_TIME", "C")
# read just particular data set
hhpc <- read.csv2("household_power_consumption.txt",
                  header = FALSE,
                  dec = ".",
                  skip = 66637,
                  nrows = 2880,
                  na.strings = "?",
                  as.is = TRUE)
# convert date and time columns to one POSIXlt column
hhpc$DT = strptime(paste(hhpc$V1, hhpc$V2), "%d/%m/%Y %T")
# the graphs
graph4 <- function () {
    # multiple graphs
    par(mfcol = c(2, 2), mar = c(4, 4, 3, 1))
    # graph 1
    plot(hhpc$DT, hhpc$V3, type = "l", ylab = "Global Active Power", xlab = "")
    # graph 2
    plot(hhpc$DT, hhpc$V7, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(hhpc$DT, hhpc$V8, col = "red")
    lines(hhpc$DT, hhpc$V9, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(par("fg"), "red", "blue"), lwd = 1, bty = "n")
    # graph 3
    plot(hhpc$DT, hhpc$V5, type = "l", ylab = "Voltage", xlab = "datetime")
    # graph 4
    plot(hhpc$DT, hhpc$V4, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
}
# plot to screen
graph4()
# plot to png with default width and height set to 480 px
png("plot4.png", bg = "transparent")
graph4()
dev.off()