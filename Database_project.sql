-- Create the database
CREATE DATABASE IF NOT EXISTS StockExchangeDB;

-- Use the database
USE StockExchangeDB;

-- Create the Users table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    pswd VARCHAR(100) NOT NULL,
    roles ENUM('Admin', 'Trader') NOT NULL,
    Savings DECIMAL(10,2),
    Tax DECIMAL(10,2),
    UNIQUE (Username)
);
INSERT INTO Users (Username, pswd, roles, Savings, Tax) VALUES
('admin', 'adminpassword', 'Admin', NULL, NULL),
('trader1', 'traderpassword', 'Trader', 10000.00, NULL),
('trader2', 'traderpassword', 'Trader', 15000.00, NULL);
Select * from Users;

-- Create the Stocks table
CREATE TABLE IF NOT EXISTS Stocks (
    StockID INT AUTO_INCREMENT PRIMARY KEY,
    StockName VARCHAR(100) NOT NULL,
    StockCode VARCHAR(10) NOT NULL,
    MarketPrice DECIMAL(10,2) NOT NULL,
    UNIQUE (StockCode)
);
INSERT INTO Stocks (StockName, StockCode, MarketPrice) VALUES
('Apple Inc.', 'AAPL', 150.50),
('Microsoft Corporation', 'MSFT', 200.75),
('Amazon.com Inc.', 'AMZN', 3200.00);
Select * from Stocks;
-- Create the Transactions table
CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    StockID INT,
    TransactionType ENUM('Buy', 'Sell') NOT NULL,
    Shares INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    TransactionDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID)
);

-- Sample data for Transactions table
INSERT INTO Transactions (UserID, StockID, TransactionType, Shares, Price, TransactionDate) VALUES
(2, 1, 'Buy', 10, 150.50, '2024-03-13'),
(2, 2, 'Buy', 20, 200.75, '2024-03-13'),
(2, 2, 'Sell', 20, 200.75, '2024-03-13'),
(3, 1, 'Buy', 5, 150.50, '2024-03-13'),
(3, 3, 'Buy', 15, 3200.00, '2024-03-13');

SELECT * FROM Transactions;
