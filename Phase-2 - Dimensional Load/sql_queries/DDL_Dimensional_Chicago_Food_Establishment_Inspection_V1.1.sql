-- Chicago Food Inspections
-- Dimensional Model
-- 2022-10-08
/* 
drop table dbo.FCT_Chicago_FoodInspections
drop table dbo.FCT_Chicago_FoodInspections_Violations
drop table dbo.FCT_Chicago_FoodInspections_Violations
*/

CREATE TABLE dbo.Dim_Chicago_BusinessLicenses (
	LicenseSK int NOT NULL IDENTITY(1,1),
	ID char(16) NULL,
	LICENSE_ID int NULL,
	ACCOUNT_NUMBER int NULL,
	LEGAL_NAME varchar(120) NULL,
	SITE_NUMBER int NULL,
	DOING_BUSINESS_AS_NAME varchar(128) NULL,
	ADDRESS varchar(80) NULL,
	CITY varchar(30) NULL,
	STATE char(2) NULL,
	ZIP_CODE char(5) NULL,
	WARD int NULL,
	PRECINCT int NULL,
	WARD_PRECINCT char(6) NULL,
	POLICE_DISTRICT int NULL,
	LICENSE_CODE int NULL,
	LICENSE_DESCRIPTION varchar(60) NULL,
	BUSINESS_ACTIVITY_ID varchar(81) NULL,
	BUSINESS_ACTIVITY varchar(MAX) NULL,
	APPLICATION_TYPE char(6) NULL,
	LICENSE_NUMBER int NULL,
	APPLICATION_CREATED_DATE date NULL,
	APPLICATION_REQUIREMENTS_COMPLETE date NULL,
	PAYMENT_DATE date NULL,
	CONDITIONAL_APPROVAL char(1) NULL,
	LICENSE_TERM_START_DATE date NULL,
	LICENSE_TERM_EXPIRATION_DATE date NULL,
	LICENSE_APPROVED_FOR_ISSUANCE date NULL,
	DATE_ISSUED date NULL,
	LICENSE_STATUS char(3) NULL,
	LICENSE_STATUS_CHANGE_DATE date NULL,
	SSA int NULL,
	LATITUDE char(18) NULL,
	LONGITUDE char(18) NULL,
	LOCATION char(40) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	PRIMARY KEY (LicenseSK)
);

CREATE TABLE dbo.Dim_Chicago_FacilityType (
	FacilitySK int  NOT NULL IDENTITY(1,1),
	FacilityType varchar(47) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	CONSTRAINT pk_Dim_Chicago_FacilityType_FacilitySK PRIMARY KEY (FacilitySK)
);

CREATE TABLE dbo.Dim_Chicago_FoodInspectionResults (
	ResultsSK int NOT NULL IDENTITY(1,1),
	Results varchar(20) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	PRIMARY KEY (ResultsSK)
);

CREATE TABLE dbo.Dim_Chicago_FoodInspectionType (
	InspectionTypeSK int NOT NULL IDENTITY(1,1),
	InspectionType varchar(41) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	CONSTRAINT pk_Dim_Chicago_FoodInspectionType_InspectionTypeSK PRIMARY KEY (InspectionTypeSK)
);

CREATE TABLE dbo.Dim_Chicago_FoodRiskCategory (
	RiskSK  int NOT NULL IDENTITY(1,1),
	Risk char(15) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	PRIMARY KEY (RiskSK)
);

CREATE TABLE dbo.Dim_Chicago_Geo (
	GeoSK  int NOT NULL IDENTITY(1,1),
	Address varchar(51) NULL,
	City varchar(20) NULL,
	State char(2) NULL,
	Zip int NULL,
	Latitude char(18) NULL,
	Longitude char(18) NULL,
	Location char(40) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	PRIMARY KEY (GeoSK)
);

CREATE TABLE dbo.Dim_Chicago_Restaurants (
	RestaurantSK  int NOT NULL IDENTITY(1,1),
	DBA_Name varchar(79) NULL,
	AKA_Name varchar(79) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	PRIMARY KEY (RestaurantSK)
);

CREATE TABLE dbo.Dim_Chicago_ViolationCodes_SCD (
	ViolationSK  int NOT NULL IDENTITY(1,1),
	ViolationCode int NULL,
	ViolationDescription varchar(256) NULL,
	Version varchar(20) NULL,
	PRIMARY KEY (ViolationSK)
);

CREATE TABLE dbo.FCT_Chicago_FoodInspections (
	InspectionID int NOT NULL,
	InspectionDate date NULL,
	RestaurantSK int NULL,
	License_Number int NULL,
	LicenseSK int NULL,
	GeoSK int NULL,
	FacilitySK int NULL,
	InspectionTypeSK int NULL,
	ResultsSK int NULL,
	RiskSK int NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL,
	PRIMARY KEY (InspectionID)
);

CREATE TABLE dbo.FCT_Chicago_FoodInspections_Violations (
	InspectionID int NOT NULL,
	ViolationSK int NOT NULL,
	ViolationComment varchar(MAX) NULL,
	DI_CreateDate datetime NULL,
	DI_WorkflowDirectory nvarchar(256) NULL,
	DI_WorkflowFileName nvarchar(256) NULL
	--PRIMARY KEY (InspectionID, ViolationSK)
);

ALTER TABLE dbo.FCT_Chicago_FoodInspections 
ADD CONSTRAINT fk_Dim_Chicago_BusinessLicenses_FCT_Chicago_FoodInspections FOREIGN KEY (LicenseSK)
REFERENCES dbo.Dim_Chicago_BusinessLicenses (LicenseSK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections 
ADD CONSTRAINT fk_Dim_Chicago_FacilityType_FCT_Chicago_FoodInspections FOREIGN KEY (FacilitySK)
REFERENCES dbo.Dim_Chicago_FacilityType (FacilitySK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections 
ADD CONSTRAINT fk_Dim_Chicago_FoodInspectionResults_FCT_Chicago_FoodInspections FOREIGN KEY (ResultsSK)
REFERENCES dbo.Dim_Chicago_FoodInspectionResults (ResultsSK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections ADD CONSTRAINT fk_Dim_Chicago_FoodInspectionType_FCT_Chicago_FoodInspections FOREIGN KEY (InspectionTypeSK)
REFERENCES dbo.Dim_Chicago_FoodInspectionType (InspectionTypeSK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections ADD CONSTRAINT fk_Dim_Chicago_FoodRiskCategory_FCT_Chicago_FoodInspections FOREIGN KEY (RiskSK)
REFERENCES dbo.Dim_Chicago_FoodRiskCategory (RiskSK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections ADD CONSTRAINT fk_Dim_Chicago_Geo_FCT_Chicago_FoodInspections FOREIGN KEY (GeoSK)
REFERENCES dbo.Dim_Chicago_Geo (GeoSK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections 
ADD CONSTRAINT fk_Dim_Chicago_Restaurants_FCT_Chicago_FoodInspections FOREIGN KEY (RestaurantSK)
REFERENCES dbo.Dim_Chicago_Restaurants (RestaurantSK);

ALTER TABLE dbo.FCT_Chicago_FoodInspections_Violations 
ADD CONSTRAINT fk_Dim_Chicago_ViolationCodes_SCD_FCT_Chicago_FoodInspections_Violations FOREIGN KEY (ViolationSK)
REFERENCES dbo.Dim_Chicago_ViolationCodes_SCD (ViolationSK);

