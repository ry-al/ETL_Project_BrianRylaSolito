###After creating a database to hold these tables, run this code to create the necessary tables for data loading.


#First Table

CREATE TABLE movies(
title_id VARCHAR PRIMARY KEY NOT NULL,
rank INT UNIQUE NOT NULL,
title VARCHAR (50) NOT NULL,
rating FLOAT NOT NULL,
year INT NOT NULL,
genre VARCHAR NOT NULL,
mpaa_rating VARCHAR(10) NOT NULL
);

#Second Table

CREATE TABLE streaming(
title_id VARCHAR NOT NULL,
streaming_service VARCHAR NOT NULL,
url VARCHAR,
PRIMARY KEY (title_id,streaming_service)
);