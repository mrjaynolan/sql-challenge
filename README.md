#SQL Challenge

## Overview

This project is a SQL-based challenge that involves creating a relational database for managing employee information. The project is divided into three main parts: Data Modeling, Data Engineering, and Data Analysis.

- **Data Modeling**: Involves the design of the database schema.
- **Data Engineering**: Focuses on creating the tables and importing data into them.
- **Data Analysis**: Consists of running SQL queries to retrieve specific information from the database.

## Database Structure

The database includes the following tables:

1. **departments**: Stores department information.
2. **titles**: Contains job titles.
3. **employees**: Holds employee details, linked to job titles.
4. **dept_emp**: Represents the many-to-many relationship between employees and departments.
5. **dept_manager**: Manages the relationship between departments and their managers.
6. **salaries**: Contains salary information for each employee.

## Files Included

- **create_tables.sql**: SQL script to create the database tables.
- **data_analysis.sql**: SQL script with queries to extract specific information from the database.
- **README.md**: This file, providing an overview and instructions for the project.

## How to Use

### Prerequisites

- **PgAdmin 4**: This tool is recommended for managing and querying the PostgreSQL database.
- **PostgreSQL**: The database management system that will run the SQL scripts.

### Steps to Run

1. **Create the Database**:
    - Open PgAdmin 4.
    - Create a new database (e.g., `employee_db`).
  
2. **Run the SQL Scripts**:
    - **Create Tables**: Open `create_tables.sql` in the PgAdmin query editor and execute the script. This will create the necessary tables.
    - **Import Data**: Ensure that data is imported into each table corresponding to the schema defined in the `create_tables.sql`.
  
3. **Run Data Analysis Queries**:
    - Open `data_analysis.sql` in the PgAdmin query editor and execute the queries to retrieve the required information.

### Data Analysis Queries

The following queries are included in the `data_analysis.sql` file:

1. **Employee Details with Salary**: Retrieves the employee number, last name, first name, gender, and salary of each employee.
2. **Employees Hired in 1986**: Lists the first name, last name, and hire date for employees who were hired in 1986.
3. **Managers of Each Department**: Lists the department number, department name, employee number, last name, and first name of each manager.
4. **Department and Employee Details**: Lists the department number for each employee along with their employee number, last name, first name, and department name.
5. **Employees Named Hercules B**: Lists first name, last name, and gender of employees whose first name is Hercules and last name begins with the letter B.
6. **Employees in Sales Department**: Lists employees in the Sales department with their employee number, last name, and first name.
7. **Employees in Sales and Development Departments**: Lists employees in the Sales and Development departments with their employee number, last name, first name, and department name.
8. **Frequency Count of Last Names**: Lists the frequency count of each last name in descending order.
