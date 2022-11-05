-- QUERY TABLE

SELECT *
FROM weather; -- Retrieves all data

SELECT city, temp_lo, temp_hi, prcp, date
FROM weather;

-- Write Expressions
SELECT city, (temp_hi + temp_lo) / 2 AS temp_avg, date
FROM weather;

-- Get weather from SF on rainy days
SELECT *
FROM weather
WHERE city = 'San Francisco'
  AND prcp > 0.0;

-- Get data in sorted order
SELECT *
FROM weather
ORDER BY city;

-- Remove Duplicate data for a column
SELECT DISTINCT city
FROM weather
ORDER BY city;


-- Joins between tables (Inner Joins)

SELECT *
FROM weather
         JOIN cities ON city = name;

SELECT city, temp_lo, temp_hi, prcp, date, location
FROM weather
         JOIN cities ON city = name;

-- A more better way
SELECT weather.city, weather.temp_lo, weather.temp_hi, weather.prcp, weather.date, cities.location
FROM weather
         JOIN cities ON weather.city = cities.name;

-- Outer Joins
-- This query is called a `left outer join` because the table mentioned on the left will have each of its rows in
-- the output at least once, whereas the table on the right will only have those rows output that match some row of
-- the left table.
SELECT *
FROM weather
         LEFT OUTER JOIN cities ON weather.city = cities.name;

-- TODO: Right Outer Join

-- TODO: Full Outer Join

-- Self Join
SELECT w1.city, w1.temp_lo AS low, w1.temp_hi AS high, w2.city, w2.temp_lo AS low, w2.temp_hi AS high
FROM weather w1
         JOIN weather w2 ON w1.temp_lo < w2.temp_lo AND w1.temp_hi > w2.temp_hi;

-- Aggregate Functions

SELECT max(temp_lo)
FROM weather;

-- Using a SubQuery
SELECT city
FROM weather
WHERE temp_lo = (SELECT max(temp_lo) FROM weather);


-- Aggregates are also very useful in combination with GROUP BY clauses.
SELECT city, max(temp_lo)
FROM weather
GROUP BY city;

-- We can filter these groups using HAVING clause
SELECT city, max(temp_lo)
FROM weather
GROUP BY city
HAVING max(temp_lo) < 40;

-- Get the cities whose name begins with "N"
SELECT city, max(temp_lo)
FROM weather
WHERE city LIKE 'N%'
GROUP BY city
HAVING max(temp_lo) < 40;

-- WHERE selects input rows before groups and aggregates are computed
-- (thus, it controls which rows go into the aggregate computation),
-- whereas HAVING selects group rows after groups and aggregates are
-- computed. Thus, the WHERE clause must not contain aggregate functions
-- HAVING clause always contains aggregate functions.