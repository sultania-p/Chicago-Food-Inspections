--Chicago Stage, Dimensions and Fact tables count
select count(*) as Count_Stg_Buss_Lic from chicago_ins.STG_BUSS_LIC
select count(*) as Count_Stg_Chicago_Food_Estd_Ins from chicago_ins.STG_CHICAGO_FOOD_ESTD_INS
select count(*) as Count_Dim_Chicago_BusinessLicenses from dbo.Dim_Chicago_BusinessLicenses
select count(*) as Count_Dim_Chicago_Geo from dbo.Dim_Chicago_Geo
select count(*) as Count_Dim_Chicago_Restaurants from dbo.Dim_Chicago_Restaurants
select count(*) as Count_Dim_Chicago_FoodInspectionType from dbo.Dim_Chicago_FoodInspectionType
select count(*) as Count_Dim_Chicago_FoodInspectionResults from dbo.Dim_Chicago_FoodInspectionResults
select count(*) as Count_Dim_Chicago_FoodRiskCategory from dbo.Dim_Chicago_FoodRiskCategory
select count(*) as Count_Dim_Chicago_FacilityType from dbo.Dim_Chicago_FacilityType
select count(*) as Count_Dim_Chicago_ViolationCodes_SCD from dbo.Dim_Chicago_ViolationCodes_SCD

select count(*) as Count_FCT_Chicago_FoodInspections from dbo.FCT_Chicago_FoodInspections
select count(*) as FCT_Chicago_FoodInspections_Violations from dbo.FCT_Chicago_FoodInspections_Violations


/*
--> Truncate Table Script
Truncate table dbo.Dim_Chicago_BusinessLicenses
Truncate table dbo.Dim_Chicago_Geo
Truncate table dbo.Dim_Chicago_Restaurants
Truncate table dbo.Dim_Chicago_FoodInspectionType
Truncate table dbo.Dim_Chicago_FoodInspectionResults
Truncate table dbo.Dim_Chicago_FoodRiskCategory
Truncate table dbo.Dim_Chicago_FacilityType
Truncate table dbo.Dim_Chicago_ViolationCodes_SCD

Truncate table dbo.FCT_Chicago_FoodInspections
Truncate table dbo.FCT_Chicago_FoodInspections_Violations
*/


/* 
Data Validations Post Load
*/
select * from  [dbo].[FCT_Chicago_FoodInspections_Violations] where InspectionID= 2365831
select *  from  [dbo].[FCT_Chicago_FoodInspections_Violations] where InspectionID=2222408

select 
	FI.InspectionID,
	FI.[License_Number],
	FI.[InspectionDate],
	R.[DBA_Name], R.DBA_Name,
	G.Address, G.City, G.[State], G.[Zip], G.[Latitude], G.[Longitude], G.[Location],
	IT.InspectionType,
	IR.Results,
	RC.Risk,
	FT.FacilityType,
	SCD.[ViolationCode],
	SCD.[ViolationDescription],
	FV.[ViolationComment]
from [dbo].[FCT_Chicago_FoodInspections]  FI
join [dbo].[FCT_Chicago_FoodInspections_Violations] FV on FI.InspectionID = FV.InspectionID
join [dbo].[Dim_Chicago_ViolationCodes_SCD] SCD on FV.ViolationSK = SCD.ViolationSK
join [dbo].[Dim_Chicago_BusinessLicenses] BL on BL.LicenseSK = FI.LicenseSK
-- join all dimension tables
join [dbo].[Dim_Chicago_Restaurants] R on FI.RestaurantSK = R.RestaurantSK
join [dbo].[Dim_Chicago_Geo] G on FI.GeoSK = G.GeoSK
join [dbo].[Dim_Chicago_FoodInspectionType] IT on FI.InspectionTypeSK = IT.InspectionTypeSK
join [dbo].[Dim_Chicago_FoodInspectionResults] IR on FI.ResultsSK = IR.ResultsSK
join [dbo].[Dim_Chicago_FoodRiskCategory] RC on FI.RiskSK = RC.RiskSK
join [dbo].[Dim_Chicago_FacilityType] FT on FI.FacilitySK = FT.FacilitySK
where FI.InspectionID= 2365831
