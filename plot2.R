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
# the graph
graph2 <- function () {
    par(mfcol = c(1, 1), mar = c(4, 4, 3, 1))
    plot(hhpc$DT, hhpc$V3, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
}
# plot to screen
graph2()
# plot to png with default width and height set to 480 px
png("plot2.png", bg = "transparent")
graph2()
dev.off()