﻿ALTER TABLE [dbo].[Nop_LogType]
    ADD CONSTRAINT [PK_Nop_LogType] PRIMARY KEY CLUSTERED ([LogTypeID] ASC) WITH (FILLFACTOR = 80, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
