CREATE FUNCTION rand_int(min INT, max INT) RETURNS INT AS $EOFCODE$
BEGIN
  RETURN floor(RANDOM() * (max - min)) + min;
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION rand_real(min REAL, max REAL) RETURNS REAL AS $EOFCODE$
BEGIN
  RETURN floor(RANDOM() * (max - min)) + min;
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION birthday() RETURNS DATE AS $EOFCODE$
BEGIN
  RETURN now()::date - rand_int(0, 365 * 70);
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION rand_interval(future BOOLEAN, units TEXT, min INT, max INT) RETURNS INTERVAL AS $EOFCODE$
BEGIN
  IF (future) THEN
    RETURN (rand_int(min, max) || ' ' || units)::INTERVAL;
  ELSE
    RETURN (rand_real(min, max) || ' ' || units)::INTERVAL;
  END IF;
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION rand_timestamp(future BOOLEAN, min INT, max INT) RETURNS TIMESTAMP AS $EOFCODE$
BEGIN
  IF (future) THEN
    RETURN now() + rand_interval(future, 'days', min, max);
  ELSE
    RETURN now() - rand_interval(future, 'days', min, max);
  END IF;
END;
$EOFCODE$ LANGUAGE plpgsql VOLATILE;

CREATE TABLE users (
	ID SERIAL PRIMARY KEY,
    NAME DATE
);

INSERT INTO USERS (NAME) (SELECT rand_timestamp(true));
SELECT * FROM users;