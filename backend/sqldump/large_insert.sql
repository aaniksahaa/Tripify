
---Deleting previous entries...

DELETE FROM Users;
DELETE FROM Guides;
DELETE FROM Cities;
DELETE FROM Destinations;
DELETE FROM Activities;
DELETE FROM Hotels;
DELETE FROM Flights;
DELETE FROM Restaurants;
DELETE FROM Flights;
DELETE FROM Provides;
DELETE FROM Trips;
DELETE FROM Reviews;

-- Insert Dummy City for inserting Admin

INSERT INTO Cities (city_id, name, country_name, population, weather_type) VALUES (0, 'Dummy', 'Dummy', 0, 'sunny');

-- Insert Global Admin User ( user_id = 0 )

INSERT INTO Users ( user_id, username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 0, 'admin', 'admin@gmail.com', 'admin', 'admin', 'Oppenheimer', 'I am from Andromida', 0, 'facebook.com/opp', 'twitter.com/opp', 'instagram.com/opp', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );

---Cities

INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Dhaka', 'Bangladesh', 168957745, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Chittagong', 'Bangladesh', 28607074, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Khulna', 'Bangladesh', 15563000, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Rajshahi', 'Bangladesh', 9536714, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Comilla', 'Bangladesh', 22142000, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Mymensingh', 'Bangladesh', 22058771, 'cold');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Rangpur', 'Bangladesh', 2901390, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Sylhet', 'Bangladesh', 3482659, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Barisal', 'Bangladesh', 3393084, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Narayanganj', 'Bangladesh', 2200000, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Gazipur', 'Bangladesh', 1997510, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Narsingdi', 'Bangladesh', 705768, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Bogra', 'Bangladesh', 791382, 'cold');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Pabna', 'Bangladesh', 389918, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Bandarban', 'Bangladesh', 275265, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Jessore', 'Bangladesh', 237478, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Dinajpur', 'Bangladesh', 204874, 'cold');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Naogaon', 'Bangladesh', 151398, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Tangail', 'Bangladesh', 160937, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Netrokona', 'Bangladesh', 229752, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Noakhali', 'Bangladesh', 160242, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Narsingdi', 'Bangladesh', 705768, 'cold');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Faridpur', 'Bangladesh', 114277, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Bandarban', 'Bangladesh', 126379, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Bhola', 'Bangladesh', 183113, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Manikganj', 'Bangladesh', 160093, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Coxs Bazar', 'Bangladesh', 249000, 'sunny');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Rangamati', 'Bangladesh', 3482659, 'cold');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Tangail', 'Bangladesh', 160937, 'rainy');
INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('Chandpur', 'Bangladesh', 115000, 'rainy');

---Users

INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'aaniksahaa', 'abc@gmail.com', MY_HASH_PASSWORD('123'), 'client', 'Anik Saha', 'Little Coder', 1, 'facebook.com/abc', 'twitter.com/abc', 'instagram.com/abc', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );
INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'jab3r', 'xyz@gmail.com', MY_HASH_PASSWORD('456'), 'client', 'Jaber Ahmed Deeder', 'Pro Coder', 1, 'facebook.com/xyz', 'twitter.com/xyz', 'instagram.com/xyz', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );


INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'shabnam_rahman', 'shabnam_rahman@yahoo.com', MY_HASH_PASSWORD('Ld1bNOOX7GB'), 'Shabnam Rahman', 3 , TO_DATE('1997-09-15','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'rashid.haque', 'rashid.haque@gmail.com', MY_HASH_PASSWORD('gkSwVfvT'), 'Rashid Haque', 16 , TO_DATE('1994-03-17','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'asif.ali', 'asif.ali@gmail.com', MY_HASH_PASSWORD('3oARHXJre4'), 'Asif Ali', 13 , TO_DATE('1977-01-08','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'sumaiya_islam', 'sumaiya_islam@yahoo.com', MY_HASH_PASSWORD('TndVym1b'), 'Sumaiya Islam', 25 , TO_DATE('1966-03-28','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'sanjida.haque', 'sanjida.haque@yahoo.com', MY_HASH_PASSWORD('CkbDXFDT'), 'Sanjida Haque', 7 , TO_DATE('1992-09-16','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'amina.begum', 'amina.begum@yahoo.com', MY_HASH_PASSWORD('jemMSk3vtPY'), 'Amina Begum', 21 , TO_DATE('1999-09-19','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'sharmin_sultana', 'sharmin_sultana@gmail.com', MY_HASH_PASSWORD('rY4D6o78K7PA'), 'Sharmin Sultana', 1 , TO_DATE('1946-08-18','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'arif_khanom', 'arif_khanom@gmail.com', MY_HASH_PASSWORD('iPWaKrv7j'), 'Arif Khanom', 16 , TO_DATE('1981-10-18','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'sanjida.nasrin', 'sanjida.nasrin@yahoo.com', MY_HASH_PASSWORD('zO86JIK0r'), 'Sanjida Nasrin', 14 , TO_DATE('1961-05-11','YYYY-MM-DD'));
INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( 'tasnim_haque', 'tasnim_haque@yahoo.com', MY_HASH_PASSWORD('xkNft5f0'), 'Tasnim Haque', 30 , TO_DATE('1984-01-14','YYYY-MM-DD'));

---Guides

INSERT INTO Guides (user_id) VALUES (1);
INSERT INTO Guides (user_id) VALUES (2);

---Destinations

INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Ahsan Manzil', 'Bangsha Road, Old Dhaka', 1, 23.7104, 90.4074, 'Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Coxs Bazar', 'Coxs Bazar, Chittagong', 2, 21.4272, 92.0058, 'Coxs Bazar is the longest sea beach in the world, located in southeastern Bangladesh.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sundarbans Mangrove Forest', 'Sundarbans, Khulna', 3, 21.9497, 89.1833, 'The Sundarbans is the largest mangrove forest and a UNESCO World Heritage Site.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Srimangal', 'Srimangal, Sylhet', 8, 24.3133, 91.7258, 'Srimangal is known as the Tea Capital of Bangladesh and offers beautiful tea gardens.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Saint Martins Island', 'Saint Martins Island, Coxs Bazar', 2, 20.5951, 92.3186, 'Saint Martins Island is a popular tourist destination known for its pristine beaches.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sajek Valley', 'Sajek Valley, Rangamati', 28, 23.3999, 92.2932, 'Sajek Valley is a picturesque hill station with breathtaking views of the hills and clouds.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Lalbagh Fort', 'Lalbagh, Old Dhaka', 1, 23.7162, 90.4071, 'Lalbagh Fort is a Mughal fort complex with historical significance in Dhaka.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Kuakata', 'Kuakata, Patuakhali', 9, 21.8333, 90.1167, 'Kuakata is known for its beautiful beach and stunning views of both sunrise and sunset.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Ratargul Swamp Forest', 'Ratargul, Sylhet', 8, 24.3821, 90.9055, 'Ratargul Swamp Forest is a freshwater swamp forest and a great place for nature lovers.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Jaflong', 'Jaflong, Sylhet', 8, 25.1473, 92.2659, 'Jaflong is famous for its tea gardens, hills, and the Dawki River with crystal-clear water.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Rangamati Hill Tracts', 'Rangamati, Chittagong Hill Tracts', 28, 22.6503, 92.1645, 'Rangamati is a scenic hill district with beautiful lakes and tribal cultural diversity.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Jamuna Future Park', 'Kuril, Dhaka', 1, 23.8166, 90.4232, 'Jamuna Future Park is the largest shopping mall in South Asia, located in Dhaka.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Lalbagh Kella Mosque', 'Lalbagh, Old Dhaka', 1, 23.7176, 90.4041, 'Lalbagh Kella Mosque is an ancient mosque within the premises of Lalbagh Fort.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sagor Dighi', 'Rajshahi City', 4, 24.3668, 88.6091, 'Sagor Dighi is a large pond in Rajshahi city known for its historical significance.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Ruposhi Bangla Hotel', 'Shahbagh, Dhaka', 1, 23.7345, 90.3918, 'Ruposhi Bangla Hotel is a renowned five-star hotel in the heart of Dhaka city.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Rangpur Museum', 'Rangpur City', 7, 25.7555, 89.2445, 'Rangpur Museum is a museum with historical artifacts and cultural displays.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bangabandhu Sheikh Mujibur Rahman Novo Theatre', 'Shahbagh, Dhaka', 1, 23.7379, 90.3903, 'Novo Theatre is a planetarium and science museum dedicated to Bangabandhu Sheikh Mujibur Rahman.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Shah Amanat Bridge', 'Chittagong City', 2, 22.3077, 91.8125, 'Shah Amanat Bridge is a landmark bridge over the Karnaphuli River in Chittagong.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Coxs Bazar Marine Aquarium', 'Coxs Bazar, Chittagong', 2, 21.432, 92.0141, 'Coxs Bazar Marine Aquarium is an aquarium showcasing marine life and biodiversity.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sundarbans Tiger Reserve', 'Sundarbans, Khulna', 3, 21.9495, 88.9051, 'The Sundarbans Tiger Reserve is a protected area for the critically endangered Bengal tiger.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Inani Beach', 'Coxs Bazar, Chittagong', 2, 21.4225, 92.0093, 'Inani Beach is one of the most popular and longest sea beaches in the world.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Kaptai Lake', 'Kaptai, Rangamati', 28, 22.73, 92.2189, 'Kaptai Lake is the largest man-made lake in Bangladesh and offers scenic boat trips.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Shalban Vihara', 'Mainamati, Comilla', 5, 23.4642, 91.1155, 'Shalban Vihara is an ancient archaeological site with Buddhist stupas and monasteries.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Ratargul Swamp Forest', 'Ratargul, Sylhet', 8, 24.3821, 90.9055, 'Ratargul Swamp Forest is a freshwater swamp forest and a great place for nature lovers.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Kuakata Sea Beach', 'Kuakata, Patuakhali', 9, 21.8333, 90.1167, 'Kuakata Sea Beach is known for its stunning sunrise and sunset views over the Bay of Bengal.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sundarbans National Park', 'Sundarbans, Khulna', 3, 21.9497, 88.9051, 'Sundarbans National Park is a UNESCO World Heritage Site known for its Bengal tigers and mangrove forests.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Saint Martins Island', 'Saint Martins Island, Coxs Bazar', 2, 20.5951, 92.3186, 'Saint Martins Island is a popular tourist destination known for its pristine beaches.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Lawachara National Park', 'Moulvibazar, Sylhet', 8, 24.4743, 91.5958, 'Lawachara National Park is a wildlife sanctuary known for its hoolock gibbons and rich biodiversity.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Rangamati Hanging Bridge', 'Rangamati, Chittagong Hill Tracts', 28, 22.6335, 92.1919, 'Rangamati Hanging Bridge offers stunning views of the Kaptai Lake and surrounding hills.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Kantaji Temple', 'Dinajpur City', 17, 25.6281, 88.6348, 'Kantaji Temple is a terracotta Hindu temple and one of the finest examples of Bengal architecture.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Mahasthangarh', 'Bogra City', 13, 24.8, 89.3167, 'Mahasthangarh is an ancient archaeological site with ruins of ancient civilizations.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Nilgiri Hills', 'Bandarban Hill District', 15, 21.7787, 92.2837, 'Nilgiri Hills is a popular hill station offering panoramic views of the surrounding landscape.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bichanakandi', 'Sylhet', 8, 25.0711, 92.1731, 'Bisnakandi is a scenic spot known for its crystal-clear water and surrounding hills.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sundarbans Wildlife Sanctuary', 'Sundarbans, Khulna', 3, 21.9497, 89.1833, 'Sundarbans Wildlife Sanctuary is a protected area for various endangered species.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Jatiya Sangsad Bhaban', 'Sher-e-Bangla Nagar, Dhaka', 1, 23.7861, 90.4086, 'Jatiya Sangsad Bhaban is the National Parliament House of Bangladesh with modern architectural design.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Biswakosh Bhaban', 'Agargaon, Dhaka', 1, 23.7877, 90.3637, 'Biswakosh Bhaban is the Bangladesh National Encyclopedia building, known for its unique design.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sonargaon', 'Narayanganj', 10, 23.6146, 90.5606, 'Sonargaon is an ancient historic city with ruins of palaces, mosques, and museums.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Birishiri', 'Birishiri, Netrokona', 20, 24.9098, 90.7312, 'Birishiri is a beautiful hilly area with the picturesque Someshwari River and blue hills.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bangladesh National Museum', 'Shahbagh, Dhaka', 1, 23.729, 90.4043, 'Bangladesh National Museum is the largest and oldest museum in Bangladesh with diverse exhibits.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Chittagong Ethnological Museum', 'Chittagong City', 2, 22.3593, 91.8327, 'Chittagong Ethnological Museum showcases the lifestyle and culture of various ethnic groups in Bangladesh.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Kantajew Temple', 'Dinajpur City', 17, 25.6472, 88.6485, 'Kantajew Temple is a stunning terracotta Hindu temple known for its intricate artwork.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Srimangal Tea Gardens', 'Srimangal, Sylhet', 8, 24.3056, 91.7121, 'Srimangal is renowned for its lush tea gardens and offers scenic views for nature enthusiasts.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Nijhum Dwip', 'Noakhali', 21, 22.1587, 91.9827, 'Nijhum Dwip is an isolated island with diverse wildlife and serene natural beauty.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Mainamati Ruins', 'Mainamati, Comilla', 5, 23.4486, 91.1319, 'Mainamati Ruins is an archaeological site with ancient Buddhist stupas and structures.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Chera Dwip', 'Coxs Bazar, Chittagong', 2, 21.4072, 92.1095, 'Chera Dwip is an untouched island offering a peaceful retreat and scenic beauty.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Sompur Mahabihar', 'Paharpur, Naogaon', 18, 25.0126, 88.9649, 'Sompur Mahabihar is an ancient Buddhist monastery and UNESCO World Heritage Site.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Lalmai Hills', 'Comilla', 5, 23.4041, 91.1555, 'Lalmai Hills offer hiking opportunities and archaeological sites dating back to the 8th century.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Kaptai National Park', 'Kaptai, Rangamati', 28, 22.7455, 92.3142, 'Kaptai National Park is a wildlife reserve with diverse flora and fauna.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Baklai Waterfall', 'Bandarban Hill District', 24, 21.9641, 92.4188, 'Baklai Waterfall is a picturesque waterfall surrounded by lush greenery.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Ramsagar National Park', 'Dinajpur', 17, 25.7775, 89.0993, 'Ramsagar National Park is a lake and park with historical significance.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Ishwardi Upazila', 'Pabna', 14, 24.1303, 89.0413, 'Ishwardi Upazila is known for its agricultural landscapes and historical sites.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Charanpur Reserve Forest', 'Pabna', 14, 24.0191, 89.2229, 'Charanpur Reserve Forest offers rich biodiversity and is a great place for nature lovers.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Shilaidaha Kuthibari', 'Kusumgram, Pabna', 14, 24.0133, 89.2392, 'Shilaidaha Kuthibari is a historic house where Nobel Laureate Rabindranath Tagore stayed.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bangabandhu Bridge', 'Shahjadpur, Sirajganj', 6, 24.7899, 89.4807, 'Bangabandhu Bridge is the 6th longest bridge in South Asia and a significant landmark.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bir Muktijoddha Sirajul Islam Public Library', 'Mymensingh', 6, 24.7564, 90.4027, 'Bir Muktijoddha Sirajul Islam Public Library is a renowned library with historical documents.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Shambhuganj Upazila', 'Mymensingh', 6, 25.0805, 90.5773, 'Shambhuganj Upazila is known for its tranquil atmosphere and lush greenery.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bhawal National Park', 'Gazipur', 11, 24.063, 90.3875, 'Bhawal National Park is a nature reserve with diverse flora and fauna.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Chandni Ghat', 'Gazipur', 11, 23.9952, 90.4989, 'Chandni Ghat is a serene riverfront spot offering picturesque views of the river.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Fantasy Kingdom', 'Sukundi, Gazipur', 11, 24.0902, 90.4185, 'Fantasy Kingdom is a popular amusement park with various fun rides and entertainment.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bheramara Upazila', 'Jessore', 16, 23.9592, 89.2305, 'Bheramara Upazila is known for its rural beauty and traditional culture.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Shaheed Minar, Jessore', 'Jessore', 16, 23.1625, 89.2071, 'Shaheed Minar in Jessore is a monument dedicated to the language movement martyrs.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Jadu Nibash Palace', 'Jessore', 16, 23.1365, 89.2108, 'Jadu Nibash Palace is a historical palace with architectural significance.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Jamuna Future Park, Tangail', 'Tangail', 19, 24.2767, 89.9638, 'Jamuna Future Park in Tangail is a large shopping and entertainment complex.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Birulia Bridge', 'Tangail', 19, 24.3787, 89.9687, 'Birulia Bridge is an old iron bridge offering views of the river and surrounding landscapes.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Zia Park', 'Tangail', 19, 24.2409, 90.0093, 'Zia Park is a recreational park with greenery and various leisure activities.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Bhairab Upazila', 'Narsingdi', 12, 23.9042, 90.7359, 'Bhairab Upazila is known for its cultural heritage and ancient sites.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Narsingdi Town Hall', 'Narsingdi', 12, 23.9324, 90.7277, 'Narsingdi Town Hall is a significant architectural landmark in the town center.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Meghna River', 'Narsingdi', 12, 23.6195, 90.706, 'The Meghna River offers boat rides and scenic views of the surrounding landscapes.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Fulkuri River View', 'Faridpur', 23, 23.3784, 89.8509, 'Fulkuri River View offers stunning views of the river and surrounding landscapes.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Charbhadrasan Bridge', 'Faridpur', 23, 23.3772, 89.6912, 'Charbhadrasan Bridge is a picturesque bridge over a serene waterway.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Charvadrason Zamindar Bari', 'Faridpur', 23, 23.5023, 89.8973, 'Charvadrason Zamindar Bari is a historical mansion with rich heritage and cultural value.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Dhalchar', 'Bhola', 25, 22.2145, 90.1194, 'Dhalchar is a river island known for its scenic beauty and tranquility.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Monpura Island', 'Bhola', 25, 22.1788, 90.2172, 'Monpura Island is a remote island with beautiful beaches and serene atmosphere.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Char Kukri-Mukri', 'Bhola', 25, 22.3195, 90.2405, 'Char Kukri-Mukri is a sandbar with crystal-clear water and stunning views.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Atiya Jami Mosque', 'Manikganj', 26, 23.8644, 89.9569, 'Atiya Jami Mosque is a historical mosque with intricate terracotta artwork.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Elenga Resort', 'Elenga, Manikganj', 26, 24.0765, 89.7355, 'Elenga Resort is a popular resort with swimming pools and recreational facilities.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Manikganj Museum', 'Manikganj', 26, 23.8636, 89.9624, 'Manikganj Museum exhibits artifacts showcasing the regions cultural heritage.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Hajiganj Fort', 'Hajiganj, Chandpur', 30, 23.1477, 90.7314, 'Hajiganj Fort is a historic Mughal fort with ancient ruins and architectural charm.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Lohagara Upazila', 'Chandpur', 30, 23.0915, 90.6707, 'Lohagara Upazila is known for its serene landscape and peaceful environment.', 'dummy.jpg');
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('Chandpur Shilpakala Academy', 'Chandpur', 30, 23.2287, 90.6514, 'Chandpur Shilpakala Academy promotes local arts and culture through various events.', 'dummy.jpg');

---Activities

INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Boat Tour', 'Adventure', 'Experience the breathtaking beauty of a boat tour in a mangrove forest.', 'boat_tour.jpg', 8, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Hiking', 'Adventure', 'Embark on a thrilling hiking adventure amidst picturesque hills.', 'hiking.jpg', 12, 55);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Snorkeling', 'Adventure', 'Discover the underwater world and vibrant marine life through snorkeling.', 'snorkeling.jpg', 10, 50);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Cultural Tour', 'Culture', 'Immerse in the local culture and traditions with a guided cultural tour.', 'cultural_tour.jpg', 15, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Historical Sites Visit', 'Culture', 'Explore ancient historical sites and learn about their rich history.', 'historical_sites.jpg', 12, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Wildlife Safari', 'Adventure', 'Embark on a thrilling wildlife safari and spot exotic animals.', 'wildlife_safari.jpg', 18, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Nature Walks', 'Adventure', 'Take peaceful walks in nature and enjoy the tranquility it offers.', 'nature_walks.jpg', 8, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Beach Relaxation', 'Relaxation', 'Relax and unwind on the beautiful sandy beaches with crystal clear waters.', 'beach_relaxation.jpg', 5, 75);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Water Sports', 'Adventure', 'Indulge in various water sports activities like jet skiing, parasailing, and more.', 'water_sports.jpg', 16, 55);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Sunset Cruise', 'Adventure', 'Enjoy the mesmerizing view of the sunset while on a cruise.', 'sunset_cruise.jpg', 10, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Local Food Tasting', 'Cuisine', 'Taste a variety of delicious local dishes and savor the flavors.', 'local_food_tasting.jpg', 12, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Fishing Adventure', 'Adventure', 'Go on a fishing expedition and test your angling skills.', 'fishing_adventure.jpg', 10, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Art and Craft Workshop', 'Culture', 'Participate in traditional art and craft workshops and create unique souvenirs.', 'art_craft_workshop.jpg', 8, 75);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Mountain Biking', 'Adventure', 'Explore the rugged terrains on a mountain biking adventure.', 'mountain_biking.jpg', 18, 50);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Yoga Retreat', 'Relaxation', 'Rejuvenate your mind and body with a peaceful yoga retreat.', 'yoga_retreat.jpg', 20, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Hot Air Balloon Ride', 'Adventure', 'Experience the thrill of a hot air balloon ride with stunning aerial views.', 'hot_air_balloon_ride.jpg', 12, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Local Market Shopping', 'Cuisine', 'Explore the vibrant local markets and shop for unique handicrafts.', 'local_market_shopping.jpg', 8, 80);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Volunteer and Community Service', 'Culture', 'Contribute to the community by participating in volunteer activities.', 'volunteer_community_service.jpg', 18, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Kayaking Adventure', 'Adventure', 'Paddle through the adventurous waters on a kayaking expedition.', 'kayaking_adventure.jpg', 14, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Scuba Diving', 'Adventure', 'Dive into the ocean depths and explore the wonders of marine life.', 'scuba_diving.jpg', 16, 55);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Camping', 'Adventure', 'Experience the thrill of camping under the starry night sky.', 'camping.jpg', 12, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Cycling Tour', 'Adventure', 'Take a cycling tour and enjoy the scenic beauty at a leisurely pace.', 'cycling_tour.jpg', 16, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Underwater Exploration', 'Adventure', 'Dive into the mesmerizing underwater world and explore the vibrant marine life.', 'underwater_exploration.jpg', 18, 50);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Photography Tour', 'Adventure', 'Capture the scenic beauty of the destination on a photography tour.', 'photography_tour.jpg', 18, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('River Rafting', 'Adventure', 'Challenge the rapids of the river with an exciting rafting adventure.', 'river_rafting.jpg', 18, 50);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Cooking Classes', 'Cuisine', 'Learn to cook the local dishes from expert chefs in cooking classes.', 'cooking_classes.jpg', 12, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Helicopter Tour', 'Adventure', 'Get a birds eye view of the destination with an exciting helicopter tour.', 'helicopter_tour.jpg', 10, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Sailing Adventure', 'Adventure', 'Embark on a sailing adventure and explore the coastline from the sea.', 'sailing_adventure.jpg', 16, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Educational Visit to Museum', 'Education', 'Discover the art, history, and culture of the region in museums.', 'museum_visits.jpg', 8, 80);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Paragliding', 'Adventure', 'Experience the thrill of paragliding with an experienced pilot.', 'paragliding.jpg', 16, 55);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Fruit Picking', 'Cuisine', 'Enjoy the fun of picking fresh fruits and tasting them at orchards.', 'fruit_picking.jpg', 5, 75);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Zip Lining', 'Adventure', 'Feel the adrenaline rush with an exciting zip-lining adventure.', 'zip_lining.jpg', 12, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Gardens and Parks', 'Adventure', 'Relax and take a leisurely stroll in beautiful gardens and parks.', 'gardens_parks.jpg', 5, 80);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Cave Exploration', 'Adventure', 'Explore the mysterious caves and marvel at their natural beauty.', 'cave_exploration.jpg', 14, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Bird Watching', 'Adventure', 'Observe and identify various bird species in their natural habitats.', 'bird_watching.jpg', 10, 75);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Local Music and Dance', 'Culture', 'Experience the local music and dance performances showcasing traditions.', 'local_music_dance.jpg', 8, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Safaris', 'Adventure', 'Embark on thrilling safaris and encounter the diverse wildlife.', 'safaris.jpg', 18, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Festivals and Events', 'Culture', 'Participate in vibrant festivals and events celebrating local traditions.', 'festivals_events.jpg', 12, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Rock Climbing', 'Adventure', 'Conquer the rocks and cliffs with the thrill of rock climbing.', 'rock_climbing.jpg', 16, 50);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Spa and Wellness', 'Relaxation', 'Pamper yourself with rejuvenating spa treatments and wellness therapies.', 'spa_wellness.jpg', 18, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Desert Adventure', 'Adventure', 'Experience the desert life and go on thrilling desert safaris.', 'desert_adventure.jpg', 10, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Pottery Classes', 'Culture', 'Learn the traditional art of pottery-making from skilled artisans.', 'pottery_classes.jpg', 12, 75);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Sightseeing Tours', 'Adventure', 'Explore the famous landmarks and attractions on sightseeing tours.', 'sightseeing_tours.jpg', 8, 80);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Cultural Workshops', 'Culture', 'Engage in interactive cultural workshops and learn traditional skills.', 'cultural_workshops.jpg', 10, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Jet Skiing', 'Adventure', 'Feel the rush of adrenaline with an exciting jet skiing adventure.', 'jet_skiing.jpg', 16, 55);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Gastronomic Tour', 'Cuisine', 'Embark on a gastronomic tour and indulge in a variety of local cuisines.', 'gastronomic_tour.jpg', 12, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Archaeological Excavation', 'Culture', 'Participate in archaeological digs and uncover ancient artifacts.', 'archaeological_excavation.jpg', 18, 65);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Forest Trek', 'Adventure', 'Embark on a trekking expedition through lush forests and diverse wildlife.', 'forest_trek.jpg', 14, 60);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Cultural Performances', 'Culture', 'Witness captivating cultural performances showcasing local traditions.', 'cultural_performances.jpg', 8, 70);
INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('Hot Spring Baths', 'Relaxation', 'Relax in natural hot spring baths and experience the healing properties.', 'hot_spring_baths.jpg', 10, 75);

