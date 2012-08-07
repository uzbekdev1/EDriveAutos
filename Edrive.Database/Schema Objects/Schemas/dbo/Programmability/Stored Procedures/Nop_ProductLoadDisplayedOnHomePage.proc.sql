﻿CREATE PROCEDURE [dbo].[Nop_ProductLoadDisplayedOnHomePage]
(
	@ShowHidden		bit = 0,
	@LanguageID		int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		p.[ProductId],
		dbo.NOP_getnotnullnotempty(pl.[Name],p.[Name]) as [Name],
		dbo.NOP_getnotnullnotempty(pl.[ShortDescription],p.[ShortDescription]) as [ShortDescription],
		dbo.NOP_getnotnullnotempty(pl.[FullDescription],p.[FullDescription]) as [FullDescription],
		p.[AdminComment], 
		p.[ProductTypeID], 
		p.[TemplateID], 
		p.[ShowOnHomePage], 
		dbo.NOP_getnotnullnotempty(pl.[MetaKeywords],p.[MetaKeywords]) as [MetaKeywords],
		dbo.NOP_getnotnullnotempty(pl.[MetaDescription],p.[MetaDescription]) as [MetaDescription],
		dbo.NOP_getnotnullnotempty(pl.[MetaTitle],p.[MetaTitle]) as [MetaTitle],
		dbo.NOP_getnotnullnotempty(pl.[SEName],p.[SEName]) as [SEName],
		p.[AllowCustomerReviews], 
		p.[AllowCustomerRatings], 
		p.[RatingSum], 
		p.[TotalRatingVotes], 
		p.[Published], 
		p.[Deleted], 
		p.[CreatedOn], 
		p.[UpdatedOn],
		p.[VIN],
		p.[CustomerID],
		p.[VehicleName],
		p.[Type],
		p.[TypeAttribute],
		p.[Stock],
		p.[Year],
		p.[YearAttribute],
		p.[Make],
		p.[MakeAttribute],
		p.[Model],
		p.[Trim],
		p.[Free_Text],
		p.[Body],
		p.[BodyAttribute],
		p.[Mileage],
		p.[MileageAttribute],
		p.[Price_Current],
		p.[Reserved],
		p.[Price_Wholesale],
		p.[Price_Cost],
		p.[PriceAttribute],
		p.[Title],
		p.[Condition],
		p.[Exterior_Color],
		p.[Interior_Color],
		p.[Doors],
		p.[Engine],
		p.[Transmission],
		p.[Fuel_Type],
		p.[Drive_Type],
		p.[Options],
		p.[Warranty],
		p.[WarrantyAttribute],
		p.[Description],
		p.[Pics],
		p.[Dealer_Name],
		p.[Dealer_Zip],
		p.[SavingAmount],
		p.[City] ,
		p.[StateID], 
		p.[Date_in_Stock],
		p.[FileName],
		p.[IsNew],
		p.[IsFeature] ,
		p.[QualifyPrice],
		p.[OwnerDetail],
		p.[Show_on_Dealer] ,
		p.[Offer],
		p.[City_Fuel],
		p.[Highway_Fuel],
		p.[AverageRetailPrice],
		p.[AverageTradeinPrice],
		p.[SellerName],
		p.[SellerEmail],
		p.[SellerPhone] ,
		p.[SellerNotes] 
		
	FROM [Nop_Product] p
		LEFT OUTER JOIN Nop_ProductLocalized pl with (NOLOCK) ON p.ProductID = pl.ProductID AND pl.LanguageID = @LanguageID
	WHERE (p.Published = 1 or @ShowHidden = 1) and p.ShowOnHomePage=1 and p.Deleted=0 
	order by p.[Name]
END