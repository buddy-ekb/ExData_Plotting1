# read just particular data set
hhpc <- read.csv2("household_power_consumption.txt",
                  header = FALSE,
                  dec = ".",
                  skip = 66637,
                  nrows = 2880,
                  na.strings = "?",
                  as.is = TRUE)
# the graph
graph1 <- function () {
    par(mfcol = c(1, 1), mar = c(4, 4, 3, 1))
    hist(hhpc$V3, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
}
# plot to screen
graph1()
# plot to png with default width and height set to 480 px
png("plot1.png", bg = "transparent")
graph1()
dev.off()