CREATE DATABASE conservation_db;

-- rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
);

-- species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);

-- sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);


-- INSERT SAMPLE DATA

-- rangers
INSERT INTO rangers (ranger_id, name, region) VALUES 
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range'),
(4, 'David Black', 'Eastern Ridge'),
(5, 'Emily Brown', 'Desert Plains'),
(6, 'Frank Stone', 'Western Cliffs'),
(7, 'Grace Blue', 'Highland Forest'),
(8, 'Henry Wood', 'Tropical Grove'),
(9, 'Ivy Lake', 'Rainy Marsh'),
(10, 'Jack Flint', 'Southern Bay'),
(11, 'Karen Moss', 'Redwood Basin'),
(12, 'Leo Brooks', 'Pine Valley'),
(13, 'Mia Fox', 'Glacier Fields'),
(14, 'Nathan Wolf', 'Foggy Canyon'),
(15, 'Olivia Snow', 'Snowcap Ridge'),
(16, 'Paul Bear', 'Grassy Knolls'),
(17, 'Quincy Sky', 'Sunrise Peaks'),
(18, 'Rachel Field', 'Savannah Bend'),
(19, 'Sam Ash', 'Cactus Hollow'),
(20, 'Tina Ray', 'Crystal Springs');


-- species

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
(5, 'Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
(6, 'Indian Peacock', 'Pavo cristatus', '1758-01-01', 'Least Concern'),
(7, 'Great Hornbill', 'Buceros bicornis', '1758-01-01', 'Vulnerable'),
(8, 'Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
(9, 'Indian Star Tortoise', 'Geochelone elegans', '1831-01-01', 'Vulnerable'),
(10, 'Indian Wolf', 'Canis lupus pallipes', '1831-01-01', 'Endangered'),
(11, 'King Cobra', 'Ophiophagus hannah', '1836-01-01', 'Vulnerable'),
(12, 'Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
(13, 'Gaur', 'Bos gaurus', '1827-01-01', 'Vulnerable'),
(14, 'Indian Leopard', 'Panthera pardus fusca', '1794-01-01', 'Vulnerable'),
(15, 'Barasingha', 'Rucervus duvaucelii', '1823-01-01', 'Vulnerable'),
(16, 'Blackbuck', 'Antilope cervicapra', '1758-01-01', 'Least Concern'),
(17, 'Himalayan Monal', 'Lophophorus impejanus', '1790-01-01', 'Least Concern'),
(18, 'Fishing Cat', 'Prionailurus viverrinus', '1822-01-01', 'Vulnerable'),
(19, 'Nilgiri Tahr', 'Nilgiritragus hylocrius', '1838-01-01', 'Endangered'),
(20, 'Olive Ridley Turtle', 'Lepidochelys olivacea', '1829-01-01', 'Vulnerable');



-- sightings
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(5, 4, 4, 'River Edge', '2024-05-20 06:00:00', 'Tracks near water'),
(6, 5, 5, 'Sandy Hollow', '2024-05-21 12:15:00', 'Shed skin found'),
(7, 6, 6, 'Peacock Point', '2024-05-21 17:45:00', 'Display observed'),
(8, 7, 7, 'Hornbill Nest Rock', '2024-05-22 11:00:00', NULL),
(9, 8, 8, 'Pangolin Trail', '2024-05-23 21:30:00', 'Nocturnal movement'),
(10, 9, 9, 'Tortoise Rock', '2024-05-24 10:05:00', 'Basking in sunlight'),
(11, 10, 10, 'Wolfswood Hills', '2024-05-24 20:00:00', 'Howling heard'),
(12, 11, 11, 'Serpent Curve', '2024-05-25 15:25:00', 'Nest located'),
(13, 12, 12, 'Bear Creek', '2024-05-26 06:40:00', 'Claw marks on tree'),
(14, 13, 13, 'Gaur Valley', '2024-05-26 08:15:00', 'Large herd seen'),
(15, 14, 14, 'Leopard Ledge', '2024-05-27 17:30:00', NULL),
(16, 15, 15, 'Stag Point', '2024-05-28 07:20:00', 'Antlers recovered'),
(17, 16, 16, 'Blackbuck Plain', '2024-05-28 18:00:00', 'Fast movement spotted'),
(18, 17, 17, 'Monal Heights', '2024-05-29 09:30:00', 'Colorful plumage noted'),
(19, 18, 18, 'Fishing Creek', '2024-05-29 13:10:00', 'Prey hunt observed'),
(20, 19, 19, 'Tahr Rockface', '2024-05-30 06:55:00', 'Group climbing seen');


-- Problem 1
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');


-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


-- Problem 3
SELECT *
FROM sightings
WHERE location ILIKE '%Pass%';


-- Problem 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.ranger_id, r.name
ORDER BY r.name;


-- Problem 5
SELECT s.common_name
FROM species s
LEFT JOIN sightings si ON s.species_id = si.species_id
WHERE si.sighting_id IS NULL;


-- Problem 6
SELECT sp.common_name, si.sighting_time, r.name
FROM sightings si
JOIN species sp ON si.species_id = sp.species_id
JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;


-- Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';


-- Problem 8
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;


-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);