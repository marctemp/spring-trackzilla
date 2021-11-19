CREATE TABLE `application` (
                            application_id smallint NOT NULL,
                            app_name varchar(40) NOT NULL,
                            description varchar(2000),
                            owner varchar(40),
                            PRIMARY KEY (application_id)
                           );

CREATE TABLE `release` (
                        id int NOT NULL,
                        description varchar(2000),
                        release_date date,
                        PRIMARY KEY (id)
                       );

CREATE TABLE `ticket` (
                       id int NOT NULL,
                       title varchar(40) NOT NULL,
                       description varchar(2000),
                       status ENUM('OPEN', 'IN PROGRESS', 'CLOSED'),
                       application_id smallint NOT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (application_id) REFERENCES `application`(application_id)
                      );

CREATE TABLE `ticket_release` (
                               `ticket_fk` int NOT NULL,
                               `release_fk` int NOT NULL,
                               PRIMARY KEY (`ticket_fk`, `release_fk`),
                               FOREIGN KEY (`ticket_fk`) REFERENCES `ticket` (id),
                               FOREIGN KEY (`release_fk`) REFERENCES `release` (id)
                              );

INSERT INTO `application` (application_id, app_name, description, owner) VALUES (1, 'Trackzilla','A bug tracking application', 'Chris Kenma');
INSERT INTO `application` (application_id, app_name, description, owner) VALUES (2, 'Expenses','An application used to submit expenses', 'Jane Doe');
INSERT INTO `application` (application_id, app_name, description, owner) VALUES (3, 'Bookings','An application used to book ticket ', 'John Doe');
INSERT INTO `application` (application_id, app_name, description, owner) VALUES (4, 'Invoice Search','An application used to search invoices ', 'Mary Richards');
INSERT INTO `application` (application_id, app_name, description, owner) VALUES (5, 'Audits','An application used for auditing purposes.', 'Tiffany Stewart');
INSERT INTO `ticket` (id, title, description, application_id, status) VALUES (1, 'Sort Feature','Add the ability to sort ticket  by severity', 1, 'OPEN');
INSERT INTO `ticket` (id, title, description, application_id, status) VALUES (2, 'Search Feature','Add the ability to search by invoice date', 4, 'IN PROGRESS');
INSERT INTO `ticket` (id, title, description, application_id, status) VALUES (3, 'Audit','Add the ability to audit by year', 5, 'CLOSED');
INSERT INTO `ticket` (id, title, description, application_id, status) VALUES (4, 'Booking Feature','Add the ability to book ticket online', 3, 'OPEN');
INSERT INTO `release` (id, description, release_date) VALUES (1,'Q1 release Containing High Priority Bugs', '2030-02-14');
INSERT INTO `release` (id, description, release_date) VALUES (2,'Q2 release Containing High Priority Enhancements', '2030-05-27');
INSERT INTO `release` (id, description, release_date) VALUES (3,'Q3 release Containing Bugs', '2030-09-14');
INSERT INTO `release` (id, description, release_date) VALUES (4,'Q4 release Containing Enhancements', '2030-12-10');
INSERT INTO `ticket_release` (release_fk, ticket_fk) VALUES (1,3);
INSERT INTO `ticket_release` (release_fk, ticket_fk) VALUES (2,1);
INSERT INTO `ticket_release` (release_fk, ticket_fk) VALUES (2,4);
