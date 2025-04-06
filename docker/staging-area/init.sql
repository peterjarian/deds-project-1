CREATE TABLE Shippers (
  ShipperID INT PRIMARY KEY,
  CompanyName VARCHAR(255) NOT NULL,
  Phone VARCHAR(255)
);

CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY,
  CompanyName VARCHAR(255),
  ContactName VARCHAR(255),
  ContactTitle VARCHAR(255),
  `Address` VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  PostalCode VARCHAR(255),
  Country VARCHAR(255),
  Phone VARCHAR(255),
  Fax VARCHAR(255),
  HomePage VARCHAR(255)
);

CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY,
  `Name` VARCHAR(255),
  GroupName VARCHAR(255),
  dept_head_id INT,
  ModifiedDate TIMESTAMP
);

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  NationalIDNumber VARCHAR(255),
  LoginID VARCHAR(255),
  OrganizationLevel INT,
  JobTitle VARCHAR(255),
  BirthDate DATE,
  MaritalStatus VARCHAR(1),
  Gender VARCHAR(1),
  HireDate DATE,
  SalariedFlag INT,
  VacationHours INT,
  SickLeaveHours INT,
  CurrentFlag INT,
  ModifiedDate TIMESTAMP,
  DepartmentID INT,
  LastName VARCHAR(255),
  FirstName VARCHAR(255),
  TitleOfCourtesy VARCHAR(255),
  `Address` VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  Country VARCHAR(255),
  HomePhone VARCHAR(255),
  Extension VARCHAR(255),
  Notes VARCHAR(255),
  ReportsTo INT,
  manager_id INT,
  street VARCHAR(255),
  `state` VARCHAR(255),
  zip_code INT,
  phone varchar(255),
  `status` VARCHAR(255),
  ss_number INT,
  salary INT,
  bene_health_ins VARCHAR(1),
  bene_life_ins VARCHAR(1),
  bene_day_care VARCHAR(1),
  sex VARCHAR(1),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
  FOREIGN KEY (ReportsTo) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Region (
  RegionID INT PRIMARY KEY,
  RegionDescription VARCHAR(255)
);

