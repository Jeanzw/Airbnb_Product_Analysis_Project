SELECT age, COUNT(id)
FROM data.train_users
GROUP BY age
HAVING age <> 0
ORDER BY age;