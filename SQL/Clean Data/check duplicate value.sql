SELECT id, COUNT(id) AS count_id
FROM data.train_users
GROUP BY id
HAVING count_id > 1;