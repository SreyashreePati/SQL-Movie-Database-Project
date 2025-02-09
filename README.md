# SQL-Movie-Database-Project
This SQL project is designed to analyze and retrieve meaningful insights from a movie database, covering various aspects such as movie details, actors, ratings, reviews, directors, genres, and viewer feedback.
1. Movie Details & Release Information
Find the release year of 'American Beauty' using a simple selection query.
Retrieve all movies released before 1998 to understand historical movie data.
Fetch movies released after 1995 with a duration longer than 120 minutes for filtering long movies.
Identify movies with lower ratings than 'Innocence' using subqueries.
List the top 7 movies released in the United Kingdom, sorted by year.
Retrieve all movies except those released in the United Kingdom for a global movie dataset.
2. Actor & Role Analysis
Find actors who performed in 'American Beauty' using INNER JOIN.
Retrieve actors and their roles in 'Aliens', including the reviewer names.
Identify actors who played a role in 'Annie Hall' using the IN operator.
Exclude male actors from the result set while fetching first names, last names, and roles.
3. Movie Ratings & Reviews
Find the actor and movie with the highest star rating using subqueries and joins.
Retrieve the lowest-rated movies for understanding poor-performing films.
Classify movies based on their ratings into categories:
Bad Movie (rating ≤ 4)
Average Movie (rating 5-7)
Good Movie (rating > 8)
Display movie names along with their reviews.
Find all reviewers who rated 'Slumdog Millionaire'.
4. Director & Genre-Based Analysis
Find directors of the top 5 highest-rated movies.
Retrieve the genre title, maximum movie duration, and count of movies in each genre.
5. Data Modification & Updates
Change the language of movies from Japanese to Chinese if the release year is 2001.
6. Creating Views for Simplified Access
Create a view named actor_movie_roles that stores actors’ names, movie titles, and roles for easier querying in the future.
Project Purpose & Learning Outcomes
This project demonstrates the ability to:
Retrieve & analyze movie data using SQL queries.
Use JOIN operations to combine multiple tables effectively.
Implement subqueries for advanced data filtering.
Classify data dynamically using CASE statements.
Modify data using UPDATE statements.
Create views for structured data access.
