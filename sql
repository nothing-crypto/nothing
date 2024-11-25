Step 1: Create the Database and Tables
sql
Copy code
-- Create Database
CREATE DATABASE LoanSystem;

-- Use the created Database
USE LoanSystem;

-- Create Loan table
CREATE TABLE Loan (
    loan_number INT PRIMARY KEY,
    branch_name VARCHAR(100),
    amount DECIMAL(10, 2),
    asset DECIMAL(10, 2)
);

-- Create Borrower table
CREATE TABLE Borrower (
    Customer_name VARCHAR(100),
    loan_number INT,
    FOREIGN KEY (loan_number) REFERENCES Loan(loan_number)
);

-- Insert Sample Data into Loan table
INSERT INTO Loan (loan_number, branch_name, amount, asset) VALUES
(101, 'New York', 150000, 50000),
(102, 'Los Angeles', 200000, 80000),
(103, 'Chicago', 120000, 60000),
(104, 'New York', 250000, 120000),
(105, 'Los Angeles', 180000, 75000),
(106, 'Chicago', 95000, 45000);

-- Insert Sample Data into Borrower table
INSERT INTO Borrower (Customer_name, loan_number) VALUES
('John Doe', 101),
('Jane Smith', 102),
('Alice Brown', 103),
('Bob Johnson', 104),
('Charlie Davis', 105),
('Eva Wilson', 106);
Step 2: Complex Query Implementations
1. Find the average loan amount and asset value for each branch, grouped by branch, ordered by average loan amount:
sql
Copy code
SELECT L.branch_name, 
       AVG(L.amount) AS avg_loan_amount,
       AVG(L.asset) AS avg_asset_value
FROM Loan L
GROUP BY L.branch_name
ORDER BY avg_loan_amount DESC;
2. Find borrowers with total loan amounts greater than 200,000, using a subquery:
sql
Copy code
SELECT B.Customer_name, L.amount
FROM Borrower B
JOIN Loan L ON B.loan_number = L.loan_number
WHERE L.amount > (SELECT 200000);
3. Find branches where the total loan amount exceeds 500,000 using GROUP BY and HAVING:
sql
Copy code
SELECT L.branch_name, SUM(L.amount) AS total_loan_amount
FROM Loan L
GROUP BY L.branch_name
HAVING SUM(L.amount) > 500000;
4. Find the loan numbers with the highest and lowest asset values, grouped by branch:
sql
Copy code
SELECT L.branch_name, 
       MAX(L.asset) AS highest_asset, 
       MIN(L.asset) AS lowest_asset
FROM Loan L
GROUP BY L.branch_name;
5. Find the number of loans per branch where the loan amount exceeds 100,000:
sql
Copy code
SELECT L.branch_name, COUNT(L.loan_number) AS loan_count
FROM Loan L
WHERE L.amount > 100000
GROUP BY L.branch_name;
6. Find the total number of borrowers and the total loan amount for each branch, using JOIN and GROUP BY:
sql
Copy code
SELECT L.branch_name, 
       COUNT(DISTINCT B.Customer_name) AS num_borrowers,
       SUM(L.amount) AS total_loan_amount
FROM Loan L
JOIN Borrower B ON L.loan_number = B.loan_number
GROUP BY L.branch_name;
7. Find the average loan amount for customers from the New York branch and compare it to customers from Los Angeles (with nested queries):
sql
Copy code
SELECT 
    (SELECT AVG(amount) FROM Loan WHERE branch_name = 'New York') AS avg_new_york_loan,
    (SELECT AVG(amount) FROM Loan WHERE branch_name = 'Los Angeles') AS avg_la_loan;
8. List all borrowers whose loan amounts exceed the average loan amount of their respective branch (nested subquery):
sql
Copy code
SELECT B.Customer_name, L.amount, L.branch_name
FROM Borrower B
JOIN Loan L ON B.loan_number = L.loan_number
WHERE L.amount > 
    (SELECT AVG(amount) 
     FROM Loan 
     WHERE branch_name = L.branch_name);
9. Find the loan number and branch for the 3 highest loan amounts using ORDER BY and LIMIT:
sql
Copy code
SELECT L.loan_number, L.branch_name, L.amount
FROM Loan L
ORDER BY L.amount DESC
LIMIT 3;

10. Find the total loan amount and asset value for each branch where the asset value is greater than 70,000:

SELECT L.branch_name, 
       SUM(L.amount) AS total_loan_amount,
       SUM(L.asset) AS total_asset_value
FROM Loan L
WHERE L.asset > 70000
GROUP BY L.branch_name;
11. Find the customer names from the New York branch where the loan amount exceeds the average amount in New York:
sql
Copy code
SELECT B.Customer_name, L.amount
FROM Borrower B
JOIN Loan L ON B.loan_number = L.loan_number
WHERE L.branch_name = 'New York' 
AND L.amount > 
    (SELECT AVG(amount) FROM Loan WHERE branch_name = 'New York');
12. Find the branch with the highest total asset value (GROUP BY, ORDER BY, LIMIT):
sql
Copy code
SELECT L.branch_name, SUM(L.asset) AS total_asset_value
FROM Loan L
GROUP BY L.branch_name
ORDER BY total_asset_value DESC
LIMIT 1;
