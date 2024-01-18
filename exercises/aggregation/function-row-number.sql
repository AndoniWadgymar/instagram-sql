-- row_number	firstname	surname
--  1	          GUEST	GUEST
--  2	          Darren	Smith
--  3	           Tracy	Smith

SELECT ROW_NUMBER() over(), firstname, surname
FROM cd.members
ORDER BY joindate