﻿ALTER TABLE [dbo].[ED_EdriveProducts]
    ADD CONSTRAINT [PK_ED_EdriveProducts] PRIMARY KEY CLUSTERED ([EDProductId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
