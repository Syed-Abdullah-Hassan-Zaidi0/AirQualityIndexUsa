# Problem Statement
Air pollution is a critical issue that affects the health and well-being of millions across the United States. With increasing industrialization, urbanization, and environmental challenges, understanding air quality trends is vital for making informed policy and public health decisions. This project aims to analyze air quality data from 1980 to 2022, providing insights into the most affected regions, identifying seasonal patterns, and highlighting the pollutants contributing to poor air quality.

# Key questions addressed:

How has air quality evolved across different US regions and states over time?
Which states have consistently high or low air quality, and how does it vary seasonally?
What are the key pollutants driving the changes in air quality?
Through this analysis, we aim to offer actionable insights to better understand the factors influencing air quality and help mitigate pollution-related health risks.


# Project Story: US Air Quality Analysis (1980-2022)
This PowerBI-based project leverages historical air quality data from the United States, obtained from Kaggle's Air Quality Dataset (1980-Present) https://www.kaggle.com/datasets/calebreigada/us-air-quality-1980present . The dashboard provides detailed visualizations to explore air quality trends, focusing on regional differences, seasonal variations, and the impact of specific pollutants on AQI levels.

# Key Insights:

1.Regional and Yearly AQI Trends:
Pacific West has historically shown higher AQI values, peaking around the early 2000s, though air quality has improved over time.
Other regions, such as Great Plains and Southeast, exhibit lower AQI levels, indicating better air quality and fewer pollution-related issues.
Overall, there is a visible decline in AQI across most regions, suggesting improvements in air quality, possibly due to environmental regulations and cleaner technologies.

2.Seasonal Air Quality Patterns:
The summer months show the highest AQI values, likely due to smog, wildfires, and increased vehicular emissions. In contrast, winter typically has the lowest AQI, indicating cleaner air during colder months.

3.State-Level Analysis:
California has the highest average AQI, making it the state with the worst air quality, largely driven by factors such as industrial emissions, traffic congestion, and wildfire smoke.
On the opposite end, Hawaii consistently exhibits the best air quality, with minimal pollution due to its geographic isolation and lower industrial activities.

4.Pollution Categories and Key Pollutants:
The majority of AQI data falls into the "Good" category, but significant portions are still categorized as "Unhealthy" and "Very Unhealthy."
Key pollutants such as Ozone (O3) and PM10 are the most prevalent contributors to poor air quality, with other pollutants like CO and NO2 playing lesser roles.

# Data Source:
Data Used: US Air Quality Data (1980-Present)
Source: Kaggle




# Python Code Explanation for Data Cleaning:
The provided Python code is designed to perform essential data cleaning and exploratory tasks for the air quality dataset in a Jupyter Notebook. Below is a breakdown of the tasks performed by the code:

Loading the Dataset: The dataset is loaded using the pandas library. The time taken to load the file is measured and displayed, which can be useful for understanding performance with large datasets.

Checking for Missing Values: The code checks for missing values across all columns and provides a count of how many missing values exist in each.

Checking for Duplicate Rows: The code checks for and counts any duplicate rows in the dataset, which could indicate redundancy or data entry errors.

Summary Statistics: The code generates summary statistics (mean, min, max, 25%, 50%, 75%) for the numeric columns, giving a quick overview of the data distribution and helping identify any potential anomalies.

Data Type Inspection: The data types of all columns are checked to ensure that the correct types are used (e.g., int64 for integers, float64 for floats). Incorrect data types can lead to errors in analysis and must be corrected.

Outlier Detection: The code detects outliers in the numeric columns using the Interquartile Range (IQR) method. This helps identify values that are significantly higher or lower than most of the data, which might indicate erroneous entries or extreme conditions.

# Code Summary:
This script is useful for understanding the quality of the data before performing more complex transformations or visualizations. It allows the user to clean and analyze missing or duplicate data and detect outliers that could skew the analysis.






# Sql Script for Data Transformation and Analysis:
This repository contains SQL scripts designed to transform, clean, and analyze the United States Air Quality Index (AQI) dataset. The scripts are used to perform various analyses, from calculating trends and seasonality to investigating regional pollution levels and the impact of policies like the Clean Air Act. These SQL queries can be integrated into a data analysis workflow for environmental studies or health impact assessments.

The script covers multiple key analyses, including AQI trends over time, seasonality patterns, regional performance, and pollutant correlations. Additionally, it performs transformations to create aggregated datasets for deeper trend analysis, including historical and predictive insights.

# Key Features:
1.Trend Analysis:
Calculates the average AQI by year and state, allowing for long-term trend analysis and understanding the progression of air quality over time.

2.Seasonality Analysis:
Determines the average AQI by season (Winter, Spring, Summer, Fall) to identify potential seasonal patterns in air quality.

3.Regional Analysis:
Identifies the top 5 most polluted regions based on city and state data. This helps to pinpoint problem areas for targeted environmental interventions.

r.Pollutant Correlations:
Analyzes the correlations between AQI levels and different pollutants, providing insights into which pollutants are the main contributors to air quality degradation.

5.Policy Impact Analysis:
Compares AQI levels before and after the Clean Air Act Amendments (1990), showing the effectiveness of government policies on air quality improvement.

6.Aggregation for Historical Analysis:
Creates an aggregated dataset with key metrics such as population density and the number of sites reporting, allowing for further analysis of historical air quality trends across states.

7.State Performance Analysis:
Analyzes historical AQI trends for each state, calculating yearly percentage changes to track performance improvements or deteriorations.

# How to Use:
Import the SQL scripts into your preferred SQL environment (e.g., SQL Server, MySQL).
Ensure the US_AQI dataset is loaded into the database.
Run the scripts to generate insights on AQI trends, pollutant analysis, and regional performance.
Use the aggregated data for further analysis, such as predictive modeling and visualizations using tools like Power BI.
