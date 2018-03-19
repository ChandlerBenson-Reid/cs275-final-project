/**
* CS 275 - Web and Mobile Application Development
* Group 4
* Access
*/

-- Drop Tables
DROP TABLE Content;
DROP TABLE Users;
DROP TABLE Organizations;

-- Create Tables
CREATE TABLE Organizations (
    org_name VARCHAR(64) PRIMARY KEY
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
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
('test2', 'test2', 0, 1, 'CS 275');

INSERT INTO Content(content_name, content_path, necessary_rank, is_archived, org_name)
VALUES
('testContent1', './content/content1', 0, 0, 'CS 275'),
('testContent2', './content/content2', 0, 0, 'CS 275');
