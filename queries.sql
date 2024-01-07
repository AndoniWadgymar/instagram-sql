-- Select the 3 users with the highest IDs from the user table
SELECT *
FROM users
ORDER BY id DESC
LIMIT 3

-- JOIN the users and posts table. Show username of user ID 200 and the captions
-- of all posts they have created
SELECT username, caption
FROM users
JOIN posts ON users.id = posts.user_id
WHERE users.id = 200;

-- Show each username and the number  of likes they have created
SELECT username, COUNT(*)
FROM users
JOIN likes ON likes.user_id = users.id
GROUP BY username;

-- Show the username of users who were tagged in a caption or photo before
-- January 7, 2010
SELECT username, tags.created_at
FROM users
JOIN (
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
