/* First, create our posts table: */
CREATE TABLE posts (
    id serial NOT NULL,
    title VARCHAR(50),
    body TEXT,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone
);

/* Then insert some posts for testing: */
INSERT INTO posts (title,body,created)
    VALUES ('The title', 'This is the post body.', NOW());
INSERT INTO posts (title,body,created)
    VALUES ('A title once again', 'And the post body follows.', NOW());
INSERT INTO posts (title,body,created)
    VALUES ('Title strikes back', 'This is really exciting! Not.', NOW());
    
INSERT INTO clearances("key", name, description, parent_id) VALUES ('MANAGE_NEWS', 'Actualities management', 'Manazovanie aktualít', 1);


-- administrator
INSERT INTO roles_clearances(role_id, clearance_id) VALUES (1,1);
INSERT INTO roles_clearances(role_id, clearance_id) VALUES (1,2);
INSERT INTO roles_clearances(role_id, clearance_id) VALUES (1,3);
INSERT INTO roles_clearances(role_id, clearance_id) VALUES (1,4);
INSERT INTO roles_clearances(role_id, clearance_id) VALUES (1,6);