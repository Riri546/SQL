-- 1. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
SELECT DISTINCT firstname
FROM users;
GROUP BY firstname 
ORDER BY firstname;

-- 2. Выведите количество мужчин старше 35 лет [COUNT].
SELECT *
FROM profiles 
WHERE 
     TIMESTAMPDIFF(YEAR, birthday, NOW()) > 35
     AND gender = 'm'

-- 3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY].
SELECT 
	COUNT(*),
	status
FROM friend_requests 
GROUP BY status