# ETL Project

- Bryan Wilson
- Ryla Almario
- Solito Reyes

# Synopsis

IMDB has a list a revered list of the [Top 250 Movies](https://www.imdb.com/chart/top/?ref_=nv_mv_250) based off of user IMDB ratings. As per this IMDB page, shorts, TV movies, and documentaries are not included; also, only movies that received at least 25,000 ratings from users.

Due to the prevalence of streaming services in our media consumption, we wanted to discover which streaming services provide these movies.  We analyzed the available movies for Netflix, Amazon Prime, Disney+, and Hulu for this project.

# PROJECT OUTLINE 

[data_etl.ipynb](https://github.com/ry-al/ETL_Project_BryanRylaSolito/blob/master/data_etl.ipynb) is a link to our main 
Jupyter Notebook containing all code for all three project portions (Extract, Transformation.

*Processes described in markdown cells or commented code within the Jupyter notebook, as well as within this README file. 
*Created an ERD, using QuickBaseDiagrams, as a reference for the end product desired, in addition to a flowchart to keep us on track and give a solid workflow visualization. 

All Sources Included within README file or GitHub repository under (Resources) Folder. 

## Extract


We retrieved a list of the Top 250 Movies along with the movie's year of release and IMDB rating by web scraping the following [page](https://www.imdb.com/chart/top/?ref_=nv_mv_250). 

We also scraped the movie pages from (reelgood.com)[https://reelgood.com/movies] to find the movies available on Amazon Prime, Netflix, Disney+, and Hulu. Since you can filter these pages by IMDB rating, we restricted the movies we retrieved to an IMDB rating of 8 or higher in order to easily match movies that are on the IMDB Top 250 list.

We also were able to retrieve additional information on the movies available on Netflix and Disney+ from Kaggle sources. The only data that was incomplete was the url for each result; we couldn’t find a source URL for every matching movie.

## Sources 

Config.py (For access to PostgreSQL database)

Netflix - https://www.kaggle.com/shivamb/netflix-shows

Netflix URLS - https://reelgood.com/movies/source/netflix?filter-imdb_start=8

DisneyPlus - https://www.kaggle.com/unanimad/disney-plus-shows

DisneyPlus URLS - https://reelgood.com/movies/source/disney_plus?filter-imdb_start=8

Hulu Movies and URLS - https://reelgood.com/movies/source/hulu?filter-imdb_start=8

Amazon Prime Movies and URLS - https://reelgood.com/movies/source/amazon?filter-imdb_start=8

IMDB - https://www.imdb.com/chart/top/?ref_=nv_mv_250
*OMDB API - http://www.omdbapi.com/

*Data mostly sourced from Kaggle, or scraped from “reelgood.com” and “imdb.com”


## Transformation

We started out the transformation of all our data by importing the raw files into Pandas, using a variety of methods to filter out each file in order to create dataframes and then CSV files containing the information necessary for our final database. 

Cleaning the data consisted of using functions or tools to clean and filter the data, such as filtering for only results included within the iMDB Top 250 List, dropping duplicates, and filling NaN cells to complete certain tables or joins. 

After creation of all dataframes containing “movies” data and “streaming service” data (final tables per Database Diagram/Flowchart), we used Pandas to merge all of these into one large dataframe (using joins). We sliced this single final dataframe to create two separate dataframes, then convert them into .csv files, one for each final table within our database.

At the end, we combined all Jupyter Notebooks that had been created individually into one, complete notebook including all steps of the project for simplicity’s sake. 

## Load 

PURPOSE: 

To consolidate data into single SQL database available for reviewal of final transformed data, queryable for record access by any of the included criteria.

Final data load consists of two tables.
The first table (movies) provides information, including a unique title_id, regarding the move itself (iMDB Rank, title, and year of release).

The second table provides information regarding the availability of each title (matched by title_id) on all streaming services studied, and the url(s) with which one can access each movie available.

The first step we took is to create a database within PostgreSQL which we could import the two Pandas dataframe (as .csv files), in order to create a queryable database. 

*Code for Creating ETL Project PostgreSQL DB Included in ETLProject_PGAdmin_Schema.sql file 

Code in our Jupyter Notebook consisted of creating a database connection by creating an engine, connecting to it, and then confirming all fields/ tables matched. After doing so, loading the final CSV files into the database was the final major step of this project. This left us with a complete database that achieves the original goal, providing the end user with a queryable database that includes all movies available on each streaming service at the time of project completion. (May 23, 	 2020) 



