SELECT SUBSTR(surname, 1,1) as letter, COUNT(*) as count
FROM cd.members
GROUP BY letter
ORDER BY letter