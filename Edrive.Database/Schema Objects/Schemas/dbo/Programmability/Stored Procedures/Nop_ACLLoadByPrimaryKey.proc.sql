﻿

CREATE PROCEDURE [dbo].[Nop_ACLLoadByPrimaryKey]
(
	@ACLID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ACL]
	WHERE
		ACLID = @ACLID
END
