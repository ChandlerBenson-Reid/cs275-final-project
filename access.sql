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
('Drexel Karate Club');
--('CS 260');

INSERT INTO Users(username, user_pass, admin_status, rank, org_name)
VALUES
('Sensei', 'senseipass', 1, 5, 'Drexel Karate Club'),
('whitebelt', 'student1', 0, 1, 'Drexel Karate Club'),
('yellowbelt', 'student2', 0, 2, 'Drexel Karate Club'),
('orangebelt', 'student3', 0, 2, 'Drexel Karate Club'),
('greenbelt', 'student4', 0, 3, 'Drexel Karate Club'),
('purplebelt', 'student5', 0, 3, 'Drexel Karate Club'),
('brownbelt', 'student6', 0, 3, 'Drexel Karate Club'),
('redbelt', 'student7', 0, 4, 'Drexel Karate Club'),
('blackbelt', 'student8', 0, 4, 'Drexel Karate Club');

INSERT INTO Content(content_name, content_path, necessary_rank, is_archived, org_name)
VALUES
('Class Schedule', './drexel_karate_club/class_schedule.txt', 0, 0, 'Drexel Karate Club'),
('White Belt Forms', './drexel_karate_club/whitebelt_forms.txt', 1, 0, 'Drexel Karate Club'),
('White Belt Test', './drexel_karate_club/whitebelt_test.txt', 1, 0, 'Drexel Karate Club'),
('Orange Belt Forms', './drexel_karate_club/orangebelt_forms.txt', 2, 0, 'Drexel Karate Club'),
('Orange Belt Test', './drexel_karate_club/orangebelt_test.txt', 2, 0, 'Drexel Karate Club'),
('Purple Belt Forms', './drexel_karate_club/purblebelt_forms.txt', 3, 0, 'Drexel Karate Club'),
('Purple Belt Test', './drexel_karate_club/purplebelt_test.txt', 3, 0, 'Drexel Karate Club'),
('Red Belt Forms', './drexel_karate_club/redbelt_forms.txt', 4, 0, 'Drexel Karate Club'),
('Red Belt Test', './drexel_karate_club/redbelt_test.txt', 4, 0, 'Drexel Karate Club'),
('Black Belt Forms', './drexel_karate_club/blackbelt_forms.txt', 5, 0, 'Drexel Karate Club'),
('Black Belt Test', './drexel_karate_club/blackbelt_test.txt', 5, 0, 'Drexel Karate Club');