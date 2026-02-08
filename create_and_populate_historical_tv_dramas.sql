-- =====================================
-- Title: Ratings of Historical TV Dramas (Week 2A Assignment)

-- Author: Kiera Griffiths 

-- Approach:
-- I chose six dramatic TV series set in historical periods and asked five participants to rate how they liked each
-- show on a scale of 1 to 5 (1 being the lowest).The data will be stored in three tables (ratings, shows, 
-- participants) in SQLite then loaded into R, to combine the tables and analyze the average ratings per show. For
-- instances where a participant did not watch a show, they will not rate that show and the missing rating will be 
-- presented as "NULL" in SQL and "NA" in R. This means shows with fewer viewers may have averages more sensitive to 
-- each viewer's rating but not necessarily higher ratings.
-- =====================================
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS shows;
DROP TABLE IF EXISTS participants;

CREATE TABLE shows (
    show_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL
);

CREATE TABLE participants (
    participant_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);
CREATE TABLE ratings (
    participant_id INTEGER,
    show_id INTEGER,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    PRIMARY KEY (participant_id, show_id),
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);
INSERT INTO shows (title) VALUES
('Bridgerton'),
('Peaky Blinders'),
('Gilded Age'),
('Underground'),
('Shogun'),
('Warriors');

INSERT INTO participants (name) VALUES
('P1'),
('P2'),
('P3'),
('P4'),
('P5');

INSERT INTO ratings (participant_id, show_id, rating) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 3, 5),
(1, 4, 4),

(2, 1, 4),
(2, 3, 5),
(2, 6, 5),

(3, 2, 5),
(3, 3, 1),
(3, 4, 5),
(3, 5, 4),

(4, 1, 3),
(4, 3, 5),
(4, 4, 5),
(4, 5, 4),

(5, 3, 4),
(5, 4, 5),
(5, 6, 5);


