-- Slow query without materialized view
SELECT
  date_trunc('week', COALESCE(posts.created_at,comments.created_at) AS week,
  COUNT(posts.id) AS num_likes_for_posts,
  COUNT(comments.id) AS num_ikes_for_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

-- With materialized view
CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT
    date_trunc('week', COALESCE(posts.created_at,comments.created_at) AS week,
    COUNT(posts.id) AS num_likes_for_posts,
    COUNT(comments.id) AS num_ikes_for_comments
  FROM likes
  LEFT JOIN posts ON posts.id = likes.post_id
  LEFT JOIN comments ON comments.id = likes.comment_id
  GROUP BY week
  ORDER BY week
) WITH DATA;

SELECT * FROM weekly_likes;

-- IF WE ADD OR DELETE DATA FROM ONE OF THE TABLES
-- WE NEED TO RUN THIS QUERY
REFRESH MATERIALIZED VIEW weekly_likes;

-- SO WE USE MATERIALIZED VIEWS WHEN WE ARENT GOING TO CHANGE DATA FROM THE TABLES
