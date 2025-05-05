# Load the required dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Aggregate total emissions by year
total_emissions <- aggregate(Emissions ~ year, data = NEI, sum)

# Create the plot and save to plot1.png
png("plot1.png", width = 480, height = 480)
barplot(height = total_emissions$Emissions / 10^6,
        names.arg = total_emissions$year,
        col = "steelblue",
        main = "Total PM2.5 Emissions in the U.S. (1999–2008)",
        xlab = "Year",
        ylab = "Emissions (in million tons)")
dev.off()