---Hotels

INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Sanctuary Hotel', '75 Riverfront Naogaon , Bangladesh', 18, 'A Magically Elegant hotel in Naogaon.', 'dummy.jpg', 3189, '019468914394', 'elegantsanctuaryhotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Lodge Hotel', '85 Lakeview Drive Chittagong , Bangladesh', 2, 'A Uniquely Elevated hotel in Chittagong.', 'dummy.jpg', 3263, '015996718898', 'quaintlodgehotel@outlook.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Villa Hotel', '92 Lakeview Drive Chandpur , Bangladesh', 30, 'A Exceptionally Rustic hotel in Chandpur.', 'dummy.jpg', 3758, '018255256415', 'cozyvillahotel@gmail.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Resort Hotel', '5 Mountain Street Bhola , Bangladesh', 25, 'A Serenely Quaint hotel in Bhola.', 'dummy.jpg', 1648, '017135227931', 'rusticresorthotel@gmail.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Oasis Hotel', '53 Mountain Street Chandpur , Bangladesh', 30, 'A Extravagantly Charming hotel in Chandpur.', 'dummy.jpg', 4523, '013637391093', 'boutiqueoasishotel@gmail.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Spectacular Palace Hotel', '64 Lakeview Drive Bandarban , Bangladesh', 15, 'A Exceptionally Elevated hotel in Bandarban.', 'dummy.jpg', 4544, '016003332988', 'spectacularpalacehotel@yahoo.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Cottage Hotel', '66 Park Avenue Chandpur , Bangladesh', 30, 'A Wonderfully Luxurious hotel in Chandpur.', 'dummy.jpg', 4203, '012705117309', 'gloriouscottagehotel@gmail.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Oasis Hotel', '76 Ocean Drive Tangail , Bangladesh', 29, 'A Enchantingly Luxurious hotel in Tangail.', 'dummy.jpg', 2218, '013454493901', 'quaintoasishotel@outlook.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Resort Hotel', '47 Riverfront Noakhali , Bangladesh', 21, 'A Extravagantly Charming hotel in Noakhali.', 'dummy.jpg', 1931, '019056438928', 'luxuriousresorthotel@outlook.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Hideaway Hotel', '9 Sunset Boulevard Dinajpur , Bangladesh', 17, 'A Magically Elevated hotel in Dinajpur.', 'dummy.jpg', 3764, '017758683589', 'rustichideawayhotel@yahoo.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Hideaway Hotel', '75 Sunset Boulevard Bandarban , Bangladesh', 15, 'A Exceptionally Rustic hotel in Bandarban.', 'dummy.jpg', 4351, '013985256789', 'charminghideawayhotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Oasis Hotel', '70 Sunset Boulevard Khulna , Bangladesh', 3, 'A Wonderfully Spectacular hotel in Khulna.', 'dummy.jpg', 3289, '011605739425', 'gloriousoasishotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Inn Hotel', '21 Mountain Street Noakhali , Bangladesh', 21, 'A Exceptionally Elevated hotel in Noakhali.', 'dummy.jpg', 3372, '015978166723', 'moderninnhotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Sanctuary Hotel', '70 Ocean Drive Khulna , Bangladesh', 3, 'A Extravagantly Elevated hotel in Khulna.', 'dummy.jpg', 3196, '015319023368', 'rusticsanctuaryhotel@yahoo.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Cottage Hotel', '41 Riverfront Barisal , Bangladesh', 9, 'A Exceptionally Luxurious hotel in Barisal.', 'dummy.jpg', 3296, '013623796017', 'boutiquecottagehotel@outlook.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Villa Hotel', '72 Beach Road Rangpur , Bangladesh', 7, 'A Exquisitely Quaint hotel in Rangpur.', 'dummy.jpg', 1337, '018419385998', 'rusticvillahotel@outlook.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Oasis Hotel', '78 Garden Lane Naogaon , Bangladesh', 18, 'A Gracefully Charming hotel in Naogaon.', 'dummy.jpg', 4316, '012971308308', 'cozyoasishotel@gmail.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Seaside Palace Hotel', '29 Harbor View Faridpur , Bangladesh', 23, 'A Extravagantly Elevated hotel in Faridpur.', 'dummy.jpg', 3054, '018163364083', 'seasidepalacehotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Hideaway Hotel', '97 Park Avenue Coxs Bazar , Bangladesh', 27, 'A Uniquely Elevated hotel in Coxs Bazar.', 'dummy.jpg', 4467, '016618179081', 'glorioushideawayhotel@yahoo.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Sanctuary Hotel', '41 Beach Road Dhaka , Bangladesh', 1, 'A Exceptionally Boutique hotel in Dhaka.', 'dummy.jpg', 2936, '014602587421', 'luxurioussanctuaryhotel@yahoo.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elevated Inn Hotel', '28 Main Street Bandarban , Bangladesh', 24, 'A Exceptionally Cozy hotel in Bandarban.', 'dummy.jpg', 2662, '014596756011', 'elevatedinnhotel@gmail.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Castle Hotel', '65 Lakeview Drive Narayanganj , Bangladesh', 10, 'A Magically Rustic hotel in Narayanganj.', 'dummy.jpg', 4242, '015557751540', 'rusticcastlehotel@yahoo.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Villa Hotel', '72 Sunset Boulevard Bhola , Bangladesh', 25, 'A Exceptionally Charming hotel in Bhola.', 'dummy.jpg', 3798, '014739591332', 'modernvillahotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elevated Villa Hotel', '44 Garden Lane Faridpur , Bangladesh', 23, 'A Magically Modern hotel in Faridpur.', 'dummy.jpg', 2855, '011713196576', 'elevatedvillahotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Inn Hotel', '14 Lakeview Drive Chandpur , Bangladesh', 30, 'A Magically Glorious hotel in Chandpur.', 'dummy.jpg', 3723, '013353169899', 'moderninnhotel@gmail.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Spectacular Oasis Hotel', '81 Ocean Drive Coxs Bazar , Bangladesh', 27, 'A Extravagantly Boutique hotel in Coxs Bazar.', 'dummy.jpg', 3085, '011451767087', 'spectacularoasishotel@gmail.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Inn Hotel', '70 Mountain Street Narayanganj , Bangladesh', 10, 'A Exquisitely Luxurious hotel in Narayanganj.', 'dummy.jpg', 1747, '016116919546', 'elegantinnhotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Palace Hotel', '4 Mountain Street Dhaka , Bangladesh', 1, 'A Magically Charming hotel in Dhaka.', 'dummy.jpg', 4073, '015427796846', 'boutiquepalacehotel@gmail.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Palace Hotel', '40 Garden Lane Bhola , Bangladesh', 25, 'A Exceptionally Luxurious hotel in Bhola.', 'dummy.jpg', 4933, '013482379939', 'gloriouspalacehotel@yahoo.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Spectacular Manor Hotel', '93 Main Street Chandpur , Bangladesh', 30, 'A Gracefully Cozy hotel in Chandpur.', 'dummy.jpg', 1700, '019122084055', 'spectacularmanorhotel@yahoo.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Mansion Hotel', '96 Park Avenue Bandarban , Bangladesh', 15, 'A Uniquely Cozy hotel in Bandarban.', 'dummy.jpg', 1223, '016243895280', 'gloriousmansionhotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Retreat Hotel', '44 Mountain Street Comilla , Bangladesh', 5, 'A Enchantingly Spectacular hotel in Comilla.', 'dummy.jpg', 2696, '019238135184', 'gloriousretreathotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Oasis Hotel', '29 Sunset Boulevard Sylhet , Bangladesh', 8, 'A Majestically Cozy hotel in Sylhet.', 'dummy.jpg', 1526, '018155093336', 'modernoasishotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Oasis Hotel', '78 Garden Lane Rajshahi , Bangladesh', 4, 'A Exquisitely Boutique hotel in Rajshahi.', 'dummy.jpg', 4342, '015534666833', 'rusticoasishotel@yahoo.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Lodge Hotel', '35 Riverfront Sylhet , Bangladesh', 8, 'A Serenely Elevated hotel in Sylhet.', 'dummy.jpg', 831, '013869612113', 'quaintlodgehotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Seaside Hideaway Hotel', '2 Garden Lane Bandarban , Bangladesh', 15, 'A Exceptionally Elegant hotel in Bandarban.', 'dummy.jpg', 4258, '013114591448', 'seasidehideawayhotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Sanctuary Hotel', '75 Beach Road Narsingdi , Bangladesh', 12, 'A Extravagantly Elegant hotel in Narsingdi.', 'dummy.jpg', 3476, '014372927381', 'quaintsanctuaryhotel@gmail.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Cottage Hotel', '76 Sunset Boulevard Netrokona , Bangladesh', 20, 'A Extravagantly Cozy hotel in Netrokona.', 'dummy.jpg', 3864, '012824119593', 'cozycottagehotel@outlook.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Castle Hotel', '30 Harbor View Tangail , Bangladesh', 29, 'A Exceptionally Rustic hotel in Tangail.', 'dummy.jpg', 2491, '013196298686', 'quaintcastlehotel@gmail.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Manor Hotel', '48 Garden Lane Gazipur , Bangladesh', 11, 'A Exquisitely Rustic hotel in Gazipur.', 'dummy.jpg', 3777, '017311613495', 'luxuriousmanorhotel@yahoo.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Manor Hotel', '84 Mountain Street Rangamati , Bangladesh', 28, 'A Majestically Elegant hotel in Rangamati.', 'dummy.jpg', 2684, '017729316987', 'quaintmanorhotel@outlook.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Hideaway Hotel', '55 Beach Road Bhola , Bangladesh', 25, 'A Serenely Boutique hotel in Bhola.', 'dummy.jpg', 932, '012313831981', 'charminghideawayhotel@yahoo.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Inn Hotel', '78 Harbor View Khulna , Bangladesh', 3, 'A Exceptionally Quaint hotel in Khulna.', 'dummy.jpg', 3621, '011545066207', 'charminginnhotel@gmail.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Oasis Hotel', '57 Sunset Boulevard Manikganj , Bangladesh', 26, 'A Enchantingly Cozy hotel in Manikganj.', 'dummy.jpg', 3428, '014498964239', 'rusticoasishotel@yahoo.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Oasis Hotel', '62 Harbor View Narayanganj , Bangladesh', 10, 'A Gracefully Spectacular hotel in Narayanganj.', 'dummy.jpg', 2294, '018566396771', 'boutiqueoasishotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Inn Hotel', '6 Main Street Coxs Bazar , Bangladesh', 27, 'A Exquisitely Glorious hotel in Coxs Bazar.', 'dummy.jpg', 2196, '015315629083', 'boutiqueinnhotel@gmail.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Cottage Hotel', '94 Lakeview Drive Rajshahi , Bangladesh', 4, 'A Gracefully Glorious hotel in Rajshahi.', 'dummy.jpg', 4869, '019227376381', 'cozycottagehotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Hideaway Hotel', '69 Beach Road Coxs Bazar , Bangladesh', 27, 'A Serenely Rustic hotel in Coxs Bazar.', 'dummy.jpg', 4874, '013363838950', 'quainthideawayhotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Oasis Hotel', '82 Sunset Boulevard Mymensingh , Bangladesh', 6, 'A Majestically Rustic hotel in Mymensingh.', 'dummy.jpg', 2933, '012188748918', 'cozyoasishotel@outlook.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Seaside Retreat Hotel', '83 Ocean Drive Naogaon , Bangladesh', 18, 'A Exceptionally Glorious hotel in Naogaon.', 'dummy.jpg', 2204, '019118145709', 'seasideretreathotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Oasis Hotel', '14 Ocean Drive Chandpur , Bangladesh', 30, 'A Serenely Boutique hotel in Chandpur.', 'dummy.jpg', 3855, '011222387287', 'rusticoasishotel@yahoo.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Oasis Hotel', '19 Park Avenue Chittagong , Bangladesh', 2, 'A Exceptionally Modern hotel in Chittagong.', 'dummy.jpg', 3249, '016819328551', 'charmingoasishotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Seaside Lodge Hotel', '96 Riverfront Dhaka , Bangladesh', 1, 'A Exceptionally Quaint hotel in Dhaka.', 'dummy.jpg', 4241, '017722237477', 'seasidelodgehotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Hideaway Hotel', '9 Garden Lane Chandpur , Bangladesh', 30, 'A Uniquely Cozy hotel in Chandpur.', 'dummy.jpg', 1046, '017587731617', 'boutiquehideawayhotel@outlook.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Resort Hotel', '38 Beach Road Tangail , Bangladesh', 29, 'A Extravagantly Boutique hotel in Tangail.', 'dummy.jpg', 4102, '016811029167', 'elegantresorthotel@outlook.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Manor Hotel', '32 Lakeview Drive Narsingdi , Bangladesh', 12, 'A Magically Seaside hotel in Narsingdi.', 'dummy.jpg', 4366, '013081861958', 'modernmanorhotel@yahoo.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Manor Hotel', '89 Harbor View Rangpur , Bangladesh', 7, 'A Uniquely Quaint hotel in Rangpur.', 'dummy.jpg', 2798, '016785692564', 'luxuriousmanorhotel@gmail.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Villa Hotel', '27 Garden Lane Coxs Bazar , Bangladesh', 27, 'A Magically Boutique hotel in Coxs Bazar.', 'dummy.jpg', 1849, '017314982752', 'gloriousvillahotel@gmail.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elevated Manor Hotel', '69 Main Street Bandarban , Bangladesh', 24, 'A Gracefully Cozy hotel in Bandarban.', 'dummy.jpg', 2885, '015177709056', 'elevatedmanorhotel@yahoo.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Seaside Sanctuary Hotel', '94 Garden Lane Rangamati , Bangladesh', 28, 'A Serenely Charming hotel in Rangamati.', 'dummy.jpg', 1683, '014451764586', 'seasidesanctuaryhotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Castle Hotel', '89 Beach Road Faridpur , Bangladesh', 23, 'A Serenely Spectacular hotel in Faridpur.', 'dummy.jpg', 1821, '016232398114', 'quaintcastlehotel@yahoo.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Palace Hotel', '52 Ocean Drive Gazipur , Bangladesh', 11, 'A Majestically Quaint hotel in Gazipur.', 'dummy.jpg', 3351, '019159252527', 'boutiquepalacehotel@yahoo.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Lodge Hotel', '57 Park Avenue Bogra , Bangladesh', 13, 'A Extravagantly Modern hotel in Bogra.', 'dummy.jpg', 1000, '011926413427', 'quaintlodgehotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Hideaway Hotel', '46 Park Avenue Dinajpur , Bangladesh', 17, 'A Uniquely Seaside hotel in Dinajpur.', 'dummy.jpg', 4045, '012089666086', 'rustichideawayhotel@outlook.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Boutique Castle Hotel', '12 Main Street Dinajpur , Bangladesh', 17, 'A Extravagantly Rustic hotel in Dinajpur.', 'dummy.jpg', 1827, '019937734201', 'boutiquecastlehotel@outlook.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Hideaway Hotel', '1 Ocean Drive Jessore , Bangladesh', 16, 'A Wonderfully Boutique hotel in Jessore.', 'dummy.jpg', 1550, '016774451412', 'modernhideawayhotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Villa Hotel', '9 Ocean Drive Sylhet , Bangladesh', 8, 'A Majestically Boutique hotel in Sylhet.', 'dummy.jpg', 3033, '011179497865', 'rusticvillahotel@outlook.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Villa Hotel', '68 Main Street Bogra , Bangladesh', 13, 'A Exquisitely Glorious hotel in Bogra.', 'dummy.jpg', 2607, '013695211356', 'gloriousvillahotel@outlook.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Villa Hotel', '28 Park Avenue Manikganj , Bangladesh', 26, 'A Majestically Boutique hotel in Manikganj.', 'dummy.jpg', 4782, '019505551954', 'gloriousvillahotel@yahoo.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Palace Hotel', '14 Riverfront Manikganj , Bangladesh', 26, 'A Wonderfully Charming hotel in Manikganj.', 'dummy.jpg', 4139, '016049849911', 'gloriouspalacehotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Hideaway Hotel', '59 Sunset Boulevard Dinajpur , Bangladesh', 17, 'A Exquisitely Charming hotel in Dinajpur.', 'dummy.jpg', 2062, '011054061762', 'luxurioushideawayhotel@gmail.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Manor Hotel', '46 Harbor View Chittagong , Bangladesh', 2, 'A Wonderfully Cozy hotel in Chittagong.', 'dummy.jpg', 1772, '017969784042', 'luxuriousmanorhotel@outlook.com', 0, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Sanctuary Hotel', '58 Lakeview Drive Bandarban , Bangladesh', 24, 'A Exceptionally Cozy hotel in Bandarban.', 'dummy.jpg', 3216, '017858669426', 'quaintsanctuaryhotel@outlook.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Retreat Hotel', '92 Mountain Street Gazipur , Bangladesh', 11, 'A Gracefully Seaside hotel in Gazipur.', 'dummy.jpg', 2117, '015775181957', 'charmingretreathotel@gmail.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Resort Hotel', '67 Garden Lane Bogra , Bangladesh', 13, 'A Majestically Elevated hotel in Bogra.', 'dummy.jpg', 2197, '016316222313', 'cozyresorthotel@gmail.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Manor Hotel', '60 Garden Lane Narayanganj , Bangladesh', 10, 'A Serenely Elegant hotel in Narayanganj.', 'dummy.jpg', 4191, '013849438116', 'elegantmanorhotel@gmail.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Cottage Hotel', '15 Mountain Street Rajshahi , Bangladesh', 4, 'A Enchantingly Seaside hotel in Rajshahi.', 'dummy.jpg', 3496, '011323184650', 'cozycottagehotel@gmail.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Spectacular Castle Hotel', '8 Beach Road Coxs Bazar , Bangladesh', 27, 'A Extravagantly Boutique hotel in Coxs Bazar.', 'dummy.jpg', 4664, '014875468005', 'spectacularcastlehotel@gmail.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Cottage Hotel', '100 Beach Road Narsingdi , Bangladesh', 12, 'A Exquisitely Glorious hotel in Narsingdi.', 'dummy.jpg', 2848, '014855264618', 'quaintcottagehotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Seaside Oasis Hotel', '51 Riverfront Bhola , Bangladesh', 25, 'A Majestically Quaint hotel in Bhola.', 'dummy.jpg', 1729, '015397165718', 'seasideoasishotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Cottage Hotel', '17 Lakeview Drive Chittagong , Bangladesh', 2, 'A Wonderfully Quaint hotel in Chittagong.', 'dummy.jpg', 2705, '015815096505', 'quaintcottagehotel@yahoo.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Castle Hotel', '76 Mountain Street Jessore , Bangladesh', 16, 'A Gracefully Charming hotel in Jessore.', 'dummy.jpg', 4514, '016564332282', 'quaintcastlehotel@yahoo.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Inn Hotel', '78 Park Avenue Dinajpur , Bangladesh', 17, 'A Majestically Glorious hotel in Dinajpur.', 'dummy.jpg', 4180, '019221981690', 'luxuriousinnhotel@yahoo.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Lodge Hotel', '98 Mountain Street Rangamati , Bangladesh', 28, 'A Exceptionally Elevated hotel in Rangamati.', 'dummy.jpg', 4019, '017333842425', 'elegantlodgehotel@outlook.com', 0, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elevated Castle Hotel', '34 Main Street Chandpur , Bangladesh', 30, 'A Magically Quaint hotel in Chandpur.', 'dummy.jpg', 3013, '012479072098', 'elevatedcastlehotel@gmail.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Cozy Lodge Hotel', '27 Ocean Drive Rangamati , Bangladesh', 28, 'A Serenely Modern hotel in Rangamati.', 'dummy.jpg', 4287, '011613512807', 'cozylodgehotel@outlook.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elevated Palace Hotel', '39 Garden Lane Chittagong , Bangladesh', 2, 'A Wonderfully Boutique hotel in Chittagong.', 'dummy.jpg', 4763, '017822272577', 'elevatedpalacehotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Castle Hotel', '58 Sunset Boulevard Gazipur , Bangladesh', 11, 'A Extravagantly Elevated hotel in Gazipur.', 'dummy.jpg', 1042, '013521611304', 'charmingcastlehotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Lodge Hotel', '71 Harbor View Tangail , Bangladesh', 29, 'A Uniquely Rustic hotel in Tangail.', 'dummy.jpg', 1605, '014463606022', 'elegantlodgehotel@gmail.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Oasis Hotel', '88 Beach Road Tangail , Bangladesh', 29, 'A Exceptionally Spectacular hotel in Tangail.', 'dummy.jpg', 1292, '014361182991', 'charmingoasishotel@gmail.com', 0, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Rustic Inn Hotel', '24 Beach Road Dinajpur , Bangladesh', 17, 'A Serenely Elevated hotel in Dinajpur.', 'dummy.jpg', 806, '018478566715', 'rusticinnhotel@outlook.com', 1, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elegant Lodge Hotel', '26 Ocean Drive Naogaon , Bangladesh', 18, 'A Exquisitely Elevated hotel in Naogaon.', 'dummy.jpg', 4058, '019731964386', 'elegantlodgehotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Cottage Hotel', '90 Sunset Boulevard Narayanganj , Bangladesh', 10, 'A Exquisitely Charming hotel in Narayanganj.', 'dummy.jpg', 4189, '013056023750', 'moderncottagehotel@yahoo.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Glorious Castle Hotel', '37 Main Street Netrokona , Bangladesh', 20, 'A Serenely Modern hotel in Netrokona.', 'dummy.jpg', 3656, '015687744342', 'gloriouscastlehotel@outlook.com', 1, 1, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Modern Mansion Hotel', '77 Riverfront Comilla , Bangladesh', 5, 'A Enchantingly Rustic hotel in Comilla.', 'dummy.jpg', 2500, '011513117644', 'modernmansionhotel@gmail.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Elevated Castle Hotel', '18 Garden Lane Manikganj , Bangladesh', 26, 'A Serenely Elegant hotel in Manikganj.', 'dummy.jpg', 921, '013386237904', 'elevatedcastlehotel@outlook.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Hideaway Hotel', '39 Ocean Drive Mymensingh , Bangladesh', 6, 'A Majestically Modern hotel in Mymensingh.', 'dummy.jpg', 4465, '015228987253', 'quainthideawayhotel@gmail.com', 0, 0, 0);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Luxurious Palace Hotel', '21 Harbor View Sylhet , Bangladesh', 8, 'A Enchantingly Charming hotel in Sylhet.', 'dummy.jpg', 1499, '016839032832', 'luxuriouspalacehotel@outlook.com', 1, 1, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Quaint Palace Hotel', '12 Garden Lane Bandarban , Bangladesh', 15, 'A Serenely Charming hotel in Bandarban.', 'dummy.jpg', 4534, '016732195624', 'quaintpalacehotel@yahoo.com', 1, 0, 1);
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('Charming Castle Hotel', '6 Beach Road Chandpur , Bangladesh', 30, 'A Serenely Luxurious hotel in Chandpur.', 'dummy.jpg', 4432, '016897206790', 'charmingcastlehotel@gmail.com', 0, 1, 0);

