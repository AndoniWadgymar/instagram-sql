SELECT facid,  extract(month from starttime) AS month, SUM(slots) AS "Total Slots"
FROM cd.bookings
WHERE extract(year from starttime) = 2012
GROUP BY facid, month
ORDER BY facid, month