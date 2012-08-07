﻿CREATE TABLE [dbo].[Nop_Customer] (
    [CustomerID]            INT              IDENTITY (1, 1) NOT NULL,
    [CustomerGUID]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [CustomerType]          INT              NOT NULL,
    [Email]                 NVARCHAR (255)   NOT NULL,
    [Username]              NVARCHAR (100)   NOT NULL,
    [PasswordHash]          NVARCHAR (255)   NOT NULL,
    [SaltKey]               NVARCHAR (255)   NOT NULL,
    [AffiliateID]           INT              NOT NULL,
    [BillingAddressID]      INT              NOT NULL,
    [ShippingAddressID]     INT              NOT NULL,
    [LastPaymentMethodID]   INT              NOT NULL,
    [LastAppliedCouponCode] NVARCHAR (100)   NOT NULL,
    [GiftCardCouponCodes]   XML              NOT NULL,
    [CheckoutAttributes]    XML              NOT NULL,
    [LanguageID]            INT              NOT NULL,
    [CurrencyID]            INT              NOT NULL,
    [TaxDisplayTypeID]      INT              NOT NULL,
    [IsTaxExempt]           BIT              NOT NULL,
    [IsAdmin]               BIT              NOT NULL,
    [IsGuest]               BIT              NOT NULL,
    [IsForumModerator]      BIT              NOT NULL,
    [TotalForumPosts]       INT              NOT NULL,
    [Signature]             NVARCHAR (300)   NOT NULL,
    [AdminComment]          NVARCHAR (4000)  NOT NULL,
    [Active]                BIT              NOT NULL,
    [Deleted]               BIT              NOT NULL,
    [RegistrationDate]      DATETIME         NOT NULL,
    [TimeZoneID]            NVARCHAR (200)   NOT NULL,
    [AvatarID]              INT              NOT NULL,
    [Password]              NVARCHAR (20)    NULL,
    [IPAddress]             NVARCHAR (100)   NULL,
    [ExpiryDate]            DATETIME         NULL,
    [IsTrial]               BIT              NULL,
    [DealerCityId]          INT              NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0:Admin
1:Dealer
2:User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Nop_Customer', @level2type = N'COLUMN', @level2name = N'CustomerType';

