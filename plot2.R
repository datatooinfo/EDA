#Read file into R
secondplot <- read.csv("c:/rWork/Household_Power.csv", header=TRUE,
                      stringsAsFactors = FALSE)

#Subset the required data
y <- secondplot[,3]

#Set the X axis parameters
a <- c(100, 1500, 2800)
b <- c("Thu", "Fri", "Sat")

#Create the plot
plot2 <- plot(y, xlab="", xaxt = "n",
              ylab="Global Active Power (killowatts)", type="n")
with(subset(secondplot, y >= 0), lines(y, col = "black"))
axis(1, at=a, labels=b)
par (oma=c(5,4,3,1))

#Copy the plot to a PNG file
dev.copy(png, width = 480, height = 480, file="plot2.png")
dev.off()