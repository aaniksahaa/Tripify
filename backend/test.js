sql += "INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'aaniksahaa', 'abc@gmail.com', MY_HASH_PASSWORD('123'), 'client', 'Anik Saha', 'Little Coder', 1, 'facebook.com/abc', 'twitter.com/abc', 'instagram.com/abc', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"

sql += "INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'jab3r', 'xyz@gmail.com', MY_HASH_PASSWORD('456'), 'client', 'Jaber Ahmed Deeder', 'Pro Coder', 1, 'facebook.com/xyz', 'twitter.com/xyz', 'instagram.com/xyz', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"