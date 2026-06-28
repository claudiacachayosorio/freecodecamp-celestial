-- Celestial Database Schema

CREATE DATABASE universe;


CREATE TABLE galaxy(
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(100),
    large_scale_structure VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO galaxy(
    name,
    type,
    large_scale_structure,
    is_active
) VALUES
    ('Milky Way', 'Spiral', 'Local Group', TRUE),
    ('Andromeda', 'Spiral', 'Local Group', TRUE),
    ('Large Magellanic Cloud', 'Irregular', 'Local Group', TRUE),
    ('Small Magellanic Cloud', 'Irregular', 'Local Group', TRUE),
    ('Triangulum', 'Spiral', 'Local Group', TRUE),
    ('Messier 87', 'Elliptical', 'Virgo Cluster', TRUE);



CREATE TABLE star(
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(100),
    absolute_magnitude NUMERIC(10,2),
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

INSERT INTO star(
    name,
    type,
    absolute_magnitude,
    galaxy_id
) VALUES
    ('Sun', 'G-type main-sequence', 4.83, 1),
    ('Kepler-22', 'G-type main-sequence', 11.90, 1),
    ('Noquisi', 'M-type main-sequence', 10.67, 1),
    ('Orkaria', 'M-type main-sequence', 14.00, 1),
    ('Polaris', 'F-type main-sequence', 430.00, 1),
    ('WASP-12', 'G-type main-sequence', 12.60, 1);



CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(100),
    known_satellites INT,
    star_id INT REFERENCES star(star_id)
);

INSERT INTO planet(
    name,
    type,
    known_satellites,
    star_id
) VALUES
    ('Mercury', 'Terrestrial', 0, 1),
    ('Venus', 'Terrestrial', 0, 1),
    ('Earth', 'Terrestrial', 1, 1),
    ('Mars', 'Terrestrial', 2, 1),
    ('Jupiter', 'Gas Giant', 79, 1),
    ('Saturn', 'Gas Giant', 82, 1),
    ('Uranus', 'Ice Giant', 27, 1),
    ('Neptune', 'Ice Giant', 14, 1),
    ('Awohali', 'Exoplanet', 0, 3),
    ('Enaiposha', 'Exoplanet', 0, 4),
    ('Kepler-22 b', 'Exoplanet', 0, 2),
    ('WASP-12 b', 'Exoplanet', 0, 6);



CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    etymology TEXT,
    suspected_ocean BOOLEAN DEFAULT FALSE,
    planet_id INT REFERENCES planet(planet_id)
);

INSERT INTO moon(
    name,
    etymology,
    suspected_ocean,
    planet_id
) VALUES
    ('Moon', 'Latin', FALSE, 3),
    ('Phobos', 'Greek', FALSE, 4),
    ('Deimos', 'Greek', FALSE, 4),
    ('Io', 'Greek', FALSE, 5),
    ('Europa', 'Greek', TRUE, 5),
    ('Ganymede', 'Greek', TRUE, 5),
    ('Callisto', 'Greek', TRUE, 5),
    ('Himalia', 'Greek', FALSE, 5),
    ('Titan', 'Latin', TRUE, 6),
    ('Enceladus', 'Greek', TRUE, 6),
    ('Mimas', 'Greek', FALSE, 6),
    ('Phoebe', 'Greek', FALSE, 6),
    ('Oberon', 'Shakespeare', TRUE, 7),
    ('Titania', 'Shakespeare', TRUE, 7),
    ('Ariel', 'Shakespeare', TRUE, 7),
    ('Umbriel', 'Shakespeare', TRUE, 7),
    ('Miranda', 'Shakespeare', TRUE, 7),
    ('Triton', 'Greek', TRUE, 8),
    ('Proteus', 'Greek', FALSE, 8),
    ('Nereid', 'Greek', FALSE, 8);



CREATE TABLE comet(
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    epoch_year INT
);

INSERT INTO comet(
    name,
    epoch_year
) VALUES
    ('Halley', 1986),
    ('Hale-Bopp', 1997),
    ('Hyakutake', 1996);
