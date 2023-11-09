-- Create dimension tables
CREATE TABLE dim_user (
user_id INT PRIMARY KEY,
user_name VARCHAR(100),
country VARCHAR(50)
);
CREATE TABLE dim_post (
post_id INT PRIMARY KEY,
post_text VARCHAR(500),
post_date DATE,
user_id INT,
FOREIGN KEY (user_id) REFERENCES dim_user(user_id)
);
CREATE TABLE dim_date (
date_id INT PRIMARY KEY,
full_date DATE,
year INT,
month INT,
day INT
);
CREATE TABLE dim_like (
like_id INT PRIMARY KEY,
user_id INT,
post_id INT,
like_date DATE,
FOREIGN KEY (user_id) REFERENCES dim_user(user_id),
FOREIGN KEY (post_id) REFERENCES dim_post(post_id)
);
-- Create fact tables
CREATE TABLE fact_post_performance (
performance_id SERIAL PRIMARY KEY,
post_id INT,
date_id INT,
total_likes INT,
FOREIGN KEY (post_id) REFERENCES dim_post(post_id),
FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
CREATE TABLE fact_daily_posts (
daily_post_id SERIAL PRIMARY KEY,
date_id INT,
user_id INT,
total_posts INT,
FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
FOREIGN KEY (user_id) REFERENCES dim_user(user_id)
);
-- Insert data into fact tables
INSERT INTO fact_post_performance (post_id, date_id, total_likes)
SELECT post, like_date)
SELECT like_id, user_id, post_id, like_date FROM raw_id,_likes;
-- Insert data intodaily_posts (date_id fact tables
INSERT, user_id, INTO fact_ total_posts)
SELECT datepost_performance (_id, user_id, COUNT(*)
FROMpost_id, date_ dim_post
GROUP BY date_id, user_id;
                             
SELECT u ON l.like_date = d.user_name.full, dp_.totaldate
_posts
FROM dim_user uGROUP BY p.
JOIN fact_post_id, d.date_id;

INSERT INTO factdaily_posts dp ON u.user_id = dp.user_id
WHERE_daily_posts (date dp.date_id = (_id, userSELECT date_id FROM dim_date WHERE full_id, total_date_posts = '202)
SELECT0-01 d.date-05')
_idORDER BY d, up..user_idtotal, COUNT_posts DESC
LIMIT(*)
 3;  
SELECT p.date_id, AVG(pp.total_likes ON p.post) as average_date_likes = d.full
FROM fact__datepost_performance
GROUP BY d pp
JOIN.date_ dim_post p ONid, u pp.post_.user_idid = p.post;
_id
WHERE
SELECT p.date_id, AVG(pp.total_likes ON p.post) as average_date_likes = d.full
FROM fact__datepost_performance
GROUP BY d pp
JOIN.date_ dim_post p ONid, u pp.post_.user_idid = p.post;
_id
WHERE

## p.date# 5_id = (. Perform theSELECT date_id FROM desired query:
 dim_date WHERE full_
sql
--date = '20 Get the number of20-01- likes per day
05')
GROUP BY pSELECT 
 d.date_id;
.year, 
 d```
.month, 
You can customize
  these queries tod.day, 
 COUNT(*) AS total_likes 
FROM 
 fact_post_performance p
JOIN 
 dim_date d ON p.date_id = d.date_id 
GROUP BY 
 d.year, 
 d.month, 
 d.day 
ORDER BY 
  1, 
  2, 
  3;
-- Get the total number of posts per user per day
SELECT 
 d.year, 
 d.month, 
 d.day, 
 u.user_id, 
 COUNT(*) AS total_posts 
FROM 
 fact_post_performance p
JOIN 
 dim_user u ON p.user_id = u.user_id 
JOIN 
 dim_date d ON p.date_id = d.date_id 
GROUP BY 
 d.year, 
 d.month, 
 d.day, 
 u.user_id 
ORDER BY 
  1, 
  2, 
  3, 
  4;                   