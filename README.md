# Weather_Project
Automated Weather Analysis Dashboard
This project demonstrates a data pipeline that automatically collects, stores, and visualizes real-time weather data for major US cities. The system is designed to build its own historical dataset over time, providing a foundation for trend analysis.

 Live Dashboard
View the Interactive Dashboard on Tableau Public
(Insert link to dashboard once published.)

 Key Features:
1. Automated Data Pipeline: A Python script runs on a recurring schedule to fetch new data, creating a self-updating and ever-growing dataset without manual intervention.
2. Live Database Connection: The Tableau dashboard queries the PostgreSQL database directly, ensuring visualizations are always based on the latest available data.
3. Historical Trend Analysis: Tracks weather patterns over time, allowing for analysis of changing conditions as the dataset grows.
4. Interactive Visualization: Empowers users to filter by city and date range to dynamically explore the data and uncover insights.

 Technologies & Skills:
1. Data Extraction: Python (requests library), OpenWeatherMap API
2. Data Transformation: Python (datetime library)
3. Data Storage: PostgreSQL (SQL)
4. Data Visualization: Tableau Desktop
5. Automation: Windows Task Scheduler
6. Version Control: Git & GitHub

 Project Architecture:
This project follows a classic ETL (Extract, Transform, Load) architecture:
1. Extract: A Python script, scheduled to run automatically, calls the OpenWeatherMap API to fetch current weather data for a predefined list of cities.
2. Transform: The raw JSON data from the API is cleaned and structured in Python. Key transformations include combining separate rain and snow fields into a single total_precipitation metric to standardize analysis
3. Load: The clean, transformed data is loaded into a weather_data table within a PostgreSQL database for persistent storage.
4. Visualize: A Tableau dashboard connects directly to the PostgreSQL database, providing an interactive and up-to-date visualization of weather trends.

 How to Replicate This Project:
To set up and run this project on your local machine, follow these steps:
1. Prerequisites: 
Ensure you have the following software installed:
Python,
PostgreSQL,
Tableau Desktop.

2. Clone the Repository:
git clone [https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git)
cd YOUR_REPOSITORY_NAME

3. Install Python Dependencies:
Install the psycopg2-binary Python package from your terminal.

4. Set Up the Database:
Open pgAdmin and connect to your PostgreSQL server.
Create a new database named weather_db.
Execute the SQL script located in the /sql_script folder of this repository to create the weather_data table structure.

5. Configure the Python Script:
Open the weather_scrape.py file in a code editor.
Replace the placeholder values for API_KEY and DB_PASSWORD with your personal OpenWeatherMap API key and your PostgreSQL database password.

6. Run the Pipeline:
Execute the script from your terminal to perform the first data pull and confirm the pipeline is working.
Once confirmed, set up a scheduled task (using Task Scheduler on Windows or cron on macOS/Linux) to run the script at your desired interval (e.g., once every hour).
