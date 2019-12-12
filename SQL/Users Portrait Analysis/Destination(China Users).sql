SELECT language, country_destination, COUNT(country_destination) AS cd_num
FROM data.train_users
GROUP BY language, country_destination
HAVING language = 'zh'
ORDER BY cd_num DESC;