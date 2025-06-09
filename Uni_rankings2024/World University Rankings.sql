create database World_University_Rankings_Analysis;

use world_university_rankings_analysis;

-- 1. import table
select * from uni_rankings2024;

/* Data Exploration Using SQL
Explore the structure of the dataset using basic SQL queries 
(e.g., SELECT, COUNT(), GROUP BY, etc.).*/

-- 2. view the structure of the table
describe uni_rankings2024;

-- check the total number of records
select count(*) from uni_rankings2024;

-- 3. Analysis Questions
-- i. Top Universities by Overall Score
Create view Top10_uni as
select university, overall from uni_rankings2024 order by overall desc limit 10;

-- ii. Top Countries by Research Performance
Create view Top_countryR as
select country, avg(research) as avg_research_score from uni_rankings2024
group by country order by avg_research_score desc
limit 10;
select * from top_countryr;

-- iii. Impact of International Outlook on Rankings
create view Top10_international_outlook as
Select University, `rank` `International outlook` From uni_rankings2024 Where `International outlook` > 90;
select * from top10_international_outlook;

-- iv. Correlation Between Industry Income and Rankings
create view income_ranking as
select University, `rank` `Industry Income` from uni_rankings2024 
where `Industry Income` > 90;
Select * from income_ranking;

/* 5. Conclusion and Insights
From the SQL queries, we can derive the following insights:
•	Top Universities:
The top 10 universities by overall score typically belong to countries with strong research and teaching performances.
•	Research Performance:
Countries such as the US and the UK tend to dominate research performance metrics, correlating with their high university rankings.
•	International Outlook Influence:
A high international outlook score generally correlates with better university rankings, though some universities may rank highly with moderate outlook scores due to strong research or teaching metrics.
•	Industry Income:
High industry income can be found among top universities, but it is not always a decisive factor in overall ranking compared to research and citations.
*/











