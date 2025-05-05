# Load required libraries
library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Identify coal combustion-related sources
coal_scc <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
coal_codes <- SCC[coal_scc, "SCC"]

# Subset NEI for coal combustion emissions
coal_data <- subset(NEI, SCC %in% coal_codes)

# Aggregate by year
coal_totals <- aggregate(Emissions ~ year, data = coal_data, sum)

# Plot and save
png("plot4.png", width = 480, height = 480)
ggplot(coal_totals, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity", fill = "gray40") +
  labs(title = "Coal Combustion-Related PM2.5 Emissions in the U.S. (1999–2008)",
       x = "Year",
       y = "Emissions (tons)") +
  theme_minimal()
dev.off()