---Flights

INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (2, 4, 'National Aviation Airlines', TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 4825, 'Business', 44, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (3, 24, 'National Airways Airlines', TO_DATE('2023-09-13', 'YYYY-MM-DD'), TO_DATE('2023-09-17', 'YYYY-MM-DD'), 12629, 'Business', 47, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (9, 4, 'Luxury Aviation Airlines', TO_DATE('2023-09-06', 'YYYY-MM-DD'), TO_DATE('2023-09-08', 'YYYY-MM-DD'), 15494, 'Business', 106, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (19, 17, 'Luxury Flights Airlines', TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 18374, 'First', 27, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (22, 30, 'Royal Flights Airlines', TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 18037, 'Economy', 73, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (13, 6, 'Luxury Airlines Airlines', TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 17091, 'Economy', 20, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (9, 5, 'Luxury Aviation Airlines', TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 14055, 'Business', 70, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (19, 24, 'Luxury Airways Airlines', TO_DATE('2023-09-08', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), 4332, 'First', 78, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (29, 18, 'Elite Airways Airlines', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 12956, 'First', 38, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (9, 24, 'Royal Aviation Airlines', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-18', 'YYYY-MM-DD'), 3352, 'First', 97, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (20, 27, 'Elite Aviation Airlines', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 9256, 'Economy', 106, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (8, 3, 'Premium Aviation Airlines', TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 4544, 'Economy', 67, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (4, 10, 'Premium Airways Airlines', TO_DATE('2023-08-29', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 3810, 'Business', 27, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (14, 24, 'Elite Aviation Airlines', TO_DATE('2023-09-17', 'YYYY-MM-DD'), TO_DATE('2023-09-18', 'YYYY-MM-DD'), 6047, 'Economy', 25, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (17, 6, 'Premium Airlines Airlines', TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 12646, 'First', 83, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (10, 13, 'National Aviation Airlines', TO_DATE('2023-08-22', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 10802, 'Business', 49, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (21, 18, 'International Airlines Airlines', TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-24', 'YYYY-MM-DD'), 9187, 'Business', 62, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (25, 22, 'International Flights Airlines', TO_DATE('2023-09-14', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 9913, 'First', 49, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (28, 10, 'Premium Aviation Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-16', 'YYYY-MM-DD'), 3198, 'First', 108, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (12, 24, 'Elite Flights Airlines', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 6709, 'Economy', 53, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (10, 4, 'Luxury Aviation Airlines', TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), 3548, 'First', 77, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (12, 19, 'Global Aviation Airlines', TO_DATE('2023-09-09', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 3422, 'First', 47, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 25, 'Global Aviation Airlines', TO_DATE('2023-09-17', 'YYYY-MM-DD'), TO_DATE('2023-09-24', 'YYYY-MM-DD'), 13421, 'First', 76, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (19, 13, 'International Airways Airlines', TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-19', 'YYYY-MM-DD'), 15806, 'Business', 115, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (26, 4, 'Elite Airlines Airlines', TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-25', 'YYYY-MM-DD'), 16477, 'Economy', 80, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (29, 23, 'Luxury Airlines Airlines', TO_DATE('2023-08-22', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), 17043, 'First', 100, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (15, 28, 'National Airlines Airlines', TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 15216, 'First', 60, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (22, 20, 'Royal Airways Airlines', TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-18', 'YYYY-MM-DD'), 10273, 'Business', 51, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (10, 25, 'Global Aviation Airlines', TO_DATE('2023-09-17', 'YYYY-MM-DD'), TO_DATE('2023-09-24', 'YYYY-MM-DD'), 18717, 'First', 108, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (1, 12, 'Global Aviation Airlines', TO_DATE('2023-08-29', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 4873, 'Economy', 36, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 10, 'Elite Flights Airlines', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-22', 'YYYY-MM-DD'), 14533, 'Business', 114, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (12, 18, 'Premium Airlines Airlines', TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), 19511, 'Business', 22, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (23, 1, 'Global Aviation Airlines', TO_DATE('2023-08-29', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 16619, 'Business', 77, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (28, 9, 'National Aviation Airlines', TO_DATE('2023-09-17', 'YYYY-MM-DD'), TO_DATE('2023-09-22', 'YYYY-MM-DD'), 12092, 'Economy', 42, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (14, 18, 'Luxury Airlines Airlines', TO_DATE('2023-09-14', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 8773, 'First', 105, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (17, 9, 'National Airways Airlines', TO_DATE('2023-09-07', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 11445, 'First', 46, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (26, 30, 'National Flights Airlines', TO_DATE('2023-09-07', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), 11461, 'Economy', 55, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (21, 2, 'Royal Aviation Airlines', TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-19', 'YYYY-MM-DD'), 16932, 'Economy', 113, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (2, 26, 'International Airways Airlines', TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-19', 'YYYY-MM-DD'), 9293, 'First', 72, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (9, 10, 'Elite Aviation Airlines', TO_DATE('2023-08-29', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 4901, 'Business', 96, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (30, 13, 'Royal Airlines Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-17', 'YYYY-MM-DD'), 9147, 'First', 43, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (26, 3, 'National Airways Airlines', TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 6905, 'Economy', 69, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (13, 4, 'Global Flights Airlines', TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 12047, 'Economy', 116, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (19, 20, 'International Airlines Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-18', 'YYYY-MM-DD'), 19819, 'Economy', 64, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (25, 9, 'Global Flights Airlines', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 18535, 'First', 93, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 30, 'International Aviation Airlines', TO_DATE('2023-08-24', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 13190, 'Economy', 59, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (11, 18, 'Royal Airways Airlines', TO_DATE('2023-09-06', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), 3212, 'First', 75, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (24, 3, 'Premium Aviation Airlines', TO_DATE('2023-09-14', 'YYYY-MM-DD'), TO_DATE('2023-09-17', 'YYYY-MM-DD'), 15308, 'First', 44, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (30, 24, 'Premium Flights Airlines', TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 19374, 'Economy', 82, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (3, 11, 'Premium Airlines Airlines', TO_DATE('2023-09-14', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 5074, 'Economy', 47, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (22, 15, 'Elite Aviation Airlines', TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 17041, 'Economy', 29, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (6, 8, 'International Aviation Airlines', TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 3146, 'Economy', 32, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (19, 2, 'Elite Airways Airlines', TO_DATE('2023-09-06', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 4881, 'Economy', 22, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (2, 26, 'Elite Airways Airlines', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 13625, 'First', 77, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (20, 26, 'International Aviation Airlines', TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 16496, 'Business', 101, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (28, 26, 'National Aviation Airlines', TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 13029, 'Business', 90, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (18, 4, 'Royal Aviation Airlines', TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 4590, 'Economy', 33, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (23, 26, 'International Airlines Airlines', TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 5481, 'First', 107, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (27, 6, 'Global Airlines Airlines', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 17507, 'First', 95, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (11, 6, 'Premium Aviation Airlines', TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), 17758, 'First', 51, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (2, 18, 'Elite Flights Airlines', TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 19916, 'First', 82, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (12, 25, 'Global Flights Airlines', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 19643, 'Economy', 116, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 9, 'Global Airways Airlines', TO_DATE('2023-09-17', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 4860, 'Business', 105, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (24, 16, 'Luxury Flights Airlines', TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 8973, 'Economy', 117, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (26, 25, 'Premium Aviation Airlines', TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 6016, 'Business', 47, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (10, 16, 'Luxury Airways Airlines', TO_DATE('2023-08-19', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD'), 3824, 'Economy', 60, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (6, 9, 'Premium Airlines Airlines', TO_DATE('2023-08-28', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 5668, 'First', 91, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (27, 11, 'Elite Flights Airlines', TO_DATE('2023-09-13', 'YYYY-MM-DD'), TO_DATE('2023-09-17', 'YYYY-MM-DD'), 7007, 'Business', 21, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (28, 23, 'International Flights Airlines', TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-19', 'YYYY-MM-DD'), 18197, 'First', 73, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (22, 1, 'Luxury Flights Airlines', TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), 16396, 'Economy', 71, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (26, 7, 'National Aviation Airlines', TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 17485, 'First', 55, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 21, 'Royal Airlines Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-16', 'YYYY-MM-DD'), 16405, 'Business', 120, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (22, 3, 'National Flights Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-16', 'YYYY-MM-DD'), 11078, 'Economy', 41, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (21, 3, 'International Airways Airlines', TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-23', 'YYYY-MM-DD'), 12788, 'First', 91, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (30, 21, 'Premium Airways Airlines', TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 9607, 'Business', 116, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (6, 10, 'Elite Airlines Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-17', 'YYYY-MM-DD'), 17361, 'Economy', 67, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (9, 3, 'Global Aviation Airlines', TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-08', 'YYYY-MM-DD'), 8602, 'Economy', 22, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (11, 30, 'Elite Airlines Airlines', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-19', 'YYYY-MM-DD'), 18103, 'Business', 102, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (5, 6, 'Luxury Aviation Airlines', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), 4359, 'Economy', 101, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (1, 19, 'Premium Flights Airlines', TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 16067, 'First', 24, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (28, 9, 'Elite Airlines Airlines', TO_DATE('2023-09-09', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), 16439, 'Economy', 83, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 20, 'Elite Flights Airlines', TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 3911, 'Economy', 88, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 2, 'National Airlines Airlines', TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 18818, 'Business', 58, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (22, 1, 'Global Flights Airlines', TO_DATE('2023-09-13', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), 18095, 'Economy', 71, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (12, 7, 'National Airways Airlines', TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'), 3063, 'First', 71, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (13, 22, 'Global Aviation Airlines', TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), 7297, 'First', 88, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (16, 26, 'Global Airlines Airlines', TO_DATE('2023-09-08', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), 4389, 'First', 79, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (10, 18, 'Royal Airlines Airlines', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 18197, 'Business', 37, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (15, 20, 'Premium Airways Airlines', TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2023-08-24', 'YYYY-MM-DD'), 4669, 'First', 109, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (20, 5, 'Premium Airlines Airlines', TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD'), 18043, 'Business', 49, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (13, 19, 'Royal Airlines Airlines', TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('2023-09-08', 'YYYY-MM-DD'), 16335, 'Economy', 59, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (29, 30, 'International Airlines Airlines', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 8436, 'Economy', 41, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (19, 14, 'International Airlines Airlines', TO_DATE('2023-09-12', 'YYYY-MM-DD'), TO_DATE('2023-09-16', 'YYYY-MM-DD'), 10576, 'Business', 89, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (8, 16, 'International Airways Airlines', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 12302, 'Economy', 49, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (28, 30, 'Luxury Flights Airlines', TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 14487, 'First', 82, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (20, 15, 'International Airways Airlines', TO_DATE('2023-08-29', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 18552, 'Economy', 68, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (21, 24, 'National Airlines Airlines', TO_DATE('2023-09-06', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), 4184, 'Business', 68, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (7, 20, 'Premium Airways Airlines', TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 12964, 'Economy', 49, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (26, 10, 'International Airlines Airlines', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-04', 'YYYY-MM-DD'), 10786, 'Business', 89, 'booking.com');
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES (5, 8, 'International Airways Airlines', TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 16476, 'Business', 32, 'booking.com');

---Restaurants

INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Bistro Seafood Restaurant', 454, '86 Cafeteria Lane', 18, 'A restaurant serving Uniquely Savory Thai Curry.', 'dummy.jpg', 'Japanese', '019171653408', 'rusticbistroseafoodrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Delicious Tavern Biryani Restaurant', 81, '53 Restaurant Row', 27, 'A restaurant serving Elegantly Elegant Japanese Dim Sum.', 'dummy.jpg', 'Bangladeshi', '016498286519', 'delicioustavernbiryanirestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Diner Seafood Restaurant', 109, '90 Riverfront', 26, 'A restaurant serving Elegantly Delicious Thai Seafood.', 'dummy.jpg', 'Spanish', '012467145777', 'gourmetdinerseafoodrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Cafe Pizza Restaurant', 434, '50 Restaurant Row', 29, 'A restaurant serving Elegantly Fusion Thai Tacos.', 'dummy.jpg', 'Italian', '012323677237', 'cozycafepizzarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Kitchen Burger Restaurant', 137, '19 Restaurant Row', 28, 'A restaurant serving Savoringly Charming Spanish Pasta.', 'dummy.jpg', 'Chinese', '018244694714', 'elegantkitchenburgerrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Steakhouse Sushi Restaurant', 449, '34 Dining Boulevard', 18, 'A restaurant serving Authentically Quaint Italian Curry.', 'dummy.jpg', 'Mexican', '013537032763', 'elegantsteakhousesushirestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Osteria Biryani Restaurant', 333, '59 Riverfront', 9, 'A restaurant serving Exquisitely Cozy French Seafood.', 'dummy.jpg', 'Mediterranean', '013704386335', 'exquisiteosteriabiryanirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Savory Bistro Pizza Restaurant', 429, '66 Main Street', 12, 'A restaurant serving Enchantingly Delicious Japanese Steak.', 'dummy.jpg', 'Chinese', '013822576751', 'savorybistropizzarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Diner Burger Restaurant', 411, '73 Main Street', 4, 'A restaurant serving Uniquely Authentic Bangladeshi Sushi.', 'dummy.jpg', 'Indian', '011003202489', 'charmingdinerburgerrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Bistro Tacos Restaurant', 235, '90 Culinary Avenue', 5, 'A restaurant serving Savoringly Savory Mexican Pasta.', 'dummy.jpg', 'Chinese', '012777932539', 'rusticbistrotacosrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Diner Steak Restaurant', 395, '31 Cafeteria Lane', 13, 'A restaurant serving Exquisitely Rustic Japanese Tacos.', 'dummy.jpg', 'French', '013399001534', 'quaintdinersteakrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Diner Pizza Restaurant', 166, '75 Main Street', 22, 'A restaurant serving Passionately Exquisite Mexican Burger.', 'dummy.jpg', 'Mexican', '013591957501', 'cozydinerpizzarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Brasserie Tacos Restaurant', 114, '84 Restaurant Row', 4, 'A restaurant serving Passionately Authentic Bangladeshi Seafood.', 'dummy.jpg', 'Spanish', '016256182569', 'fusionbrasserietacosrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Pizzeria Pasta Restaurant', 275, '85 Culinary Avenue', 1, 'A restaurant serving Savoringly Fusion Japanese Burger.', 'dummy.jpg', 'Mexican', '018631196091', 'fusionpizzeriapastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Delicious Grill Pizza Restaurant', 408, '98 Lakeview Drive', 9, 'A restaurant serving Passionately Elegant Italian Biryani.', 'dummy.jpg', 'Mediterranean', '014424738532', 'deliciousgrillpizzarestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Steakhouse Kebab Restaurant', 422, '1 Gourmet Street', 10, 'A restaurant serving Savoringly Exquisite Chinese Dim Sum.', 'dummy.jpg', 'Indian', '016787922248', 'seasidesteakhousekebabrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Kitchen Sushi Restaurant', 460, '33 Cafeteria Lane', 14, 'A restaurant serving Passionately Elegant Indian Burger.', 'dummy.jpg', 'Italian', '018844443903', 'seasidekitchensushirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Eatery Pasta Restaurant', 385, '61 Restaurant Row', 27, 'A restaurant serving Delightfully Cozy Thai Tacos.', 'dummy.jpg', 'Japanese', '011744768358', 'fusioneaterypastarestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Eatery Kebab Restaurant', 58, '79 Dining Boulevard', 16, 'A restaurant serving Savoringly Seaside French Curry.', 'dummy.jpg', 'Greek', '012447246035', 'exquisiteeaterykebabrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Osteria Steak Restaurant', 447, '28 Foodie Street', 6, 'A restaurant serving Wonderfully Cozy Thai Burger.', 'dummy.jpg', 'Mediterranean', '017243121387', 'rusticosteriasteakrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Authentic Diner Dim Sum Restaurant', 440, '60 Lakeview Drive', 1, 'A restaurant serving Authentically Rustic Mediterranean Biryani.', 'dummy.jpg', 'Thai', '018883477728', 'authenticdinerdimsumrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Delicious Eatery Pasta Restaurant', 157, '75 Main Street', 18, 'A restaurant serving Authentically Cozy Chinese Biryani.', 'dummy.jpg', 'Bangladeshi', '011431712083', 'deliciouseaterypastarestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Kitchen Tacos Restaurant', 338, '73 Riverfront', 23, 'A restaurant serving Exquisitely Fusion Bangladeshi Dim Sum.', 'dummy.jpg', 'Italian', '014193288885', 'fusionkitchentacosrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Steakhouse Dim Sum Restaurant', 129, '27 Cafeteria Lane', 5, 'A restaurant serving Uniquely Elegant Thai Pizza.', 'dummy.jpg', 'Spanish', '019346834121', 'rusticsteakhousedimsumrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Savory Brasserie Steak Restaurant', 84, '37 Culinary Avenue', 7, 'A restaurant serving Enchantingly Delicious Italian Kebab.', 'dummy.jpg', 'Mediterranean', '014798109139', 'savorybrasseriesteakrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Pizzeria Pasta Restaurant', 218, '3 Main Street', 28, 'A restaurant serving Savoringly Rustic Chinese Curry.', 'dummy.jpg', 'Spanish', '017431435244', 'gourmetpizzeriapastarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Grill Dim Sum Restaurant', 185, '18 Cafeteria Lane', 5, 'A restaurant serving Passionately Charming Italian Pizza.', 'dummy.jpg', 'Greek', '013926082892', 'charminggrilldimsumrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Brasserie Curry Restaurant', 65, '81 Food Court', 24, 'A restaurant serving Delightfully Seaside Mexican Sushi.', 'dummy.jpg', 'Thai', '011932598450', 'cozybrasseriecurryrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Grill Pasta Restaurant', 253, '64 Main Street', 17, 'A restaurant serving Savoringly Seaside Spanish Biryani.', 'dummy.jpg', 'Mediterranean', '019406317290', 'exquisitegrillpastarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Kitchen Pasta Restaurant', 162, '18 Food Court', 1, 'A restaurant serving Tastefully Fusion Italian Kebab.', 'dummy.jpg', 'Mexican', '014035146935', 'quaintkitchenpastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Bakery Pasta Restaurant', 385, '20 Riverfront', 26, 'A restaurant serving Savoringly Quaint Mexican Tacos.', 'dummy.jpg', 'Mexican', '017075834127', 'quaintbakerypastarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Kitchen Sushi Restaurant', 92, '65 Restaurant Row', 2, 'A restaurant serving Tastefully Fusion Mediterranean Dim Sum.', 'dummy.jpg', 'Mediterranean', '019169483977', 'gourmetkitchensushirestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Osteria Pasta Restaurant', 141, '19 Food Court', 25, 'A restaurant serving Enchantingly Authentic Thai Pasta.', 'dummy.jpg', 'Greek', '019134789307', 'fusionosteriapastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Authentic Diner Curry Restaurant', 402, '81 Culinary Avenue', 20, 'A restaurant serving Passionately Cozy Spanish Sushi.', 'dummy.jpg', 'Mexican', '012366495452', 'authenticdinercurryrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Savory Bistro Pizza Restaurant', 467, '88 Cafeteria Lane', 25, 'A restaurant serving Authentically Exquisite Mediterranean Burger.', 'dummy.jpg', 'Bangladeshi', '018269514186', 'savorybistropizzarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Bistro Seafood Restaurant', 265, '5 Culinary Avenue', 26, 'A restaurant serving Wonderfully Exquisite Spanish Curry.', 'dummy.jpg', 'Mexican', '014541205662', 'elegantbistroseafoodrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Brasserie Tacos Restaurant', 175, '6 Culinary Avenue', 1, 'A restaurant serving Uniquely Authentic Japanese Dim Sum.', 'dummy.jpg', 'Italian', '017912911782', 'charmingbrasserietacosrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Brasserie Tacos Restaurant', 431, '57 Restaurant Row', 12, 'A restaurant serving Exquisitely Exquisite Indian Dim Sum.', 'dummy.jpg', 'Thai', '019814247686', 'gourmetbrasserietacosrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Pizzeria Dim Sum Restaurant', 72, '61 Food Court', 14, 'A restaurant serving Savoringly Cozy Thai Steak.', 'dummy.jpg', 'Japanese', '011779568005', 'quaintpizzeriadimsumrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Cafe Burger Restaurant', 460, '29 Food Court', 18, 'A restaurant serving Exquisitely Charming Mexican Steak.', 'dummy.jpg', 'Indian', '011381535492', 'exquisitecafeburgerrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Kitchen Burger Restaurant', 176, '64 Restaurant Row', 24, 'A restaurant serving Enchantingly Authentic Japanese Sushi.', 'dummy.jpg', 'Greek', '012848152489', 'quaintkitchenburgerrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Brasserie Steak Restaurant', 319, '35 Lakeview Drive', 28, 'A restaurant serving Wonderfully Exquisite French Pasta.', 'dummy.jpg', 'Mexican', '017554204568', 'fusionbrasseriesteakrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Delicious Cafe Pizza Restaurant', 109, '33 Main Street', 4, 'A restaurant serving Savoringly Cozy Spanish Kebab.', 'dummy.jpg', 'Thai', '018915669442', 'deliciouscafepizzarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Steakhouse Sushi Restaurant', 419, '92 Food Court', 20, 'A restaurant serving Wonderfully Gourmet Chinese Dim Sum.', 'dummy.jpg', 'Thai', '018658281379', 'quaintsteakhousesushirestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Savory Bistro Tacos Restaurant', 116, '43 Food Court', 13, 'A restaurant serving Elegantly Delicious Thai Burger.', 'dummy.jpg', 'Mexican', '015733639914', 'savorybistrotacosrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Eatery Steak Restaurant', 365, '53 Cafeteria Lane', 28, 'A restaurant serving Delightfully Rustic Spanish Pizza.', 'dummy.jpg', 'Spanish', '018695361902', 'seasideeaterysteakrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Tavern Biryani Restaurant', 475, '99 Dining Boulevard', 22, 'A restaurant serving Delightfully Seaside Greek Pizza.', 'dummy.jpg', 'Chinese', '012591223721', 'eleganttavernbiryanirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Grill Pizza Restaurant', 256, '12 Lakeview Drive', 23, 'A restaurant serving Tastefully Rustic Italian Tacos.', 'dummy.jpg', 'Thai', '014337926552', 'charminggrillpizzarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Osteria Steak Restaurant', 369, '67 Gourmet Street', 7, 'A restaurant serving Authentically Gourmet Italian Pizza.', 'dummy.jpg', 'Mediterranean', '011875593237', 'seasideosteriasteakrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Bistro Pasta Restaurant', 140, '53 Dining Boulevard', 6, 'A restaurant serving Authentically Rustic French Dim Sum.', 'dummy.jpg', 'Indian', '015815791411', 'quaintbistropastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Osteria Pasta Restaurant', 487, '11 Lakeview Drive', 28, 'A restaurant serving Elegantly Authentic Spanish Kebab.', 'dummy.jpg', 'Chinese', '015582532983', 'gourmetosteriapastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Brasserie Dim Sum Restaurant', 460, '50 Riverfront', 14, 'A restaurant serving Delightfully Authentic Mediterranean Pasta.', 'dummy.jpg', 'Chinese', '012539716623', 'charmingbrasseriedimsumrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Pizzeria Seafood Restaurant', 472, '21 Lakeview Drive', 22, 'A restaurant serving Elegantly Authentic Italian Steak.', 'dummy.jpg', 'Greek', '012053967350', 'rusticpizzeriaseafoodrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Steakhouse Dim Sum Restaurant', 240, '29 Lakeview Drive', 30, 'A restaurant serving Authentically Authentic Mexican Sushi.', 'dummy.jpg', 'Italian', '017257337589', 'elegantsteakhousedimsumrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Diner Tacos Restaurant', 404, '35 Cafeteria Lane', 15, 'A restaurant serving Enchantingly Seaside Japanese Steak.', 'dummy.jpg', 'Japanese', '011614481810', 'cozydinertacosrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Cafe Kebab Restaurant', 304, '63 Gourmet Street', 20, 'A restaurant serving Tastefully Cozy Indian Seafood.', 'dummy.jpg', 'Greek', '013396188231', 'quaintcafekebabrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Bakery Pizza Restaurant', 282, '67 Food Court', 22, 'A restaurant serving Exquisitely Rustic French Pasta.', 'dummy.jpg', 'Bangladeshi', '017309173850', 'seasidebakerypizzarestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Pizzeria Seafood Restaurant', 200, '89 Gourmet Street', 17, 'A restaurant serving Authentically Cozy Mexican Biryani.', 'dummy.jpg', 'Greek', '015852641968', 'cozypizzeriaseafoodrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Eatery Kebab Restaurant', 296, '96 Cafeteria Lane', 7, 'A restaurant serving Delightfully Fusion Chinese Biryani.', 'dummy.jpg', 'Thai', '016688803805', 'seasideeaterykebabrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Kitchen Steak Restaurant', 227, '58 Foodie Street', 11, 'A restaurant serving Exquisitely Authentic Mediterranean Seafood.', 'dummy.jpg', 'Japanese', '013576597724', 'cozykitchensteakrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Eatery Burger Restaurant', 118, '7 Dining Boulevard', 9, 'A restaurant serving Delightfully Elegant French Biryani.', 'dummy.jpg', 'Spanish', '016444054269', 'charmingeateryburgerrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Diner Sushi Restaurant', 121, '2 Cafeteria Lane', 30, 'A restaurant serving Elegantly Seaside Japanese Biryani.', 'dummy.jpg', 'Mexican', '014019061618', 'elegantdinersushirestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Steakhouse Steak Restaurant', 92, '3 Food Court', 7, 'A restaurant serving Passionately Savory Mexican Steak.', 'dummy.jpg', 'Bangladeshi', '014034551800', 'rusticsteakhousesteakrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Eatery Pasta Restaurant', 189, '67 Main Street', 3, 'A restaurant serving Delightfully Exquisite Thai Curry.', 'dummy.jpg', 'Indian', '019727297130', 'cozyeaterypastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Osteria Burger Restaurant', 423, '31 Restaurant Row', 28, 'A restaurant serving Authentically Seaside French Biryani.', 'dummy.jpg', 'Bangladeshi', '015207094919', 'gourmetosteriaburgerrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Cafe Sushi Restaurant', 275, '47 Lakeview Drive', 21, 'A restaurant serving Enchantingly Savory French Steak.', 'dummy.jpg', 'Italian', '013062889632', 'fusioncafesushirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Cafe Burger Restaurant', 165, '46 Restaurant Row', 17, 'A restaurant serving Passionately Elegant Japanese Seafood.', 'dummy.jpg', 'Mexican', '018579677109', 'exquisitecafeburgerrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Bistro Steak Restaurant', 148, '78 Riverfront', 25, 'A restaurant serving Uniquely Seaside Mexican Pizza.', 'dummy.jpg', 'Bangladeshi', '011344648541', 'gourmetbistrosteakrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Pizzeria Seafood Restaurant', 88, '38 Foodie Street', 7, 'A restaurant serving Exquisitely Cozy Italian Burger.', 'dummy.jpg', 'Indian', '013819886880', 'seasidepizzeriaseafoodrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Grill Steak Restaurant', 241, '19 Main Street', 20, 'A restaurant serving Savoringly Charming French Pizza.', 'dummy.jpg', 'French', '015208342993', 'exquisitegrillsteakrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Cafe Sushi Restaurant', 471, '54 Main Street', 1, 'A restaurant serving Delightfully Authentic Spanish Tacos.', 'dummy.jpg', 'Mediterranean', '013759634023', 'charmingcafesushirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Bistro Burger Restaurant', 323, '24 Food Court', 19, 'A restaurant serving Elegantly Elegant Indian Sushi.', 'dummy.jpg', 'Japanese', '011193194077', 'cozybistroburgerrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Charming Eatery Pizza Restaurant', 293, '100 Restaurant Row', 19, 'A restaurant serving Uniquely Cozy Spanish Sushi.', 'dummy.jpg', 'Japanese', '018508902211', 'charmingeaterypizzarestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Authentic Brasserie Pasta Restaurant', 442, '7 Culinary Avenue', 14, 'A restaurant serving Exquisitely Cozy Mexican Burger.', 'dummy.jpg', 'Japanese', '014331037871', 'authenticbrasseriepastarestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Pizzeria Pasta Restaurant', 181, '38 Main Street', 5, 'A restaurant serving Tastefully Seaside Spanish Curry.', 'dummy.jpg', 'Bangladeshi', '013717346598', 'gourmetpizzeriapastarestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Osteria Tacos Restaurant', 337, '93 Restaurant Row', 1, 'A restaurant serving Enchantingly Rustic Spanish Pasta.', 'dummy.jpg', 'Thai', '013639524428', 'exquisiteosteriatacosrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Brasserie Curry Restaurant', 441, '33 Food Court', 2, 'A restaurant serving Tastefully Authentic Mediterranean Tacos.', 'dummy.jpg', 'French', '013952816241', 'exquisitebrasseriecurryrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Kitchen Biryani Restaurant', 205, '63 Restaurant Row', 10, 'A restaurant serving Authentically Gourmet Bangladeshi Biryani.', 'dummy.jpg', 'French', '018078179590', 'elegantkitchenbiryanirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Cozy Osteria Curry Restaurant', 68, '26 Dining Boulevard', 1, 'A restaurant serving Uniquely Elegant Bangladeshi Kebab.', 'dummy.jpg', 'Indian', '015783708879', 'cozyosteriacurryrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Pizzeria Seafood Restaurant', 426, '64 Riverfront', 24, 'A restaurant serving Delightfully Delicious Mediterranean Tacos.', 'dummy.jpg', 'Bangladeshi', '013025568380', 'gourmetpizzeriaseafoodrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Diner Dim Sum Restaurant', 199, '5 Foodie Street', 4, 'A restaurant serving Enchantingly Savory Japanese Steak.', 'dummy.jpg', 'Thai', '015636051265', 'rusticdinerdimsumrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Kitchen Seafood Restaurant', 251, '83 Riverfront', 20, 'A restaurant serving Delightfully Gourmet Spanish Steak.', 'dummy.jpg', 'Mexican', '011707876811', 'quaintkitchenseafoodrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Cafe Kebab Restaurant', 169, '17 Cafeteria Lane', 25, 'A restaurant serving Enchantingly Delicious French Pizza.', 'dummy.jpg', 'Thai', '015202784227', 'quaintcafekebabrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Grill Tacos Restaurant', 120, '67 Food Court', 2, 'A restaurant serving Passionately Gourmet Italian Steak.', 'dummy.jpg', 'French', '014466262535', 'gourmetgrilltacosrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Kitchen Burger Restaurant', 145, '88 Food Court', 23, 'A restaurant serving Savoringly Seaside Bangladeshi Pasta.', 'dummy.jpg', 'Indian', '013043547716', 'rustickitchenburgerrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Cafe Curry Restaurant', 484, '86 Food Court', 4, 'A restaurant serving Authentically Quaint Spanish Pasta.', 'dummy.jpg', 'Indian', '018495139388', 'quaintcafecurryrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Quaint Osteria Dim Sum Restaurant', 61, '15 Cafeteria Lane', 6, 'A restaurant serving Delightfully Fusion Greek Pizza.', 'dummy.jpg', 'Japanese', '014681995808', 'quaintosteriadimsumrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Savory Grill Kebab Restaurant', 118, '35 Foodie Street', 4, 'A restaurant serving Exquisitely Fusion Mexican Biryani.', 'dummy.jpg', 'Thai', '014821234914', 'savorygrillkebabrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Grill Burger Restaurant', 204, '56 Dining Boulevard', 10, 'A restaurant serving Wonderfully Seaside Chinese Seafood.', 'dummy.jpg', 'Spanish', '016982278868', 'rusticgrillburgerrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Bistro Sushi Restaurant', 227, '78 Main Street', 26, 'A restaurant serving Delightfully Savory Thai Biryani.', 'dummy.jpg', 'Thai', '018085512285', 'rusticbistrosushirestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Savory Pizzeria Tacos Restaurant', 69, '60 Dining Boulevard', 23, 'A restaurant serving Elegantly Fusion Thai Biryani.', 'dummy.jpg', 'Chinese', '016469583581', 'savorypizzeriatacosrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Delicious Brasserie Dim Sum Restaurant', 77, '52 Dining Boulevard', 2, 'A restaurant serving Elegantly Delicious Chinese Burger.', 'dummy.jpg', 'Indian', '019305125874', 'deliciousbrasseriedimsumrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Seaside Brasserie Kebab Restaurant', 256, '76 Foodie Street', 29, 'A restaurant serving Tastefully Fusion Thai Curry.', 'dummy.jpg', 'Greek', '019863493822', 'seasidebrasseriekebabrestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Cafe Steak Restaurant', 83, '38 Cafeteria Lane', 25, 'A restaurant serving Uniquely Charming Mediterranean Sushi.', 'dummy.jpg', 'Chinese', '016204656200', 'fusioncafesteakrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Elegant Eatery Kebab Restaurant', 428, '51 Cafeteria Lane', 24, 'A restaurant serving Authentically Cozy Spanish Biryani.', 'dummy.jpg', 'Japanese', '014044254903', 'eleganteaterykebabrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Grill Burger Restaurant', 403, '27 Foodie Street', 24, 'A restaurant serving Elegantly Rustic Mexican Sushi.', 'dummy.jpg', 'Spanish', '018283585934', 'rusticgrillburgerrestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Rustic Bakery Biryani Restaurant', 306, '2 Dining Boulevard', 28, 'A restaurant serving Delightfully Exquisite Greek Tacos.', 'dummy.jpg', 'Greek', '013887652682', 'rusticbakerybiryanirestaurant@yahoo.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Exquisite Brasserie Biryani Restaurant', 306, '86 Culinary Avenue', 4, 'A restaurant serving Authentically Cozy French Pizza.', 'dummy.jpg', 'Mexican', '019204018809', 'exquisitebrasseriebiryanirestaurant@outlook.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Gourmet Bakery Curry Restaurant', 262, '12 Gourmet Street', 5, 'A restaurant serving Authentically Seaside Japanese Dim Sum.', 'dummy.jpg', 'Mexican', '019461654363', 'gourmetbakerycurryrestaurant@gmail.com');
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('Fusion Bakery Dim Sum Restaurant', 248, '45 Riverfront', 19, 'A restaurant serving Authentically Rustic Chinese Seafood.', 'dummy.jpg', 'Mediterranean', '016159299113', 'fusionbakerydimsumrestaurant@yahoo.com');

---Provides

INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (1, 1, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (1, 4, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (1, 6, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (2, 8, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (2, 9, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (2, 20, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (3, 3, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (3, 6, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (3, 7, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (4, 10, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (4, 12, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (4, 45, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (5, 8, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (5, 9, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (5, 20, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (6, 2, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (6, 5, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (6, 36, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (7, 4, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (7, 5, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (7, 44, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (8, 8, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (8, 21, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (8, 45, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (9, 2, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (9, 5, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (9, 15, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (10, 3, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (10, 7, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (10, 15, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (11, 2, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (11, 6, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (11, 36, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (12, 25, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (12, 29, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (12, 45, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (13, 4, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (13, 15, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (13, 18, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (14, 7, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (14, 14, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (14, 31, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (15, 8, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (15, 9, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (15, 25, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (16, 29, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (16, 30, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (16, 31, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (17, 28, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (17, 30, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (17, 34, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (18, 2, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (18, 9, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (18, 12, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (19, 8, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (19, 9, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (19, 20, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (20, 3, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (20, 6, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (20, 34, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (21, 8, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (21, 9, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (21, 20, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (22, 1, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (22, 2, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (22, 3, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (23, 24, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (23, 25, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (23, 28, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (24, 2, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (24, 5, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (24, 33, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (25, 8, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (25, 9, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (25, 20, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (26, 3, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (26, 6, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (26, 7, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (27, 8, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (27, 9, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (27, 20, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (28, 26, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (28, 28, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (28, 34, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (29, 11, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (29, 29, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (29, 32, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (30, 11, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (30, 29, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (30, 32, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (31, 30, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (31, 31, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (31, 34, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (32, 13, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (32, 15, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (32, 16, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (33, 10, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (33, 29, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (33, 30, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (34, 3, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (34, 6, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (34, 26, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (35, 17, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (35, 19, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (35, 36, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (36, 17, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (36, 19, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (36, 36, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (37, 3, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (37, 6, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (37, 7, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (38, 11, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (38, 29, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (38, 32, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (39, 13, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (39, 15, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (39, 16, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (40, 8, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (40, 9, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (40, 20, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (41, 30, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (41, 31, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (41, 34, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (42, 13, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (42, 15, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (42, 16, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (43, 3, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (43, 6, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (43, 7, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (44, 13, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (44, 15, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (44, 16, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (45, 11, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (45, 29, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (45, 32, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (46, 3, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (46, 6, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (46, 7, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (47, 17, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (47, 19, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (47, 36, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (48, 8, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (48, 9, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (48, 20, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (49, 3, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (49, 6, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (49, 7, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (50, 26, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (50, 28, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (50, 34, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (51, 21, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (51, 22, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (51, 24, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (52, 26, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (52, 28, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (52, 34, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (53, 10, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (53, 11, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (53, 49, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (54, 18, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (54, 19, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (54, 25, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (55, 13, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (55, 15, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (55, 16, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (56, 11, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (56, 29, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (56, 32, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (57, 28, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (57, 30, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (57, 34, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (58, 10, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (58, 11, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (58, 49, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (59, 37, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (59, 38, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (59, 43, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (60, 38, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (60, 39, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (60, 48, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (61, 30, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (61, 31, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (61, 34, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (62, 13, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (62, 15, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (62, 16, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (63, 13, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (63, 15, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (63, 16, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (64, 26, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (64, 28, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (64, 34, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (65, 41, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (65, 42, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (65, 43, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (66, 26, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (66, 28, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (66, 34, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (67, 38, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (67, 39, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (67, 48, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (68, 49, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (68, 50, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (69, 49, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (69, 50, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (70, 26, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (70, 28, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (70, 34, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (71, 30, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (71, 31, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (71, 34, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (72, 10, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (72, 11, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (72, 49, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (73, 13, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (73, 15, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (73, 16, 250, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (74, 17, 350, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (74, 19, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (74, 36, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (75, 17, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (75, 19, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (75, 36, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (76, 13, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (76, 15, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (76, 16, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (77, 28, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (77, 30, 500, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (77, 34, 400, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (78, 10, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (78, 11, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (78, 49, 50, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (79, 3, 150, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (79, 6, 450, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (79, 7, 200, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (80, 17, 300, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (80, 19, 100, 1);
INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES (80, 36, 300, 1);


-- Insert dummy trips

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(1, TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-10', 'YYYY-MM-DD')),
    HotelDates(2, TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-07-20', 'YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(1, 2, 3);
  l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(1, 1, TO_DATE('2023-07-15', 'YYYY-MM-DD')),
    DestinationActivity(1, 4, TO_DATE('2023-07-17', 'YYYY-MM-DD'))
  );
  l_guides GuideList := GuideList(1, 2);
  p_trip_id NUMBER;
BEGIN
  AddTrip(1, 2, 'Summer Vacation in Paris', 'Enjoy the charm of Paris in summer', 'paris_summer.jpg', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-25', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
  
  DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(5, TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD')),
    HotelDates(8, TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(10, 15, 20);
  l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(2, 8, TO_DATE('2023-08-15', 'YYYY-MM-DD')),
    DestinationActivity(2, 9, TO_DATE('2023-08-18', 'YYYY-MM-DD'))
  );
  l_guides GuideList := GuideList(1);
  p_trip_id NUMBER;
BEGIN
  AddTrip(3, 4, 'Adventure in the Himalayas', 'Experience thrilling adventure in the Himalayas', 'himalayas_adventure.jpg', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 2, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
  
  DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(25, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD')),
    HotelDates(30, TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(18, 21, 22);
  l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(3, 3, TO_DATE('2023-09-12', 'YYYY-MM-DD')),
    DestinationActivity(3, 7, TO_DATE('2023-09-15', 'YYYY-MM-DD'))
  );
  l_guides GuideList := GuideList(1, 2);
  p_trip_id NUMBER;
BEGIN
  AddTrip(5, 6, 'Relaxing Beach Vacation', 'Unwind on the beautiful beaches of Maldives', 'maldives_beach.jpg', TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 0, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
  
  DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/



DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(77, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD')),
HotelDates(87, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-21', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(22, 2, 46, 87);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(60, 48, TO_DATE('2023-08-19', 'YYYY-MM-DD')),
DestinationActivity(33, 10, TO_DATE('2023-08-19', 'YYYY-MM-DD')),
DestinationActivity(44, 16, TO_DATE('2023-08-17', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(1, 2);
p_trip_id NUMBER;
BEGIN
AddTrip(18, 10, 'Mountainous Adventure', 'Unwind in luxurious accommodations, surrounded by picturesque scenery that promises both serenity and excitement.', 'dummy.jpg', TO_DATE('2023-08-16', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(48, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(73, 83, 98, 38, 50);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(69, 49, TO_DATE('2023-08-17', 'YYYY-MM-DD')),
DestinationActivity(48, 20, TO_DATE('2023-08-19', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2, 1);
p_trip_id NUMBER;
BEGIN
AddTrip(25, 8, 'Cultural Discovery', 'Explore majestic mountains, relax on pristine beaches, and create cherished memories with fellow travelers.', 'dummy.jpg', TO_DATE('2023-08-16', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(80, TO_DATE('2023-08-14', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(60, 51, 65, 10);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(72, 11, TO_DATE('2023-08-13', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2, 1);
p_trip_id NUMBER;
BEGIN
AddTrip(12, 19, 'Relaxation Retreat', 'This is the ultimate getaway, where every day brings a new opportunity for exploration and wonder.', 'dummy.jpg', TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(3, TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(22, 26, 73, 4, 76);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(37, 3, TO_DATE('2023-08-18', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(1);
p_trip_id NUMBER;
BEGIN
AddTrip(2, 9, 'Urban Exploration', 'Venture into the heart of untouched wilderness, where every step unveils new surprises and untold stories.', 'dummy.jpg', TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(82, TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD')),
HotelDates(60, TO_DATE('2023-08-16', 'YYYY-MM-DD'), TO_DATE('2023-08-21', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(53, 16);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(58, 10, TO_DATE('2023-08-17', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2);
p_trip_id NUMBER;
BEGIN
AddTrip(22, 24, 'Wilderness Retreat', 'Explore majestic mountains, relax on pristine beaches, and create cherished memories with fellow travelers.', 'dummy.jpg', TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(36, TO_DATE('2023-08-19', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(34, 83, 65);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(21, 8, TO_DATE('2023-08-19', 'YYYY-MM-DD')),
DestinationActivity(40, 8, TO_DATE('2023-08-17', 'YYYY-MM-DD')),
DestinationActivity(36, 19, TO_DATE('2023-08-17', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2);
p_trip_id NUMBER;
BEGIN
AddTrip(6, 4, 'Wilderness Retreat', 'Indulge in the perfect blend of adventure and tranquility, creating memories that will last a lifetime.', 'dummy.jpg', TO_DATE('2023-08-16', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(74, TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD')),
HotelDates(59, TO_DATE('2023-08-16', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(34);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(26, 3, TO_DATE('2023-08-16', 'YYYY-MM-DD')),
DestinationActivity(7, 4, TO_DATE('2023-08-16', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2, 1);
p_trip_id NUMBER;
BEGIN
AddTrip(7, 17, 'Tropical Getaway', 'Discover hidden gems, savor local cuisines, and immerse yourself in the rich history of each destination.', 'dummy.jpg', TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(52, TO_DATE('2023-08-13', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(43);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(46, 6, TO_DATE('2023-08-15', 'YYYY-MM-DD')),
DestinationActivity(3, 6, TO_DATE('2023-08-13', 'YYYY-MM-DD')),
DestinationActivity(74, 36, TO_DATE('2023-08-13', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2, 1);
p_trip_id NUMBER;
BEGIN
AddTrip(7, 16, 'Relaxation Retreat', 'Get ready for an eco-friendly escapade, where youll connect with nature and support sustainable tourism.', 'dummy.jpg', TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(66, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-24', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(78, 9);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(76, 16, TO_DATE('2023-08-20', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(1, 2);
p_trip_id NUMBER;
BEGIN
AddTrip(30, 25, 'Eco-Friendly Escape', 'Indulge in the perfect blend of adventure and tranquility, creating memories that will last a lifetime.', 'dummy.jpg', TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
l_hotels HotelDatesList := HotelDatesList(
    HotelDates(27, TO_DATE('2023-08-19', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'))
);
l_restaurants RestaurantList := RestaurantList(73, 53, 51, 72);
l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(14, 14, TO_DATE('2023-08-18', 'YYYY-MM-DD'))
);
l_guides GuideList := GuideList(2);
p_trip_id NUMBER;
BEGIN
AddTrip(14, 1, 'Cultural Discovery', 'This is the ultimate getaway, where every day brings a new opportunity for exploration and wonder.', 'dummy.jpg', TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    


DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Through discovering local culture, I marveled at unforgettable scenes. The cultural connoisseurss passion and knowledge added depth to my journey, as did the delectable offerings at ethnic cuisine spots.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 83);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Each day was filled with immersing captivating landscapes. I felt secure at historic manors and enjoyed memorable meals at gourmet restaurants, while our cultural connoisseurs infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 86);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unique flavors and culinary creativity impressed us. Charming ambiance added to the overall enjoyment. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 37);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Convenient parking arrangements added to our comfort. Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule. Top-notch security enhanced our peace of mind.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 29);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience. Delicious dishes delighted our taste buds. Varied menu options satisfied different palates. Attentive service created a memorable dining experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 21);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'During my exquisite trip, I had the pleasure of unwinding diverse landscapes. The gourmet restaurants we dined at was exceptional, and the expert locals made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Varied menu options satisfied different palates.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 30);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'From adventuring breathtaking sights to savoring exquisite cuisines at street food stalls, my inspiring trip was enriched by a knowledgeable guides who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Timely wake-up calls assisted our daily schedule. Convenient parking arrangements added to our comfort. Fast WiFi contributed to a connected stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 45);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 24);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Delicious dishes delighted our taste buds. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 18);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 84);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Through enjoying local culture, I marveled at charming scenes. The friendly insiderss passion and knowledge added depth to my journey, as did the delectable offerings at local eateries.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Fast service contributed to a seamless meal. Varied menu options satisfied different palates. Presentation of dishes was visually appealing.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 19);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 63);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Presentation of dishes was visually appealing. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 67);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds. Attentive service created a memorable dining experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 79);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'From immersing breathtaking sights to savoring exquisite cuisines at gourmet restaurants, my unforgettable trip was enriched by a friendly insiders who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Convenient parking arrangements added to our comfort. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Top-notch security enhanced our peace of mind.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 14);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience. Varied menu options satisfied different palates. Fast service contributed to a seamless meal.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 75);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 39);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Timely wake-up calls assisted our daily schedule. Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 41);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience. Varied menu options satisfied different palates.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 51);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 57);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience. Fast service contributed to a seamless meal. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 24);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Exceptional breakfast options set a positive tone. Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 25);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Delicious dishes delighted our taste buds. Charming ambiance added to the overall enjoyment. Fast service contributed to a seamless meal. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 71);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 20);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 34);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Through experiencing local culture, I marveled at captivating scenes. The expert localss passion and knowledge added depth to my journey, as did the delectable offerings at gourmet restaurants.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Top-notch security enhanced our peace of mind. Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 50);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Convenient location enhanced our dining convenience. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 76);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Each day was filled with enjoying captivating landscapes. I felt secure at chic accommodations and enjoyed memorable meals at farm-to-table diners, while our adventure enthusiasts infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Attentive service created a memorable dining experience. Fast service contributed to a seamless meal. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 28);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Charming ambiance added to the overall enjoyment.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 81);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Efficient management ensured a smooth stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 28);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Convenient parking arrangements added to our comfort. Fast WiFi contributed to a connected stay. Top-notch security enhanced our peace of mind.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 21);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Each day was filled with experiencing captivating landscapes. I felt secure at seaside resorts and enjoyed memorable meals at fusion food trucks, while our adventure enthusiasts infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Each day was filled with savoring captivating landscapes. I felt secure at seaside resorts and enjoyed memorable meals at rustic bistros, while our enthusiastic storytellers infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Varied menu options satisfied different palates. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 53);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 98);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Attentive staff created a welcoming experience. Top-notch security enhanced our peace of mind. Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 32);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 100);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unwinding in quaint inns and savoring the surroundings, I cherished the culinary delights at hidden gems. Our knowledgeable guides brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'During my delightful trip, I had the pleasure of savoring diverse landscapes. The farm-to-table diners we dined at was exceptional, and the expert locals made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'During my charming trip, I had the pleasure of savoring diverse landscapes. The farm-to-table diners we dined at was exceptional, and the passionate explorers made every moment unforgettable.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Top-notch security enhanced our peace of mind. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 41);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Each day was filled with savoring captivating landscapes. I felt secure at luxurious hotels and enjoyed memorable meals at hidden gems, while our adventure enthusiasts infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 79);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unwinding in cosy bed and breakfasts and adventuring the surroundings, I cherished the culinary delights at farm-to-table diners. Our cultural connoisseurs brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unwinding in mountain retreats and adventuring the surroundings, I cherished the culinary delights at rustic bistros. Our charming hosts brought unique perspectives to every experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort. Modern gym facilities ensured a satisfying workout. Attentive staff created a welcoming experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 23);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Charming ambiance added to the overall enjoyment. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 83);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Unwinding in luxurious hotels and unwinding the surroundings, I cherished the culinary delights at fusion food trucks. Our cultural connoisseurs brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 49);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'During my enchanting trip, I had the pleasure of savoring diverse landscapes. The seaside cafes we dined at was exceptional, and the knowledgeable guides made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 13);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Fast service contributed to a seamless meal. Varied menu options satisfied different palates. Convenient location enhanced our dining convenience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 26);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Each day was filled with relaxing captivating landscapes. I felt secure at modern hostels and enjoyed memorable meals at street food stalls, while our enthusiastic storytellers infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 44);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Top-notch security enhanced our peace of mind.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 40);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unwinding in seaside resorts and experiencing the surroundings, I cherished the culinary delights at gourmet restaurants. Our insightful companions brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Timely wake-up calls assisted our daily schedule. Convenient parking arrangements added to our comfort. Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 59);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'During my enchanting trip, I had the pleasure of discovering diverse landscapes. The street food stalls we dined at was exceptional, and the knowledgeable guides made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Top-notch security enhanced our peace of mind. Efficient management ensured a smooth stay. Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort. Modern gym facilities ensured a satisfying workout.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 11);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'During my delightful trip, I had the pleasure of exploring diverse landscapes. The ethnic cuisine spots we dined at was exceptional, and the expert locals made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From unwinding breathtaking sights to savoring exquisite cuisines at local eateries, my delightful trip was enriched by a cultural connoisseurs who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'From relaxing breathtaking sights to savoring exquisite cuisines at local eateries, my inspiring trip was enriched by a cultural connoisseurs who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Convenient location enhanced our dining convenience. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 74);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Top-notch security enhanced our peace of mind. Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 33);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Each day was filled with unwinding captivating landscapes. I felt secure at mountain retreats and enjoyed memorable meals at farm-to-table diners, while our friendly insiders infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Each day was filled with experiencing captivating landscapes. I felt secure at urban getaways and enjoyed memorable meals at rustic bistros, while our passionate explorers infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Each day was filled with immersing captivating landscapes. I felt secure at historic manors and enjoyed memorable meals at street food stalls, while our history buffs infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Modern gym facilities ensured a satisfying workout.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 37);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 13);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates. Attentive service created a memorable dining experience. Fast service contributed to a seamless meal.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 50);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'From immersing breathtaking sights to savoring exquisite cuisines at local eateries, my amazing trip was enriched by a passionate explorers who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Varied menu options satisfied different palates. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 94);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 31);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'During my breathtaking trip, I had the pleasure of immersing diverse landscapes. The ethnic cuisine spots we dined at was exceptional, and the charming hosts made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Presentation of dishes was visually appealing. Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 12);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'During my exquisite trip, I had the pleasure of exploring diverse landscapes. The street food stalls we dined at was exceptional, and the charming hosts made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Unwinding in cosy bed and breakfasts and enjoying the surroundings, I cherished the culinary delights at hidden gems. Our charming hosts brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'From adventuring breathtaking sights to savoring exquisite cuisines at gourmet restaurants, my captivating trip was enriched by a insightful companions who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'From unwinding breathtaking sights to savoring exquisite cuisines at hidden gems, my breathtaking trip was enriched by a charming hosts who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 51);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Through experiencing local culture, I marveled at amazing scenes. The cultural connoisseurss passion and knowledge added depth to my journey, as did the delectable offerings at ethnic cuisine spots.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Unwinding in luxurious hotels and unwinding the surroundings, I cherished the culinary delights at rustic bistros. Our expert locals brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience. Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 87);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'During my spectacular trip, I had the pleasure of adventuring diverse landscapes. The urban food markets we dined at was exceptional, and the knowledgeable guides made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Exceptional breakfast options set a positive tone. Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 47);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Delicious dishes delighted our taste buds. Varied menu options satisfied different palates. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 63);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'During my amazing trip, I had the pleasure of relaxing diverse landscapes. The ethnic cuisine spots we dined at was exceptional, and the knowledgeable guides made every moment unforgettable.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay. Exceptional breakfast options set a positive tone.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 73);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Fast service contributed to a seamless meal. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 29);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Convenient parking arrangements added to our comfort. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 90);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Unwinding in chic accommodations and discovering the surroundings, I cherished the culinary delights at hidden gems. Our adventure enthusiasts brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Attentive service created a memorable dining experience. Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 51);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 17);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Delicious dishes delighted our taste buds. Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates. Fast service contributed to a seamless meal. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 81);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unwinding in mountain retreats and relaxing the surroundings, I cherished the culinary delights at farm-to-table diners. Our insightful companions brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Through exploring local culture, I marveled at delightful scenes. The enthusiastic storytellerss passion and knowledge added depth to my journey, as did the delectable offerings at gourmet restaurants.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'From indulging breathtaking sights to savoring exquisite cuisines at street food stalls, my breathtaking trip was enriched by a cultural connoisseurs who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 15);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Through enjoying local culture, I marveled at breathtaking scenes. The insightful companionss passion and knowledge added depth to my journey, as did the delectable offerings at farm-to-table diners.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unwinding in quaint inns and exploring the surroundings, I cherished the culinary delights at seaside cafes. Our cultural connoisseurs brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 91);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unwinding in chic accommodations and experiencing the surroundings, I cherished the culinary delights at gourmet restaurants. Our insightful companions brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 31);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Timely wake-up calls assisted our daily schedule. Efficient management ensured a smooth stay. Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 44);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Charming ambiance added to the overall enjoyment. Presentation of dishes was visually appealing. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 97);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Varied menu options satisfied different palates. Delicious dishes delighted our taste buds. Presentation of dishes was visually appealing. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 72);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Through adventuring local culture, I marveled at unforgettable scenes. The knowledgeable guidess passion and knowledge added depth to my journey, as did the delectable offerings at gourmet restaurants.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Each day was filled with savoring captivating landscapes. I felt secure at boutique lodges and enjoyed memorable meals at fusion food trucks, while our adventure enthusiasts infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Attentive service created a memorable dining experience. Varied menu options satisfied different palates.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 64);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unwinding in mountain retreats and savoring the surroundings, I cherished the culinary delights at farm-to-table diners. Our passionate explorers brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Attentive staff created a welcoming experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 78);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 45);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Delicious dishes delighted our taste buds. Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Unique flavors and culinary creativity impressed us. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 93);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'From indulging breathtaking sights to savoring exquisite cuisines at local eateries, my charming trip was enriched by a passionate explorers who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'During my breathtaking trip, I had the pleasure of discovering diverse landscapes. The rustic bistros we dined at was exceptional, and the cultural connoisseurs made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Top-notch security enhanced our peace of mind. Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'From experiencing breathtaking sights to savoring exquisite cuisines at rustic bistros, my spectacular trip was enriched by a expert locals who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Through adventuring local culture, I marveled at exquisite scenes. The passionate explorerss passion and knowledge added depth to my journey, as did the delectable offerings at street food stalls.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort. Attentive staff created a welcoming experience. Top-notch security enhanced our peace of mind.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'During my captivating trip, I had the pleasure of savoring diverse landscapes. The fusion food trucks we dined at was exceptional, and the enthusiastic storytellers made every moment unforgettable.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Unwinding in chic accommodations and exploring the surroundings, I cherished the culinary delights at gourmet restaurants. Our insightful companions brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 26);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'From exploring breathtaking sights to savoring exquisite cuisines at urban food markets, my charming trip was enriched by a knowledgeable guides who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unwinding in seaside resorts and savoring the surroundings, I cherished the culinary delights at urban food markets. Our passionate explorers brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Each day was filled with indulging captivating landscapes. I felt secure at seaside resorts and enjoyed memorable meals at seaside cafes, while our passionate explorers infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 53);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 39);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds. Charming ambiance added to the overall enjoyment.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 76);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'From indulging breathtaking sights to savoring exquisite cuisines at urban food markets, my enchanting trip was enriched by a adventure enthusiasts who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Each day was filled with discovering captivating landscapes. I felt secure at urban getaways and enjoyed memorable meals at fusion food trucks, while our history buffs infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 19);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Each day was filled with savoring captivating landscapes. I felt secure at chic accommodations and enjoyed memorable meals at ethnic cuisine spots, while our passionate explorers infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Attentive service created a memorable dining experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 75);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'During my charming trip, I had the pleasure of experiencing diverse landscapes. The gourmet restaurants we dined at was exceptional, and the charming hosts made every moment unforgettable.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Fast service contributed to a seamless meal. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Unique flavors and culinary creativity impressed us.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 28);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Charming ambiance added to the overall enjoyment. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 22);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Varied menu options satisfied different palates. Convenient location enhanced our dining convenience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 20);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Exceptional breakfast options set a positive tone. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 94);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Unwinding in mountain retreats and savoring the surroundings, I cherished the culinary delights at street food stalls. Our adventure enthusiasts brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'During my exquisite trip, I had the pleasure of experiencing diverse landscapes. The rustic bistros we dined at was exceptional, and the history buffs made every moment unforgettable.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Each day was filled with discovering captivating landscapes. I felt secure at modern hostels and enjoyed memorable meals at seaside cafes, while our passionate explorers infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Convenient parking arrangements added to our comfort. Modern gym facilities ensured a satisfying workout. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 72);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Top-notch security enhanced our peace of mind. Modern gym facilities ensured a satisfying workout. Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 89);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates. Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 86);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'During my spectacular trip, I had the pleasure of enjoying diverse landscapes. The farm-to-table diners we dined at was exceptional, and the cultural connoisseurs made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 99);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 67);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Modern gym facilities ensured a satisfying workout. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 100);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Each day was filled with exploring captivating landscapes. I felt secure at chic accommodations and enjoyed memorable meals at local eateries, while our history buffs infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Each day was filled with relaxing captivating landscapes. I felt secure at chic accommodations and enjoyed memorable meals at hidden gems, while our cultural connoisseurs infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Each day was filled with savoring captivating landscapes. I felt secure at cosy bed and breakfasts and enjoyed memorable meals at urban food markets, while our expert locals infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Through discovering local culture, I marveled at spectacular scenes. The passionate explorerss passion and knowledge added depth to my journey, as did the delectable offerings at fusion food trucks.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 100);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Exceptional breakfast options set a positive tone. Attentive staff created a welcoming experience. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 14);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 51);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'From enjoying breathtaking sights to savoring exquisite cuisines at fusion food trucks, my breathtaking trip was enriched by a friendly insiders who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 91);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Each day was filled with indulging captivating landscapes. I felt secure at seaside resorts and enjoyed memorable meals at gourmet restaurants, while our cultural connoisseurs infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Presentation of dishes was visually appealing. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 65);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Through enjoying local culture, I marveled at enchanting scenes. The cultural connoisseurss passion and knowledge added depth to my journey, as did the delectable offerings at street food stalls.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 73);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Convenient parking arrangements added to our comfort. Exceptional breakfast options set a positive tone. Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 30);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Fast WiFi contributed to a connected stay. Top-notch security enhanced our peace of mind. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 82);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 61);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Through immersing local culture, I marveled at spectacular scenes. The enthusiastic storytellerss passion and knowledge added depth to my journey, as did the delectable offerings at street food stalls.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience. Varied menu options satisfied different palates.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 15);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Each day was filled with exploring captivating landscapes. I felt secure at quaint inns and enjoyed memorable meals at hidden gems, while our adventure enthusiasts infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 14);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Each day was filled with relaxing captivating landscapes. I felt secure at modern hostels and enjoyed memorable meals at ethnic cuisine spots, while our history buffs infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'From indulging breathtaking sights to savoring exquisite cuisines at street food stalls, my spectacular trip was enriched by a friendly insiders who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 70);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'During my enchanting trip, I had the pleasure of discovering diverse landscapes. The seaside cafes we dined at was exceptional, and the charming hosts made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Varied menu options satisfied different palates. Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 30);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 27);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Unique flavors and culinary creativity impressed us. Delicious dishes delighted our taste buds. Varied menu options satisfied different palates.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 67);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience. Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 57);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Exceptional breakfast options set a positive tone. Top-notch security enhanced our peace of mind. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 87);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'During my amazing trip, I had the pleasure of indulging diverse landscapes. The seaside cafes we dined at was exceptional, and the knowledgeable guides made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 31);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Unwinding in mountain retreats and indulging the surroundings, I cherished the culinary delights at fusion food trucks. Our charming hosts brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Exceptional breakfast options set a positive tone. Modern gym facilities ensured a satisfying workout. Timely wake-up calls assisted our daily schedule. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Exceptional breakfast options set a positive tone. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Top-notch security enhanced our peace of mind.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 18);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'During my enchanting trip, I had the pleasure of immersing diverse landscapes. The farm-to-table diners we dined at was exceptional, and the charming hosts made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'From adventuring breathtaking sights to savoring exquisite cuisines at ethnic cuisine spots, my charming trip was enriched by a expert locals who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 16);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Fast WiFi contributed to a connected stay. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 77);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Fast service contributed to a seamless meal. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 55);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Convenient parking arrangements added to our comfort. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 64);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Exceptional breakfast options set a positive tone. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 48);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience. Fast service contributed to a seamless meal.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 33);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Unwinding in chic accommodations and discovering the surroundings, I cherished the culinary delights at seaside cafes. Our adventure enthusiasts brought unique perspectives to every experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Fast WiFi contributed to a connected stay. Efficient management ensured a smooth stay. Modern gym facilities ensured a satisfying workout. Attentive staff created a welcoming experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 24);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'During my inspiring trip, I had the pleasure of savoring diverse landscapes. The rustic bistros we dined at was exceptional, and the insightful companions made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal. Delicious dishes delighted our taste buds. Presentation of dishes was visually appealing.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 59);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Unwinding in seaside resorts and enjoying the surroundings, I cherished the culinary delights at fusion food trucks. Our friendly insiders brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Exceptional breakfast options set a positive tone. Top-notch security enhanced our peace of mind. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 92);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Unwinding in historic manors and indulging the surroundings, I cherished the culinary delights at seaside cafes. Our charming hosts brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Convenient parking arrangements added to our comfort. Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 39);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Charming ambiance added to the overall enjoyment. Fast service contributed to a seamless meal. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Efficient management ensured a smooth stay. Exceptional breakfast options set a positive tone.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 75);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 59);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Through adventuring local culture, I marveled at amazing scenes. The insightful companionss passion and knowledge added depth to my journey, as did the delectable offerings at gourmet restaurants.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Each day was filled with exploring captivating landscapes. I felt secure at chic accommodations and enjoyed memorable meals at hidden gems, while our cultural connoisseurs infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Through indulging local culture, I marveled at exquisite scenes. The passionate explorerss passion and knowledge added depth to my journey, as did the delectable offerings at local eateries.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unwinding in modern hostels and indulging the surroundings, I cherished the culinary delights at urban food markets. Our enthusiastic storytellers brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 90);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Efficient management ensured a smooth stay. Exceptional breakfast options set a positive tone. Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 33);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 64);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort. Top-notch security enhanced our peace of mind. Timely wake-up calls assisted our daily schedule.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Attentive service created a memorable dining experience. Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 51);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 74);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Each day was filled with unwinding captivating landscapes. I felt secure at mountain retreats and enjoyed memorable meals at rustic bistros, while our adventure enthusiasts infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 28);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Unwinding in cosy bed and breakfasts and indulging the surroundings, I cherished the culinary delights at hidden gems. Our history buffs brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Through adventuring local culture, I marveled at breathtaking scenes. The passionate explorerss passion and knowledge added depth to my journey, as did the delectable offerings at rustic bistros.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Each day was filled with immersing captivating landscapes. I felt secure at chic accommodations and enjoyed memorable meals at fusion food trucks, while our cultural connoisseurs infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Presentation of dishes was visually appealing. Charming ambiance added to the overall enjoyment. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 29);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Unwinding in historic manors and experiencing the surroundings, I cherished the culinary delights at street food stalls. Our expert locals brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Fast WiFi contributed to a connected stay. Top-notch security enhanced our peace of mind. Efficient management ensured a smooth stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 62);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Timely wake-up calls assisted our daily schedule. Convenient parking arrangements added to our comfort. Exceptional breakfast options set a positive tone. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 82);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort. Exceptional breakfast options set a positive tone. Modern gym facilities ensured a satisfying workout.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 27);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Top-notch security enhanced our peace of mind. Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 97);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Convenient location enhanced our dining convenience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 20);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort. Modern gym facilities ensured a satisfying workout. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 13);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 70);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Each day was filled with exploring captivating landscapes. I felt secure at cosy bed and breakfasts and enjoyed memorable meals at street food stalls, while our expert locals infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience. Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 91);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Exceptional breakfast options set a positive tone. Top-notch security enhanced our peace of mind. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 56);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Each day was filled with experiencing captivating landscapes. I felt secure at luxurious hotels and enjoyed memorable meals at farm-to-table diners, while our friendly insiders infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Varied menu options satisfied different palates. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Presentation of dishes was visually appealing. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 84);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 65);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Each day was filled with exploring captivating landscapes. I felt secure at quaint inns and enjoyed memorable meals at farm-to-table diners, while our passionate explorers infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Varied menu options satisfied different palates. Fast service contributed to a seamless meal. Charming ambiance added to the overall enjoyment. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 15);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds. Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 80);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Unwinding in luxurious hotels and enjoying the surroundings, I cherished the culinary delights at local eateries. Our expert locals brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unwinding in boutique lodges and adventuring the surroundings, I cherished the culinary delights at urban food markets. Our knowledgeable guides brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Fast WiFi contributed to a connected stay. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 60);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Modern gym facilities ensured a satisfying workout. Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 95);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 99);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Unwinding in luxurious hotels and exploring the surroundings, I cherished the culinary delights at fusion food trucks. Our charming hosts brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Charming ambiance added to the overall enjoyment. Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Unique flavors and culinary creativity impressed us. Attentive service created a memorable dining experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 52);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Each day was filled with unwinding captivating landscapes. I felt secure at urban getaways and enjoyed memorable meals at rustic bistros, while our charming hosts infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 55);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 68);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Charming ambiance added to the overall enjoyment. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 20);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule. Top-notch security enhanced our peace of mind.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 98);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 57);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 46);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Convenient parking arrangements added to our comfort. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 26);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule. Efficient management ensured a smooth stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 24);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 71);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unique flavors and culinary creativity impressed us. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 28);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Exceptional breakfast options set a positive tone. Convenient parking arrangements added to our comfort. Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 14);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Through experiencing local culture, I marveled at spectacular scenes. The passionate explorerss passion and knowledge added depth to my journey, as did the delectable offerings at street food stalls.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Timely wake-up calls assisted our daily schedule. Efficient management ensured a smooth stay. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 78);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Fast WiFi contributed to a connected stay. Efficient management ensured a smooth stay. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 88);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Convenient location enhanced our dining convenience. Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Charming ambiance added to the overall enjoyment.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 16);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Unwinding in chic accommodations and savoring the surroundings, I cherished the culinary delights at seaside cafes. Our adventure enthusiasts brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Delicious dishes delighted our taste buds. Attentive service created a memorable dining experience. Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates. Fast service contributed to a seamless meal.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 96);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 52);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 78);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Through unwinding local culture, I marveled at amazing scenes. The friendly insiderss passion and knowledge added depth to my journey, as did the delectable offerings at urban food markets.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 15);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Efficient management ensured a smooth stay. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Modern gym facilities ensured a satisfying workout.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Each day was filled with enjoying captivating landscapes. I felt secure at modern hostels and enjoyed memorable meals at urban food markets, while our passionate explorers infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 27);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From immersing breathtaking sights to savoring exquisite cuisines at hidden gems, my spectacular trip was enriched by a charming hosts who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unique flavors and culinary creativity impressed us. Delicious dishes delighted our taste buds. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 63);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Top-notch security enhanced our peace of mind. Efficient management ensured a smooth stay. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 52);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Presentation of dishes was visually appealing. Convenient location enhanced our dining convenience. Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Delicious dishes delighted our taste buds.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 64);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'During my spectacular trip, I had the pleasure of savoring diverse landscapes. The rustic bistros we dined at was exceptional, and the adventure enthusiasts made every moment unforgettable.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Varied menu options satisfied different palates. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Convenient location enhanced our dining convenience. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 90);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Through adventuring local culture, I marveled at spectacular scenes. The history buffss passion and knowledge added depth to my journey, as did the delectable offerings at rustic bistros.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay. Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 90);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'During my spectacular trip, I had the pleasure of adventuring diverse landscapes. The seaside cafes we dined at was exceptional, and the friendly insiders made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Each day was filled with relaxing captivating landscapes. I felt secure at cosy bed and breakfasts and enjoyed memorable meals at street food stalls, while our insightful companions infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 68);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Exceptional breakfast options set a positive tone. Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Top-notch security enhanced our peace of mind.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 12);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Varied menu options satisfied different palates. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment. Unique flavors and culinary creativity impressed us. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 21);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 59);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 38);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Modern gym facilities ensured a satisfying workout. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 97);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Modern gym facilities ensured a satisfying workout. Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 15);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Each day was filled with relaxing captivating landscapes. I felt secure at boutique lodges and enjoyed memorable meals at local eateries, while our cultural connoisseurs infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Unwinding in seaside resorts and unwinding the surroundings, I cherished the culinary delights at seaside cafes. Our insightful companions brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'During my amazing trip, I had the pleasure of adventuring diverse landscapes. The farm-to-table diners we dined at was exceptional, and the expert locals made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 56);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Attentive service created a memorable dining experience. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 99);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Varied menu options satisfied different palates. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Each day was filled with savoring captivating landscapes. I felt secure at cosy bed and breakfasts and enjoyed memorable meals at hidden gems, while our insightful companions infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Modern gym facilities ensured a satisfying workout. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Timely wake-up calls assisted our daily schedule. Exceptional breakfast options set a positive tone.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Each day was filled with exploring captivating landscapes. I felt secure at cosy bed and breakfasts and enjoyed memorable meals at seaside cafes, while our history buffs infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Unwinding in luxurious hotels and savoring the surroundings, I cherished the culinary delights at street food stalls. Our knowledgeable guides brought unique perspectives to every experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From unwinding breathtaking sights to savoring exquisite cuisines at rustic bistros, my breathtaking trip was enriched by a history buffs who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From immersing breathtaking sights to savoring exquisite cuisines at hidden gems, my exquisite trip was enriched by a enthusiastic storytellers who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Charming ambiance added to the overall enjoyment. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 46);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Through savoring local culture, I marveled at enchanting scenes. The expert localss passion and knowledge added depth to my journey, as did the delectable offerings at street food stalls.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Fast service contributed to a seamless meal. Delicious dishes delighted our taste buds. Presentation of dishes was visually appealing.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 24);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Exceptional breakfast options set a positive tone. Convenient parking arrangements added to our comfort.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'From discovering breathtaking sights to savoring exquisite cuisines at fusion food trucks, my delightful trip was enriched by a adventure enthusiasts who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Attentive staff created a welcoming experience. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule. Top-notch security enhanced our peace of mind. Convenient parking arrangements added to our comfort.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 71);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Convenient parking arrangements added to our comfort.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Convenient location enhanced our dining convenience. Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 53);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From discovering breathtaking sights to savoring exquisite cuisines at ethnic cuisine spots, my amazing trip was enriched by a passionate explorers who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Attentive service created a memorable dining experience. Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience. Fast service contributed to a seamless meal.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 96);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Delicious dishes delighted our taste buds. Fast service contributed to a seamless meal. Varied menu options satisfied different palates.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 42);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience. Attentive service created a memorable dining experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 51);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Each day was filled with savoring captivating landscapes. I felt secure at mountain retreats and enjoyed memorable meals at gourmet restaurants, while our knowledgeable guides infused the trip with cultural richness.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unwinding in mountain retreats and indulging the surroundings, I cherished the culinary delights at ethnic cuisine spots. Our enthusiastic storytellers brought unique perspectives to every experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'Top-notch security enhanced our peace of mind. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 50);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 31);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Through exploring local culture, I marveled at unforgettable scenes. The adventure enthusiastss passion and knowledge added depth to my journey, as did the delectable offerings at fusion food trucks.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Charming ambiance added to the overall enjoyment. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 70);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'From unwinding breathtaking sights to savoring exquisite cuisines at street food stalls, my spectacular trip was enriched by a charming hosts who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Each day was filled with savoring captivating landscapes. I felt secure at luxurious hotels and enjoyed memorable meals at fusion food trucks, while our history buffs infused the trip with cultural richness.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 7);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Unwinding in luxurious hotels and enjoying the surroundings, I cherished the culinary delights at seaside cafes. Our adventure enthusiasts brought unique perspectives to every experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Fast service contributed to a seamless meal. Delicious dishes delighted our taste buds. Presentation of dishes was visually appealing.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 89);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 70);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Convenient location enhanced our dining convenience. Delicious dishes delighted our taste buds. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience. Charming ambiance added to the overall enjoyment.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 40);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Attentive service created a memorable dining experience. Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 48);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Top-notch security enhanced our peace of mind. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 67);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (2, 'During my unforgettable trip, I had the pleasure of unwinding diverse landscapes. The hidden gems we dined at was exceptional, and the cultural connoisseurs made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 19);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal. Attentive service created a memorable dining experience. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 14);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Fast service contributed to a seamless meal. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 63);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Attentive staff created a welcoming experience. Top-notch security enhanced our peace of mind. Fast WiFi contributed to a connected stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 93);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Through experiencing local culture, I marveled at unforgettable scenes. The insightful companionss passion and knowledge added depth to my journey, as did the delectable offerings at street food stalls.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay. Top-notch security enhanced our peace of mind.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 18);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 96);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Delicious dishes delighted our taste buds. Varied menu options satisfied different palates. Fast service contributed to a seamless meal.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 21);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 20);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Unwinding in chic accommodations and relaxing the surroundings, I cherished the culinary delights at farm-to-table diners. Our expert locals brought unique perspectives to every experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Unwinding in urban getaways and discovering the surroundings, I cherished the culinary delights at seaside cafes. Our enthusiastic storytellers brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Attentive staff created a welcoming experience. Efficient management ensured a smooth stay. Fast WiFi contributed to a connected stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 59);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'From enjoying breathtaking sights to savoring exquisite cuisines at rustic bistros, my exquisite trip was enriched by a charming hosts who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 4);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From savoring breathtaking sights to savoring exquisite cuisines at seaside cafes, my enchanting trip was enriched by a knowledgeable guides who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Exceptional breakfast options set a positive tone. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 83);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'During my unforgettable trip, I had the pleasure of enjoying diverse landscapes. The gourmet restaurants we dined at was exceptional, and the charming hosts made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 1);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Efficient management ensured a smooth stay. Modern gym facilities ensured a satisfying workout. Exceptional breakfast options set a positive tone. Attentive staff created a welcoming experience. Top-notch security enhanced our peace of mind.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 17);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Charming ambiance added to the overall enjoyment. Presentation of dishes was visually appealing. Delicious dishes delighted our taste buds.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 71);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'During my inspiring trip, I had the pleasure of relaxing diverse landscapes. The local eateries we dined at was exceptional, and the charming hosts made every moment unforgettable.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience. Presentation of dishes was visually appealing.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 26);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Varied menu options satisfied different palates. Unique flavors and culinary creativity impressed us. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 93);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'From relaxing breathtaking sights to savoring exquisite cuisines at seaside cafes, my spectacular trip was enriched by a knowledgeable guides who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Fast service contributed to a seamless meal. Convenient location enhanced our dining convenience. Unique flavors and culinary creativity impressed us. Varied menu options satisfied different palates. Attentive service created a memorable dining experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 30);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Convenient location enhanced our dining convenience. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds. Fast service contributed to a seamless meal.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 91);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Convenient parking arrangements added to our comfort.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 98);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Fast WiFi contributed to a connected stay. Timely wake-up calls assisted our daily schedule. Modern gym facilities ensured a satisfying workout. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 59);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Through exploring local culture, I marveled at spectacular scenes. The adventure enthusiastss passion and knowledge added depth to my journey, as did the delectable offerings at gourmet restaurants.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 6);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'From experiencing breathtaking sights to savoring exquisite cuisines at ethnic cuisine spots, my unforgettable trip was enriched by a history buffs who shared fascinating insights.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'From immersing breathtaking sights to savoring exquisite cuisines at gourmet restaurants, my enchanting trip was enriched by a cultural connoisseurs who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 10);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Efficient management ensured a smooth stay. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 52);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Convenient parking arrangements added to our comfort. Fast WiFi contributed to a connected stay. Modern gym facilities ensured a satisfying workout. Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 73);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Unique flavors and culinary creativity impressed us. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience. Charming ambiance added to the overall enjoyment.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 17);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Through enjoying local culture, I marveled at inspiring scenes. The expert localss passion and knowledge added depth to my journey, as did the delectable offerings at rustic bistros.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment. Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds. Convenient location enhanced our dining convenience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 76);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Unwinding in boutique lodges and enjoying the surroundings, I cherished the culinary delights at street food stalls. Our friendly insiders brought unique perspectives to every experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Presentation of dishes was visually appealing. Attentive service created a memorable dining experience. Delicious dishes delighted our taste buds. Unique flavors and culinary creativity impressed us. Charming ambiance added to the overall enjoyment.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 24);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Attentive service created a memorable dining experience. Unique flavors and culinary creativity impressed us. Fast service contributed to a seamless meal.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 53);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Charming ambiance added to the overall enjoyment. Varied menu options satisfied different palates. Convenient location enhanced our dining convenience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Convenient location enhanced our dining convenience. Delicious dishes delighted our taste buds. Varied menu options satisfied different palates.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 49);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Unwinding in chic accommodations and exploring the surroundings, I cherished the culinary delights at local eateries. Our expert locals brought unique perspectives to every experience.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 8);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (10, 'Convenient parking arrangements added to our comfort. Modern gym facilities ensured a satisfying workout. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 58);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'From unwinding breathtaking sights to savoring exquisite cuisines at seaside cafes, my exquisite trip was enriched by a expert locals who shared fascinating insights.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'During my amazing trip, I had the pleasure of exploring diverse landscapes. The hidden gems we dined at was exceptional, and the insightful companions made every moment unforgettable.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 9);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (1, 'Attentive staff created a welcoming experience. Modern gym facilities ensured a satisfying workout. Convenient parking arrangements added to our comfort. Timely wake-up calls assisted our daily schedule.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 31);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (6, 'Each day was filled with relaxing captivating landscapes. I felt secure at boutique lodges and enjoyed memorable meals at seaside cafes, while our insightful companions infused the trip with cultural richness.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Presentation of dishes was visually appealing. Fast service contributed to a seamless meal. Unique flavors and culinary creativity impressed us.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 91);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (7, 'Timely wake-up calls assisted our daily schedule. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort. Top-notch security enhanced our peace of mind. Attentive staff created a welcoming experience.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 33);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'From experiencing breathtaking sights to savoring exquisite cuisines at seaside cafes, my spectacular trip was enriched by a charming hosts who shared fascinating insights.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (9, 'Top-notch security enhanced our peace of mind. Modern gym facilities ensured a satisfying workout. Fast WiFi contributed to a connected stay. Attentive staff created a welcoming experience. Convenient parking arrangements added to our comfort.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 15);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Charming ambiance added to the overall enjoyment. Presentation of dishes was visually appealing. Varied menu options satisfied different palates. Delicious dishes delighted our taste buds.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 78);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (5, 'Through exploring local culture, I marveled at spectacular scenes. The knowledgeable guidess passion and knowledge added depth to my journey, as did the delectable offerings at seaside cafes.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 3);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Timely wake-up calls assisted our daily schedule. Attentive staff created a welcoming experience. Fast WiFi contributed to a connected stay. Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay.', 4, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 70);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Through enjoying local culture, I marveled at exquisite scenes. The charming hostss passion and knowledge added depth to my journey, as did the delectable offerings at hidden gems.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO tripReviews(review_id, trip_id) VALUES(l_id, 5);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Timely wake-up calls assisted our daily schedule. Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay. Exceptional breakfast options set a positive tone.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 45);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (8, 'Convenient parking arrangements added to our comfort. Efficient management ensured a smooth stay. Top-notch security enhanced our peace of mind. Exceptional breakfast options set a positive tone. Timely wake-up calls assisted our daily schedule.', 3, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO hotelReviews(review_id, hotel_id) VALUES(l_id, 31);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (3, 'Fast service contributed to a seamless meal. Presentation of dishes was visually appealing. Attentive service created a memorable dining experience.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 2);
END;
/

    

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES (4, 'Convenient location enhanced our dining convenience. Varied menu options satisfied different palates. Charming ambiance added to the overall enjoyment.', 5, 'dummy.jpg')
    RETURNING review_id INTO l_id;
    INSERT INTO restaurantReviews(review_id, restaurant_id) VALUES(l_id, 23);
END;
/

    

SELECT * FROM USERS;

