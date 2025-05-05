# Load required library
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Identify motor vehicle-related SCC codes
vehicle_rows <- grep("vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle_codes <- SCC[vehicle_rows, "SCC"]

# Filter for motor vehicle emissions in Baltimore and LA
vehicle_data <- subset(NEI, SCC %in% vehicle_codes & (fips == "24510" | fips == "06037"))

# Add readable city names
vehicle_data$city <- factor(vehicle_data$fips, 
                            levels = c("24510", "06037"),
                            labels = c("Baltimore, MD", "Los Angeles, CA"))

# Aggregate emissions by year and city
city_totals <- aggregate(Emissions ~ year + city, data = vehicle_data, sum)

# Plot
png("plot6.png", width = 480, height = 480)
ggplot(city_totals, aes(x = factor(year), y = Emissions, fill = city)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Motor Vehicle PM2.5 Emissions: Baltimore vs Los Angeles (1999–2008)",
       x = "Year",
       y = "Emissions (tons)") +
  theme_minimal()
dev.off()
