-- Create a recursive table for a countdown
WITH RECURSIVE coutdown(val) AS (
  SELECT 3 AS val
  UNION
  SELECT val -1 FROM countdown WHERE val > 1
)
SELECT *
FROM countdown;

-- Recursive suggestion followers
WITH RECURSIVE suggestions(leader_id, followers_id, depth) AS (
    SELECT leader_id, follower_id, 1 AS depth
    FROM followers
    WHERE follower_id = 1000
  UNION
    SELECT followers .leader_id, followers.follower_id, depth + 1
    FROM followers
    JOIN suggestions ON suggestions.leader_id = followers.follower_id
    WHERE depth < 2
  )
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1