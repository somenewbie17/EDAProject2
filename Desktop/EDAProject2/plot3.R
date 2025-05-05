# Load necessary libraries
library(ggplot2)

# Load the dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City
baltimore_data <- subset(NEI, fips == "24510")

# Aggregate emissions by year and source type
type_totals <- aggregate(Emissions ~ year + type, data = baltimore_data, sum)

# Plot with ggplot2
png("plot3.png", width = 480, height = 480)
ggplot(type_totals, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ type, scales = "free_y") +
  labs(title = "PM2.5 Emissions in Baltimore by Source Type (1999–2008)",
       x = "Year",
       y = "Emissions (tons)") +
  theme_minimal()
dev.off()
