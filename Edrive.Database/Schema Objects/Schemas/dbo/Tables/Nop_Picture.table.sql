﻿CREATE TABLE [dbo].[Nop_Picture] (
    [PictureID]     INT             IDENTITY (1, 1) NOT NULL,
    [PictureBinary] VARBINARY (MAX) NOT NULL,
    [Extension]     NVARCHAR (20)   NOT NULL,
    [IsNew]         BIT             NOT NULL
);

