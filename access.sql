/**
* CS 275 - Web and Mobile Application Development
* Group 4
* Access
*/

DROP TABLE Content;
DROP TABLE Users;
DROP TABLE Organizations;


-- Create tables
CREATE TABLE Organizations (
    org_name VARCHAR(64) PRIMARY KEY
);

CREATE TABLE Users (
    email NVARCHAR(320) PRIMARY KEY,
    username VARCHAR(64) unique NOT NULL,
    user_pass char(64) NOT NULL,
    admin_status BIT default 0,
    rank INT CHECK (rank >= 0),
    org_name VARCHAR(64)
        REFERENCES Organizations (org_name) ON DELETE CASCADE
);

CREATE TABLE Content (
    content_name VARCHAR(128) unique NOT NULL,
    content_path VARCHAR(64) UNIQUE NOT NULL,
    necessary_rank INT,
    is_archived BIT default 0,
    org_name VARCHAR(64) NOT NULL
        REFERENCES Organizations (org_name) ON DELETE CASCADE,
    PRIMARY KEY (content_name, org_name)
);

INSERT INTO Organizations(org_name)
VALUES
('CS 275'),
('CS 260');

INSERT INTO Users(username, user_pass, admin_status, rank, org_name)
VALUES
('test1', 'test1', 1, 1, 'CS 275'),
('test2', 'test2', 0, 1, 'CS 275'),
('test3', 'test3', 1, 2, 'CS 275'),
('test4', 'test4', 0, 2, 'CS 275'),
('test5', 'test5', 1, 3, 'CS 275'),
('test6', 'test6', 0, 3, 'CS 275'),
('test7', 'test7', 1, 4, 'CS 275'),
('test8', 'test8', 0, 4, 'CS 275'),
('test9', 'test9', 1, 5, 'CS 275'),
('test10', 'test10', 0, 5, 'CS 275');

INSERT INTO Content(content_name, content_path, necessary_rank, is_archived, org_name)
VALUES
('testContent1', './content/content1', 0, 0, 'CS 275'),
('testContent2', './content/content2', 0, 0, 'CS 275'),
('testContent3', './content/content3', 1, 0, 'CS 275'),
('testContent4', './content/content4', 1, 0, 'CS 275'),
('testContent5', './content/content5', 1, 0, 'CS 275'),
('testContent6', './content/content6', 2, 0, 'CS 275'),
('testContent7', './content/content7', 2, 0, 'CS 275'),
('testContent8', './content/content8', 3, 0, 'CS 275'),
('testContent9', './content/content9', 3, 0, 'CS 275'),
('testContent10', './content/content10', 3, 0, 'CS 275'),
('testContent11', './content/content11', 4, 0, 'CS 275'),
('testContent12', './content/content12', 4, 0, 'CS 275'),
('testContent13', './content/content13', 5, 0, 'CS 275');
('testContent14', './content/content14', 5, 0, 'CS 275'),