SELECT book.facid, fac.name,trim(to_char(sum(book.slots)/2.0, '9999999999999999D99')) as "Total Hours"
FROM cd.bookings book
JOIN cd.facilities as fac on fac.facid = book.facid
GROUP BY book.facid, fac.name
ORDER BY book.facid