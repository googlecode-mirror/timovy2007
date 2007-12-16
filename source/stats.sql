/* First, create our posts table: */
CREATE TABLE stats (
    id serial NOT NULL,
    title VARCHAR(50),
    body TEXT,
    created timestamp without time zone NOT NULL
);

/* Then insert some posts for testing: */
INSERT INTO stats (title,body,created)
    VALUES ('Stats', 'statistics', NOW());
INSERT INTO stats (title,body,created)
    VALUES ('Stats - second', 'results', NOW());
