import mysql.connector
import pandas as pd
from sqlalchemy import create_engine

# Create sqlalchemy connection engine
user = 'emilytorres'
password = 'grtkd1217!'
host = 'localhost'
port = '3306'
database = 'Food4U'
engine = create_engine(f'mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}')

# Open connection using mysql.connector
conn = mysql.connector.connect(
    user=user, password=password, host=host, database=database
)
cursor = conn.cursor()

# Run the "USE" command
cursor.execute("USE Food4U")

# Option 1: Produce a list of all tables in the database.
def tableList():
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()
    tables_df = pd.DataFrame(tables, columns=["Tables"])
    print('\nOkay, here is a dataframe of all tables in the Meals4U Database.\n')
    print(tables_df)

# Option 2: Produce a list of the number of rows for each table. 
def numRows():
    cursor.execute("""
        SELECT table_name, table_rows
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'Food4U'
        ORDER BY table_rows DESC;
    """)
    rows_per_table = cursor.fetchall()
    rows_per_table_df = pd.DataFrame(rows_per_table, columns=["Table", "Num_Rows"])
    print('\nOkay, here is a dataframe of every table and its row count in the Meals4U Database.\n')
    print(rows_per_table_df)

PROMPT = '%> '

# User friendly REPL to access different queries
def proj_repl():
    print ('\nWelcome to The Meals4U Database.\n')
    while True:
        main_menu() #?
        choice = input(PROMPT)
        if choice == '9':
            break
        elif choice == '1':
            tableList()
        elif choice =='2':
            numRows()
    cursor.close()
    conn.close()
    print('\nThanks for using the Meals4U Database. See you later!\n')

def main_menu():
    print("""          
✩₊˚.⋆☾⋆⁺₊✧  Meals4U Database Main Menu  ✩₊˚.⋆☾⋆⁺₊✧

=============================================
Meals4U offers a variety of frozen homemade meals delivered to 
college students’ doorsteps made fresh under strict sanitary and 
food preparation regulations by trained individuals/volunteers.

Please choose from one of the following options to get started. 
=============================================

1) Produce a list of all tables in the database. 
2) Produce a list of the number of rows for each table. 

9) Quit.
""")
    
proj_repl()