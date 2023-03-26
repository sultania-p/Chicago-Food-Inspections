/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Chicago_Food_Establishment_Inspection_DataModel.DM1
 *
 * Date Created : Wednesday, October 05, 2022 22:58:26
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: STG_BUSS_LIC 
 */

CREATE TABLE chicago_ins.STG_BUSS_LIC(
    Stg_Buss_Lic_ID                          int               NOT NULL,
    DI_FileName                              varchar(255)      NULL,
    DI_WorkflowFileName                      nvarchar(255)     NULL,
    DI_CreateDate                            datetime          NULL,
    Id                                       char(16)          NULL,
    License_Id                               int               NULL,
    Account_Number                           int               NULL,
    Site_Number                              smallint          NULL,
    Legal_Name                               varchar(255)      NULL,
    Doing_Business_As_Name                   varchar(255)      NULL,
    Address                                  varchar(255)      NULL,
    City                                     varchar(255)      NULL,
    State                                    char(2)           NULL,
    ZipCode                                  char(5)           NULL,
    Ward                                     tinyint           NULL,
    Precinct                                 smallint          NULL,
    Ward_Precinct                            char(6)           NULL,
    Police_Desctrict                         tinyint           NULL,
    License_Code                             smallint          NULL,
    License_Description                      varchar(255)      NULL,
    Business_Activity_Id                     varchar(255)      NULL,
    Business_Activity                        nvarchar(1000)    NULL,
    License_number                           int               NULL,
    Application_Type                         char(6)           NULL,
    Application_Created_Date                 char(10)          NULL,
    Application_Created_Date_Out             date              NULL,
    Application_Requirements_Complete        char(10)          NULL,
    Application_Requirements_Complete_Out    date              NULL,
    Payment_Date                             char(10)          NULL,
    Payment_Date_Out                         date              NULL,
    Conditional_Approval                     char(1)           NULL,
    License_Term_Start_Date                  char(10)          NULL,
    License_Term_Start_Date_Out              date              NULL,
    License_Term_Expiration_Date             char(10)          NULL,
    License_Term_Expiration_Date_Out         date              NULL,
    License_Approved_For_Issuance            char(10)          NULL,
    License_Approved_For_Issuance_Out        date              NULL,
    Date_Issued                              char(10)          NULL,
    Date_Issued_Out                          date              NULL,
    License_Status                           char(3)           NULL,
    License_Status_Change_Date               varchar(10)       NULL,
    License_Status_Change_Date_Out           date              NULL,
    Ssa                                      tinyint           NULL,
    Latitude                                 char(18)          NULL,
    Longitude                                char(18)          NULL,
    Location                                 char(255)         NULL,
    CONSTRAINT PK_STG_BUSS_LIC PRIMARY KEY CLUSTERED (Stg_Buss_Lic_ID)
)

go


IF OBJECT_ID('STG_BUSS_LIC') IS NOT NULL
    PRINT '<<< CREATED TABLE STG_BUSS_LIC >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE STG_BUSS_LIC >>>'
go

/* 
 * TABLE: STG_CHICAGO_FOOD_ESTD_INS 
 */

CREATE TABLE chicago_ins.STG_CHICAGO_FOOD_ESTD_INS(
    Stg_Chicago_Food_Estd_Ins_ID    int              NOT NULL,
    DI_FileName                     char(255)        NULL,
    DI_WorkflowFileName             nvarchar(255)    NULL,
    DI_CreateDate                   datetime         NULL,
    Inspection_ID                   int              NULL,
    DBA_Name                        varchar(255)     NULL,
    AKA_Name                        varchar(255)     NULL,
    License_Id                      int              NULL,
    Facility_Type                   varchar(255)     NULL,
    Risk                            char(255)        NULL,
    Address                         varchar(255)     NULL,
    City                            varchar(20)      NULL,
    State                           char(2)          NULL,
    Zip                             int              NULL,
    Inspection_Date                 char(10)         NULL,
    Inspection_Date_Out             date             NULL,
    Inspection_Type                 varchar(255)     NULL,
    Results                         varchar(255)     NULL,
    Violations                      nvarchar(max)    NULL,
    Latitude                        char(18)         NULL,
    Longitude                       char(18)         NULL,
    Location                        char(40)         NULL,
    CONSTRAINT PK_STG_CHICAGO_FOOD_ESTD_INS PRIMARY KEY CLUSTERED (Stg_Chicago_Food_Estd_Ins_ID)
)

go


IF OBJECT_ID('STG_CHICAGO_FOOD_ESTD_INS') IS NOT NULL
    PRINT '<<< CREATED TABLE STG_CHICAGO_FOOD_ESTD_INS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE STG_CHICAGO_FOOD_ESTD_INS >>>'
go

