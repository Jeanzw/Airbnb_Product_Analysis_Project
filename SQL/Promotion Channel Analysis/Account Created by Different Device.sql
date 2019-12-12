SELECT first_device_type, COUNT(id) AS fdt_num
FROM data.train_users
GROUP BY first_device_type
ORDER BY fdt_num DESC;