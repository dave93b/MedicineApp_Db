Create DataBase MedicineDb collate Cyrillic_General_CI_AS
GO

use MedicineDb
GO


Create table Pharmacy
(
	[PharmacyId] int identity(1,1) NOT NULL,
	[PharmacyName] NVARCHAR (100) NOT NULL,
	[PharmacyCity] NVARCHAR (50) NOT NULL,
	[PharmacyStreet] NVARCHAR (50) NOT NULL,
	[PharmacyHouseNumber] NVARCHAR (10) NOT NULL
)
GO

ALTER TABLE Pharmacy
add constraint 
PK_PHARMACY_PharmacyId PRIMARY KEY(PharmacyId)
GO


Create table Manufacturer
(
	[ManufacturerId] int identity(1,1) NOT NULL,
	[ManufacturerName] NVARCHAR (100) NOT NULL,
	[ManufacturerCity] NVARCHAR (50) NOT NULL,
	[ManufacturerStreet] NVARCHAR (50) NOT NULL,
	[ManufacturerHouseNumber] NVARCHAR (10) NOT NULL
)
GO

ALTER TABLE Manufacturer
add constraint 
PK_MANUFACTURER_ManufacturerId PRIMARY KEY(ManufacturerId)
GO


Create table MedicineForm
(
	[MedicineFormId] int identity(1,1) NOT NULL,
	[MedicineFormName] NVARCHAR (20) NOT NULL
)
GO

ALTER TABLE MedicineForm
add constraint 
PK_MedicineForm_MedicineFormId PRIMARY KEY(MedicineFormId)
GO


Create table MedicineUnit
(
	[MedicineUnitId] int identity(1,1) NOT NULL,
	[MedicineUnitName] NVARCHAR (20) NOT NULL
)
GO

ALTER TABLE MedicineUnit
add constraint 
PK_MedicineUnit_MedicineUnitId PRIMARY KEY(MedicineUnitId)
GO


Create table Medicine
(
	[MedicineId] int identity(1,1) NOT NULL,
	[MedicineName] NVARCHAR (max) NOT NULL,
	[MedicineFormId] int not null,
	[Quantity] int not null,
	[Weight] decimal(5,2) null,
	[MedicineUnitId] int not null,
	[ManufacturerId] int not null,
	[Price] decimal(5,2) NOT NULL,
	[PharmacyId] int not null,
	[DeliveryDate] date not null,
	[InvoiceNumber] NVARCHAR (10) NOT NULL
)
GO

ALTER TABLE Medicine
add constraint 
PK_MEDICINE_MedicineId PRIMARY KEY(MedicineId)
GO

ALTER TABLE Medicine
add constraint 
FK_Medicine_MedicineFormId FOREIGN KEY(MedicineFormId)
REFERENCES MedicineForm(MedicineFormId)
GO

ALTER TABLE Medicine
add constraint 
FK_Medicine_MedicineUnitId FOREIGN KEY(MedicineUnitId)
REFERENCES MedicineUnit(MedicineUnitId)
GO

ALTER TABLE Medicine
add constraint 
FK_Medicine_ManufacturerId FOREIGN KEY(ManufacturerId)
REFERENCES Manufacturer(ManufacturerId)
GO

ALTER TABLE Medicine
add constraint 
FK_Medicine_PharmacyId FOREIGN KEY(PharmacyId)
REFERENCES Pharmacy(PharmacyId)
GO