-- 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
-- 2. Выведите данные, используя написанное представление [SELECT]
-- 3. Удалите представление [DROP VIEW]
-- 4*. Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей), 
-- user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN. */
USE vk;

CREATE OR REPLACE VIEW usercounter AS 
     SELECT communities.name AS community, 
	    COUNT(user_id) AS users_count
       FROM communities
       JOIN users_communities ON communities.id = users_communities.community_id
   GROUP BY communities.id
   ORDER BY communities.name;

SELECT community,
       users_count
  FROM usercounter;
  
DROP VIEW usercounter;

-- JOIN

  SELECT COUNT(media.id) AS news_count,
         media.user_id,
         users.email AS user_email
    FROM media
    JOIN users ON media.user_id = users.id
GROUP BY users.id;

-- CTE

  WITH newscounter AS (
       SELECT COUNT(id) AS news_count,
	      user_id
         FROM media
     GROUP BY user_id)
SELECT newscounter.news_count, 
       newscounter.user_id, 
       users.email AS user_email
  FROM newscounter, users
 WHERE newscounter.user_id = users.id