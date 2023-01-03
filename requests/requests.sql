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

-- Get the most popular sport type
SELECT type FROM sport_types WHERE id IN (
    WITH types AS (
		SELECT sport_type, COUNT(*) FROM trainings
        GROUP BY sport_type
        ORDER BY count
        DESC LIMIT 1
	) SELECT sport_type FROM types
);

-- Get all posts by title entry
SELECT * FROM posts WHERE title LIKE %auctor%;

-- Get authors of posts of the last 2 days
SELECT name, surname FROM users WHERE id IN (
    SELECT author FROM posts
    WHERE date > (now() - '2 day'::INTERVAL)
);

SELECT * FROM subscribers_x_events GROUP BY event;

-- Get info about the biggest event by amount of subscribers
SELECT * FROM events WHERE id = (
	WITH count_x_event AS (
		SELECT COUNT(subscriber), event
		FROM subscribers_x_events
		GROUP BY event
	)
	SELECT event FROM count_x_event
	WHERE count = (SELECT max(count) FROM count_x_event)
);

-- Get average amount of post likes of the user with max followers count
WITH count_x_posts AS (
	SELECT COUNT(like_author), post FROM likes_x_posts
	WHERE post IN (
		SELECT id FROM posts
		WHERE author = (
			WITH count_x_users AS (
				SELECT COUNT(follower), "user"
				FROM users_x_followers
				GROUP BY "user"
			) SELECT "user" FROM count_x_users
			    WHERE count = (SELECT max(count) FROM count_x_users)
		)
	) GROUP BY post
) SELECT AVG(count) FROM count_x_posts;

-- Set status by trainings count for all followers of the user with max followers count
-- 0 - Unsportsmanlike
-- 1 <= n <= 4 - Amateur Athlete
-- > 4 - Sportsman

WITH followers_count_x_users AS (
    SELECT COUNT(follower), "user"
    FROM users_x_followers
    GROUP BY "user"
), user_with_max_followers_count AS (
	SELECT "user"
	FROM followers_count_x_users
	WHERE count = (SELECT max(count) FROM followers_count_x_users)
), user_followers AS (
	SELECT follower FROM users_x_followers
    WHERE "user" = (SELECT "user" FROM user_with_max_followers_count)
), count_x_author AS (
    SELECT COUNT(id), author FROM trainings
    WHERE author IN (SELECT follower FROM user_followers) GROUP BY author
), status_x_author AS (
    SELECT
        CASE
            WHEN count = 0 THEN 'Unsportsmanlike'
            WHEN count >= 1 AND count <= 4 THEN 'Amateur Athlete'
            WHEN count > 4 THEN 'Sportsman'
        END status,
        author
    FROM count_x_author
)	SELECT status, name, surname, gender, birthday
	FROM status_x_author AS status
	JOIN users
	ON users.id = status.author;

-- Get info about training with max heartrate for every user where training type is "Treadmill"
WITH treadmill_trainings AS (
	SELECT * FROM trainings WHERE sport_type = (
		SELECT id FROM sport_types WHERE "type" = 'Treadmill'
	)
), trainings_with_max_heart_rate AS (
	SELECT training, MAX(heart_rate) FROM biometrics GROUP BY training
)
SELECT name, surname, treadmill_trainings.*  FROM users
JOIN treadmill_trainings ON users.id = treadmill_trainings.author
JOIN trainings_with_max_heart_rate ON treadmill_trainings.id = training;