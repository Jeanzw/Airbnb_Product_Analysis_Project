SELECT date_first_booking, COUNT(date_first_booking)
FROM data.train_users
WHERE date_first_booking = '0000-00-00 00:00:00';