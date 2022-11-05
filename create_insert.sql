-- CREATE A TABLE

CREATE TABLE weather
(
    city    varchar(80),
    temp_lo int,  -- low temperature
    temp_hi int,  -- high temperature
    prcp    real, -- precipitation
    date    date
);


CREATE TABLE cities
(
    name     varchar(80),
    location point -- point data type is postgresql specific data type
);


-- POPULATE TABLE WITH DATA

INSERT INTO weather
VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

-- OTHER WAY TO INSERT DATA

INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
VALUES ('New York', 36, 48, 0.21, '1990-11-29');

INSERT INTO weather (date, city, temp_hi, temp_lo)
VALUES ('1991-09-10', 'Washington DC', 54, 37);

INSERT INTO cities
VALUES ('San Francisco', '(-194.0, 53.0)');

