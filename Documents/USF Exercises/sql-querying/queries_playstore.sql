-- 1. Find the entire record for the app with ID 1880
SELECT *
FROM analytics
WHERE id = 1880;

-- 2. Find the ID and app name for apps last updated on August 1, 2018
SELECT id, app_name
FROM analytics
WHERE last_updated = DATE '2018-08-01';

-- 3. Count the number of apps in each category
SELECT category, COUNT(*) AS app_count
FROM analytics
GROUP BY category
ORDER BY app_count DESC;

-- 4. Find the top 5 most-reviewed apps and their review counts
SELECT app_name, reviews
FROM analytics
ORDER BY reviews DESC
LIMIT 5;

-- 5. Find the app with the most reviews that has a rating of at least 4.8
SELECT app_name, reviews, rating
FROM analytics
WHERE rating >= 4.8
ORDER BY reviews DESC
LIMIT 1;

-- 6. Average rating per category (highest to lowest)
SELECT category, AVG(rating) AS avg_rating
FROM analytics
GROUP BY category
ORDER BY avg_rating DESC;

-- 7. Find the most expensive app with a rating below 3
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
ORDER BY price DESC
LIMIT 1;

-- 8. Find apps with min_installs <= 50 that have a rating
--    Order by highest rating first
SELECT app_name, min_installs, rating
FROM analytics
WHERE min_installs <= 50
  AND rating IS NOT NULL
ORDER BY rating DESC;

-- 9. Find apps rated below 3 with at least 10,000 reviews
SELECT app_name
FROM analytics
WHERE rating < 3
  AND reviews >= 10000
ORDER BY reviews DESC;

-- 10. Find the top 10 most-reviewed apps priced between $0.10 and $1.00
SELECT app_name, price, reviews
FROM analytics
WHERE price BETWEEN 0.10 AND 1.00
ORDER BY reviews DESC
LIMIT 10;

-- 11. Find the most out-of-date app (oldest last_updated)
SELECT app_name, last_updated
FROM analytics
ORDER BY last_updated ASC
LIMIT 1;

-- 12. Find the most expensive app
SELECT app_name, price
FROM analytics
ORDER BY price DESC
LIMIT 1;

-- 13. Count all reviews in the Google Play Store
SELECT SUM(reviews) AS total_reviews
FROM analytics;

-- 14. Find categories with more than 300 apps
SELECT category, COUNT(*) AS app_count
FROM analytics
GROUP BY category
HAVING COUNT(*) > 300
ORDER BY app_count DESC;

-- 15. Highest ratio of installs to reviews (100k+ installs)
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;