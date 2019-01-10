-- In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping track of a database that contain the best “how-to” videos on MySQL.

CREATE SCHEMA videos; -- create new database(schema) for this assignment

CREATE TABLE Videos (
	ID int, -- unique ID for each video
    title varchar(200) NOT NULL, -- title of the videos
    length_mins int, -- video length in minutes
    URL varchar(200), -- URL of the videos
    primary key (ID)
); -- create "Videos" table to keep track of the videos

INSERT INTO Videos
VALUES 
	(1,'How To Cook Chicken', 4, 'https://www.youtube.com/watch?v=XFlTnMxLEfs'),
	(2,'How To Cook Perfect Eggs Every Time', 6, 'https://www.youtube.com/watch?v=X5oD_thIk3c'),
	(3,'How To Cook The Best Oatmeal Ever', 3, 'https://www.youtube.com/watch?v=zsLdv-DyWFE')
; -- insert ID, title, lenght in minutes and URL of related "how-to_cook" videos from Youtube

CREATE TABLE Reviewers (
    user varchar(30),
    video_id int,
    rating int,
    review varchar(200)
); -- create "Reviewers" table to keep track of user reviews for the videos, with column video_id linked to column ID from "Videos" table

INSERT INTO Reviewers
VALUES 
	('Abby', 2, 4, 'Nice video!'),
    ('Cindy', 1, 2, 'Not bad.'),
    ('Bob', 2, 5, 'Loved it!'),
    ('Edward', 3, 3, 'Good.'),
    ('Flora', 1, NULL, 'Good.'),
    ('David', 3, 4, 'Nice video!')
; -- insert user name, video id, rating from 0 to 5 and short review for the videos

SELECT * 
FROM Videos AS v
INNER JOIN Reviewers AS r
ON v.ID = r.video_id; -- join the two tables and show all information for all records that have the matched video id