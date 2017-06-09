
DECLARE cursorUser CURSOR FOR
SELECT	*
FROM	_xlnm#_FilterDatabase

OPEN cursorUser

DECLARE @Number     VARCHAR(30)
DECLARE @DIDNumber  VARCHAR(50)
DECLARE @bDIDNumber VARCHAR(50)

FETCH NEXT FROM cursorUser INTO @Number
								, @DIDNumber

WHILE (@@FETCH_STATUS <> -1)
BEGIN
	
	UPDATE	[tableName]
	SET		[columnName] = @DIDNumber
	WHERE	Number = @Number
		
	FETCH NEXT FROM cursorUser INTO @Number
									, @DIDNumber
	
END

CLOSE cursorUser
DEALLOCATE cursorUser
