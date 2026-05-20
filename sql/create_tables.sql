CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    greek_name TEXT,
    birth_place TEXT,
    estimated_birth_year INTEGER,
    estimated_death_year INTEGER,
    period TEXT,
    primary_genre TEXT,
    notes TEXT
);

CREATE TABLE works (
    work_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER,
    genre TEXT,
    estimated_date TEXT,
    language TEXT,
    source_culture TEXT,
    notes TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    modern_equivalent TEXT,
    location_type TEXT,
    mythological BOOLEAN,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    region TEXT,
    notes TEXT
);

CREATE TABLE characters (
    character_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    greek_name TEXT,
    roman_name TEXT,
    character_type TEXT,
    gender TEXT,
    domain TEXT,
    origin_location_id INTEGER,
    notes TEXT,
    FOREIGN KEY (origin_location_id) REFERENCES locations(location_id)
);

CREATE TABLE character_appearances (
    appearance_id INTEGER PRIMARY KEY,
    character_id INTEGER NOT NULL,
    work_id INTEGER NOT NULL,
    role TEXT,
    importance TEXT,
    notes TEXT,
    FOREIGN KEY (character_id) REFERENCES characters(character_id),
    FOREIGN KEY (work_id) REFERENCES works(work_id)
);

CREATE TABLE relationships (
    relationship_id INTEGER PRIMARY KEY,
    source_character_id INTEGER NOT NULL,
    target_character_id INTEGER NOT NULL,
    relationship_type TEXT NOT NULL,
    source_work_id INTEGER,
    notes TEXT,
    FOREIGN KEY (source_character_id) REFERENCES characters(character_id),
    FOREIGN KEY (target_character_id) REFERENCES characters(character_id),
    FOREIGN KEY (source_work_id) REFERENCES works(work_id)
);

CREATE TABLE relationship_types (
    relationship_type_id INTEGER PRIMARY KEY,
    relationship_type TEXT NOT NULL,
    category TEXT,
    description TEXT,
    notes TEXT
);

CREATE TABLE events (
    event_id INTEGER PRIMARY KEY,
    event_name TEXT NOT NULL,
    event_type TEXT,
    primary_location_id INTEGER,
    estimated_period TEXT,
    source_work_id INTEGER,
    summary TEXT,
    notes TEXT,
    FOREIGN KEY (primary_location_id) REFERENCES locations(location_id),
    FOREIGN KEY (source_work_id) REFERENCES works(work_id)
);

CREATE TABLE event_characters (
    event_character_id INTEGER PRIMARY KEY,
    event_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    event_role TEXT,
    notes TEXT,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

CREATE TABLE character_aliases (
    alias_id INTEGER PRIMARY KEY,
    character_id INTEGER NOT NULL,
    alias_name TEXT NOT NULL,
    alias_type TEXT,
    language_or_culture TEXT,
    notes TEXT,
    FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

CREATE TABLE work_locations (
    work_location_id INTEGER PRIMARY KEY,
    work_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    location_role TEXT,
    notes TEXT,
    FOREIGN KEY (work_id) REFERENCES works(work_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE sources (
    source_id INTEGER PRIMARY KEY,
    source_type TEXT,
    title TEXT NOT NULL,
    author_id INTEGER,
    work_id INTEGER,
    language TEXT,
    source_culture TEXT,
    reliability_note TEXT,
    notes TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (work_id) REFERENCES works(work_id)
);

CREATE TABLE source_references (
    reference_id INTEGER PRIMARY KEY,
    entity_type TEXT NOT NULL,
    entity_id INTEGER NOT NULL,
    source_id INTEGER NOT NULL,
    reference_note TEXT,
    confidence_level TEXT,
    FOREIGN KEY (source_id) REFERENCES sources(source_id)
);

CREATE TABLE crimes_and_punishments (
    crime_id INTEGER PRIMARY KEY,
    event_id INTEGER,
    character_id INTEGER,
    alleged_action TEXT,
    mythological_category TEXT,
    mythological_punishment TEXT,
    punishing_figure TEXT,
    modern_uk_equivalent TEXT,
    likely_illegal_today TEXT,
    modern_law_note TEXT,
    severity_rating INTEGER,
    notes TEXT,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (character_id) REFERENCES characters(character_id)
);
