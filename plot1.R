#Read file into R
firstplot <- read.csv("c:/rWork/Household_Power.csv", header=TRUE,
                   stringsAsFactors = FALSE)

#Create the plot
plot1 <- hist(firstplot$Global_active_power, 
              xlab="Global Active Power (killowatts)",
              main="Global Active Power", col="red")

#Copy the plot to a PNG file
dev.copy(png, file="plot1.png")
dev.off()