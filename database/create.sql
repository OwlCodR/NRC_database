CREATE TABLE users (
	"id" BIGSERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"surname" TEXT NOT NULL,
	"sex" TEXT,
	"birthday" TIMESTAMP NOT NULL
);

CREATE TABLE users_x_followers (
    "user" BIGINT NOT NULL REFERENCES users (id),
	"follower" BIGINT NOT NULL REFERENCES users (id)
);

CREATE TABLE posts (
	"id" BIGSERIAL PRIMARY KEY,
	"author" BIGINT NOT NULL REFERENCES users (id),
	"title" TEXT,
	"date" TIMESTAMP NOT NULL,
	"content" TEXT
);

CREATE TABLE sport_types (
	"id" BIGSERIAL PRIMARY KEY,
	"type" TEXT NOT NULL UNIQUE
);

CREATE TABLE trainings (
	"id" BIGSERIAL PRIMARY KEY,
	"author" BIGINT NOT NULL REFERENCES users (id),
	"title" TEXT,
	"start_date" TIMESTAMP NOT NULL,
	"duration" INT,
	"sport_type" BIGINT NOT NULL REFERENCES sport_types (id)
);

CREATE TABLE biometrics (
	"id" BIGSERIAL PRIMARY KEY,
	"training" BIGINT NOT NULL REFERENCES trainings (id),
	"date" TIMESTAMP NOT NULL,
	"heart_rate" INT,
	"calories" INT,
	"elevation_gain" INT,
	"distance" INT,
	"steps" INT,
	"latitude" REAL,
	"longitude" REAL
);

CREATE TABLE likes_x_posts (
	"like_author" BIGINT NOT NULL REFERENCES users (id),
	"post" BIGINT NOT NULL REFERENCES posts (id)
);

CREATE TABLE events (
	"id" BIGSERIAL PRIMARY KEY,
	"author" BIGINT NOT NULL REFERENCES users (id),
	"date" TIMESTAMP NOT NULL,
	"title" TEXT,
	"content" TEXT,
	"start_date" TIMESTAMP NOT NULL,
	"end_date" TIMESTAMP NOT NULL,
	"location" TEXT,
	"sport_type" BIGINT NOT NULL REFERENCES sport_types (id),
	"latitude" REAL,
    "longitude" REAL
);

CREATE TABLE subscribers_x_events (
	"subscriber" BIGINT NOT NULL REFERENCES users (id),
	"event" BIGINT NOT NULL REFERENCES events (id)
);