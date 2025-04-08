-- Create the tables for the data warehouse

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY, # Northwind & AenC & AdventureWorks
    Name VARCHAR(255), # Northwind & AenC & AdventureWorks
    Color VARCHAR(50), # AenC & AdventureWorks
    Size VARCHAR(50), # AenC & AdventureWorks
    SizeUnitMeasureCode VARCHAR(50), # AdventureWorks
    Weight DECIMAL(10, 2), # AdventureWorks
    WeightUnitMeasureCode VARCHAR(50), # AdventureWorks
    Discontinued BOOLEAN, # Northwind & AdventureWorks (date) - if current > date then discontinued
    StandardCost DECIMAL(10, 2), # AdventureWorks
    Price DECIMAL(10, 2), # Northwind & AenC & AdventureWorks
    SafetyStockLevel INT, # AdventureWorks 
    ReorderPoint INT, # Northwind & AdventureWorks
    ProductCategoryName VARCHAR(255) # 
);

CREATE TABLE DimVendor ( 
    VendorID INT PRIMARY KEY,
    `Name` VARCHAR(255),	
    ActiveFlag BOOLEAN
);


CREATE TABLE DimEmployee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Title VARCHAR(100),
    DepartmentName VARCHAR(255),
    DepartmentGroupName VARCHAR(255)
);

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    `Address` VARCHAR(255),
    City VARCHAR(100),
    Zip VARCHAR(20),
    `State` VARCHAR(50),
    Country VARCHAR(100),
    Phone VARCHAR(50),
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);

CREATE TABLE FactInkoop (
    PurchaseOrderID INT NOT NULL,
    PurchaseOrderDetailID INT NOT NULL,
    VendorID INT,
    EmployeeID INT,
    ProductID INT,
    OrderDate TIMESTAMP,
    ShipDate TIMESTAMP,
    OrderQty INT,
    UnitPrice DECIMAL(10,2),
    LineTotal DECIMAL(10,2),
    ReceivedQty INT,
    RejectedQty INT,
    StockedQty INT,
    TotalDue DECIMAL(10,2),
    TaxAmt DECIMAL(10,2),
    SubTotal DECIMAL(10,2),

    PRIMARY KEY (PurchaseOrderID, PurchaseOrderDetailID),
    FOREIGN KEY (VendorID) REFERENCES DimVendor(VendorID),
    FOREIGN KEY (EmployeeID) REFERENCES DimEmployee(EmployeeID), 
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID)

);
    
CREATE TABLE FactVerkoop (
    SalesOrderID INT,
    SalesOrderDetailID INT,
    OrderDate TIMESTAMP NOT NULL,
    ShipDate TIMESTAMP NULL,
    CustomerID INT,
    EmployeeID INT,
    ProductID INT,
    OrderQty INT,
    UnitPrice DECIMAL(10, 2),
    LineTotal DECIMAL(10, 2),
    Discount DECIMAL(10, 2),
    SubTotal DECIMAL(10, 2),
    TaxAmt DECIMAL(10, 2),
    TotalDue DECIMAL(10, 2),
    Status INT,

    PRIMARY KEY (SalesOrderID, SalesOrderDetailID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES DimEmployee(EmployeeID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID)

);
