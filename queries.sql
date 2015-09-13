--- Worked on it with Steven Saurbier

-- You can run it in the terminal by putting: psql movies < queries.sql
-- You always run that in the terminal with the database < file_name.sql (a generic note!)

-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

-- YOUR QUERY HERE

SELECT title AS Film, rating FROM movies ORDER BY rating LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

-- YOUR QUERY HERE

SELECT title AS Film FROM movies WHERE rating IS NULL ORDER BY title;


-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

-- YOUR QUERY HERE

SELECT title AS Film FROM movies WHERE synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

-- YOUR QUERY HERE

SELECT title AS Film, year, rating FROM movies JOIN genres ON genre_id = genres.id
WHERE genres.name LIKE 'Science Fiction & Fantasy%' AND movies.rating IS NOT NULL ORDER BY rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

-- YOUR QUERY HERE

SELECT actors.name AS Actor, movies.title AS Film, movies.year FROM actors
JOIN cast_members ON cast_members.actor_id = actors.id
JOIN movies ON cast_members.movie_id = movies.id
WHERE cast_members.character = 'James Bond' ORDER BY movies.year;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

-- YOUR QUERY HERE

SELECT movies.title AS Film, genres.name AS Genre, movies.year FROM movies
JOIN cast_members ON cast_members.movie_id = movies.id
JOIN actors ON actors.id = cast_members.actor_id
JOIN genres ON genres.id = movies.genre_id
WHERE actors.name = 'Julianne Moore' ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

-- YOUR QUERY HERE

SELECT movies.title AS Film, movies.year, studios.name AS Studio
FROM movies  FULL OUTER JOIN studios ON studios.id = movies.studio_id
JOIN genres ON genres.id = movies.genre_id
WHERE genres.name LIKE '%Horror%' ORDER BY movies.year LIMIT 5;
