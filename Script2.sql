CREATE table IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS person (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	name_album VARCHAR(60) NOT NULL,
	date_album DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS PersonAlbum (
	person_id INTEGER REFERENCES person(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pc PRIMARY KEY (person_id, album_id)
);

CREATE TABLE IF NOT EXISTS GenrePerson (
	genre_id INTEGER REFERENCES genre(id),
	person_id INTEGER REFERENCES person(id),
	CONSTRAINT pg PRIMARY KEY (genre_id, person_id)
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	albums_id INTEGER REFERENCES albums(id),
	track_name VARCHAR(80) NOT NULL,
	duration INTERVAL NOT NULL
);

CREATE TABLE IF NOT EXISTS compil (
	id SERIAL PRIMARY KEY,
	track_id INTEGER REFERENCES tracks(id),
	compil_name VARCHAR(60) NOT NULL,
	year_release INTEGER NOT NULL
);
