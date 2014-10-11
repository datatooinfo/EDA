#Read file into R
sixthplot <- read.csv("c:/rWork/Household_Power.csv", header=TRUE,
                      stringsAsFactors = FALSE)

x <- sixthplot[,3]
n <- sixthplot[,7]
o <- sixthplot[,8]
p <- sixthplot[,9]
f <- sixthplot[,4]
z <- sixthplot[,5]

#Set the X axis parameters
a <- c(100, 1500, 2800)
b <- c("Thu", "Fri", "Sat")

par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(sixthplot, {
  #Create the plot
  plot2 <- plot(x, xlab="", xaxt = "n",
                ylab="Global Active Power (killowatts)", type="n")
  with(subset(sixthplot, x >= 0), lines(x, col = "black"))
  axis(1, at=a, labels=b)
  
  plot3 <- 
    plot(n, xlab="", xaxt = "n",
         ylab="Energy sub metering", type="n")
  lines(n, col = "black")
  par(add=TRUE)
  lines(o, col = "red")
  par(add=TRUE)
  lines(p, col = "blue")
  par (add=TRUE)
  axis(1, at=a, labels=b)
  legend("topright", lty = 1, pt.cex=0, cex=0.4, col = c("black", "blue", "red"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering _3"))
  
  plot4 <- plot(z, xlab="datetime", xaxt = "n",
                ylab="Voltage", type="n")
  with(subset(sixthplot, z >= 0), lines(z, col = "black"))
  axis(1, at=a, labels=b)
  
  plot5 <- plot(f, xlab="datetime", xaxt = "n",
                ylab="Global_reactive_power", type="n")
  with(subset(sixthplot, f >= 0), lines(f, col = "black"))
  axis(1, at=a, labels=b)
  
})

#Copy the plot to a PNG file
dev.copy(png, width = 480, height = 480, file="plot4.png")
dev.off()

