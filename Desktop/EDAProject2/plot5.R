# Load libraries
library(ggplot2)

# Load datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Identify motor vehicle-related SCC codes
vehicle_rows <- grep("vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle_codes <- SCC[vehicle_rows, "SCC"]

# Subset NEI for motor vehicle emissions in Baltimore (fips == "24510")
baltimore_vehicle <- subset(NEI, fips == "24510" & SCC %in% vehicle_codes)

# Aggregate by year
vehicle_totals <- aggregate(Emissions ~ year, data = baltimore_vehicle, sum)

# Plot and save
png("plot5.png", width = 480, height = 480)
ggplot(vehicle_totals, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(title = "Motor Vehicle PM2.5 Emissions in Baltimore (1999–2008)",
       x = "Year",
       y = "Emissions (tons)") +
  theme_minimal()
dev.off()
