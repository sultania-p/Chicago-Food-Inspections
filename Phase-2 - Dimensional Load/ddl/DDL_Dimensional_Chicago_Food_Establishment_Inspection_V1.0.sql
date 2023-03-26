/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Chicago_Food_Inspection_DimensionalModel.DM1
 *
 * Date Created : Thursday, October 06, 2022 13:49:13
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: DimAddress 
 */

CREATE TABLE chicago_ins.DimAddress(
    AddressSK          int             NOT NULL,
    RestaurantSK       int             NULL,
    Address            varchar(255)    NULL,
    City               varchar(255)    NULL,
    State              char(2)         NULL,
    Zipcode            char(5)         NULL,
    Ward               tinyint         NULL,
    Precint            smallint        NULL,
    WardPrecinct       char(6)         NULL,
    PoliceDistrict     tinyint         NULL,
    Ssa                tinyint         NULL,
    Latitude           char(18)        NULL,
    Longitude          char(18)        NULL,
    Location           char(255)       NULL,
    DI_JobID           varchar(255)    NULL,
    DI_CreateDate      date            NULL,
    DI_ModifiedDate    datetime        NULL,
    CONSTRAINT PK_DimAddress PRIMARY KEY CLUSTERED (AddressSK)
)

go


IF OBJECT_ID('DimAddress') IS NOT NULL
    PRINT '<<< CREATED TABLE DimAddress >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimAddress >>>'
go

/* 
 * TABLE: DimDate 
 */

CREATE TABLE chicago_ins.DimDate(
    DateSK               int             NOT NULL,
    FullDate             date            NULL,
    DayNumberOfWeek      int             NULL,
    DayNameOfWeek        nvarchar(10)    NULL,
    MonthName            nvarchar(10)    NULL,
    MonthNumberOfYear    int             NULL,
    CalendarYear         smallint        NULL,
    DI_JobID             varchar(255)    NULL,
    DI_CreateDate        datetime        NULL,
    DI_ModifiedDate      datetime        NULL,
    CONSTRAINT PK_DimDate PRIMARY KEY CLUSTERED (DateSK)
)

go


