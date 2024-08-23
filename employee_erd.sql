--- Employee SQL Challenge ---

--- Data Engineering ---

-- Create Tables --

-- Departments
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(18) NOT NULL
);

-- Titles
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(18) NOT NULL
);

-- Employees
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Department Employees
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Department Manager
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Salaries
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--- Data Analysis ---

-- Employee #, last and first name, sex, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
    ON e.emp_no = s.emp_no;

-- First name, last name, hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Manager of each department, department no, department name, employee number, last and first name
SELECT dm.emp_no, dm.dept_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN departments AS d
    ON dm.dept_no = d.dept_no
JOIN employees AS e
    ON dm.emp_no = e.emp_no;

-- Department number for each employee, employee number, last and first name, department name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e
    ON de.emp_no = e.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no;

-- First name, last name, sex for employees whose first name is Hercules and last name begins with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Employees in Sales department, employee number, last and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Employees in Sales and Development departments, employee number, last and first name, department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Frequency count of employee last names
SELECT last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;