CREATE TABLE Territories (
  TerritoryID varchar(255) PRIMARY KEY,
  TerritoryDescription VARCHAR(255),
  RegionID INT,
  FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE EmployeeTerritories (
  EmployeeID INT,
  TerritoryID VARCHAR(255),
  PRIMARY KEY (EmployeeID, TerritoryID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);

CREATE TABLE Bonus (
  emp_id INT,
  bonus_date DATE,
  bonus_amount INT,
  PRIMARY KEY (emp_id, bonus_date),
  FOREIGN KEY (emp_id) REFERENCES Employee(EmployeeID)
);

CREATE TABLE `State` (
  state_id VARCHAR(2) PRIMARY KEY,
  state_name VARCHAR(255),
  state_capital VARCHAR(255),
  country VARCHAR(3),
  region VARCHAR(255)
);

CREATE TABLE Person (
  PersonID INT PRIMARY KEY,
  PersonType VARCHAR(2),
  NameStyle INT,
  Title VARCHAR(255),
  FirstName VARCHAR(255),
  MiddleName VARCHAR(255),
  LastName VARCHAR(255),
  Suffix VARCHAR(255),
  EmailPromotion INT,
  ModifiedDate TIMESTAMP
);

CREATE TABLE SalesTerritory (
  TerritoryID INT PRIMARY KEY,
  `Name` VARCHAR(255),
  CountryRegionCode VARCHAR(255),
  `Group` VARCHAR(255),
  SalesYTD DECIMAL(65, 4),
  SalesLastYear DECIMAL(65, 4),
  CostYTD DECIMAL(65, 4),
  CostLastYear DECIMAL(65, 4),
  ModifiedDate TIMESTAMP
);

CREATE TABLE Store (
  StoreID INT PRIMARY KEY,
  `Name` VARCHAR(255),
  EmployeeID INT,
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY ,
  PersonID INT,
  StoreID INT,
  TerritoryID INT,
  AccountNumber VARCHAR(255),
  CompanyName VARCHAR(255),
  ContactName VARCHAR(255),
  ContactTitle VARCHAR(255),
  `Address` VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  PostalCode VARCHAR(255),
  Country VARCHAR(255),
  Phone int,
  Fax VARCHAR(255),
  ModifiedDate TIMESTAMP,
  fname VARCHAR(255),
  lname VARCHAR(255),
  `state` VARCHAR(255),
  zip VARCHAR(255),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
  FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID)
);

CREATE TABLE Address (
  AddressID INT PRIMARY KEY,
  AddressLine1 VARCHAR(255),
  AddressLine2 VARCHAR(255),
  City VARCHAR(255),
  StateProvinceID INT,
  PostalCode VARCHAR(255),
  ModifiedDate TIMESTAMP,
  PersonID INT,
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE ProductCategory (
  ProductCategoryID INT PRIMARY KEY,
  `Name` VARCHAR(255),
  ModifiedDate TIMESTAMP,
  `description` VARCHAR(255)
);

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(255),
  ProductNumber VARCHAR(255),
  MakeFlag INT,
  FinishedGoodsFlag INT,
  Color VARCHAR(255),
  SafetyStockLevel INT,
  ReorderPoint INT,
  StandardCost DECIMAL(65, 4),
  ListPrice DECIMAL(65, 4),
  `Size` VARCHAR(255),
  SizeUnitMeasureCode VARCHAR(255),
  WeightUnitMeasureCode VARCHAR(255),
  `Weight` NUMERIC(8, 2),
  DaysToManufacture INT,
  ProductLine VARCHAR(255),
  Class VARCHAR(255),
  Style VARCHAR(255),
  SellStartDate TIMESTAMP,
  SellEndDate TIMESTAMP,
  DiscontinuedDate TIMESTAMP,
  ModifiedDate TIMESTAMP,
  ProductCategoryID INT,
  SupplierID INT,
  QuantityPerUnit VARCHAR(255),
  UnitPrice INT,
  UnitsInStock INT,
  ReorderLevel INT,
  Discontinued INT,
  `description` VARCHAR(255),
  quanitity INT,
  category VARCHAR(255),
  FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory(ProductCategoryID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Vendor (
  VendorID INT PRIMARY KEY,
  AccountNumber VARCHAR(255),
  `Name` VARCHAR(255),
  CreditRating INT,
  PreferredVendorStatus INT,
  ActiveFlag INT,
  PurchasingWebServceURL VARCHAR(255),
  ModifiedDate TIMESTAMP
);

CREATE TABLE PurchaseOrderHeader (
  PurchaseOrderID INT PRIMARY KEY,
  RevisionNumber INT,
  `Status` INT,
  EmployeeID INT,
  VendorID INT,
  OrderDate TIMESTAMP,
  ShipDate TIMESTAMP,
  SubTotal DECIMAL(65, 4),
  TaxAmt DECIMAL(65, 4),
  Freight DECIMAL(65, 4),
  TotalDue DECIMAL(65, 4),
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
);

CREATE TABLE PurchaseOrderDetail (
  PurchaseOrderID INT,
  PurchaseOrderDetailID INT,
  DueDate TIMESTAMP,
  OrderQty INT,
  ProductID INT,
  UnitPrice DECIMAL(65, 4),
  LineTotal DECIMAL(65, 4),
  ReceivedQty NUMERIC(8,2),
  RejectedQty NUMERIC(8,2),
  StockedQty NUMERIC(9,2),
  ModifiedDate TIMESTAMP,
  PRIMARY KEY (PurchaseOrderID, PurchaseOrderDetailID),
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrderHeader(PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE SalesOrderHeader (
  SalesOrderID INT PRIMARY KEY,
  RevisionNumber INT,
  OrderDate TIMESTAMP,
  DueDate TIMESTAMP,
  ShipDate TIMESTAMP,
  `Status` INT,
  OnlineOrderFlag INT,
  SalesOrderNumber VARCHAR(255),
  PurchaseOrderNumber VARCHAR(255),
  AccountNumber VARCHAR(255),
  CustomerID INT,
  EmployeeID INT,
  TerritoryID INT,
  BillToAddressID INT,
  ShipToAddressID INT,
  ShipMethodID INT,
  CreditCardID INT,
  CreditCardApprovalCode VARCHAR(255),
  SubTotal DECIMAL(65, 4),
  TaxAmt DECIMAL(65, 4),
  Freight DECIMAL(65, 4),
  TotalDue DECIMAL(65, 4),
  Comment VARCHAR(65),
  ModifiedDate TIMESTAMP,
  RequiredDate DATETIME,
  ShippedDate DATETIME,
  ShipVia INT,
  ShipName VARCHAR(255),
  ShipAddress VARCHAR(255),
  ShipCity VARCHAR(255),
  ShipRegion VARCHAR(255),
  ShipPostalCode VARCHAR(255),
  ShipCountry VARCHAR(255),
  cust_id INT,
  region VARCHAR(255),
  sales_rep INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID),
  FOREIGN KEY (BillToAddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (ShipToAddressID) REFERENCES Address(AddressID)
);

CREATE TABLE BillsOfMaterials (
  BillOfMaterialsID INT PRIMARY KEY,
  ProductAssemblyID INT,
  ComponentID INT,
  StartDate TIMESTAMP,
  EndDate TIMESTAMP,
  UnitMeasureCode VARCHAR(255),
  BOMLevel INT,
  PerAssemblyQty NUMERIC(8,2),
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (ProductAssemblyID) REFERENCES Product(ProductID),
  FOREIGN KEY (ComponentID) REFERENCES Product(ProductID)
);

CREATE TABLE SalesOrderDetail (
  SalesOrderID INT,
  SalesOrderDetailID INT,
  CarrierTrackingNumber VARCHAR(255),
  OrderQty INT,
  ProductID INT,
  UnitPrice DECIMAL(65, 4),
  UnitPriceDiscount DECIMAL(65, 4),
  LineTotal NUMERIC(28,6),
  ModifiedDate TIMESTAMP,
  Discount DECIMAL(10, 2),
  ship_date TEXT,
  line_id INT,
  PRIMARY KEY (SalesOrderID, SalesOrderDetailID),
  FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader(SalesOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);  
