﻿ALTER TABLE [dbo].[Nop_RecurringPayment]
    ADD CONSTRAINT [Nop_RecurringPayment_PK] PRIMARY KEY CLUSTERED ([RecurringPaymentID] ASC) WITH (FILLFACTOR = 80, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

