# Exploratory Data Analysis – Course Project 2

## Overview

This repository contains the deliverables for the second peer-graded assignment in the Exploratory Data Analysis course (Johns Hopkins / Coursera Data Science Specialization).

The objective is to explore how PM2.5 emissions have changed in the United States from 1999 to 2008, using data from the Environmental Protection Agency’s National Emissions Inventory (NEI).

---

## Repository Contents

- `plot1.R` – Generates `plot1.png`: Total PM2.5 emissions in the U.S. from 1999 to 2008.
- `plot2.R` – Generates `plot2.png`: Total PM2.5 emissions in Baltimore City, Maryland.
- `plot3.R` – Generates `plot3.png`: PM2.5 emissions by source type in Baltimore.
- `plot4.R` – Generates `plot4.png`: PM2.5 emissions from coal combustion-related sources across the U.S.
- `plot5.R` – Generates `plot5.png`: PM2.5 emissions from motor vehicles in Baltimore.
- `plot6.R` – Generates `plot6.png`: Motor vehicle emissions comparison: Baltimore vs. Los Angeles.

Each `.R` script includes:
- Data loading
- Data filtering and summarizing
- Plot construction and export

---

## How to Run

1. Clone this repository or download the files.
2. Place the following datasets in your working directory:
   - `summarySCC_PM25.rds`
   - `Source_Classification_Code.rds`
3. Open R or RStudio.
4. Source any of the scripts (`plot1.R`, `plot2.R`, etc.).
5. A corresponding `.png` file will be saved to the working directory.

---

## Notes

- The data can be downloaded from the Coursera course page or the EPA NEI website.
- Base plotting system is used for `plot1` and `plot2`; `ggplot2` is used for the rest.
- File size limitations are respected; no `.rds` files are pushed to GitHub.

---


GitHub: [somenewbie17](https://github.com/somenewbie17)
