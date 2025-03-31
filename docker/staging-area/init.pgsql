-- Create the tables for the staging area

CREATE TABLE Shippers (
  ShipperID INT PRIMARY KEY,
  CompanyName VARCHAR(255),
  Phone VARCHAR(255)
);

CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY,
  CompanyName VARCHAR(255),
  ContactName VARCHAR(255),
  ContactTitle VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  PostalCode VARCHAR(255),
  Country VARCHAR(255),
  Phone VARCHAR(255),
  Fax VARCHAR(255),
  HomePage VARCHAR(255)
);

CREATE TABLE EmployeeTerritories (
  EmployeeID INT,
  TerritoryID VARCHAR(255),
  PRIMARY KEY (EmployeeID, TerritoryID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);

CREATE TABLE Territories (
  TerritoryID VARCHAR(255) PRIMARY KEY,
  TerritoryDescription VARCHAR(255),
  RegionID INT,
  FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Region (
  RegionID INT PRIMARY KEY,
  RegionDescription VARCHAR(255)
);

CREATE TABLE Bonus (
  emp_id INT,
  bonus_date TEXT,
  bonus_amount INT,
  PRIMARY KEY (emp_id, bonus_date),
  FOREIGN KEY (emp_id) REFERENCES Employee(EmployeeID)
);

CREATE TABLE State (
  state_id VARCHAR(255) PRIMARY KEY,
  state_name VARCHAR(255),
  state_capital VARCHAR(255),
  country VARCHAR(255),
  region VARCHAR(255)
);

CREATE TABLE Person (
  BusinessEntityID INT PRIMARY KEY,
  PersonType VARCHAR(255),
  NameStyle VARCHAR(255),
  Title VARCHAR(255),
  FirstName VARCHAR(255),
  MiddleName VARCHAR(255),
  LastName VARCHAR(255),
  Suffix VARCHAR(255),
  EmailPromotion INT,
  ModifiedDate TIMESTAMP
);

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  NationalIDNumber VARCHAR(255) ,
  LoginID VARCHAR(255),
  OrganizationNode VARCHAR(255,
  OrganizationLevel INT,
  JobTitle VARCHAR(255),
  BirthDate TIMESTAMP,
  MaritalStatus VARCHAR(255),
  Gender VARCHAR(255),
  HireDate TIMESTAMP,
  SalariedFlag VARCHAR(255),
  VacationHours INT,
  SickLeaveHours INT,
  CurrentFlag VARCHAR(255),
  ModifiedDate TIMESTAMP,
  DepartmentID INT,
  LastName VARCHAR(255),
  FirstName VARCHAR(255),
  TitleOfCourtesy VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  Country VARCHAR(255),
  HomePhone VARCHAR(255),
  Extension VARCHAR(255),
  Photo VARCHAR(255),
  Notes VARCHAR(255),
  ReportsTo INT,
  manager_id INT,
  street VARCHAR(255),
  state VARCHAR(255),
  zip_code VARCHAR(255),
  phone VARCHAR(255),
  status VARCHAR(255),
  ss_number VARCHAR(255),
  salary DECIMAL(10, 2),
  bene_health_ins VARCHAR(255),
  bene_life_ins VARCHAR(255),
  bene_day_care VARCHAR(255),
  sex VARCHAR(255),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
  FOREIGN KEY (ReportsTo) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  PersonID INT,
  StoreID INT,
  TerritoryID INT,
  AccountNumber VARCHAR(255),
  CompanyName VARCHAR(255),
  ContactName VARCHAR(255),
  ContactTitle VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  PostalCode VARCHAR(255),
  Country VARCHAR(255),
  Phone VARCHAR(255),
  Fax VARCHAR(255),
  ModifiedDate TIMESTAMP,
  fname VARCHAR(255),
  lname VARCHAR(255),
  state VARCHAR(255),
  zip VARCHAR(255),
  FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID),
  FOREIGN KEY (StoreID) REFERENCES Store(BusinessEntityID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID)
);

CREATE TABLE SalesTerritory (
  TerritoryID INT PRIMARY KEY,
  Name VARCHAR(255),
  CountryRegionCode VARCHAR(255),
  Group VARCHAR(255),
  SalesYTD DECIMAL(10, 2),
  SalesLastYear DECIMAL(10, 2),
  CostYTD DECIMAL(10, 2),
  CostLastYear DECIMAL(10, 2),
  ModifiedDate TIMESTAMP
);

CREATE TABLE Store (
  BusinessEntityID INT PRIMARY KEY,
  Name VARCHAR(255),
  SalesPersonID INT,
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (SalesPersonID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Address (
  AddressID INT PRIMARY KEY,
  AddressLine1 VARCHAR(255),
  AddressLine2 VARCHAR(255),
  City VARCHAR(255),
  StateProvinceID INT,
  PostalCode VARCHAR(255),
  SpatialLocation VARCHAR(255),
  ModifiedDate TIMESTAMP,
  BusinessEntityID INT,
  FOREIGN KEY (StateProvinceID) REFERENCES State(state_id),
  FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY,
  Name VARCHAR(255),
  GroupName VARCHAR(255),
  dept_head_id INT,
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (dept_head_id) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(255),
  ProductNumber VARCHAR(255),
  MakeFlag VARCHAR(255),
  FinishedGoodsFlag VARCHAR(255),
  Color VARCHAR(255),
  SafetyStockLevel INT,
  ReorderPoint INT,
  StandardCost DECIMAL(10, 2),
  ListPrice DECIMAL(10, 2),
  Size VARCHAR(255),
  SizeUnitMeasureCode VARCHAR(255),
  WeightUnitMeasureCode VARCHAR(255),
  Weight DECIMAL(10, 2),
  DaysToManufacture INT,
  ProductLine VARCHAR(255),
  Class VARCHAR(255),
  Style VARCHAR(255),
  SellStartDate DATE,
  SellEndDate DATE,-0=
  DiscontinuedDate DATE,
  ModifiedDate TIMESTAMP,
  ProductCategoryID INT,
  SupplierID INT,
  QuantityPerUnit VARCHAR(255),
  UnitPrice DECIMAL(10, 2),
  UnitsInStock INT,
  ReorderLevel INT,
  Discontinued VARCHAR(255),
  description VARCHAR(255),
  color VARCHAR(255),
  quanitity INT,
  picture_name VARCHAR(255),
  category VARCHAR(255),
  FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory(ProductCategoryID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE PurchaseOrderHeader (
  PurchaseOrderID INT PRIMARY KEY,
  RevisionNumber INT,
  Status VARCHAR(255),
  EmployeeID INT,
  VendorID INT,
  OrderDate DATE,
  ShipDate DATE,
  SubTotal DECIMAL(10, 2),
  TaxAmt DECIMAL(10, 2),
  Freight DECIMAL(10, 2),
  TotalDue DECIMAL(10, 2),
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (VendorID) REFERENCES Vendor(BusinessEntityID)
);

CREATE TABLE PurchaseOrderDetail (
  PurchaseOrderID INT,
  PurchaseOrderDetailID INT,
  DueDate DATE,
  OrderQty INT,
  ProductID INT,
  UnitPrice DECIMAL(10, 2),
  LineTotal DECIMAL(10, 2),
  ReceivedQty INT,
  RejectedQty INT,
  StockedQty INT,
  ModifiedDate TIMESTAMP,
  PRIMARY KEY (PurchaseOrderID, PurchaseOrderDetailID),
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrderHeader(PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Vendor (
  BusinessEntityID INT PRIMARY KEY,
  AccountNumber VARCHAR(255),
  Name VARCHAR(255),
  CreditRating INT,
  PreferredVendorStatus VARCHAR(255),
  ActiveFlag VARCHAR(255),
  PurchasingWebServceURL VARCHAR(255),
  ModifiedDate TIMESTAMP
);

CREATE TABLE ProductCategory (
  ProductCategoryID INT PRIMARY KEY,
  Name VARCHAR(255),
  ModifiedDate TIMESTAMP,
  Description VARCHAR(255),
  Picture VARCHAR(255)
);

CREATE TABLE Shippers (
  ShipperID INT PRIMARY KEY,
  CompanyName VARCHAR(255),
  Phone VARCHAR(255)
);

CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY,
  CompanyName VARCHAR(255),
  ContactName VARCHAR(255),
  ContactTitle VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  PostalCode VARCHAR(255),
  Country VARCHAR(255),
  Phone VARCHAR(255),
  Fax VARCHAR(255),
  HomePage VARCHAR(255)
);

CREATE TABLE EmployeeTerritories (
  EmployeeID INT,
  TerritoryID INT,
  PRIMARY KEY (EmployeeID, TerritoryID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);

CREATE TABLE Territories (
  TerritoryID INT PRIMARY KEY,
  TerritoryDescription VARCHAR(255),
  RegionID INT,
  FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Region (
  RegionID INT PRIMARY KEY,
  RegionDescription VARCHAR(255)
);

CREATE TABLE Bonus (
  emp_id INT,
  bonus_date DATE,
  bonus_amount DECIMAL(10, 2),
  PRIMARY KEY (emp_id, bonus_date),
  FOREIGN KEY (emp_id) REFERENCES Employee(EmployeeID)
);

CREATE TABLE State (
  state_id INT PRIMARY KEY,
  state_name VARCHAR(255),
  state_capital VARCHAR(255),
  country VARCHAR(255),
  region VARCHAR(255)
);

CREATE TABLE Person (
  BusinessEntityID INT PRIMARY KEY,
  PersonType VARCHAR(255),
  NameStyle VARCHAR(255),
  Title VARCHAR(255),
  FirstName VARCHAR(255),
  MiddleName VARCHAR(255),
  LastName VARCHAR(255),
  Suffix VARCHAR(255),
  EmailPromotion INT,
  ModifiedDate TIMESTAMP
);

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  NationalIDNumber VARCHAR(255),
  LoginID VARCHAR(255),
  OrganizationNode VARCHAR(255),
  OrganizationLevel INT,
  JobTitle VARCHAR(255),
  BirthDate DATE,
  MaritalStatus VARCHAR(255),
  Gender VARCHAR(255),
  HireDate DATE,
  SalariedFlag VARCHAR(255),
  VacationHours INT,
  SickLeaveHours INT,
  CurrentFlag VARCHAR(255),
  ModifiedDate TIMESTAMP,
  DepartmentID INT,
  LastName VARCHAR(255),
  FirstName VARCHAR(255),
  TitleOfCourtesy VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  Country VARCHAR(255),
  HomePhone VARCHAR(255),=
  Extension VARCHAR(255),
  Photo VARCHAR(255),
  Notes VARCHAR(255),
  ReportsTo INT,
  manager_id INT,
  street VARCHAR(255),
  state VARCHAR(255),
  zip_code VARCHAR(255),
  phone VARCHAR(255),
  status VARCHAR(255),
  ss_number VARCHAR(255),
  salary DECIMAL(10, 2),
  bene_health_ins VARCHAR(255),
  bene_life_ins VARCHAR(255),
  bene_day_care VARCHAR(255),
  sex VARCHAR(255),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
  FOREIGN KEY (ReportsTo) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  PersonID INT,
  StoreID INT,
  TerritoryID INT,
  AccountNumber VARCHAR(255),
  CompanyName VARCHAR(255),
  ContactName VARCHAR(255),
  ContactTitle VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Region VARCHAR(255),
  PostalCode VARCHAR(255),
  Country VARCHAR(255),
  Phone VARCHAR(255),
  Fax VARCHAR(255),
  ModifiedDate TIMESTAMP,
  fname VARCHAR(255),
  lname VARCHAR(255),
  state VARCHAR(255),
  zip VARCHAR(255),
  FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID),
  FOREIGN KEY (StoreID) REFERENCES Store(BusinessEntityID),
  FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID)
);

CREATE TABLE SalesTerritory (
  TerritoryID INT PRIMARY KEY,
  Name VARCHAR(255),
  CountryRegionCode VARCHAR(255),
  Group VARCHAR(255),
  SalesYTD DECIMAL(10, 2),
  SalesLastYear DECIMAL(10, 2),
  CostYTD DECIMAL(10, 2),
  CostLastYear DECIMAL(10, 2),
  ModifiedDate TIMESTAMP
);

CREATE TABLE Store (
  BusinessEntityID INT PRIMARY KEY,
  Name VARCHAR(255),
  SalesPersonID INT,
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (SalesPersonID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Address (
  AddressID INT PRIMARY KEY,
  AddressLine1 VARCHAR(255),
  AddressLine2 VARCHAR(255),
  City VARCHAR(255),
  StateProvinceID INT,
  PostalCode VARCHAR(255),
  SpatialLocation VARCHAR(255),
  ModifiedDate TIMESTAMP,
  BusinessEntityID INT,
  FOREIGN KEY (StateProvinceID) REFERENCES State(state_id),
  FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY,
  Name VARCHAR(255),
  GroupName VARCHAR(255),
  dept_head_id INT,
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (dept_head_id) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(255),
  ProductNumber VARCHAR(255),
  MakeFlag VARCHAR(255),
  FinishedGoodsFlag VARCHAR(255),
  Color VARCHAR(255),
  SafetyStockLevel INT,
  ReorderPoint INT,
  StandardCost DECIMAL(10, 2),
  ListPrice DECIMAL(10, 2),
  Size VARCHAR(255),
  SizeUnitMeasureCode VARCHAR(255),
  WeightUnitMeasureCode VARCHAR(255),
  Weight DECIMAL(10, 2),
  DaysToManufacture INT,
  ProductLine VARCHAR(255),
  Class VARCHAR(255),
  Style VARCHAR(255),
  SellStartDate DATE,
  SellEndDate DATE,
  DiscontinuedDate DATE,
  ModifiedDate DATE,
  ProductCategoryID INT,
  SupplierID INT,
  QuantityPerUnit VARCHAR(255),
  UnitPrice DECIMAL(10, 2),
  UnitsInStock INT,
  ReorderLevel INT,
  Discontinued VARCHAR(255),
  description VARCHAR(255),
  color VARCHAR(255),
  quanitity INT,
  picture_name VARCHAR(255),
  category VARCHAR(255),
  FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory(ProductCategoryID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE PurchaseOrderHeader (
  PurchaseOrderID INT PRIMARY KEY,
  RevisionNumber INT,
  Status VARCHAR(255),
  EmployeeID INT,
  VendorID INT,
  OrderDate DATE,
  ShipDate DATE,
  SubTotal DECIMAL(10, 2),
  TaxAmt DECIMAL(10, 2),
  Freight DECIMAL(10, 2),
  TotalDue DECIMAL(10, 2),
  ModifiedDate TIMESTAMP,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (VendorID) REFERENCES Vendor(BusinessEntityID)
);

CREATE TABLE PurchaseOrderDetail (
  PurchaseOrderID INT,
  PurchaseOrderDetailID INT,
  DueDate DATE,
  OrderQty INT,
  ProductID INT,
  UnitPrice DECIMAL(10, 2),
  LineTotal DECIMAL(10, 2),
  ReceivedQty INT,
  RejectedQty INT,
  StockedQty INT,
  ModifiedDate TIMESTAMP,
  PRIMARY KEY (PurchaseOrderID, PurchaseOrderDetailID),
  FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrderHeader(PurchaseOrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Vendor (
  BusinessEntityID INT PRIMARY KEY,
  AccountNumber VARCHAR(255),
  Name VARCHAR(255),
  CreditRating INT,
  PreferredVendorStatus VARCHAR(255),
  ActiveFlag VARCHAR(255),
  PurchasingWebServceURL VARCHAR(255),
  ModifiedDate TIMESTAMP
);

CREATE TABLE ProductCategory (
  ProductCategoryID INT PRIMARY KEY,
  Name VARCHAR(255),
  ModifiedDate TIMESTAMP,
  Description VARCHAR(255),
  Picture VARCHAR(255)
);