IF OBJECT_ID('DimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDate >>>'
go

/* 
 * TABLE: DimInspection 
 */

CREATE TABLE chicago_ins.DimInspection(
    InspectionSK       int             NOT NULL,
    InspectionType     varchar(255)    NULL,
    Risk               varchar(255)    NULL,
    DI_JobID           varchar(255)    NULL,
    DI_CreateDate      datetime        NULL,
    DI_ModifiedDate    datetime        NULL,
    CONSTRAINT PK_DimInspection PRIMARY KEY CLUSTERED (InspectionSK)
)

go


IF OBJECT_ID('DimInspection') IS NOT NULL
    PRINT '<<< CREATED TABLE DimInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimInspection >>>'
go

/* 
 * TABLE: DimLicense 
 */

CREATE TABLE chicago_ins.DimLicense(
    LicenseSK                      int               NOT NULL,
    License_Id                     int               NULL,
    Account_Number                 int               NULL,
    License_Code                   smallint          NULL,
    License_Description            varchar(255)      NULL,
    Business_Activity              nvarchar(1000)    NULL,
    License_number                 int               NULL,
    Application_Type               char(6)           NULL,
    PaymentDateSK                  int               NULL,
    PaymentDate                    date              NULL,
    LicenseTermStartDateSK         int               NULL,
    LicenseTermStartDate           date              NULL,
    LicenseTermExpirationDateSK    int               NULL,
    LicenseTermExpirationDate      date              NULL,
    LicenseStatus                  char(3)           NULL,
    DI_JobID                       varchar(255)      NULL,
    DI_CreateDate                  date              NULL,
    DI_ModifiedDate                datetime          NULL,
    CONSTRAINT PK_DimLicense PRIMARY KEY CLUSTERED (LicenseSK)
)

go


IF OBJECT_ID('DimLicense') IS NOT NULL
    PRINT '<<< CREATED TABLE DimLicense >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimLicense >>>'
go

/* 
 * TABLE: DimRestaurant 
 */

CREATE TABLE chicago_ins.DimRestaurant(
    RestaurantSK              int             NOT NULL,
    RestaurantBusinessName    varchar(255)    NULL,
    RestaurantAKAName         varchar(255)    NULL,
    FacilityType              varchar(255)    NULL,
    DI_JobID                  varchar(255)    NULL,
    DI_CreateDate             datetime        NULL,
    DI_ModifiedDate           datetime        NULL,
    CONSTRAINT PK_DimRestaurant PRIMARY KEY CLUSTERED (RestaurantSK)
)

go


IF OBJECT_ID('DimRestaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE DimRestaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimRestaurant >>>'
go

/* 
 * TABLE: FactResturantInspection 
 */

CREATE TABLE chicago_ins.FactResturantInspection(
    FactRestaurantInspectionSK    int              NOT NULL,
    RestaurantSK                  int              NULL,
    LicenseSK                     int              NOT NULL,
    InspectionID                  int              NULL,
    InspectionSK                  int              NULL,
    DateSK                        int              NULL,
    InspectionDate                date             NULL,
    Results                       varchar(255)     NULL,
    Violations                    nvarchar(max)    NULL,
    DI_JobID                      varchar(255)     NULL,
    DI_CreateDate                 datetime         NULL,
    DI_ModifiedDate               datetime         NULL,
    CONSTRAINT PK_FactResturantInspection PRIMARY KEY CLUSTERED (FactRestaurantInspectionSK)
)

go


IF OBJECT_ID('FactResturantInspection') IS NOT NULL
    PRINT '<<< CREATED TABLE FactResturantInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactResturantInspection >>>'
go

/* 
 * INDEX: FK_DimAddress_DimRestaurant 
 */

CREATE INDEX FK_DimAddress_DimRestaurant ON chicago_ins.DimAddress(RestaurantSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimAddress') AND name='FK_DimAddress_DimRestaurant')
    PRINT '<<< CREATED INDEX DimAddress.FK_DimAddress_DimRestaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimAddress.FK_DimAddress_DimRestaurant >>>'
go

/* 
 * INDEX: FK_DimLicense_DimDate_1 
 */

CREATE INDEX FK_DimLicense_DimDate_1 ON chicago_ins.DimLicense(PaymentDateSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimLicense') AND name='FK_DimLicense_DimDate_1')
    PRINT '<<< CREATED INDEX DimLicense.FK_DimLicense_DimDate_1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimLicense.FK_DimLicense_DimDate_1 >>>'
go

/* 
 * INDEX: FK_DimLicense_DimDate_2 
 */

CREATE INDEX FK_DimLicense_DimDate_2 ON chicago_ins.DimLicense(LicenseTermStartDateSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimLicense') AND name='FK_DimLicense_DimDate_2')
    PRINT '<<< CREATED INDEX DimLicense.FK_DimLicense_DimDate_2 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimLicense.FK_DimLicense_DimDate_2 >>>'
go

/* 
 * INDEX: FK_DimLicense_DimDate_3 
 */

CREATE INDEX FK_DimLicense_DimDate_3 ON chicago_ins.DimLicense(LicenseTermExpirationDateSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimLicense') AND name='FK_DimLicense_DimDate_3')
    PRINT '<<< CREATED INDEX DimLicense.FK_DimLicense_DimDate_3 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimLicense.FK_DimLicense_DimDate_3 >>>'
go

/* 
 * INDEX: FK_FactRestaurantInspection_DimRestaurant 
 */

CREATE INDEX FK_FactRestaurantInspection_DimRestaurant ON chicago_ins.FactResturantInspection(RestaurantSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactResturantInspection') AND name='FK_FactRestaurantInspection_DimRestaurant')
    PRINT '<<< CREATED INDEX FactResturantInspection.FK_FactRestaurantInspection_DimRestaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactResturantInspection.FK_FactRestaurantInspection_DimRestaurant >>>'
go

/* 
 * INDEX: FK_FactRestaurantInspection_DimLicense 
 */

CREATE INDEX FK_FactRestaurantInspection_DimLicense ON chicago_ins.FactResturantInspection(LicenseSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactResturantInspection') AND name='FK_FactRestaurantInspection_DimLicense')
    PRINT '<<< CREATED INDEX FactResturantInspection.FK_FactRestaurantInspection_DimLicense >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactResturantInspection.FK_FactRestaurantInspection_DimLicense >>>'
go

/* 
 * INDEX: FK_FactRestaurantInspection_DimInspection 
 */

CREATE INDEX FK_FactRestaurantInspection_DimInspection ON chicago_ins.FactResturantInspection(InspectionSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactResturantInspection') AND name='FK_FactRestaurantInspection_DimInspection')
    PRINT '<<< CREATED INDEX FactResturantInspection.FK_FactRestaurantInspection_DimInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactResturantInspection.FK_FactRestaurantInspection_DimInspection >>>'
go

/* 
 * INDEX: FK_FactRestaurantInspection_DimDate 
 */

CREATE INDEX FK_FactRestaurantInspection_DimDate ON chicago_ins.FactResturantInspection(DateSK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactResturantInspection') AND name='FK_FactRestaurantInspection_DimDate')
    PRINT '<<< CREATED INDEX FactResturantInspection.FK_FactRestaurantInspection_DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactResturantInspection.FK_FactRestaurantInspection_DimDate >>>'
go

/* 
 * TABLE: DimAddress 
 */

ALTER TABLE chicago_ins.DimAddress ADD CONSTRAINT FK_DimAddress_DimRestaurant 
    FOREIGN KEY (RestaurantSK)
    REFERENCES DimRestaurant(RestaurantSK)
go


/* 
 * TABLE: DimLicense 
 */

ALTER TABLE chicago_ins.DimLicense ADD CONSTRAINT FK_DimLicense_DimDate_1 
    FOREIGN KEY (PaymentDateSK)
    REFERENCES DimDate(DateSK)
go

ALTER TABLE chicago_ins.DimLicense ADD CONSTRAINT FK_DimLicense_DimDate_2 
    FOREIGN KEY (LicenseTermStartDateSK)
    REFERENCES DimDate(DateSK)
go

ALTER TABLE chicago_ins.DimLicense ADD CONSTRAINT FK_DimLicense_DimDate_3 
    FOREIGN KEY (LicenseTermExpirationDateSK)
    REFERENCES DimDate(DateSK)
go


/* 
 * TABLE: FactResturantInspection 
 */

ALTER TABLE chicago_ins.FactResturantInspection ADD CONSTRAINT FK_FactRestaurantInspection_DimDate 
    FOREIGN KEY (DateSK)
    REFERENCES DimDate(DateSK)
go

ALTER TABLE chicago_ins.FactResturantInspection ADD CONSTRAINT FK_FactRestaurantInspection_DimInspection 
    FOREIGN KEY (InspectionSK)
    REFERENCES DimInspection(InspectionSK)
go

ALTER TABLE chicago_ins.FactResturantInspection ADD CONSTRAINT FK_FactRestaurantInspection_DimLicense 
    FOREIGN KEY (LicenseSK)
    REFERENCES DimLicense(LicenseSK)
go

ALTER TABLE chicago_ins.FactResturantInspection ADD CONSTRAINT FK_FactRestaurantInspection_DimRestaurant 
    FOREIGN KEY (RestaurantSK)
    REFERENCES DimRestaurant(RestaurantSK)
go


