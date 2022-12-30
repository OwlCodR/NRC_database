-- Get all followers by user id
SELECT * FROM users WHERE id IN (
    SELECT follower FROM users_x_followers WHERE "user" = 232
);

-- Get posts count for the last week
SELECT COUNT(*) FROM posts WHERE date > (now() - '7 day'::INTERVAL)

-- Get name and surname of all users who liked post by id
SELECT name, surname FROM users WHERE id IN (
    SELECT like_author FROM likes_x_posts WHERE "post" = 3215792
);

-- Get the post popular sport type
SELECT type FROM sport_types WHERE id IN (
    WITH types AS (
		SELECT sport_type, COUNT(*) FROM trainings
		    GROUP BY sport_type ORDER BY count DESC LIMIT 1
	) SELECT sport_type FROM types
);

SELECT distance FROM biometrics

-- Get all posts by title entry
SELECT * FROM posts WHERE title LIKE %auctor%;

-- Get authors of posts of the last 2 days
SELECT name, surname FROM users WHERE id IN (
    SELECT author FROM posts WHERE date > (now() - '2 day'::INTERVAL)
);