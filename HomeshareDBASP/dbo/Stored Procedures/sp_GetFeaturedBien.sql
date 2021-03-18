CREATE PROCEDURE [dbo].[sp_GetFeaturedBien]
	@number int
AS
BEGIN
	DECLARE @skip int
	DECLARE @count int
	SELECT @count = COUNT(*) FROM [BienEchange]
	SET @skip = RAND() * (@count - @number +1) 
EXECUTE
('SELECT * 
FROM [BienEchange]
ORDER BY [idBien]
OFFSET ' + @skip + ' ROWS
FETCH NEXT ' + @number + ' ROWS ONLY')
END


/*
ignore @skip rows then get @number next rows
for example: there are total 20 rows, skip 5 first rows then take 10 next row (from 6-15)
Notes: @skip need to be <= total rows - @number rows
For example: @skip = 5; @number = 10; count(*) = 20
=> 0=< @skip < 11 => @skip = RAND()*11 = RAND()* ((20-10) +1) 
=> @skip = RAND() * (@count - @number +1)
*/
