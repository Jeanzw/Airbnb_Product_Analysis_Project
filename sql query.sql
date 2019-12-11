##clean data
#check duplicate value
SELECT id, COUNT(id) AS count_id
FROM data.train_users
GROUP BY id
HAVING count_id > 1;

#check missing value count
SELECT date_first_booking, COUNT(date_first_booking)
FROM data.train_users
WHERE date_first_booking = '0000-00-00 00:00:00';

#check whether max or min value is normal
SELECT  min(age),max(age) FROM data.train_users;

#abnormal value: delte users whose age not between 7 and 75 and set them as 0
SET sql_safe_updates = 1;
UPDATE data.train_users
SET age = 0
WHERE id NOT IN (
		SELECT id
		FROM (
			SELECT id
			FROM data.train_users
			WHERE age <= 75
				AND age >= 7
		) a
	);






##users portrait 
#female ratio
SELECT COUNT(id) AS '女性用户数量'
FROM data.train_users
WHERE gender = 'FEMALE';

#male ratio
SELECT COUNT(id) AS '男性用户数量'
FROM data.train_users
WHERE gender = 'MALE';

#age distribution
SELECT age, COUNT(id)
FROM data.train_users
GROUP BY age
HAVING age <> 0
ORDER BY age;

#geo distribution
SELECT language, COUNT(language) AS lg_num
FROM data.train_users
GROUP BY language
ORDER BY lg_num;

#destination(china users)
SELECT language, country_destination, COUNT(country_destination) AS cd_num
FROM data.train_users
GROUP BY language, country_destination
HAVING language = 'zh'
ORDER BY cd_num DESC;







##channel analysis
#date_account_created 
SELECT date_format(date_account_created, '%Y-%M') AS year_moth, COUNT(id)
FROM data.train_users
GROUP BY date_format(date_account_created, '%Y-%M')
ORDER BY year_moth;

#account_created by different first_device_type 
SELECT first_device_type, COUNT(id) AS fdt_num
FROM data.train_users
GROUP BY first_device_type
ORDER BY fdt_num DESC;

#account_created through different promotion and channel
SELECT affiliate_channel, affiliate_provider, COUNT(id) AS ac_num
FROM data.train_users
GROUP BY affiliate_channel, affiliate_provider
ORDER BY ac_num DESC;

#conversion rate of different promotion and channel
SELECT affiliate_channel, affiliate_provider, 
SUM(CASE WHEN date_first_booking <> '0000-00-00 00:00:00' THEN 1 ELSE 0 END) / COUNT(id) AS ac_ratio
FROM data.train_users
GROUP BY affiliate_channel, affiliate_provider
ORDER BY ac_ratio DESC;

#account_created by different ad content 
SELECT first_affiliate_tracked, COUNT(id) AS fat_num
FROM data.train_users
GROUP BY first_affiliate_tracked
ORDER BY fat_num DESC;

#conversion rate by different ad content
SELECT first_affiliate_tracked, 
SUM(CASE WHEN date_first_booking <> '0000-00-00 00:00:00' THEN 1 ELSE 0 END) / COUNT(id) AS fat_ratio
FROM data.train_users
GROUP BY first_affiliate_tracked
ORDER BY fat_ratio DESC;





##funnel analysis
#total number of users
SELECT COUNT(*)  AS ‘用户总数量’
FROM (
	SELECT user_id
	FROM data.sessions
	GROUP BY user_id
) new_sessions;


#active users
SELECT COUNT(*)  AS ‘活跃用户总数量’
FROM (
	SELECT user_id
	FROM data.sessions
	GROUP BY user_id
	HAVING COUNT(user_id) >= 10
) active;

#number of account_created users
SELECT COUNT(*) AS ‘注册用户总数量’
FROM (
	SELECT user_id
	FROM data.sessions
	GROUP BY user_id
) new_sessions
	INNER JOIN data.train_users tu ON new_sessions.user_id = tu.id;

#reservations
SELECT COUNT(*) AS ‘下单用户总数量’
FROM (
	SELECT user_id
	FROM data.sessions
	WHERE action_detail = 'reservations'
	GROUP BY user_id
) booking;

#payment_instruments
SELECT COUNT(*) AS ‘实际支付用户总数量’
FROM (
	SELECT user_id
	FROM data.sessions
	WHERE action_detail = 'payment_instruments'
	GROUP BY user_id
) payed;

#repurchase:payment_instruments > 1
SELECT COUNT(*) AS ‘复购支付用户总数量’
FROM (
	SELECT user_id
	FROM data.sessions
	WHERE action_detail = 'reservations'
	GROUP BY user_id
	HAVING COUNT(user_id) >= 2
) re_booking;
