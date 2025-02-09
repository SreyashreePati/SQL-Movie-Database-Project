create database movies;
use movies;
select * from actor;
select * from cast;
select * from director;
select * from genres;
select * from movie;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

# Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

select * from movie;
select mov_title,mov_year from movie  where mov_title = 'American Beauty';
# actors names who performed in 'American beauty'

select * from actor a inner join cast c using(act_id) inner join movie m using(mov_id);
select  * from actor a inner join cast c using(act_id) inner join movie m using(mov_id) where mov_title = 'American Beauty';
## or select concat(act_fname,'',act_lname) as Actors_name, mov_title from avtor a inner join cast c using(act_id) inner join movie m using(movie_id) 
## where mov_title =  'American beauty'
# write an sql query to print the actor name, movie name, which has highest star rating

select * from ratings;
select  * from actor a inner join cast c using(act_id) inner join movie m using(mov_id) inner join ratings r using (mov_id);
select  * from actor a inner join cast c using(act_id) inner join movie m using(mov_id) inner join ratings r using (mov_id) where rev_stars =
 (select max(rev_stars) from ratings);
 # or select concat(act_fname,'',act_lname) full_name, mov_title,rev_starts from actor inner join cast c using(act_id) inner join movie m using(mov_id) inner join ratings r using(mov_id) where rev_stars = (select max(rev_stars) from ratings); 
# Top 5 movie names
 select * from(select concat(act_fname,'',act_lname) full_name, mov_title,rev_stars,dense_rank() over(order by rev_stars desc) dr 
 from actor inner join cast c using(act_id) inner join movie m using(mov_id) inner join ratings r using(mov_id)) t 
 where dr<=5; 
# director of top 5 
select * from(select concat(act_fname,'',act_lname) full_name, concat(dir_fname,'',dir_lname)as director_name,
mov_title,rev_stars, dense_rank() over(order by rev_stars desc) dr from actor inner join cast c 
using(act_id) 
inner join movie m using(mov_id) inner join movie_direction md using(mov_id) inner join director d using(dir_id) inner join ratings r using(mov_id)) t where dr<=5; 

# write an sql query to print the name of the actors and the role they have played along who reviewed the movie name called aliens
select * from (select concat(act_fname,'',act_lname) full_name, rev_name, mov_title from actor a inner join cast c using(act_id) inner join movie m using(mov_id) 
inner join ratings ra using(mov_id) 
inner join reviewer r using(rev_id)) t where mov_title = 'Aliens';
# if the review star is less than 4 make it as bad movie between 5-7 as average movie and more than 8 make it as good movie
select * from ratings;
alter table ratings add column movie_review varchar(10) ;
alter table ratings modify movie_review varchar(20);
update ratings set movie_review = case when rev_stars<=4 then 'bad_movie' when rev_stars>=5 and rev_stars<=7 then 'average_movie' else 'good_movie' end;

# display movie names and review
SELECT movie_name, review FROM movies;
# write an sql query to extract all the movie details whose rating is less than the innocence movie rating
# Write a SQL query to find those movies, which were released before 1998. Return movie title.
SELECT * FROM movies 
WHERE rating < (SELECT rating FROM movies WHERE movie_name = 'Innocence');
iii. Write a query where it should contain all the data of the movies which were
released after 1995 and their movie duration was greater than 120.
SELECT * FROM movies 
WHERE release_year > 1995 AND duration > 120;
iv. Write a query to determine the Top 7 movies which were released in United
Kingdom. Sort the data in ascending order of the movie year.
SELECT * FROM movies 
WHERE country = 'United Kingdom' 
ORDER BY release_year ASC 
LIMIT 7;
v. Set the language of movie language as 'Chinese' for the movie which has its
existing language as Japanese and the movie year was 2001.
UPDATE movies 
SET language = 'Chinese' 
WHERE language = 'Japanese' AND release_year = 2001;
vi. Write a SQL query to find name of all the reviewers who rated the movie
'Slumdog Millionaire'.
SELECT reviewer_name FROM reviews 
WHERE movie_id = (SELECT movie_id FROM movies WHERE title = 'Slumdog Millionaire');

vii. Write a query which fetch the first name, last name & role played by the
actor where output should all exclude Male actors.
SELECT first_name, last_name, role 
FROM actors 
WHERE gender != 'Male';
viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.
Fetch all the fields of actor table. (Hint: Use the IN operator).
SELECT * FROM actors 
WHERE actor_id IN (SELECT actor_id FROM movie_cast WHERE movie_id = 
                   (SELECT movie_id FROM movies WHERE title = 'Annie Hall'));
ix. Write a SQL query to find those movies that have been released in countries other
than the United Kingdom. Return movie title, movie year, movie time, and date of
release, releasing country.
SELECT title, release_year, duration, release_date, country 
FROM movies 
WHERE country != 'United Kingdom';
x. Print genre title, maximum movie duration and the count the number of
movies in each genre. (HINT: By using inner join)
SELECT g.genre_title, MAX(m.duration) AS max_duration, COUNT(m.movie_id) AS movie_count
FROM movies m
INNER JOIN genres g ON m.genre_id = g.genre_id
GROUP BY g.genre_title;
xi. Create a view which should contain the first name, last name, title of the
movie & role played by particular actor.
CREATE VIEW actor_movie_roles AS
SELECT a.first_name, a.last_name, m.title AS movie_title, mc.role
FROM actors a
JOIN movie_cast mc ON a.actor_id = mc.actor_id
JOIN movies m ON mc.movie_id = m.movie_id;
xii. Write a SQL query to find the movies with the lowest ratings
SELECT * FROM movies 
WHERE rating = (SELECT MIN(rating) FROM movies);