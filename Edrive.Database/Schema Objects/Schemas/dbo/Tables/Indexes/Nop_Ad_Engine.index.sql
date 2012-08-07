﻿CREATE NONCLUSTERED INDEX [Nop_Ad_Engine]
    ON [dbo].[Nop_Product]([Published] ASC, [Deleted] ASC, [QualifyPrice] ASC, [UpdatedOn] ASC, [Engine] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

