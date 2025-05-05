# Load the dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City, Maryland
baltimore_data <- subset(NEI, fips == "24510")

# Aggregate total emissions by year
baltimore_totals <- aggregate(Emissions ~ year, data = baltimore_data, sum)

# Plot and save as PNG
png("plot2.png", width = 480, height = 480)
barplot(height = baltimore_totals$Emissions,
        names.arg = baltimore_totals$year,
        col = "darkred",
        main = "Total PM2.5 Emissions in Baltimore (1999–2008)",
        xlab = "Year",
        ylab = "Emissions (tons)")
dev.off()

