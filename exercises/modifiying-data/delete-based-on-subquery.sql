DELETE FROM cd.members
WHERE memid not in (SELECT memid FROM cd.bookings)