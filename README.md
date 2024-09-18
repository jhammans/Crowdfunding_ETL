# ETL Mini Project

## Project Overview

This project focuses on building an ETL (Extract, Transform, Load) pipeline using Python and Pandas. It will extract data, transform it using either Python dictionary methods or regular expressions, and then load the transformed data into PostgreSQL and MongoDB databases.

---

### Project Workflow:

1. **Extract and Transform Data**: 
   - Use Python and Pandas to extract data from different sources.
   - Apply transformation techniques using Python dictionary methods or regular expressions.

2. **Create CSV Files**: 
   - After transforming the data, generate four CSV files.
   
3. **Database Integration**: 
   - Design an Entity-Relationship Diagram (ERD) and define a table schema based on the transformed data.
   - Load the CSV files into a PostgreSQL database.
   - Load the CSV files into a MongDB database.

### Tools and Technologies:
- Python
- Pandas
- Regular Expressions / Dictionary Methods
- PostgreSQL
- MongoDB

---

## Project Structure

The repository is organized as follows:
```bash
CROWDFUNDING_ETL/
└── Resources/                                # Raw and processed data files
 └── create_crowdfunding_db.sql               # Sql script used to create Postgres database
 └── crowdfunding_db_erd.png                  # Entity Relationship Diagram (ERD)
 └── crowdfunding_db_schema.sql               # Sql script containing DDL to create tables and other database objects
└── Starter_Files/                            # Jupyter notebooks for data indivdual notebooks     
└── utils/                                    # Utilities needed for the program              
└── ETL_Mini_Project_BBose_JHammans.ipynb     # Main notebook of the project
└── mongodb_load_databases.ipynb              # Notebook called by the main notebook to load output csv files to MongoDB
└── postgres_load_databases.ipynb             # Notebook called by the main notebook to load output csv files to Postgres
└── README.md                                 # Project README file
```

---

## Data Source

The data is provided in a Microsoft Excel spreadsheet and a commma seperated values (csv) text file:
1.  `crowdfunding.xlsx` 
2.  `contacts.csv`

---

## Setup Instructions

### Step 1: Clone the repository
```bash
git clone https://github.com/jhammans/Crowdfunding_ETL
cd Crowdfunding_ETL
```

### Step 2: Set up your configuration file

Save credentials for your Postgres and MongoDB instances

```bash
1. Copy `config.template.json` to `config.json`.
2. Edit `config.json` and add your actual credentials.
3. Ensure `config.json` is not added to version control by checking that it'''s listed in `.gitignore`.
```

### Step 3: Installing Dependencies

Make sure you have the required Python libraries installed. You can install them using `pip`:

```bash
pip install pymongo pandas sqlalchemy import_ipynb
```

### Step 4: Running the Notebooks

- Open `ETL_Mini_Project_BBose_JHammans.ipynb` this the main notebook.  It reads in the source data, cleans it and outputs 4 csv files.  It then calls `postgres_load_databases.ipynb` which connects to Postgres and creates the database and all the objects needed for the csv files to be loaded to.  `mongodb_load_databases.ipynb` is then called to load the csv files into collections in MongoDB. 

---