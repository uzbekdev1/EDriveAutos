﻿

CREATE PROCEDURE [dbo].[Nop_ACLDelete]
(
	@ACLID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ACL]
	WHERE
		[ACLID] = @ACLID
END
