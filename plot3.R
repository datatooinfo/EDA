#Read file into R
thirdplot <- read.csv("c:/rWork/Household_Power.csv", header=TRUE,
                       stringsAsFactors = FALSE)

#Subset the required data
n <- thirdplot[,7]
o <- thirdplot[,8]
p <- thirdplot[,9]

#Set the X axis parameters
a <- c(100, 1500, 2800)
b <- c("Thu", "Fri", "Sat")

#Create the plot
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
par (mar=c(5,5,3,0.2))
legend("topright", lty = 1, pt.cex=0, cex=0.4, col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering _3"))

#Copy the plot to a PNG file
dev.copy(png, width = 480, height = 480, file="plot3.png")
dev.off()