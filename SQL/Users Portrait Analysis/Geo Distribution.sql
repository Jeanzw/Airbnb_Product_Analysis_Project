SELECT language, COUNT(language) AS lg_num
FROM data.train_users
GROUP BY language
ORDER BY lg_num;