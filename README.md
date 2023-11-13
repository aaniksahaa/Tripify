# Tripify

# Introduction

Discover, plan, and explore effortlessly with Tripify: the ultimate travel platform. Curate your ideal journey, connect with fellow adventurers, and unlock AI-powered trip guides. Elevate your travel experience with seamless bookings and personalized recommendations. Your gateway to limitless exploration.

# Video Demonstration

https://www.youtube.com/watch?v=s3t8R-3Z094

# Contents

## 1. [How to Run](#how-to-run-1)
## 2. [Frontend - Demonstration](#tripify---frontend)
## 3. [Backend - API Documentation](#tripify---backend)

# How to Run

## Setting Up The Schema

1. Go to sqlplus and login with system username and password

2. Run the following four commands sequentially in sqlplus
```sql
CREATE USER c##tripify IDENTIFIED BY tripify;    
GRANT CONNECT, RESOURCE, DBA TO c##tripify;    
GRANT CREATE SESSION TO c##tripify;    
GRANT UNLIMITED TABLESPACE TO c##tripify;    
```
3. type disconnect
4. Now close sqlplus
5. Again go to sqlplus and login with system username and password
6. type conn
7. Enter username: c##tripify
8. Enter password: tripify
9. Just for testing, create this table,
```sql
CREATE TABLE Hotels (
 id INTEGER PRIMARY KEY,
 name VARCHAR(20)
);
```
10. Insert this data
```sql
INSERT INTO Hotels VALUES(1,'Mountain View');
```
11. Test whether the data have been inserted properly.
```sql
SELECT * FROM HOTELS;
```
12. Now drop that test table
```sql
DROP TABLE HOTELS;
```
13. Close sqlplus
14. Go to Navicat, New Oracle connection, type above username and password in 
the place of 'hr' and 'hr' that we previously wrote for setting up HR schema.

16. Now Set up the database as per the following specification.
```
Go to the directory  -->  backend/sqldump/master_dump
If your are setting the database for the first time, run in Navicat  -->  dump_first_time.sql
Otherwise, run in Navicat -->  dump_any_time_later.sql
```
17. For running the queries, just create query files of same names in Navicat and copy the content.

## Setting Up The Project Directory

#### 1. First clone the repository.
#### 2. Open the Directory on VS Code and Open a new terminal. Click split terminal so that you may run frontend and backend both with convenience.
#### 3. On one terminal, head over to the backend, install the dependencies and run the server.
```
cd backend
```
```
npm i
```
```
npm start
```
#### 4. On the other terminal, head over to the frontend, install the dependencies and run the client.
```
cd frontend
```
```
npm i
```
```
npm run dev
```
#### 5. Click on the localhost link that pops up on the client terminal.
#### 6. You may also test the API separately on Postman or anything similar.   

![Screenshot (115)](https://github.com/aaniksahaa/Tripify/assets/63545621/6328d778-7d29-4fb5-b8fa-83f15ade4d2e)

## Data Generation (Optional)

1. Go to the directory ``backend/data_generators``
2. First Run ``master_generator.py``
3. Then run ``sql_generator.py``
4. The generated ``large_insert.sql`` file will be in the directory ``backend/data_generators/sql``
5. You may control data generation parameters in ``config.py``

# Tripify - Frontend

## Demonstration:

## 1. Hotels Dashboard

![Screenshot (111)](https://github.com/aaniksahaa/Tripify/assets/63545621/746fd124-0870-4def-a88a-b4599988c033)

## 2. Hotel Viewer ( Dark Mode )

![Screenshot (114)](https://github.com/aaniksahaa/Tripify/assets/63545621/869ae9c7-5e93-412d-bbb5-9f285a278169)

## 3. User Dashboard ( Dark Mode )

![Screenshot (112)](https://github.com/aaniksahaa/Tripify/assets/63545621/24b2c4a0-4229-4c9e-b653-725efb6baf92)


# Tripify - Backend 

# Tripify API Documentation

# API Endpoints
The API Endpoints belong to  major routes. The routes are as follows:   

## [Login](#login-1)
## [User](#user-1)
## [City](#city-1)
## [Destination](#destination-1)
## [Activity](#activity-1)
## [Trip](#trip-1)
## [Hotel](#hotel-1)
## [Restaurant](#restaurant-1)
## [Flight](#flight-1)
## [Review](#review-1)
## [TripBooking](#tripbooking-1)
## [Post](#post-1)
## [Comment](#comment-1)
## [Feed](#feed-1)
## [Stat](#stat-1)
## [Chat](#chat-1)

The respective API endpoints are as follows:    

# Login

## a. Login with username and password

Endpoint URL:    
```
POST
```
```
/api/v1/login
```  
Request Body: 
```json
{
    "username": "aaniksahaa",
    "password": "123"
}
```
Example Response:    
```json
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFhbmlrc2FoYWEiLCJpZCI6MSwiaWF0IjoxNjkxMDk1MjQ4fQ.40HbWfyXnqH9-rZ-bscoRykL0wJW_qDuyaAE-6EkMDw",
    "user": {
        "user_id": 1,
        "username": "aaniksahaa",
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

# User

## a. Get Single User by user_id

Endpoint URL:    
```
GET
```
```
/api/v1/user/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "email": "abc@gmail.com",
    "password_hash": "123",
    "role": "client",
    "name": "Anik Saha",
    "bio": "Little Coder",
    "city_id": 1,
    "facebook_url": "facebook.com/abc",
    "twitter_url": "twitter.com/abc",
    "instagram_url": "instagram.com/abc",
    "profile_picture": "dummy.jpg",
    "dob": "2002-09-16T18:00:00.000Z",
    "registration_date": "2023-08-01T10:46:19.000Z",
    "status": "active",
    "created_on": "2023-08-01T10:46:19.000Z",
    "last_updated_on": "2023-08-01T10:46:19.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## b. Get Users by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/user?name=e&city_id=1,2,3&min_age=5&max_age=92&page=1&per_page=3&orderby=name&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "user_id": 7,
        "email": "12@example.com",
        "password_hash": "hashed_password",
        "role": "user",
        "name": "Newton",
        "bio": "I love traveling and exploring new places.",
        "city_id": 1,
        "facebook_url": "https://www.facebook.com/johndoe",
        "twitter_url": "https://twitter.com/johndoe",
        "instagram_url": "https://www.instagram.com/johndoe",
        "profile_picture": "https://example.com/profile_picture.jpg",
        "dob": "2010-05-14T18:00:00.000Z",
        "registration_date": "2023-08-01T12:25:51.000Z",
        "status": "active",
        "created_on": "2023-08-01T12:25:51.000Z",
        "last_updated_on": "2023-08-01T12:25:51.000Z"
    },
    {
        "user_id": 1,
        "email": "changed_email@example.com",
        "password_hash": "hashed_password",
        "role": "user",
        "name": "John Doe",
        "bio": "I love traveling and exploring new places.",
        "city_id": 1,
        "facebook_url": "https://www.facebook.com/johndoe",
        "twitter_url": "https://twitter.com/johndoe",
        "instagram_url": "https://www.instagram.com/johndoe",
        "profile_picture": "https://example.com/profile_picture.jpg",
        "dob": "1990-05-14T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T11:46:58.000Z"
    },
    {
        "user_id": 2,
        "email": "xyz@gmail.com",
        "password_hash": "456",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T10:46:19.000Z"
    }
]
```

## c. Create New User
### These five attributes are mandatory
Endpoint URL: 
```
POST
```
```
/api/v1/user/
```  
Request Body:    
```json
{
    "username": "john_buet",
    "email": "example@example.com",
    "password": "123",
    "name": "John Doe",
    "dob": "1990-05-15"
}
```
Example Response:  
```json
{
    "user_id": 11,
    "username": "john_buet",
    "email": "example@example.com",
    "role": "client",
    "name": "John Doe",
    "bio": "Hey! I am using Tripify",
    "city_id": 0,
    "facebook_url": "https://www.facebook.com/leomessi",
    "twitter_url": "https://twitter.com/imessi",
    "instagram_url": "https://www.instagram.com/leomessi",
    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
    "dob": "1990-05-14T18:00:00.000Z",
    "registration_date": "2023-08-03T08:37:53.000Z",
    "status": "active",
    "created_on": "2023-08-03T08:37:53.000Z",
    "last_updated_on": "2023-08-03T08:37:53.000Z",
    "city": {
        "city_id": 0,
        "name": "Dummy",
        "country_name": "Dummy",
        "population": 0,
        "weather_type": "sunny"
    }
}
```
## d. Update a User
### If a user is also a guide, just include the substring 'guide' in his role...
### Here all attributes are mandatory except for password, you may include or omit the password from the request body
Endpoint URL: 
```
PUT
```
```
/api/v1/user/
```  
Request Body:    
```json
{
    "user_id":10,
    "username": "cooljohn",
    "password": "my_new_password",
    "email": "changed@example.com",
    "role": "user,guide,new",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-15"
}
```
Example Response:  
```json
{
    "user_id": 10,
    "username": "cooljohn",
    "email": "changed@example.com",
    "role": "user,guide,new",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-14T18:00:00.000Z",
    "registration_date": "2023-08-03T08:12:59.000Z",
    "status": "active",
    "created_on": "2023-08-03T08:12:59.000Z",
    "last_updated_on": "2023-08-03T08:35:06.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## e. Delete a User ( Soft Delete )

Endpoint URL:  
```
DELETE
```
```
api/v1/user/4
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 4,
    "email": "example@example.com",
    "password_hash": "hashed_password",
    "role": "user",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-14T18:00:00.000Z",
    "registration_date": "2023-08-01T11:37:45.000Z",
    "status": "active",
    "created_on": "2023-08-01T11:37:45.000Z",
    "last_updated_on": "2023-08-01T11:37:45.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## f. Delete a User ( Permanent Delete )

Endpoint URL:
```
DELETE
```
```
/api/v1/user/danger/5
``` 
Request Body: `None`    
Example Response:    
```json
{
    "user_id": "5",
    "status": "permanently deleted"
}
```

## g. Following a User
Endpoint URL: 
```
POST
```
```
/api/v1/user/2/follow/1
```  
Request Body:    
```
None
```
Example Response:  
```json
{
    "follower_id": 2,
    "followee_id": 1,
    "since_date": "2023-08-02T17:22:34.000Z"
}
```

## h. Unfollowing a User
Endpoint URL: 
```
DELETE
```
```
/api/v1/user/2/follow/1
```  
Request Body:    
```
None
```
Example Response:  
```json
{
    "follower_id": "2",
    "followee_id": "1",
    "message": "unfollowed"
}
```
## i. Making an object Favorite
Endpoint URL: 
```
POST
```
```
/api/v1/user/1/favorite/2
```  
Request Body:    
```
{
    "object_type": "hotel"
}
```
Example Response:  
```json
{
    "user_id": 1,
    "object_type": "hotel",
    "object_id": 2,
    "added_on": "2023-08-03T21:46:15.000Z"
}
```

## j. Removing Favorite from an object
Endpoint URL: 
```
DELETE
```
```
/api/v1/user/1/favorite/2
```  
Request Body:    
```
{
    "object_type": "hotel"
}
```
Example Response:  
```json
{
    "user_id": 1,
    "object_type": "hotel",
    "object_id": 2,
    "added_on": "2023-08-03T21:46:15.000Z"
}
```

## k. Get User Profile

Endpoint URL:    
```
GET
```
```
/api/v1/user/1/profile?page=1&per_page=3
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "username": "aaniksahaa",
    "email": "abc@gmail.com",
    "role": "client",
    "name": "Anik Saha",
    "bio": "Little Coder",
    "city_id": 1,
    "facebook_url": "facebook.com/abc",
    "twitter_url": "twitter.com/abc",
    "instagram_url": "instagram.com/abc",
    "profile_picture": "dummy.jpg",
    "dob": "2002-09-16T18:00:00.000Z",
    "registration_date": "2023-08-25T08:29:22.000Z",
    "status": "active",
    "created_on": "2023-08-25T08:29:22.000Z",
    "last_updated_on": "2023-08-25T08:29:22.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    },
    "follower_count": 9,
    "followee_count": 9,
    "post_count": 6,
    "review_count": 81,
    "hotels_created": [],
    "restaurants_created": [],
    "trips_created": [
        {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Summer Vacation in Paris",
            "description": "Enjoy the charm of Paris in summer",
            "image_url": "paris_summer.jpg",
            "total_price": 212557,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-25T08:29:32.000Z",
            "last_updated_on": "2023-08-25T08:29:32.000Z",
            "deleted_on": null,
            "rating_info": {
                "rating_1": 0,
                "rating_2": 13,
                "rating_3": 5,
                "rating_4": 9,
                "rating_5": 11,
                "rating_avg": 3.47
            },
            "images": null
        },
        {
            "trip_id": 4,
            "from_city_id": 11,
            "to_city_id": 12,
            "from_city_name": "Gazipur",
            "to_city_name": "Feni",
            "name": "Coastal Odyssey",
            "description": "Embark on a thrilling journey of discovery and relaxation, exploring both natures wonders and vibrant city life.",
            "image_url": "dummy.jpg",
            "total_price": 69005,
            "start_date": "2023-08-15T18:00:00.000Z",
            "end_date": "2023-09-01T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-25T08:29:32.000Z",
            "last_updated_on": "2023-08-25T08:29:32.000Z",
            "deleted_on": null,
            "rating_info": {
                "rating_1": 0,
                "rating_2": 6,
                "rating_3": 12,
                "rating_4": 8,
                "rating_5": 3,
                "rating_avg": 3.28
            },
            "images": null
        },
        {
            "trip_id": 5,
            "from_city_id": 15,
            "to_city_id": 4,
            "from_city_name": "Bandarban",
            "to_city_name": "Rajshahi",
            "name": "Historical Journey",
            "description": "Get ready for an eco-friendly escapade, where youll connect with nature and support sustainable tourism.",
            "image_url": "dummy.jpg",
            "total_price": 118210,
            "start_date": "2023-08-17T18:00:00.000Z",
            "end_date": "2023-08-29T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-25T08:29:32.000Z",
            "last_updated_on": "2023-08-25T08:29:32.000Z",
            "deleted_on": null,
            "rating_info": {
                "rating_1": 0,
                "rating_2": 16,
                "rating_3": 9,
                "rating_4": 5,
                "rating_5": 10,
                "rating_avg": 3.23
            },
            "images": null
        }
    ],
    "reviews_created": [
        {
            "review_id": 935,
            "user_id": 1,
            "posting_date": "2023-08-25T08:29:37.000Z",
            "description": "Friendly staff went above and beyond to serve us. Exquisite flavors danced on our tongues. Elegant decor created a sophisticated atmosphere. Fresh ingredients shined in every bite.",
            "rating": 2,
            "image_url": "dummy.jpg",
            "upvote_count": 0,
            "object": {
                "object_type": "restaurant",
                "object_id": 10
            },
            "user": {
                "user_id": 1,
                "username": "aaniksahaa",
                "email": "abc@gmail.com",
                "role": "client",
                "name": "Anik Saha",
                "bio": "Little Coder",
                "city_id": 1,
                "facebook_url": "facebook.com/abc",
                "twitter_url": "twitter.com/abc",
                "instagram_url": "instagram.com/abc",
                "profile_picture": "dummy.jpg",
                "dob": "2002-09-16T18:00:00.000Z",
                "registration_date": "2023-08-25T08:29:22.000Z",
                "status": "active",
                "created_on": "2023-08-25T08:29:22.000Z",
                "last_updated_on": "2023-08-25T08:29:22.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "review_id": 975,
            "user_id": 1,
            "posting_date": "2023-08-25T08:29:37.000Z",
            "description": "From relaxing breathtaking sights to savoring exquisite cuisines at seaside cafes, my delightful trip was enriched by a passionate explorers who shared fascinating insights.",
            "rating": 4,
            "image_url": "dummy.jpg",
            "upvote_count": 0,
            "object": {
                "object_type": "trip",
                "object_id": 6
            },
            "user": {
                "user_id": 1,
                "username": "aaniksahaa",
                "email": "abc@gmail.com",
                "role": "client",
                "name": "Anik Saha",
                "bio": "Little Coder",
                "city_id": 1,
                "facebook_url": "facebook.com/abc",
                "twitter_url": "twitter.com/abc",
                "instagram_url": "instagram.com/abc",
                "profile_picture": "dummy.jpg",
                "dob": "2002-09-16T18:00:00.000Z",
                "registration_date": "2023-08-25T08:29:22.000Z",
                "status": "active",
                "created_on": "2023-08-25T08:29:22.000Z",
                "last_updated_on": "2023-08-25T08:29:22.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "review_id": 971,
            "user_id": 1,
            "posting_date": "2023-08-25T08:29:37.000Z",
            "description": "Indulgent desserts provided a perfect ending. Mouthwatering aromas greeted us at the entrance. Inventive plating made each dish a work of art. Thoughtful attention to dietary needs was appreciated.",
            "rating": 4,
            "image_url": "dummy.jpg",
            "upvote_count": 0,
            "object": {
                "object_type": "restaurant",
                "object_id": 1
            },
            "user": {
                "user_id": 1,
                "username": "aaniksahaa",
                "email": "abc@gmail.com",
                "role": "client",
                "name": "Anik Saha",
                "bio": "Little Coder",
                "city_id": 1,
                "facebook_url": "facebook.com/abc",
                "twitter_url": "twitter.com/abc",
                "instagram_url": "instagram.com/abc",
                "profile_picture": "dummy.jpg",
                "dob": "2002-09-16T18:00:00.000Z",
                "registration_date": "2023-08-25T08:29:22.000Z",
                "status": "active",
                "created_on": "2023-08-25T08:29:22.000Z",
                "last_updated_on": "2023-08-25T08:29:22.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        }
    ],
    "flights_created": [],
    "trip_bookings_created": [],
    "activities_created": [],
    "destinations_created": [],
    "posts_created": [
        {
            "post_id": 6,
            "user_id": 1,
            "posting_date": "2023-08-25T08:54:31.000Z",
            "description": "Amazing Post",
            "image_url": "amazing.jpg",
            "images": [
                "z.jpg",
                "x.jpg",
                "y.jpg"
            ],
            "comments": [],
            "reacts": []
        },
        {
            "post_id": 5,
            "user_id": 1,
            "posting_date": "2023-08-25T08:54:00.000Z",
            "description": "Amazing Post",
            "image_url": "amazing.jpg",
            "images": [
                "a.jpg",
                "b.jpg"
            ],
            "comments": [],
            "reacts": []
        },
        {
            "post_id": 4,
            "user_id": 1,
            "posting_date": "2023-08-25T08:53:50.000Z",
            "description": "Amazing Post",
            "image_url": "amazing.jpg",
            "images": null,
            "comments": [],
            "reacts": []
        }
    ]
}
```
## l. Checking whether a User if following another User
Endpoint URL: 
```
GET
```
```
/api/v1/user/1/follow/10
```  
Request Body:    
```
None
```
Example Response:  
```json
{
    "is_following": 0,
    "follower_id": 1,
    "followee_id": 10
}
```

## m. Get Notifications ( Paginated )  
#### Once the GET is called, its status will automatically be set to read
#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/user/1/notifications?is_read=0&page=1&per_page=2&order_by=notifying_date&order_type=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "notification_id": 14,
        "user_id": 1,
        "notifying_date": "2023-08-28T16:46:41.000Z",
        "text": "Your Favorite Hotel Deleted",
        "is_read": 0
    },
    {
        "notification_id": 15,
        "user_id": 1,
        "notifying_date": "2023-08-28T16:46:41.000Z",
        "text": "Your Trip is Approved",
        "is_read": 0
    }
]
```

# City

## a. Get Single City by city_id

Endpoint URL: 
```
GET
```
```
/api/v1/city/1
``` 
Request Body: 
```
None
```
Example Response:    
```json
{
    "city_id": 1,
    "name": "Dhaka",
    "country_name": "Bangladesh",
    "population": 168957745,
    "weather_type": "rainy"
}
```

## b. Get Cities by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL: 
```
GET
```
```
/api/v1/city?name=a&country_name=ban&population_min=1000000&population_max=231231231&weather_type=rainy&orderby=population&ordertype=desc&page=1&per_page=10
``` 
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    },
    {
        "city_id": 3,
        "name": "Khulna",
        "country_name": "Bangladesh",
        "population": 15563000,
        "weather_type": "rainy"
    },
    {
        "city_id": 9,
        "name": "Barisal",
        "country_name": "Bangladesh",
        "population": 3393084,
        "weather_type": "rainy"
    }
]
```
## c. Create New City

Endpoint URL:
```
POST
```
```
/api/v1/city/
```  
Request Body:    
```json
{
    "name": "Savar",
    "country_name": "Bangladesh",
    "population": 957745,
    "weather_type": "rainy"
}
```
Example Response:  
```json
{
    "city_id": 32,
    "name": "Savar",
    "country_name": "Bangladesh",
    "population": 957745,
    "weather_type": "rainy"
}
```
## d. Update a City
Endpoint URL: 
```
PUT
```
```
/api/v1/city/
```  
Request Body:    
```json
{
  "city_id": 32,
  "name": "New Savar",
  "country_name": "Bangladesh",
  "population": 1500000,
  "weather_type": "sunny"
}
```
Example Response:  
```json
{
    "city_id": 32,
    "name": "New Savar",
    "country_name": "Bangladesh",
    "population": 1500000,
    "weather_type": "sunny"
}
```

## e. Delete a City

Endpoint URL:  
```
DELETE
```
```
/api/v1/city/32
```
Request Body: 
```
None
```
Example Response:    
```json
{
    "city_id": 32,
    "name": "New Savar",
    "country_name": "Bangladesh",
    "population": 1500000,
    "weather_type": "sunny"
}
```


# Destination

## a. Get Single Destination by destination_id

Endpoint URL:    
```
GET
```
```
/api/v1/destination/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "destination_id": 1,
    "name": "Ahsan Manzil",
    "address": "Bangsha Road, Old Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.",
    "image_url": "ahsan_manzil.jpg",
    "created_on": "2023-08-24T20:53:16.000Z",
    "last_updated_on": "2023-08-24T20:53:16.000Z",
    "creator_user_id": 0,
    "activities": [
        {
            "activity_id": 1,
            "price": 500,
            "activity": {
                "activity_id": 1,
                "name": "Boat Tour",
                "category": "Adventure",
                "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
                "image_url": "boat_tour.jpg",
                "min_age": 8,
                "max_age": 60,
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:21.000Z",
                "last_updated_on": "2023-08-24T20:53:21.000Z",
                "images": [
                    "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                    "https://images.myguide-cdn.com/perth/companies/rottnest-island-day-trip-by-ferry-adventure-boat-tour/large/rottnest-island-day-trip-by-ferry-adventure-boat-tour-560869.jpg",
                    "https://images.tripshock.com/activity/2761/1080x1080/Thriller-Miami-Speedboat-Tours.jpg",
                    "https://fallsmeetings.com/wp-content/uploads/2017/04/Boat8.jpg"
                ]
            }
        },
        {
            "activity_id": 4,
            "price": 50,
            "activity": {
                "activity_id": 4,
                "name": "Cultural Tour",
                "category": "Culture",
                "description": "Immerse in the local culture and traditions with a guided cultural tour.",
                "image_url": "cultural_tour.jpg",
                "min_age": 15,
                "max_age": 65,
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:21.000Z",
                "last_updated_on": "2023-08-24T20:53:21.000Z",
                "images": [
                    "https://asahitreks.com/wp-content/uploads/2017/04/Cultural-Tour-in-Nepal-3.jpg",
                    "https://www.shikhar.com/images/gallery/tours/117/2.jpg",
                    "https://www.shikhar.com/blog/wp-content/uploads/2017/08/893_11.jpg",
                    "https://asahitreks.com/wp-content/uploads/2017/04/Cultural-Tour-in-Nepal-800x420.jpg"
                ]
            }
        },
        {
            "activity_id": 6,
            "price": 200,
            "activity": {
                "activity_id": 6,
                "name": "Wildlife Safari",
                "category": "Adventure",
                "description": "Embark on a thrilling wildlife safari and spot exotic animals.",
                "image_url": "wildlife_safari.jpg",
                "min_age": 18,
                "max_age": 60,
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:21.000Z",
                "last_updated_on": "2023-08-24T20:53:21.000Z",
                "images": [
                    "https://www.ngorongorocratertanzania.org/wp-content/uploads/2020/10/5-Days-Best-of-Tanzania-Wildlife-Safari.jpg",
                    "https://www.expertafrica.com/images/background-image/d8aaade7bbcd42d4a0a39588bbf4aa7d-1600.jpg",
                    "https://www.serengetiparktanzania.com/wp-content/uploads/2020/11/7-Days-Tanzania-Wildlife-Safaris.jpg",
                    "https://www.expertafrica.com/images/background-image/01a037ba6e6b403a8c6cfe4d64a249f0-1600.jpg"
                ]
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    },
    "images": [
        "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
        "https://2.bp.blogspot.com/-yrHnrrhqAQ0/Vs9-riUHavI/AAAAAAAACRY/JE2bdRmk27U/s1600/Ahsan-Manzil.jpg",
        "https://i.ytimg.com/vi/3Nqg5jAsiVU/maxresdefault.jpg",
        "https://4.bp.blogspot.com/-alMqK8AGxiQ/VrwxVfzAkSI/AAAAAAAAAb0/2Q4Y5_rTou0/s1600/Ahsan_Manzil22-1140x641_c.jpg"
    ]
}
```

## b. Get Destinations by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/destination?name=e&address=dhaka&city_id=1,2,3&activity_id=2,3,4&page=1&per_page=2&orderby=name&ordertype=asc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "destination_id": 20,
        "name": "Armenian Church of the Holy Resurrection",
        "address": "Armanitola, Old Dhaka",
        "city_id": 1,
        "latitude": 23.7165,
        "longitude": 90.4083,
        "description": "This historic church is one of the oldest Christian churches in Dhaka.",
        "image_url": "armenian_church.jpg",
        "created_on": "2023-08-25T08:29:22.000Z",
        "last_updated_on": "2023-08-25T08:29:22.000Z",
        "creator_user_id": 0,
        "activities": [
            {
                "activity_id": 3,
                "price": 100,
                "activity": {
                    "activity_id": 3,
                    "name": "Snorkeling",
                    "category": "Adventure",
                    "description": "Discover the underwater world and vibrant marine life through snorkeling.",
                    "image_url": "snorkeling.jpg",
                    "min_age": 10,
                    "max_age": 50,
                    "creator_user_id": 0,
                    "created_on": "2023-08-25T08:29:26.000Z",
                    "last_updated_on": "2023-08-25T08:29:26.000Z",
                    "images": [
                        "https://fthmb.tqn.com/XtDX5UROYmPakUeif3ahefihJoI=/1500x1050/filters:fill(auto,1)/SnorkelingWithKids_Getty-56effe365f9b5867a1c4bfb4.jpg",
                        "https://www.crystalsandsonsiestakey.com/wp-content/uploads/2020/08/siesta-key-snorkeling.jpg",
                        "https://diveukhurghada.co.uk/wp-content/uploads/2020/02/Snorkelling-1.jpg",
                        "https://www.sandals.com/blog/content/images/2019/04/3_islandroutes_38-Adv-Eco.jpg"
                    ]
                }
            },
            {
                "activity_id": 6,
                "price": 350,
                "activity": {
                    "activity_id": 6,
                    "name": "Wildlife Safari",
                    "category": "Adventure",
                    "description": "Embark on a thrilling wildlife safari and spot exotic animals.",
                    "image_url": "wildlife_safari.jpg",
                    "min_age": 18,
                    "max_age": 60,
                    "creator_user_id": 0,
                    "created_on": "2023-08-25T08:29:26.000Z",
                    "last_updated_on": "2023-08-25T08:29:26.000Z",
                    "images": [
                        "https://www.serengetiparktanzania.com/wp-content/uploads/2020/11/7-Days-Tanzania-Wildlife-Safaris.jpg",
                        "https://www.expertafrica.com/images/background-image/01a037ba6e6b403a8c6cfe4d64a249f0-1600.jpg",
                        "https://www.ngorongorocratertanzania.org/wp-content/uploads/2020/10/5-Days-Best-of-Tanzania-Wildlife-Safari.jpg",
                        "https://www.expertafrica.com/images/background-image/d8aaade7bbcd42d4a0a39588bbf4aa7d-1600.jpg"
                    ]
                }
            },
            {
                "activity_id": 34,
                "price": 150,
                "activity": {
                    "activity_id": 34,
                    "name": "Cave Exploration",
                    "category": "Adventure",
                    "description": "Explore the mysterious caves and marvel at their natural beauty.",
                    "image_url": "cave_exploration.jpg",
                    "min_age": 14,
                    "max_age": 70,
                    "creator_user_id": 0,
                    "created_on": "2023-08-25T08:29:26.000Z",
                    "last_updated_on": "2023-08-25T08:29:26.000Z",
                    "images": [
                        "https://bloximages.chicago2.vip.townnews.com/poststar.com/content/tncms/assets/v3/editorial/a/4f/a4f6ad2e-4129-11e5-9eed-2782d3ad6b80/55cba09a2e333.image.jpg?resize=1200%2C766",
                        "https://img.jakpost.net/c/2018/07/10/2018_07_10_49018_1531210327._large.jpg",
                        "http://bcbstwelltuned.com/wp-content/uploads/2017/06/Spelunking-e1497553737173.jpg",
                        "https://assets3.thrillist.com/v1/image/2774746/size/gn-gift_guide_variable_c.jpg"
                    ]
                }
            }
        ],
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        },
        "images": [
            "https://i.pinimg.com/originals/e4/d8/94/e4d894905114d4d2c67ac65016de00b3.jpg",
            "https://www.churchesaustralia.org/content/directory/full/Armenian_Apostolic_Church_of_Holy_Resurrection-18251-6462.jpg",
            "https://www.alamy.com/aggregator-api/download?url=https://c8.alamy.com/comp/JMEC9T/the-armenian-church-of-the-holy-resurrection-dhaka-bangladesh-JMEC9T.jpg",
            "https://thumbs.dreamstime.com/b/armenian-apostolic-church-holy-resurrection-dhaka-bangladesh-february-exterior-86177747.jpg"
        ]
    },
    {
        "destination_id": 9,
        "name": "Bangabandhu Memorial Museum",
        "address": "Dhanmondi, Dhaka",
        "city_id": 1,
        "latitude": 23.7465,
        "longitude": 90.3863,
        "description": "This museum is dedicated to Sheikh Mujibur Rahman, the founding father of Bangladesh.",
        "image_url": "bangabandhu_museum.jpg",
        "created_on": "2023-08-25T08:29:22.000Z",
        "last_updated_on": "2023-08-25T08:29:22.000Z",
        "creator_user_id": 0,
        "activities": [
            {
                "activity_id": 2,
                "price": 350,
                "activity": {
                    "activity_id": 2,
                    "name": "Hiking",
                    "category": "Adventure",
                    "description": "Embark on a thrilling hiking adventure amidst picturesque hills.",
                    "image_url": "hiking.jpg",
                    "min_age": 12,
                    "max_age": 55,
                    "creator_user_id": 0,
                    "created_on": "2023-08-25T08:29:26.000Z",
                    "last_updated_on": "2023-08-25T08:29:26.000Z",
                    "images": [
                        "https://www.readersdigest.ca/wp-content/uploads/sites/14/2015/10/best-hiking-trails-canada-1024x683.jpg",
                        "http://www.lilkickerschicago.com/wp-content/uploads/2019/06/dawn-view-1200.jpg",
                        "https://all.accor.com/middleware/media/1385716182466/1618327327711/hiking.jpg",
                        "https://www.explore-mag.com/media/image/57291.jpg"
                    ]
                }
            },
            {
                "activity_id": 5,
                "price": 350,
                "activity": {
                    "activity_id": 5,
                    "name": "Historical Sites Visit",
                    "category": "Culture",
                    "description": "Explore ancient historical sites and learn about their rich history.",
                    "image_url": "historical_sites.jpg",
                    "min_age": 12,
                    "max_age": 70,
                    "creator_user_id": 0,
                    "created_on": "2023-08-25T08:29:26.000Z",
                    "last_updated_on": "2023-08-25T08:29:26.000Z",
                    "images": [
                        "https://www.oyorooms.com/blog/wp-content/uploads/2017/10/Taj-Mahal.jpg",
                        "https://worldinsidepictures.com/wp-content/uploads/2013/10/7-1024x682.jpg",
                        "https://yehaindia.com/wp-content/uploads/2019/05/tajmahal-garden.jpg",
                        "https://www.tripsavvy.com/thmb/Vm-xdyjrWpZiQgtV-rVbd7EsUBk=/2125x1416/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-580758423-56c6ab0c3df78cfb37860807.jpg"
                    ]
                }
            },
            {
                "activity_id": 15,
                "price": 350,
                "activity": {
                    "activity_id": 15,
                    "name": "Yoga Retreat",
                    "category": "Relaxation",
                    "description": "Rejuvenate your mind and body with a peaceful yoga retreat.",
                    "image_url": "yoga_retreat.jpg",
                    "min_age": 20,
                    "max_age": 70,
                    "creator_user_id": 0,
                    "created_on": "2023-08-25T08:29:26.000Z",
                    "last_updated_on": "2023-08-25T08:29:26.000Z",
                    "images": [
                        "https://bookretreats.com/blog/wp-content/uploads/2020/11/1000_1603815965.jpg",
                        "https://magazine.bluekarmasecrets.com/wp-content/uploads/2019/10/retreatbox4.jpg",
                        "https://retreatmehappy.com/wp-content/uploads/2019/10/Yoga-Retreat-e1574557062145.jpg",
                        "https://breathingtravel.com/wp-content/uploads/2020/05/Yoga-retreat-Australia.jpg"
                    ]
                }
            }
        ],
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        },
        "images": [
            "https://media-cdn.tripadvisor.com/media/photo-s/05/f3/69/85/bangabandhu-museum-terrace.jpg",
            "https://i.pinimg.com/originals/e9/a7/e9/e9a7e99e45360d1618333636957d15ff.jpg",
            "https://media-cdn.tripadvisor.com/media/photo-s/0a/8e/84/89/bangabandhu-memorial.jpg",
            "https://media-cdn.tripadvisor.com/media/photo-s/05/f3/69/86/bangabandhu-museum-entrance.jpg"
        ]
    }
]
```

## c. Create New Destination

Endpoint URL: 
```
POST
```
```
/api/v1/destination/
```  
Request Body:    
```json
{
    "name": "Shishu Park",
    "address": "Ramna, Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Shishu Park is a fantastic place for children in Dhaka.",
    "image_url": "dummy.jpg",
    "activities": [
        {
            "activity_id": 1,
            "price": 50
        },
        {
            "activity_id": 33,
            "price": 100
        }
    ]
}
```
Example Response:  
```json
{
    "destination_id": 83,
    "name": "Shishu Park",
    "address": "Ramna, Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Shishu Park is a fantastic place for children in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T19:24:43.000Z",
    "last_updated_on": "2023-08-01T19:24:43.000Z",
    "activities": [
        {
            "activity_id": 1,
            "price": 50,
            "activity": {
                "activity_id": 1,
                "name": "Boat Tour",
                "category": "Adventure",
                "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
                "image_url": "boat_tour.jpg",
                "min_age": 8,
                "max_age": 60
            }
        },
        {
            "activity_id": 33,
            "price": 100,
            "activity": {
                "activity_id": 33,
                "name": "Gardens and Parks",
                "category": "Adventure",
                "description": "Relax and take a leisurely stroll in beautiful gardens and parks.",
                "image_url": "gardens_parks.jpg",
                "min_age": 5,
                "max_age": 80
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```
## d. Update a Destination
Endpoint URL: 
```
PUT
```
```
/api/v1/destination/
```  
Request Body:    
```json
{
    "destination_id":1,
    "name": "New Magnificent Ahsan Manzil",
    "address": "Bangsha Road, Old Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.",
    "image_url": "dummy.jpg",
    "activities": [
        {
            "activity_id": 4,
            "price": 250
        }
    ]
}
```
Example Response:  
```json
{
    "destination_id": 1,
    "name": "New Magnificent Ahsan Manzil",
    "address": "Bangsha Road, Old Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T10:46:19.000Z",
    "last_updated_on": "2023-08-01T19:29:24.000Z",
    "activities": [
        {
            "activity_id": 4,
            "price": 250,
            "activity": {
                "activity_id": 4,
                "name": "Cultural Tour",
                "category": "Culture",
                "description": "Immerse in the local culture and traditions with a guided cultural tour.",
                "image_url": "cultural_tour.jpg",
                "min_age": 15,
                "max_age": 65
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## e. Delete a Destination

Endpoint URL:  
```
DELETE
```
```
api/v1/destination/83
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "destination_id": 83,
    "name": "Shishu Park",
    "address": "Ramna, Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Shishu Park is a fantastic place for children in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T19:24:43.000Z",
    "last_updated_on": "2023-08-01T19:24:43.000Z",
    "activities": [
        {
            "activity_id": 1,
            "price": 50,
            "activity": {
                "activity_id": 1,
                "name": "Boat Tour",
                "category": "Adventure",
                "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
                "image_url": "boat_tour.jpg",
                "min_age": 8,
                "max_age": 60
            }
        },
        {
            "activity_id": 33,
            "price": 100,
            "activity": {
                "activity_id": 33,
                "name": "Gardens and Parks",
                "category": "Adventure",
                "description": "Relax and take a leisurely stroll in beautiful gardens and parks.",
                "image_url": "gardens_parks.jpg",
                "min_age": 5,
                "max_age": 80
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

# Activity

## a. Get Single Activity by activity_id

Endpoint URL:    
```
GET
```
```
/api/v1/activity/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "activity_id": 1,
    "name": "Boat Tour",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "boat_tour.jpg",
    "min_age": 8,
    "max_age": 60,
    "creator_user_id": 0,
    "created_on": "2023-08-24T20:53:21.000Z",
    "last_updated_on": "2023-08-24T20:53:21.000Z",
    "images": [
        "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
        "https://images.myguide-cdn.com/perth/companies/rottnest-island-day-trip-by-ferry-adventure-boat-tour/large/rottnest-island-day-trip-by-ferry-adventure-boat-tour-560869.jpg",
        "https://images.tripshock.com/activity/2761/1080x1080/Thriller-Miami-Speedboat-Tours.jpg",
        "https://fallsmeetings.com/wp-content/uploads/2017/04/Boat8.jpg"
    ]
}
```

## b. Get Activities by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/activity?name=k&category=adventure&age=10&page=1&per_page=2&orderby=name&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "activity_id": 3,
        "name": "Snorkeling",
        "category": "Adventure",
        "description": "Discover the underwater world and vibrant marine life through snorkeling.",
        "image_url": "snorkeling.jpg",
        "min_age": 10,
        "max_age": 50,
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:21.000Z",
        "last_updated_on": "2023-08-24T20:53:21.000Z",
        "images": [
            "https://fthmb.tqn.com/XtDX5UROYmPakUeif3ahefihJoI=/1500x1050/filters:fill(auto,1)/SnorkelingWithKids_Getty-56effe365f9b5867a1c4bfb4.jpg",
            "https://www.crystalsandsonsiestakey.com/wp-content/uploads/2020/08/siesta-key-snorkeling.jpg",
            "https://diveukhurghada.co.uk/wp-content/uploads/2020/02/Snorkelling-1.jpg",
            "https://www.sandals.com/blog/content/images/2019/04/3_islandroutes_38-Adv-Eco.jpg"
        ]
    },
    {
        "activity_id": 7,
        "name": "Nature Walks",
        "category": "Adventure",
        "description": "Take peaceful walks in nature and enjoy the tranquility it offers.",
        "image_url": "nature_walks.jpg",
        "min_age": 8,
        "max_age": 65,
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:21.000Z",
        "last_updated_on": "2023-08-24T20:53:21.000Z",
        "images": [
            "https://www.naturalhealth365.com/wp-content/uploads/2020/04/nature-scaled.jpeg",
            "https://www.atlmentalhealth.com/wp-content/uploads/2021/01/nature-walk.jpg",
            "http://images.unsplash.com/photo-1559544948-da38a2615cb7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9",
            "https://yogafeststatecollege.com/wp-content/uploads/2017/09/Nature-Walk-900px.jpg"
        ]
    }
]
```

## c. Create New Activity

Endpoint URL: 
```
POST
```
```
/api/v1/activity/
```  
Request Body:    
```json
{
    "name": "Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```
Example Response:  
```json
{
    "activity_id": 52,
    "name": "Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```
## d. Update a Activity
Endpoint URL: 
```
PUT
```
```
/api/v1/activity/
```  
Request Body:    
```json
{
    "activity_id": 52,
    "name": "New Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```
Example Response:  
```json
{
    "activity_id": 52,
    "name": "New Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```

## e. Delete an Activity 

Endpoint URL:  
```
DELETE
```
```
api/v1/activity/52
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "activity_id": 52,
    "name": "New Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```

# Trip

## a. Get Single Trip by trip_id
Endpoint URL: 
```
GET
```
```
/api/v1/trip/4
```
Request Body: 
```
None
```
Example Response:    
```json
{
    "trip_id": 4,
    "from_city_id": 11,
    "to_city_id": 12,
    "from_city_name": "Gazipur",
    "to_city_name": "Feni",
    "name": "Coastal Odyssey",
    "description": "Embark on a thrilling journey of discovery and relaxation, exploring both natures wonders and vibrant city life.",
    "image_url": "dummy.jpg",
    "total_price": 69005,
    "start_date": "2023-08-15T18:00:00.000Z",
    "end_date": "2023-09-01T18:00:00.000Z",
    "creator_user_id": 1,
    "created_on": "2023-08-24T20:53:27.000Z",
    "last_updated_on": "2023-08-24T20:53:27.000Z",
    "deleted_on": null,
    "rating_info": {
        "rating_1": 0,
        "rating_2": 6,
        "rating_3": 12,
        "rating_4": 8,
        "rating_5": 3,
        "rating_avg": 3.28
    },
    "images": null
}
```

## b. Get Single Trip Details by trip_id
Endpoint URL: 
```
GET
```
```
/api/v1/trip/details/2
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "trip_id": 2,
    "from_city_id": 3,
    "to_city_id": 4,
    "from_city_name": "Khulna",
    "to_city_name": "Rajshahi",
    "name": "Adventure in the Himalayas",
    "description": "Experience thrilling adventure in the Himalayas",
    "image_url": "himalayas_adventure.jpg",
    "total_price": 192155,
    "start_date": "2023-08-09T18:00:00.000Z",
    "end_date": "2023-08-29T18:00:00.000Z",
    "creator_user_id": 2,
    "created_on": "2023-08-24T20:53:27.000Z",
    "last_updated_on": "2023-08-24T20:53:27.000Z",
    "deleted_on": null,
    "contains": [
        {
            "destination_id": 2,
            "destination_name": "Lalbagh Fort",
            "activity_id": 8,
            "activity_name": "Beach Relaxation",
            "price": 400,
            "tentative_date": "2023-08-14T18:00:00.000Z"
        },
        {
            "destination_id": 2,
            "destination_name": "Lalbagh Fort",
            "activity_id": 9,
            "activity_name": "Water Sports",
            "price": 150,
            "tentative_date": "2023-08-17T18:00:00.000Z"
        }
    ],
    "hotels": [
        {
            "hotel_id": 5,
            "checkin_date": "2023-08-09T18:00:00.000Z",
            "checkout_date": "2023-08-19T18:00:00.000Z",
            "hotel": {
                "hotel_id": 5,
                "name": "Best Western PLUS Maya",
                "address": "1 Sunset Boulevard Dhaka , Bangladesh",
                "city_id": 1,
                "description": "A Gracefully Spectacular hotel in Dhaka.",
                "image_url": "dummy.jpg",
                "price_per_day": 13357,
                "phone": "014573464154",
                "email": "best_western@gmail.com",
                "has_wifi": 1,
                "has_parking": 1,
                "has_gym": 0,
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:21.000Z",
                "last_updated_on": "2023-08-24T20:53:21.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 3,
                    "rating_3": 11,
                    "rating_4": 6,
                    "rating_5": 3,
                    "rating_avg": 3.39
                },
                "images": [
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/00/1a/84/best-western-plus-maya.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/14/46/02/premium-room-2-single.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/14/46/01/standard-room.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/14/45/fd/executive-room.jpg?w=1500&h=1000&s=1"
                ]
            }
        },
        {
            "hotel_id": 8,
            "checkin_date": "2023-08-24T18:00:00.000Z",
            "checkout_date": "2023-08-29T18:00:00.000Z",
            "hotel": {
                "hotel_id": 8,
                "name": "Ascott Palace Dhaka",
                "address": "56 Lakeview Drive Dhaka , Bangladesh",
                "city_id": 1,
                "description": "A Exquisitely Seaside hotel in Dhaka.",
                "image_url": "dummy.jpg",
                "price_per_day": 11201,
                "phone": "013365955244",
                "email": "ascott_palace@outlook.com",
                "has_wifi": 1,
                "has_parking": 0,
                "has_gym": 0,
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:21.000Z",
                "last_updated_on": "2023-08-24T20:53:21.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 13,
                    "rating_3": 9,
                    "rating_4": 10,
                    "rating_5": 9,
                    "rating_avg": 3.37
                },
                "images": [
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/30/46/ae/ascott-palace-limited.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/30/49/4a/ascott-palace-limited.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/30/49/38/ascott-palace-limited.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/30/49/22/ascott-palace-limited.jpg?w=1500&h=1000&s=1"
                ]
            }
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 10,
            "restaurant": {
                "restaurant_id": 10,
                "name": "Grandiose Restaurant",
                "reservation_price": 470,
                "address": "41 Dining Boulevard",
                "city_id": 1,
                "description": "A restaurant serving Delightfully Quaint French Steak.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Italian,Japanese",
                "contact": "015318645120",
                "email": "grandiose_restaurant@gmail.com",
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:25.000Z",
                "last_updated_on": "2023-08-24T20:53:25.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 11,
                    "rating_3": 8,
                    "rating_4": 7,
                    "rating_5": 8,
                    "rating_avg": 3.35
                },
                "images": [
                    "https://media-cdn.tripadvisor.com/media/photo-s/17/b6/2e/21/grandiose-restaurant.jpg"
                ]
            }
        },
        {
            "restaurant_id": 15,
            "restaurant": {
                "restaurant_id": 15,
                "name": "Barcode Cafe",
                "reservation_price": 60,
                "address": "24 Main Street",
                "city_id": 2,
                "description": "A restaurant serving Savoringly Charming Indian Tacos.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Italian,Contemporary",
                "contact": "019823167403",
                "email": "barcode.cafe@outlook.com",
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:25.000Z",
                "last_updated_on": "2023-08-24T20:53:25.000Z",
                "city": {
                    "city_id": 2,
                    "name": "Chittagong",
                    "country_name": "Bangladesh",
                    "population": 28607074,
                    "weather_type": "sunny"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 0,
                    "rating_3": 0,
                    "rating_4": 0,
                    "rating_5": 0,
                    "rating_avg": 2.5
                },
                "images": [
                    "https://media-cdn.tripadvisor.com/media/photo-o/07/41/46/cb/barcode-cafe.jpg"
                ]
            }
        },
        {
            "restaurant_id": 20,
            "restaurant": {
                "restaurant_id": 20,
                "name": "Krave",
                "reservation_price": 1500,
                "address": "35 Culinary Avenue",
                "city_id": 2,
                "description": "A restaurant serving Wonderfully Elegant Thai Steak.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Steakhouse,Italian",
                "contact": "015625729520",
                "email": "krave@yahoo.com",
                "creator_user_id": 0,
                "created_on": "2023-08-24T20:53:25.000Z",
                "last_updated_on": "2023-08-24T20:53:25.000Z",
                "city": {
                    "city_id": 2,
                    "name": "Chittagong",
                    "country_name": "Bangladesh",
                    "population": 28607074,
                    "weather_type": "sunny"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 0,
                    "rating_3": 0,
                    "rating_4": 0,
                    "rating_5": 0,
                    "rating_avg": 2.5
                },
                "images": [
                    "https://media-cdn.tripadvisor.com/media/photo-s/1c/0c/cf/95/krave.jpg"
                ]
            }
        }
    ],
    "guides": [
        {
            "guide_id": 1,
            "guide": {
                "user_id": 1,
                "username": "aaniksahaa",
                "email": "abc@gmail.com",
                "role": "client",
                "name": "Anik Saha",
                "bio": "Little Coder",
                "city_id": 1,
                "facebook_url": "facebook.com/abc",
                "twitter_url": "twitter.com/abc",
                "instagram_url": "instagram.com/abc",
                "profile_picture": "dummy.jpg",
                "dob": "2002-09-16T18:00:00.000Z",
                "registration_date": "2023-08-24T20:53:16.000Z",
                "status": "active",
                "created_on": "2023-08-24T20:53:16.000Z",
                "last_updated_on": "2023-08-24T20:53:16.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        }
    ],
    "rating_info": {
        "rating_1": 0,
        "rating_2": 12,
        "rating_3": 6,
        "rating_4": 3,
        "rating_5": 13,
        "rating_avg": 3.5
    },
    "images": null
}
```

## c. Get Trips by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/trip?from_city_id=1,2&to_city_id=1,2,3&price_min=10000&price_max=50000&start_date=2023-01-01&end_date=2024-01-01&orderby=rating&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "trip_id": 3,
        "from_city_id": 5,
        "to_city_id": 6,
        "from_city_name": "Comilla",
        "to_city_name": "Mymensingh",
        "name": "Relaxing Beach Vacation",
        "description": "Unwind on the beautiful beaches of Maldives",
        "image_url": "maldives_beach.jpg",
        "total_price": 21080,
        "start_date": "2023-09-04T18:00:00.000Z",
        "end_date": "2023-09-19T18:00:00.000Z",
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:27.000Z",
        "last_updated_on": "2023-08-24T20:53:27.000Z",
        "deleted_on": null,
        "rating_info": {
            "rating_1": 0,
            "rating_2": 10,
            "rating_3": 7,
            "rating_4": 9,
            "rating_5": 7,
            "rating_avg": 3.39
        },
        "images": null
    },
    {
        "trip_id": 8,
        "from_city_id": 12,
        "to_city_id": 7,
        "from_city_name": "Feni",
        "to_city_name": "Rangpur",
        "name": "Relaxation Retreat",
        "description": "Discover hidden gems, savor local cuisines, and immerse yourself in the rich history of each destination.",
        "image_url": "dummy.jpg",
        "total_price": 43491,
        "start_date": "2023-08-14T18:00:00.000Z",
        "end_date": "2023-09-01T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-24T20:53:27.000Z",
        "last_updated_on": "2023-08-24T20:53:27.000Z",
        "deleted_on": null,
        "rating_info": {
            "rating_1": 0,
            "rating_2": 11,
            "rating_3": 7,
            "rating_4": 6,
            "rating_5": 4,
            "rating_avg": 3.11
        },
        "images": null
    }
]
```


## d. Create New Trip
Endpoint URL: 
```
POST
```
```
/api/v1/trip
```  
Request Body:    
```json
{
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Departmental Tour to Infinity",
    "description" : "A wonderful Trip, it will be.",
    "image_url" : "dummy.jpg",
    "start_date" : "2023-07-01",
    "end_date" : "2023-07-25",
    "contains" : [
        {
            "destination_id" : 1,
            "activity_id" : 4,
            "tentative_date" : "2023-07-15"
        },
        {
            "destination_id" : 1,
            "activity_id" : 1,
            "tentative_date" : "2023-07-17"
        }
    ],
    "hotels" : [
        {
            "hotel_id" : 1,
            "checkin_date" : "2023-07-01",
            "checkout_date" : "2023-07-07"
        },
        {
            "hotel_id" : 2,
            "checkin_date" : "2023-07-15",
            "checkout_date" : "2023-07-17"
        }
    ],
    "restaurants" : [
        {
            "restaurant_id" : 1
        },
        {
            "restaurant_id" : 2
        },
        {
            "restaurant_id" : 3
        }
    ],
    "guides" : [
        {
            "guide_id" : 1
        },
        {
            "guide_id" : 2
        }
    ]
}
```
Example Response:  
```json
{
    "trip_id": 3,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Departmental Tour to Infinity",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 32571,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-07-31T21:59:52.000Z",
    "last_updated_on": "2023-07-31T21:59:52.000Z",
    "deleted_on": null
}
```
## e. Update a Trip
Endpoint URL: 
```
PUT
```
```
/api/v1/trip/
```  
Request Body:    
```json
{
    "trip_id":1,
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Novelty Tour",
    "description" : "A wonderful Trip, it will be.",
    "image_url" : "dummy.jpg",
    "start_date" : "2023-07-01",
    "end_date" : "2023-07-25",
    "contains" : [
        {
            "destination_id" : 1,
            "activity_id" : 6,
            "tentative_date" : "2023-07-15"
        },
        {
            "destination_id" : 2,
            "activity_id" : 8,
            "tentative_date" : "2023-07-17"
        }
    ],
    "hotels" : [
        {
            "hotel_id" : 5,
            "checkin_date" : "2023-07-01",
            "checkout_date" : "2023-07-07"
        },
        {
            "hotel_id" : 6,
            "checkin_date" : "2023-07-15",
            "checkout_date" : "2023-07-17"
        }
    ],
    "restaurants" : [
        {
            "restaurant_id" : 4
        },
        {
            "restaurant_id" : 5
        },
        {
            "restaurant_id" : 6
        }
    ],
    "guides" : [
        {
            "guide_id" : 1
        },
        {
            "guide_id" : 2
        }
    ]
}
```
Example Response:  
```json
{
    "trip_id": 1,
    "from_city_id": 1,
    "to_city_id": 2,
    "from_city_name": "Dhaka",
    "to_city_name": "Chittagong",
    "name": "Novelty Tour",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 22799,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-08-01T12:57:17.000Z",
    "last_updated_on": "2023-08-01T12:57:17.000Z",
    "deleted_on": null,
    "contains": [
        {
            "destination_id": 1,
            "destination_name": "Ahsan Manzil",
            "activity_id": 6,
            "activity_name": "Wildlife Safari",
            "price": 400,
            "tentative_date": "2023-07-14T18:00:00.000Z"
        },
        {
            "destination_id": 2,
            "destination_name": "Coxs Bazar",
            "activity_id": 8,
            "activity_name": "Beach Relaxation",
            "price": 300,
            "tentative_date": "2023-07-16T18:00:00.000Z"
        }
    ],
    "hotels": [
        {
            "hotel_id": 6,
            "checkin_date": "2023-07-14T18:00:00.000Z",
            "checkout_date": "2023-07-16T18:00:00.000Z",
            "hotel": {
                "hotel_id": 6,
                "name": "Charming Sanctuary Hotel",
                "address": "55 Beach Road Jessore , Bangladesh",
                "city_id": 16,
                "description": "A Majestically Elevated hotel in Jessore.",
                "image_url": "dummy.jpg",
                "price_per_day": 961,
                "phone": "015116405724",
                "email": "charmingsanctuaryhotel@gmail.com",
                "has_wifi": 1,
                "has_parking": 0,
                "has_gym": 1,
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 16,
                    "name": "Jessore",
                    "country_name": "Bangladesh",
                    "population": 237478,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "hotel_id": 5,
            "checkin_date": "2023-06-30T18:00:00.000Z",
            "checkout_date": "2023-07-06T18:00:00.000Z",
            "hotel": {
                "hotel_id": 5,
                "name": "Glorious Hideaway Hotel",
                "address": "18 Beach Road Dinajpur , Bangladesh",
                "city_id": 17,
                "description": "A Extravagantly Glorious hotel in Dinajpur.",
                "image_url": "dummy.jpg",
                "price_per_day": 3256,
                "phone": "015238514617",
                "email": "glorioushideawayhotel@gmail.com",
                "has_wifi": 0,
                "has_parking": 0,
                "has_gym": 0,
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 17,
                    "name": "Dinajpur",
                    "country_name": "Bangladesh",
                    "population": 204874,
                    "weather_type": "cold"
                }
            }
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 4,
            "restaurant": {
                "restaurant_id": 4,
                "name": "Delicious Cafe Biryani Restaurant",
                "reservation_price": 460,
                "address": "19 Lakeview Drive",
                "city_id": 28,
                "description": "A restaurant serving Wonderfully Cozy Thai Pasta.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Thai",
                "contact": "017157505197",
                "email": "deliciouscafebiryanirestaurant@yahoo.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 28,
                    "name": "Rangamati",
                    "country_name": "Bangladesh",
                    "population": 3482659,
                    "weather_type": "cold"
                }
            }
        },
        {
            "restaurant_id": 5,
            "restaurant": {
                "restaurant_id": 5,
                "name": "Elegant Steakhouse Tacos Restaurant",
                "reservation_price": 69,
                "address": "52 Gourmet Street",
                "city_id": 2,
                "description": "A restaurant serving Exquisitely Savory Bangladeshi Kebab.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Japanese",
                "contact": "018488659370",
                "email": "elegantsteakhousetacosrestaurant@outlook.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 2,
                    "name": "Chittagong",
                    "country_name": "Bangladesh",
                    "population": 28607074,
                    "weather_type": "sunny"
                }
            }
        },
        {
            "restaurant_id": 6,
            "restaurant": {
                "restaurant_id": 6,
                "name": "Delicious Bistro Biryani Restaurant",
                "reservation_price": 112,
                "address": "40 Cafeteria Lane",
                "city_id": 17,
                "description": "A restaurant serving Tastefully Fusion Indian Kebab.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Mexican",
                "contact": "018679129439",
                "email": "deliciousbistrobiryanirestaurant@yahoo.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 17,
                    "name": "Dinajpur",
                    "country_name": "Bangladesh",
                    "population": 204874,
                    "weather_type": "cold"
                }
            }
        }
    ],
    "guides": [
        {
            "guide_id": 1,
            "guide": {
                "user_id": 1,
                "email": "changed_email@example.com",
                "password_hash": "hashed_password",
                "role": "user",
                "name": "John Doe",
                "bio": "I love traveling and exploring new places.",
                "city_id": 1,
                "facebook_url": "https://www.facebook.com/johndoe",
                "twitter_url": "https://twitter.com/johndoe",
                "instagram_url": "https://www.instagram.com/johndoe",
                "profile_picture": "https://example.com/profile_picture.jpg",
                "dob": "1990-05-14T18:00:00.000Z",
                "registration_date": "2023-08-01T10:46:19.000Z",
                "status": "active",
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T11:46:58.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "guide_id": 2,
            "guide": {
                "user_id": 2,
                "email": "xyz@gmail.com",
                "password_hash": "456",
                "role": "client",
                "name": "Jaber Ahmed Deeder",
                "bio": "Pro Coder",
                "city_id": 1,
                "facebook_url": "facebook.com/xyz",
                "twitter_url": "twitter.com/xyz",
                "instagram_url": "instagram.com/xyz",
                "profile_picture": "dummy.jpg",
                "dob": "2002-09-16T18:00:00.000Z",
                "registration_date": "2023-08-01T10:46:19.000Z",
                "status": "active",
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        }
    ]
}
```
## f. Delete a Trip ( Soft Deletion )

Endpoint URL:  
```
DELETE
```
```
/api/v1/trip/2
``` 
Request Body: 
```
None
```
Example Response:    
```json
{
    "trip_id": 2,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Magnificient Seashore Exploration",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 32571,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-07-31T20:08:58.000Z",
    "last_updated_on": "2023-07-31T20:08:58.000Z",
    "deleted_on": null
}
```

## g. Delete a Trip ( Permanent )

Endpoint URL:  
```
DELETE
```
```
/api/v1/trip/danger/2
```  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": "2",
    "status": "permanently deleted"
}
```

# Hotel

## a. Get Single Hotel by hotel_id

Endpoint URL:   
```
GET
```
```
/api/v1/hotel/6
``` 
Request Body: 
```
None
```
Example Response:    
```json
{
    "hotel_id": 6,
    "name": "The Westin Dhaka",
    "address": "40 Mountain Street Dhaka , Bangladesh",
    "city_id": 1,
    "description": "A Serenely Boutique hotel in Dhaka.",
    "image_url": "dummy.jpg",
    "price_per_day": 22526,
    "phone": "019032452045",
    "email": "the.westin@gmail.com",
    "has_wifi": 1,
    "has_parking": 0,
    "has_gym": 0,
    "creator_user_id": 0,
    "created_on": "2023-08-24T20:53:21.000Z",
    "last_updated_on": "2023-08-24T20:53:21.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    },
    "rating_info": {
        "rating_1": 0,
        "rating_2": 10,
        "rating_3": 13,
        "rating_4": 10,
        "rating_5": 14,
        "rating_avg": 3.6
    },
    "images": [
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/0c/cb/10/exterior.jpg?w=1500&h=1000&s=1",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/b2/69/7e/seasonal-tastes.jpg?w=1500&h=1000&s=1",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/e0/22/cb/the-westin-dhaka.jpg?w=1500&h=1000&s=1",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/b2/69/38/prego.jpg?w=1500&h=1000&s=1"
    ]
}
```

## b. Get Hotels by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:
```
GET
```
```
/api/v1/hotel?name=hotel&address=bangladesh&city_id=24,25,26,1,2,3&min_price=500&max_price=30000&has_wifi=1&has_parking=1&has_gym=1&orderby=price_per_day&ordertype=desc&page=1&per_page=2
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "hotel_id": 252,
        "name": "Grand Prince Hotel",
        "address": "20 Mountain Street Manikganj , Bangladesh",
        "city_id": 26,
        "description": "A Enchantingly Elevated hotel in Manikganj.",
        "image_url": "dummy.jpg",
        "price_per_day": 12470,
        "phone": "014948799839",
        "email": "grand.prince@gmail.com",
        "has_wifi": 1,
        "has_parking": 1,
        "has_gym": 1,
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:24.000Z",
        "last_updated_on": "2023-08-24T20:53:24.000Z",
        "city": {
            "city_id": 26,
            "name": "Manikganj",
            "country_name": "Bangladesh",
            "population": 160093,
            "weather_type": "rainy"
        },
        "rating_info": {
            "rating_1": 0,
            "rating_2": 0,
            "rating_3": 0,
            "rating_4": 0,
            "rating_5": 0,
            "rating_avg": 2.5
        },
        "images": [
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/5f/9d/78/grand-prince-hotel-in.jpg?w=1500&h=1000&s=1",
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/81/61/16/bangladesh-national-cricket.jpg?w=1500&h=1000&s=1",
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/81/61/15/global-asus-brand-manager.jpg?w=1500&h=1000&s=1",
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/81/61/14/super-shop.jpg?w=1500&h=1000&s=1"
        ]
    },
    {
        "hotel_id": 29,
        "name": "Divine Centre Ltd, Hotel and Convention Centre",
        "address": "40 Garden Lane Khulna , Bangladesh",
        "city_id": 3,
        "description": "A Exceptionally Boutique hotel in Khulna.",
        "image_url": "dummy.jpg",
        "price_per_day": 9299,
        "phone": "016793349880",
        "email": "divine.centre@yahoo.com",
        "has_wifi": 1,
        "has_parking": 1,
        "has_gym": 1,
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:21.000Z",
        "last_updated_on": "2023-08-24T20:53:21.000Z",
        "city": {
            "city_id": 3,
            "name": "Khulna",
            "country_name": "Bangladesh",
            "population": 15563000,
            "weather_type": "rainy"
        },
        "rating_info": {
            "rating_1": 0,
            "rating_2": 0,
            "rating_3": 0,
            "rating_4": 0,
            "rating_5": 0,
            "rating_avg": 2.5
        },
        "images": [
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/be/a9/60/super-deluxe-couple-room.jpg?w=1500&h=1000&s=1",
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/be/a8/f3/super-deluxe-suit-room.jpg?w=1500&h=1000&s=1",
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/be/a8/6c/super-deluxe-twin-room.jpg?w=1500&h=1000&s=1",
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/c7/40/87/kopotakkha-meeting-rooms.jpg?w=1500&h=1000&s=1"
        ]
    }
]
```
## c. Create New Hotel

Endpoint URL: 
```
POST
```
```
/api/v1/hotel/
```  
Request Body:    
```json
{
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "images": ["a.jpg","b.jpg","c.jpg"]
}
```
Example Response:  
```json
{
    "hotel_id": 302,
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "creator_user_id": 1,
    "created_on": "2023-09-07T19:29:25.000Z",
    "last_updated_on": "2023-09-07T19:29:25.000Z",
    "city": {
        "city_id": 26,
        "name": "Manikganj",
        "country_name": "Bangladesh",
        "population": 160093,
        "weather_type": "rainy"
    },
    "rating_info": {
        "rating_1": 0,
        "rating_2": 0,
        "rating_3": 0,
        "rating_4": 0,
        "rating_5": 0,
        "rating_avg": 2.5
    },
    "images": [
        "a.jpg",
        "b.jpg",
        "c.jpg"
    ]
}
```
## d. Update a Hotel
Endpoint URL: 
```
PUT
```
```
/api/v1/hotel/
```  
Request Body:    
```json
{
    "hotel_id": 302,
    "name": "New Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 4500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "images":["x.jpg","y.jpg","z.jpg"]
}
```
Example Response:  
```json
{
    "hotel_id": 302,
    "name": "New Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 4500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "creator_user_id": 1,
    "created_on": "2023-09-07T19:29:25.000Z",
    "last_updated_on": "2023-09-07T19:32:39.000Z",
    "city": {
        "city_id": 26,
        "name": "Manikganj",
        "country_name": "Bangladesh",
        "population": 160093,
        "weather_type": "rainy"
    },
    "rating_info": {
        "rating_1": 0,
        "rating_2": 0,
        "rating_3": 0,
        "rating_4": 0,
        "rating_5": 0,
        "rating_avg": 2.5
    },
    "images": [
        "z.jpg",
        "x.jpg",
        "y.jpg"
    ]
}
```

## e. Delete a Hotel

Endpoint URL: 
```
DELETE
```
```
/api/v1/hotel/99
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "hotel_id": 99,
    "name": "Cozy Castle Hotel",
    "address": "44 Ocean Drive Tangail , Bangladesh",
    "city_id": 29,
    "description": "A Exquisitely Elevated hotel in Tangail.",
    "image_url": "dummy.jpg",
    "price_per_day": 3857,
    "phone": "014298582868",
    "email": "cozycastlehotel@outlook.com",
    "has_wifi": 1,
    "has_parking": 0,
    "has_gym": 1,
    "created_on": "2023-07-31T19:43:37.000Z",
    "last_updated_on": "2023-07-31T19:43:37.000Z"
}
```

# Restaurant

## a. Get Single Restaurant by restaurant_id

Endpoint URL: 
```
GET
```
```
/api/v1/restaurant/3
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "restaurant_id": 3,
    "name": "The Garden Kitchen at Sheraton Dhaka",
    "reservation_price": 1540,
    "address": "63 Restaurant Row",
    "city_id": 1,
    "description": "A restaurant serving Wonderfully Charming Spanish Steak.",
    "image_url": "dummy.jpg",
    "cuisine_type": "International,Sushi",
    "contact": "018029299017",
    "email": "the.garden@outlook.com",
    "creator_user_id": 0,
    "created_on": "2023-08-24T20:53:25.000Z",
    "last_updated_on": "2023-08-24T20:53:25.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    },
    "rating_info": {
        "rating_1": 0,
        "rating_2": 10,
        "rating_3": 9,
        "rating_4": 11,
        "rating_5": 7,
        "rating_avg": 3.41
    },
    "images": [
        "https://media-cdn.tripadvisor.com/media/photo-s/22/44/b4/32/restaurant-interior.jpg"
    ]
}
```

## b. Get Restaurants by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL: 
```
GET
```
```
/api/v1/restaurant?city_id=1,6,22,28&min_price=50&max_price=3000&page=1&per_page=3&orderby=rating&ordertype=desc
```  
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "restaurant_id": 1,
        "name": "Elements - Global Dining at InterContinental Dhaka",
        "reservation_price": 1420,
        "address": "58 Culinary Avenue",
        "city_id": 1,
        "description": "A restaurant serving Wonderfully Quaint Thai Pasta.",
        "image_url": "dummy.jpg",
        "cuisine_type": "American,European",
        "contact": "018826094479",
        "email": "elements_-@gmail.com",
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:25.000Z",
        "last_updated_on": "2023-08-24T20:53:25.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        },
        "rating_info": {
            "rating_1": 0,
            "rating_2": 5,
            "rating_3": 5,
            "rating_4": 10,
            "rating_5": 10,
            "rating_avg": 3.83
        },
        "images": [
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg"
        ]
    },
    {
        "restaurant_id": 5,
        "name": "Risotto by Sarina",
        "reservation_price": 1180,
        "address": "93 Lakeview Drive",
        "city_id": 1,
        "description": "A restaurant serving Delightfully Exquisite Mexican Dim Sum.",
        "image_url": "dummy.jpg",
        "cuisine_type": "Italian",
        "contact": "018775861678",
        "email": "risotto.by@outlook.com",
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:25.000Z",
        "last_updated_on": "2023-08-24T20:53:25.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        },
        "rating_info": {
            "rating_1": 0,
            "rating_2": 5,
            "rating_3": 8,
            "rating_4": 9,
            "rating_5": 8,
            "rating_avg": 3.67
        },
        "images": [
            "https://media-cdn.tripadvisor.com/media/photo-s/29/76/7b/a8/lounge-area.jpg"
        ]
    },
    {
        "restaurant_id": 7,
        "name": "Olea Turkish Restaurant at Le Meridien Dhaka",
        "reservation_price": 690,
        "address": "14 Restaurant Row",
        "city_id": 1,
        "description": "A restaurant serving Delightfully Authentic Mexican Burger.",
        "image_url": "dummy.jpg",
        "cuisine_type": "Chinese",
        "contact": "014783917035",
        "email": "olea.turkish@gmail.com",
        "creator_user_id": 0,
        "created_on": "2023-08-24T20:53:25.000Z",
        "last_updated_on": "2023-08-24T20:53:25.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        },
        "rating_info": {
            "rating_1": 0,
            "rating_2": 8,
            "rating_3": 6,
            "rating_4": 6,
            "rating_5": 10,
            "rating_avg": 3.6
        },
        "images": [
            "https://media-cdn.tripadvisor.com/media/photo-s/0e/ce/63/ab/salivating-seafood.jpg"
        ]
    }
]
```
## c. Create New restaurant

Endpoint URL: 
```
POST
```
```
/api/v1/restaurant/
```  
Request Body:    
```json
{
    "name": "Delicious Delights",
    "reservation_price": 75,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com"
}
```
Example Response:  
```json
{
    "restaurant_id": 102,
    "name": "Delicious Delights",
    "reservation_price": 75,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com",
    "created_on": "2023-08-01T13:50:25.000Z",
    "last_updated_on": "2023-08-01T13:50:25.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```
## d. Update a restaurant
Endpoint URL: 
```
PUT
```
```
/api/v1/restaurant/
``` 
Request Body:    
```json
{
    "restaurant_id" : 102,
    "name": "Ultra Delicious Delights 2",
    "reservation_price": 55,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com"
}
```
Example Response:  
```json
{
    "restaurant_id": 102,
    "name": "Ultra Delicious Delights 2",
    "reservation_price": 55,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com",
    "created_on": "2023-08-01T13:50:25.000Z",
    "last_updated_on": "2023-08-01T13:53:31.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## e. Delete a restaurant

Endpoint URL:  
```
DELETE
```
```
/api/v1/restaurant/104
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "restaurant_id": 104,
    "name": "Ultra Delicious Delights 2",
    "reservation_price": 55,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com",
    "created_on": "2023-08-01T13:53:09.000Z",
    "last_updated_on": "2023-08-01T13:53:09.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```


# Flight

## a. Get Single Flight by flight_id

Endpoint URL:    
```
GET
```
```
/api/v1/flight/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "flight_id": 1,
    "from_city_id": 28,
    "to_city_id": 16,
    "airline_name": "International Flights Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z",
    "from_city": {
        "city_id": 28,
        "name": "Rangamati",
        "country_name": "Bangladesh",
        "population": 3482659,
        "weather_type": "cold"
    },
    "to_city": {
        "city_id": 16,
        "name": "Jessore",
        "country_name": "Bangladesh",
        "population": 237478,
        "weather_type": "rainy"
    }
}
```

## b. Get Flights by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/flight?from_city_id=28,12,17,20&to_city_id=16,4,23,22&airline_name=e&min_price=2000&max_price=20000&seat_class=economy&min_duration=20&max_duration=150&departure_date=2023-01-01&return_date=2023-08-25&page=1&per_page=2&orderby=price&ordertype=asc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "flight_id": 4,
        "from_city_id": 20,
        "to_city_id": 22,
        "airline_name": "Luxury Airways Airlines",
        "departure_date": "2023-08-11T18:00:00.000Z",
        "return_date": "2023-08-14T18:00:00.000Z",
        "price": 3897,
        "seat_class": "Economy",
        "flight_duration": 74,
        "booking_url": "booking.com",
        "created_on": "2023-08-01T10:46:20.000Z",
        "last_updated_on": "2023-08-01T10:46:20.000Z",
        "from_city": {
            "city_id": 20,
            "name": "Netrokona",
            "country_name": "Bangladesh",
            "population": 229752,
            "weather_type": "sunny"
        },
        "to_city": {
            "city_id": 22,
            "name": "Narsingdi",
            "country_name": "Bangladesh",
            "population": 705768,
            "weather_type": "cold"
        }
    },
    {
        "flight_id": 2,
        "from_city_id": 12,
        "to_city_id": 4,
        "airline_name": "Luxury Flights Airlines",
        "departure_date": "2023-08-15T18:00:00.000Z",
        "return_date": "2023-08-21T18:00:00.000Z",
        "price": 18850,
        "seat_class": "Economy",
        "flight_duration": 39,
        "booking_url": "booking.com",
        "created_on": "2023-08-01T10:46:20.000Z",
        "last_updated_on": "2023-08-01T10:46:20.000Z",
        "from_city": {
            "city_id": 12,
            "name": "Narsingdi",
            "country_name": "Bangladesh",
            "population": 705768,
            "weather_type": "rainy"
        },
        "to_city": {
            "city_id": 4,
            "name": "Rajshahi",
            "country_name": "Bangladesh",
            "population": 9536714,
            "weather_type": "sunny"
        }
    }
]
```

## c. Create New Flight

Endpoint URL: 
```
POST
```
```
/api/v1/flight/
```  
Request Body:    
```json
{
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z"
}
```
Example Response:  
```json
{
    "flight_id": 102,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T18:01:27.000Z",
    "last_updated_on": "2023-08-01T18:01:27.000Z",
    "from_city": {
        "city_id": 29,
        "name": "Tangail",
        "country_name": "Bangladesh",
        "population": 160937,
        "weather_type": "rainy"
    },
    "to_city": {
        "city_id": 30,
        "name": "Chandpur",
        "country_name": "Bangladesh",
        "population": 115000,
        "weather_type": "rainy"
    }
}
```
## d. Update a Flight
Endpoint URL: 
```
PUT
```
```
/api/v1/flight/
```  
Request Body:    
```json
{
    "flight_id": 102,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "New Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z"
}
```
Example Response:  
```json
{
    "flight_id": 103,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "New Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T18:04:40.000Z",
    "last_updated_on": "2023-08-01T18:04:40.000Z",
    "from_city": {
        "city_id": 29,
        "name": "Tangail",
        "country_name": "Bangladesh",
        "population": 160937,
        "weather_type": "rainy"
    },
    "to_city": {
        "city_id": 30,
        "name": "Chandpur",
        "country_name": "Bangladesh",
        "population": 115000,
        "weather_type": "rainy"
    }
}
```

## e. Delete a Flight

Endpoint URL:  
```
DELETE
```
```
api/v1/flight/102
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "flight_id": 102,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T18:01:27.000Z",
    "last_updated_on": "2023-08-01T18:01:27.000Z",
    "from_city": {
        "city_id": 29,
        "name": "Tangail",
        "country_name": "Bangladesh",
        "population": 160937,
        "weather_type": "rainy"
    },
    "to_city": {
        "city_id": 30,
        "name": "Chandpur",
        "country_name": "Bangladesh",
        "population": 115000,
        "weather_type": "rainy"
    }
}
```

# Review

## a. Get Single Review by review_id

Endpoint URL:    
```
GET
```
```
/api/v1/review/4
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "review_id": 4,
    "user_id": 2,
    "posting_date": "2023-08-01T21:08:54.000Z",
    "description": "Absolutely amazing restaurant",
    "rating": 5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 15,
        "object_type": "restaurant",
        "object": {
            "restaurant_id": 15,
            "name": "Authentic Pizzeria Burger Restaurant",
            "reservation_price": 72,
            "address": "60 Riverfront",
            "city_id": 10,
            "description": "A restaurant serving Passionately Elegant Greek Dim Sum.",
            "image_url": "dummy.jpg",
            "cuisine_type": "Italian",
            "contact": "015135654557",
            "email": "authenticpizzeriaburgerrestaurant@outlook.com",
            "created_on": "2023-08-01T10:46:20.000Z",
            "last_updated_on": "2023-08-01T10:46:20.000Z",
            "city": {
                "city_id": 10,
                "name": "Narayanganj",
                "country_name": "Bangladesh",
                "population": 2200000,
                "weather_type": "sunny"
            }
        }
    },
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

## b. Get Reviews by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/review?user_id=2&object_type=hotel&object_id=2&rating_min=3&rating_max=5&page=1&per_page=2&orderby=rating&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "review_id": 350,
        "user_id": 2,
        "posting_date": "2023-08-25T08:29:34.000Z",
        "description": "Efficient check-in and check-out process saved us valuable time. Convenient parking arrangements added to our comfort. Regular housekeeping maintained a clean and organized environment. Efficient management ensured a smooth stay. Timely wake-up calls assisted our daily schedule.",
        "rating": 5,
        "image_url": "dummy.jpg",
        "upvote_count": 0,
        "object": {
            "object_type": "hotel",
            "object_id": 2,
            "object": {
                "hotel_id": 2,
                "name": "Hotel Sarina Dhaka",
                "address": "39 Ocean Drive Dhaka , Bangladesh",
                "city_id": 1,
                "description": "A Wonderfully Charming hotel in Dhaka.",
                "image_url": "dummy.jpg",
                "price_per_day": 8754,
                "phone": "015244332657",
                "email": "hotel.sarina@outlook.com",
                "has_wifi": 1,
                "has_parking": 0,
                "has_gym": 1,
                "creator_user_id": 0,
                "created_on": "2023-08-25T08:29:26.000Z",
                "last_updated_on": "2023-08-25T08:29:26.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 9,
                    "rating_3": 14,
                    "rating_4": 4,
                    "rating_5": 11,
                    "rating_avg": 3.45
                },
                "images": [
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/b2/b0/0e/hotel-exterior.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/b6/93/5a/hotel-sarina-dhaka.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/b6/8d/7c/hotel-sarina-dhaka.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/2e/8d/c7/hotel-sarina.jpg?w=1500&h=1000&s=1"
                ]
            }
        },
        "user": {
            "user_id": 2,
            "username": "jab3r",
            "email": "xyz@gmail.com",
            "role": "client",
            "name": "Jaber Ahmed Deeder",
            "bio": "Pro Coder",
            "city_id": 1,
            "facebook_url": "facebook.com/xyz",
            "twitter_url": "twitter.com/xyz",
            "instagram_url": "instagram.com/xyz",
            "profile_picture": "dummy.jpg",
            "dob": "2002-09-16T18:00:00.000Z",
            "registration_date": "2023-08-25T08:29:22.000Z",
            "status": "active",
            "created_on": "2023-08-25T08:29:22.000Z",
            "last_updated_on": "2023-08-25T08:29:22.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    },
    {
        "review_id": 412,
        "user_id": 2,
        "posting_date": "2023-08-25T08:29:34.000Z",
        "description": "Conference and meeting facilities were well-equipped for business travelers. Cultural and local decor elements gave the hotel a unique charm. Beautifully designed interiors created a pleasant ambiance. Friendly concierge was always ready to offer helpful recommendations. Fast WiFi contributed to a connected stay.",
        "rating": 5,
        "image_url": "dummy.jpg",
        "upvote_count": 0,
        "object": {
            "object_type": "hotel",
            "object_id": 2,
            "object": {
                "hotel_id": 2,
                "name": "Hotel Sarina Dhaka",
                "address": "39 Ocean Drive Dhaka , Bangladesh",
                "city_id": 1,
                "description": "A Wonderfully Charming hotel in Dhaka.",
                "image_url": "dummy.jpg",
                "price_per_day": 8754,
                "phone": "015244332657",
                "email": "hotel.sarina@outlook.com",
                "has_wifi": 1,
                "has_parking": 0,
                "has_gym": 1,
                "creator_user_id": 0,
                "created_on": "2023-08-25T08:29:26.000Z",
                "last_updated_on": "2023-08-25T08:29:26.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                },
                "rating_info": {
                    "rating_1": 0,
                    "rating_2": 9,
                    "rating_3": 14,
                    "rating_4": 4,
                    "rating_5": 11,
                    "rating_avg": 3.45
                },
                "images": [
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/b2/b0/0e/hotel-exterior.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/b6/93/5a/hotel-sarina-dhaka.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/b6/8d/7c/hotel-sarina-dhaka.jpg?w=1500&h=1000&s=1",
                    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/2e/8d/c7/hotel-sarina.jpg?w=1500&h=1000&s=1"
                ]
            }
        },
        "user": {
            "user_id": 2,
            "username": "jab3r",
            "email": "xyz@gmail.com",
            "role": "client",
            "name": "Jaber Ahmed Deeder",
            "bio": "Pro Coder",
            "city_id": 1,
            "facebook_url": "facebook.com/xyz",
            "twitter_url": "twitter.com/xyz",
            "instagram_url": "instagram.com/xyz",
            "profile_picture": "dummy.jpg",
            "dob": "2002-09-16T18:00:00.000Z",
            "registration_date": "2023-08-25T08:29:22.000Z",
            "status": "active",
            "created_on": "2023-08-25T08:29:22.000Z",
            "last_updated_on": "2023-08-25T08:29:22.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    }
]
```

## c. Create New Review
### user_id will be auto grabbed from req.user
Endpoint URL: 
```
POST
```
```
/api/v1/review/
```  
Request Body:    
```json
{
  "description": "Wholesome Trip !!!",
  "rating": 4.5,
  "image_url": "dummy.jpg",
  "object_type": "trip",
  "object_id": 1
}
```
Example Response:  
```json
{
    "review_id": 3,
    "user_id": 1,
    "posting_date": "2023-08-03T13:30:26.000Z",
    "description": "Wholesome Trip !!!",
    "rating": 4.5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 1,
        "object_type": "trip",
        "object": {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Summer Vacation in Paris",
            "description": "Enjoy the charm of Paris in summer",
            "image_url": "paris_summer.jpg",
            "total_price": 49878,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-03T07:32:23.000Z",
            "last_updated_on": "2023-08-03T07:32:23.000Z",
            "deleted_on": null
        }
    },
    "user": {
        "user_id": 1,
        "username": "aaniksahaa",
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```
## d. Update a Review
### Note that, the object_type of the review cannot be changed
Endpoint URL: 
```
PUT
```
```
/api/v1/review/
```  
Request Body:    
```json
{
  "review_id": 3,
  "description": "Wholesome Trip !!!",
  "rating": 3.5,
  "image_url": "dummy.jpg",
  "object_type": "trip",
  "object_id": 1
}
```
Example Response:  
```json
{
    "review_id": 3,
    "user_id": 1,
    "posting_date": "2023-08-03T13:30:26.000Z",
    "description": "Wholesome Trip !!!",
    "rating": 3.5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 1,
        "object_type": "trip",
        "object": {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Summer Vacation in Paris",
            "description": "Enjoy the charm of Paris in summer",
            "image_url": "paris_summer.jpg",
            "total_price": 49878,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-03T07:32:23.000Z",
            "last_updated_on": "2023-08-03T07:32:23.000Z",
            "deleted_on": null
        }
    },
    "user": {
        "user_id": 1,
        "username": "aaniksahaa",
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

## e. Delete a Review

Endpoint URL:  
```
DELETE
```
```
api/v1/review/4
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "review_id": 5,
    "user_id": 2,
    "posting_date": "2023-08-01T21:49:11.000Z",
    "description": "Wholesome Trip !!!",
    "rating": 5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 1,
        "object_type": "trip",
        "object": {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Novelty Tour",
            "description": "A wonderful Trip, it will be.",
            "image_url": "dummy.jpg",
            "total_price": 22799,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "created_on": "2023-08-01T12:57:17.000Z",
            "last_updated_on": "2023-08-01T12:57:17.000Z",
            "deleted_on": null
        }
    },
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```


# TripBooking

## a. Get Single TripBooking by user_id and trip_id
### user_id is auto grabbed from req.user
Endpoint URL:    
```
GET
```
```
/api/v1/tripbooking/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "trip_id": 1,
    "booking_date": "2023-08-01T22:14:06.000Z",
    "is_paid": 0,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": null,
    "transaction_id": null,
    "payment_date": null,
    "completion_date": null,
    "is_private": 0,
    "created_on": "2023-08-01T22:14:06.000Z",
    "last_updated_on": "2023-08-01T22:14:06.000Z",
    "user": {
        "user_id": 1,
        "email": "changed_email@example.com",
        "role": "user",
        "name": "John Doe",
        "bio": "I love traveling and exploring new places.",
        "city_id": 1,
        "facebook_url": "https://www.facebook.com/johndoe",
        "twitter_url": "https://twitter.com/johndoe",
        "instagram_url": "https://www.instagram.com/johndoe",
        "profile_picture": "https://example.com/profile_picture.jpg",
        "dob": "1990-05-14T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T11:46:58.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 1,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Novelty Tour",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 22799,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "created_on": "2023-08-01T12:57:17.000Z",
        "last_updated_on": "2023-08-01T12:57:17.000Z",
        "deleted_on": null
    }
}
```

## b. Get TripBookings by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/tripbooking?is_paid=1&is_processed=1&is_completed=0&payment_method=bkash&page=1&per_page=2&orderby=booking_date&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "user_id": 1,
        "trip_id": 3,
        "booking_date": "2023-08-02T14:15:12.000Z",
        "is_paid": 1,
        "is_processed": 1,
        "is_completed": 0,
        "payment_method": "bkash",
        "transaction_id": "ABCDE",
        "payment_date": "2023-08-02T15:52:58.000Z",
        "completion_date": null,
        "is_private": null,
        "created_on": "2023-08-02T14:15:12.000Z",
        "last_updated_on": "2023-08-02T15:53:13.000Z",
        "trip": {
            "trip_id": 3,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "New   New Mini Tour",
            "description": "A wonderful Trip, it will be.",
            "image_url": "dummy.jpg",
            "total_price": 29728,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-02T14:14:17.000Z",
            "last_updated_on": "2023-08-02T14:14:17.000Z",
            "deleted_on": null
        },
        "user": {
            "user_id": 1,
            "email": "abc@gmail.com",
            "role": "client",
            "name": "Anik Saha",
            "bio": "Little Coder",
            "city_id": 1,
            "facebook_url": "facebook.com/abc",
            "twitter_url": "twitter.com/abc",
            "instagram_url": "instagram.com/abc",
            "profile_picture": "dummy.jpg",
            "dob": "2002-09-16T18:00:00.000Z",
            "registration_date": "2023-08-02T14:11:02.000Z",
            "status": "active",
            "created_on": "2023-08-02T14:11:02.000Z",
            "last_updated_on": "2023-08-02T14:11:02.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    },
    {
        "user_id": 1,
        "trip_id": 2,
        "booking_date": "2023-08-02T14:15:08.000Z",
        "is_paid": 1,
        "is_processed": 1,
        "is_completed": 0,
        "payment_method": "bkash",
        "transaction_id": "XYZ",
        "payment_date": "2023-08-02T16:00:58.000Z",
        "completion_date": null,
        "is_private": null,
        "created_on": "2023-08-02T14:15:08.000Z",
        "last_updated_on": "2023-08-02T16:01:20.000Z",
        "trip": {
            "trip_id": 2,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "New Mini Tour",
            "description": "A wonderful Trip, it will be.",
            "image_url": "dummy.jpg",
            "total_price": 29728,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "creator_user_id": 1,
            "created_on": "2023-08-02T14:14:10.000Z",
            "last_updated_on": "2023-08-02T14:14:10.000Z",
            "deleted_on": null
        },
        "user": {
            "user_id": 1,
            "email": "abc@gmail.com",
            "role": "client",
            "name": "Anik Saha",
            "bio": "Little Coder",
            "city_id": 1,
            "facebook_url": "facebook.com/abc",
            "twitter_url": "twitter.com/abc",
            "instagram_url": "instagram.com/abc",
            "profile_picture": "dummy.jpg",
            "dob": "2002-09-16T18:00:00.000Z",
            "registration_date": "2023-08-02T14:11:02.000Z",
            "status": "active",
            "created_on": "2023-08-02T14:11:02.000Z",
            "last_updated_on": "2023-08-02T14:11:02.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    }
]
```

## c. Create New TripBooking
### user_id is auto grabbed from req.user
Endpoint URL: 
```
POST
```
```
/api/v1/tripbooking/
```  
Request Body:    
```json
{
    "trip_id": 3,
    "is_private": 1
}
```
Example Response:  
```json
{
    "user_id": 1,
    "trip_id": 3,
    "booking_date": "2023-08-02T08:41:57.000Z",
    "is_paid": 0,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": null,
    "transaction_id": null,
    "payment_date": null,
    "completion_date": null,
    "is_private": 0,
    "created_on": "2023-08-02T08:41:57.000Z",
    "last_updated_on": "2023-08-02T08:41:57.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T08:35:04.000Z",
        "status": "active",
        "created_on": "2023-08-02T08:35:04.000Z",
        "last_updated_on": "2023-08-02T08:35:04.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Sunrise Infinite",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 32571,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "created_on": "2023-08-02T08:35:51.000Z",
        "last_updated_on": "2023-08-02T08:35:51.000Z",
        "deleted_on": null
    }
}
```

## d. Confirm Payment for TripBooking
### user_id is auto grabbed from req.user
Endpoint URL: 
```
PUT
```
```
/api/v1/tripbooking/payment/
```  
Request Body:    
```json
{
    "trip_id": 1,
    "payment_method": "bkash",
    "transaction_id": "ABCDE"
}
```
Example Response:  
```json
{
    "user_id": 2,
    "trip_id": 1,
    "booking_date": "2023-08-02T13:38:21.000Z",
    "is_paid": 1,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": "bkash",
    "transaction_id": "ABCDE",
    "payment_date": "2023-08-02T13:40:17.000Z",
    "completion_date": null,
    "is_private": 1,
    "created_on": "2023-08-02T13:38:21.000Z",
    "last_updated_on": "2023-08-02T13:40:17.000Z",
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T09:59:14.000Z",
        "status": "active",
        "created_on": "2023-08-02T09:59:14.000Z",
        "last_updated_on": "2023-08-02T09:59:14.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 1,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Departmental Tour to Infinity",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 32571,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 0,
        "created_on": "2023-08-02T10:05:52.000Z",
        "last_updated_on": "2023-08-02T10:05:52.000Z",
        "deleted_on": null
    }
}
```

## e. Confirm Processing for TripBooking
### It is intended that this route be used only by admins or managers
Endpoint URL: 
```
PUT
```
```
/api/v1/tripbooking/onlyadmin/processed/
```  
Request Body:    
```json
{
    "user_id": 1,
    "trip_id": 3
}
```
Example Response:  
```json
{
    "user_id": 1,
    "trip_id": 3,
    "booking_date": "2023-08-02T13:38:06.000Z",
    "is_paid": 1,
    "is_processed": 1,
    "is_completed": 0,
    "payment_method": "bkash",
    "transaction_id": "ABCDE",
    "payment_date": "2023-08-02T14:06:37.000Z",
    "completion_date": null,
    "is_private": 1,
    "created_on": "2023-08-02T13:38:06.000Z",
    "last_updated_on": "2023-08-02T14:06:54.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T09:59:14.000Z",
        "status": "active",
        "created_on": "2023-08-02T09:59:14.000Z",
        "last_updated_on": "2023-08-02T09:59:14.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Summer 33 Vacation",
        "description": "Enjoy the summer break",
        "image_url": "trip_image.jpg",
        "total_price": 49878,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T10:10:58.000Z",
        "last_updated_on": "2023-08-02T10:10:58.000Z",
        "deleted_on": null
    }
}
```

## f. Confirm Completion for TripBooking
### It is intended that this route be used only by admins or managers
Endpoint URL: 
```
PUT
```
```
/api/v1/tripbooking/onlyadmin/complete/
```  
Request Body:    
```json
{
    "user_id": 1,
    "trip_id": 3
}
```
Example Response:  
```json
{
    "user_id": 1,
    "trip_id": 3,
    "booking_date": "2023-08-02T13:38:06.000Z",
    "is_paid": 1,
    "is_processed": 1,
    "is_completed": 1,
    "payment_method": "bkash",
    "transaction_id": "ABCDE",
    "payment_date": "2023-08-02T14:06:37.000Z",
    "completion_date": "2023-08-02T14:08:21.000Z",
    "is_private": 1,
    "created_on": "2023-08-02T13:38:06.000Z",
    "last_updated_on": "2023-08-02T14:08:21.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T09:59:14.000Z",
        "status": "active",
        "created_on": "2023-08-02T09:59:14.000Z",
        "last_updated_on": "2023-08-02T09:59:14.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Summer 33 Vacation",
        "description": "Enjoy the summer break",
        "image_url": "trip_image.jpg",
        "total_price": 49878,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T10:10:58.000Z",
        "last_updated_on": "2023-08-02T10:10:58.000Z",
        "deleted_on": null
    }
}
```

## g. Delete a TripBooking ( Soft Deletion )
### user_id is auto grabbed from req.user
Endpoint URL:  
```
DELETE
```
```
/api/v1/tripbooking/2
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "trip_id": 2,
    "booking_date": "2023-08-02T14:15:04.000Z",
    "is_paid": 0,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": null,
    "transaction_id": null,
    "payment_date": null,
    "completion_date": null,
    "is_private": null,
    "created_on": "2023-08-02T14:15:04.000Z",
    "last_updated_on": "2023-08-02T14:15:04.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T14:11:02.000Z",
        "status": "active",
        "created_on": "2023-08-02T14:11:02.000Z",
        "last_updated_on": "2023-08-02T14:11:02.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 1,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Mini Tour",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 29728,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T14:13:58.000Z",
        "last_updated_on": "2023-08-02T14:13:58.000Z",
        "deleted_on": null
    }
}
```

## h. Delete a TripBooking ( Permanent Deletion )
### user_id is auto grabbed from req.user
Endpoint URL:
```
DELETE
```
```
/api/v1/tripbooking/danger/2
``` 
Request Body: `None`    
Example Response:    
```json
{
    "user_id": "1",
    "trip_id": "2",
    "status": "permanently deleted"
}
```

# Post

## a. Get Single Post by post_id

Endpoint URL:    
```
GET
```
```
/api/v1/post/6
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "post_id": 6,
    "user_id": 1,
    "posting_date": "2023-08-25T08:54:31.000Z",
    "description": "Amazing Post",
    "image_url": "amazing.jpg",
    "images": [
        "a.jpg",
        "b.jpg"
    ]
}
```

## b. Get Single Post Details by post_id

Endpoint URL:    
```
GET
```
```
/api/v1/post/details/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "post_id": 1,
    "user_id": 2,
    "posting_date": "2023-09-10T08:51:01.000Z",
    "description": "Beneath the star-studded sky, I lay on the grass, the universe above a tapestry of wonder and mystery. In the heart of the desert, the sand dunes stretched out in every direction, a sea of golden waves. Beneath the ancient olive trees, I found a sense of serenity, a feeling of time standing still in the grove.",
    "image_url": "https://thumbs.dreamstime.com/b/bright-summer-seascape-sunset-copy-space-sea-beach-tour-opening-resorts-evening-article-vacation-184523328.jpg",
    "images": null,
    "user": {
        "user_id": 2,
        "username": "jab3r",
        "email": "xyz@gmail.com",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-09-10T08:50:26.000Z",
        "status": "active",
        "created_on": "2023-09-10T08:50:26.000Z",
        "last_updated_on": "2023-09-10T08:50:26.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "comments": [
        {
            "comment_id": 290,
            "user_id": 9,
            "post_id": 1,
            "commenting_date": "2023-09-10T08:51:03.000Z",
            "text": "Im loving your feed.",
            "upvote_count": 0,
            "user": {
                "user_id": 9,
                "username": "sohel.chowdhury",
                "email": "sohel.chowdhury@yahoo.com",
                "role": "client",
                "name": "Sohel Chowdhury",
                "bio": "Hey! I am using Tripify",
                "city_id": 12,
                "facebook_url": "https://www.facebook.com/leomessi",
                "twitter_url": "https://twitter.com/imessi",
                "instagram_url": "https://www.instagram.com/leomessi",
                "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                "dob": "1955-06-16T18:00:00.000Z",
                "registration_date": "2023-09-10T08:50:26.000Z",
                "status": "active",
                "created_on": "2023-09-10T08:50:26.000Z",
                "last_updated_on": "2023-09-10T08:50:26.000Z",
                "city": {
                    "city_id": 12,
                    "name": "Feni",
                    "country_name": "Bangladesh",
                    "population": 705768,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "comment_id": 17,
            "user_id": 4,
            "post_id": 1,
            "commenting_date": "2023-09-10T08:51:02.000Z",
            "text": "Youre changing the world. This made my day. This is legendary.",
            "upvote_count": 0,
            "user": {
                "user_id": 4,
                "username": "sabina_khatun",
                "email": "sabina_khatun@yahoo.com",
                "role": "client",
                "name": "Sabina Khatun",
                "bio": "Hey! I am using Tripify",
                "city_id": 24,
                "facebook_url": "https://www.facebook.com/leomessi",
                "twitter_url": "https://twitter.com/imessi",
                "instagram_url": "https://www.instagram.com/leomessi",
                "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                "dob": "1972-12-27T18:00:00.000Z",
                "registration_date": "2023-09-10T08:50:26.000Z",
                "status": "active",
                "created_on": "2023-09-10T08:50:26.000Z",
                "last_updated_on": "2023-09-10T08:50:26.000Z",
                "city": {
                    "city_id": 24,
                    "name": "Jhenaidah",
                    "country_name": "Bangladesh",
                    "population": 126379,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "comment_id": 134,
            "user_id": 3,
            "post_id": 1,
            "commenting_date": "2023-09-10T08:51:02.000Z",
            "text": "This is revolutionary. Im in love with this.",
            "upvote_count": 0,
            "user": {
                "user_id": 3,
                "username": "sohel_uddin",
                "email": "sohel_uddin@gmail.com",
                "role": "client",
                "name": "Sohel Uddin",
                "bio": "Hey! I am using Tripify",
                "city_id": 7,
                "facebook_url": "https://www.facebook.com/leomessi",
                "twitter_url": "https://twitter.com/imessi",
                "instagram_url": "https://www.instagram.com/leomessi",
                "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                "dob": "1998-12-22T18:00:00.000Z",
                "registration_date": "2023-09-10T08:50:26.000Z",
                "status": "active",
                "created_on": "2023-09-10T08:50:26.000Z",
                "last_updated_on": "2023-09-10T08:50:26.000Z",
                "city": {
                    "city_id": 7,
                    "name": "Rangpur",
                    "country_name": "Bangladesh",
                    "population": 2901390,
                    "weather_type": "sunny"
                }
            }
        },
        {
            "comment_id": 141,
            "user_id": 10,
            "post_id": 1,
            "commenting_date": "2023-09-10T08:51:02.000Z",
            "text": "Youve outdone yourself.",
            "upvote_count": 0,
            "user": {
                "user_id": 10,
                "username": "momin.mahmud",
                "email": "momin.mahmud@yahoo.com",
                "role": "client",
                "name": "Momin Mahmud",
                "bio": "Hey! I am using Tripify",
                "city_id": 8,
                "facebook_url": "https://www.facebook.com/leomessi",
                "twitter_url": "https://twitter.com/imessi",
                "instagram_url": "https://www.instagram.com/leomessi",
                "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                "dob": "1997-03-02T18:00:00.000Z",
                "registration_date": "2023-09-10T08:50:26.000Z",
                "status": "active",
                "created_on": "2023-09-10T08:50:26.000Z",
                "last_updated_on": "2023-09-10T08:50:26.000Z",
                "city": {
                    "city_id": 8,
                    "name": "Sylhet",
                    "country_name": "Bangladesh",
                    "population": 3482659,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "comment_id": 169,
            "user_id": 9,
            "post_id": 1,
            "commenting_date": "2023-09-10T08:51:02.000Z",
            "text": "This is a game-changer. This is world-changing. Youre a game-changer.",
            "upvote_count": 0,
            "user": {
                "user_id": 9,
                "username": "sohel.chowdhury",
                "email": "sohel.chowdhury@yahoo.com",
                "role": "client",
                "name": "Sohel Chowdhury",
                "bio": "Hey! I am using Tripify",
                "city_id": 12,
                "facebook_url": "https://www.facebook.com/leomessi",
                "twitter_url": "https://twitter.com/imessi",
                "instagram_url": "https://www.instagram.com/leomessi",
                "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                "dob": "1955-06-16T18:00:00.000Z",
                "registration_date": "2023-09-10T08:50:26.000Z",
                "status": "active",
                "created_on": "2023-09-10T08:50:26.000Z",
                "last_updated_on": "2023-09-10T08:50:26.000Z",
                "city": {
                    "city_id": 12,
                    "name": "Feni",
                    "country_name": "Bangladesh",
                    "population": 705768,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "comment_id": 258,
            "user_id": 1,
            "post_id": 1,
            "commenting_date": "2023-09-10T08:51:02.000Z",
            "text": "I love this! Youre a true innovator. Impressive work!",
            "upvote_count": 0,
            "user": {
                "user_id": 1,
                "username": "aaniksahaa",
                "email": "abc@gmail.com",
                "role": "client",
                "name": "Anik Saha",
                "bio": "Little Coder",
                "city_id": 1,
                "facebook_url": "facebook.com/abc",
                "twitter_url": "twitter.com/abc",
                "instagram_url": "instagram.com/abc",
                "profile_picture": "dummy.jpg",
                "dob": "2002-09-16T18:00:00.000Z",
                "registration_date": "2023-09-10T08:50:26.000Z",
                "status": "active",
                "created_on": "2023-09-10T08:50:26.000Z",
                "last_updated_on": "2023-09-10T08:50:26.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        }
    ],
    "reacts": [
        {
            "user_id": 1,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        },
        {
            "user_id": 2,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        },
        {
            "user_id": 3,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        },
        {
            "user_id": 4,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        },
        {
            "user_id": 5,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        },
        {
            "user_id": 7,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        },
        {
            "user_id": 10,
            "react_type": "like",
            "reacting_date": "2023-09-10T08:51:03.000Z"
        }
    ]
}
```

## c. Get Post Details by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/post?user_id=1&posting_date=2023-08-03&page=2&per_page=2&orderby=posting_date&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "post_id": 8,
        "user_id": 1,
        "posting_date": "2023-08-03T09:34:47.000Z",
        "description": "Amazing Post",
        "image_url": "dummy.jpg",
        "comments": [
            {
                "comment_id": 7,
                "user_id": 1,
                "post_id": 8,
                "commenting_date": "2023-08-03T16:39:19.000Z",
                "text": "cool post",
                "upvote_count": 0,
                "user": {
                    "user_id": 1,
                    "username": "aaniksahaa",
                    "email": "abc@gmail.com",
                    "role": "client",
                    "name": "Anik Saha",
                    "bio": "Little Coder",
                    "city_id": 1,
                    "facebook_url": "facebook.com/abc",
                    "twitter_url": "twitter.com/abc",
                    "instagram_url": "instagram.com/abc",
                    "profile_picture": "dummy.jpg",
                    "dob": "2002-09-16T18:00:00.000Z",
                    "registration_date": "2023-08-03T07:32:21.000Z",
                    "status": "active",
                    "created_on": "2023-08-03T07:32:21.000Z",
                    "last_updated_on": "2023-08-03T07:32:21.000Z",
                    "city": {
                        "city_id": 1,
                        "name": "Dhaka",
                        "country_name": "Bangladesh",
                        "population": 168957745,
                        "weather_type": "rainy"
                    }
                }
            }
        ],
        "reacts": [
            {
                "user_id": 1,
                "react_type": "like",
                "reacting_date": "2023-08-03T13:04:17.000Z"
            }
        ]
    },
    {
        "post_id": 7,
        "user_id": 1,
        "posting_date": "2023-08-03T09:34:42.000Z",
        "description": "Cool Post",
        "image_url": "dummy.jpg",
        "comments": [],
        "reacts": []
    }
]
```

## d. Create New Post
### user_id is auto grabbed from req.user
Endpoint URL: 
```
POST
```
```
/api/v1/post/
```  
Request Body:    
```json
{
    "description": "Amazing Post",
    "image_url": "amazing.jpg",
    "images": ["a.jpg","b.jpg"]
}
```
Example Response:  
```json
{
    "post_id": 6,
    "user_id": 1,
    "posting_date": "2023-08-25T08:54:31.000Z",
    "description": "Amazing Post",
    "image_url": "amazing.jpg",
    "images": [
        "a.jpg",
        "b.jpg"
    ]
}
```
## e. Update a Post
### user_id is auto grabbed from req.user
Endpoint URL: 
```
PUT
```
```
/api/v1/post/
```  
Request Body:    
```json
{
    "post_id": 6,
    "description": "Amazing Post",
    "image_url": "amazing.jpg",
    "images": ["x.jpg","y.jpg","z.jpg"]
}
```
Example Response:  
```json
{
    "post_id": 6,
    "user_id": 1,
    "posting_date": "2023-08-25T08:54:31.000Z",
    "description": "Amazing Post",
    "image_url": "amazing.jpg",
    "images": [
        "z.jpg",
        "x.jpg",
        "y.jpg"
    ]
}
```

## f. Delete a Post

Endpoint URL:  
```
DELETE
```
```
api/v1/post/10
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "post_id": 10,
    "user_id": 2,
    "posting_date": "2023-08-03T09:38:43.000Z",
    "description": "Updated Amazing Post",
    "image_url": "amazing.jpg"
}
```
## g. Reacting to a post
### The user_id will be auto grabbed from req.user
### Allowable reacts: 1 - like, 2 - love, 3 - haha, 4 - care, 5 - wow, 6 - sad
Endpoint URL:    
```
POST
```
```
/api/v1/post/11/react/4
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "post_id": 11,
    "react_type": "care",
    "reacting_date": "2023-08-03T13:07:59.000Z"
}
```

## h. Removing react from a post
### The user_id will be auto grabbed from req.user
### Allowable reacts: 1 - like, 2 - love, 3 - haha, 4 - care, 5 - wow, 6 - sad
Endpoint URL:    
```
DELETE
```
```
/api/v1/post/11/react/
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "post_id": 11,
    "react_type": "haha",
    "reacting_date": "2023-08-03T13:20:38.000Z"
}
```
## i. Checking whether a User has reacted to a post
### The user_id will be auto grabbed from req.user
Endpoint URL: 
```
GET
```
```
/api/v1/post/1/react
```  
Request Body:    
```
None
```
Example Response:  
```json
{
    "has_reacted ": 1,
    "user_id": 1,
    "post_id": 1
}
```
# Comment

## a. Get Single Comment by comment_id

Endpoint URL:    
```
GET
```
```
/api/v1/comment/3
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "comment_id": 3,
    "user_id": 2,
    "post_id": 2,
    "commenting_date": "2023-07-28T18:00:00.000Z",
    "text": "This is a great post!",
    "upvote_count": 10,
    "user": {
        "user_id": 2,
        "username": "jab3r",
        "email": "xyz@gmail.com",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

## b. Get Comments by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/comment?user_id=1&post_id=1&page=1&per_page=2&orderby=commenting_date&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "comment_id": 4,
        "user_id": 1,
        "post_id": 1,
        "commenting_date": "2023-07-28T18:00:00.000Z",
        "text": "This is a great post!",
        "upvote_count": 10,
        "user": {
            "user_id": 1,
            "username": "aaniksahaa",
            "email": "abc@gmail.com",
            "role": "client",
            "name": "Anik Saha",
            "bio": "Little Coder",
            "city_id": 1,
            "facebook_url": "facebook.com/abc",
            "twitter_url": "twitter.com/abc",
            "instagram_url": "instagram.com/abc",
            "profile_picture": "dummy.jpg",
            "dob": "2002-09-16T18:00:00.000Z",
            "registration_date": "2023-08-03T07:32:21.000Z",
            "status": "active",
            "created_on": "2023-08-03T07:32:21.000Z",
            "last_updated_on": "2023-08-03T07:32:21.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    },
    {
        "comment_id": 5,
        "user_id": 1,
        "post_id": 1,
        "commenting_date": "2023-07-28T18:00:00.000Z",
        "text": "Another Comment done",
        "upvote_count": 10,
        "user": {
            "user_id": 1,
            "username": "aaniksahaa",
            "email": "abc@gmail.com",
            "role": "client",
            "name": "Anik Saha",
            "bio": "Little Coder",
            "city_id": 1,
            "facebook_url": "facebook.com/abc",
            "twitter_url": "twitter.com/abc",
            "instagram_url": "instagram.com/abc",
            "profile_picture": "dummy.jpg",
            "dob": "2002-09-16T18:00:00.000Z",
            "registration_date": "2023-08-03T07:32:21.000Z",
            "status": "active",
            "created_on": "2023-08-03T07:32:21.000Z",
            "last_updated_on": "2023-08-03T07:32:21.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    }
]
```

## c. Create New Comment

Endpoint URL: 
```
POST
```
```
/api/v1/comment/
```  
Request Body:    
```json
{
    "post_id": 1,
    "text": "cool post, man"
}
```
Example Response:  
```json
{
    "comment_id": 1,
    "user_id": 1,
    "post_id": 1,
    "commenting_date": "2023-08-03T15:57:21.000Z",
    "text": "cool post, man",
    "upvote_count": 0,
    "user": {
        "user_id": 1,
        "username": "aaniksahaa",
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```
## d. Update a Comment
Endpoint URL: 
```
PUT
```
```
/api/v1/comment/
```  
Request Body:    
```json
{
    "comment_id": "1",
    "text": "very cool post, man"
}
```
Example Response:  
```json
{
    "comment_id": 1,
    "user_id": 1,
    "post_id": 1,
    "commenting_date": "2023-08-03T15:57:21.000Z",
    "text": "very cool post, man",
    "upvote_count": 0,
    "user": {
        "user_id": 1,
        "username": "aaniksahaa",
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

## e. Delete a Comment

Endpoint URL:  
```
DELETE
```
```
api/v1/comment/2
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "comment_id": 2,
    "user_id": 1,
    "post_id": 1,
    "commenting_date": "2023-08-03T16:00:23.000Z",
    "text": "very cool post, man",
    "upvote_count": 0,
    "user": {
        "user_id": 1,
        "username": "aaniksahaa",
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-03T07:32:21.000Z",
        "status": "active",
        "created_on": "2023-08-03T07:32:21.000Z",
        "last_updated_on": "2023-08-03T07:32:21.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

# Feed

## a. Get Feed of current user ( Paginated )  
### user_id auto grabbed from req.user
#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/feed?page=1&per_page=8&orderby=posting_date&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "post_id": 39,
        "user_id": 4,
        "posting_date": "2023-09-10T08:51:02.000Z",
        "description": "As the sun dipped below the horizon, the sky painted a vivid canvas of oranges and purples, creating a mesmerizing sunset. Among the ancient ruins, I could almost hear the whispers of history, the stories of those who came before. At the top of the mountain, I felt a sense of accomplishment as I looked out over the sprawling landscape below.",
        "image_url": "https://eplatfront.villagroup.com/content/themes/base/images/puerto-vallarta/activities/p1/a59/16TIROLESA.jpg?width=920&height=520&mode=crop&autorotate=true",
        "user": {
            "user_id": 4,
            "username": "sabina_khatun",
            "email": "sabina_khatun@yahoo.com",
            "role": "client",
            "name": "Sabina Khatun",
            "bio": "Hey! I am using Tripify",
            "city_id": 24,
            "facebook_url": "https://www.facebook.com/leomessi",
            "twitter_url": "https://twitter.com/imessi",
            "instagram_url": "https://www.instagram.com/leomessi",
            "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
            "dob": "1972-12-27T18:00:00.000Z",
            "registration_date": "2023-09-10T08:50:26.000Z",
            "status": "active",
            "created_on": "2023-09-10T08:50:26.000Z",
            "last_updated_on": "2023-09-10T08:50:26.000Z",
            "city": {
                "city_id": 24,
                "name": "Jhenaidah",
                "country_name": "Bangladesh",
                "population": 126379,
                "weather_type": "rainy"
            }
        },
        "comments": [
            {
                "comment_id": 59,
                "user_id": 8,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "Youre setting the bar high.",
                "upvote_count": 0,
                "user": {
                    "user_id": 8,
                    "username": "tahmina_ali",
                    "email": "tahmina_ali@yahoo.com",
                    "role": "client",
                    "name": "Tahmina Ali",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 21,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1964-10-18T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 21,
                        "name": "Savar",
                        "country_name": "Bangladesh",
                        "population": 160242,
                        "weather_type": "sunny"
                    }
                }
            },
            {
                "comment_id": 97,
                "user_id": 5,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "This is pure gold. This is revolutionary. Youre making magic here.",
                "upvote_count": 0,
                "user": {
                    "user_id": 5,
                    "username": "farida.khatun",
                    "email": "farida.khatun@yahoo.com",
                    "role": "client",
                    "name": "Farida Khatun",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 14,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "2005-11-05T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 14,
                        "name": "Pabna",
                        "country_name": "Bangladesh",
                        "population": 389918,
                        "weather_type": "sunny"
                    }
                }
            },
            {
                "comment_id": 149,
                "user_id": 3,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "I cant get enough of your photos.",
                "upvote_count": 0,
                "user": {
                    "user_id": 3,
                    "username": "sohel_uddin",
                    "email": "sohel_uddin@gmail.com",
                    "role": "client",
                    "name": "Sohel Uddin",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 7,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1998-12-22T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 7,
                        "name": "Rangpur",
                        "country_name": "Bangladesh",
                        "population": 2901390,
                        "weather_type": "sunny"
                    }
                }
            },
            {
                "comment_id": 161,
                "user_id": 6,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "This is next level. Youve got skills! Youve captured the moment perfectly.",
                "upvote_count": 0,
                "user": {
                    "user_id": 6,
                    "username": "jahanara_haque",
                    "email": "jahanara_haque@yahoo.com",
                    "role": "client",
                    "name": "Jahanara Haque",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 11,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1958-01-13T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 11,
                        "name": "Gazipur",
                        "country_name": "Bangladesh",
                        "population": 1997510,
                        "weather_type": "sunny"
                    }
                }
            },
            {
                "comment_id": 200,
                "user_id": 5,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "This is a work of art.",
                "upvote_count": 0,
                "user": {
                    "user_id": 5,
                    "username": "farida.khatun",
                    "email": "farida.khatun@yahoo.com",
                    "role": "client",
                    "name": "Farida Khatun",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 14,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "2005-11-05T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 14,
                        "name": "Pabna",
                        "country_name": "Bangladesh",
                        "population": 389918,
                        "weather_type": "sunny"
                    }
                }
            },
            {
                "comment_id": 204,
                "user_id": 9,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "This is picture perfect.",
                "upvote_count": 0,
                "user": {
                    "user_id": 9,
                    "username": "sohel.chowdhury",
                    "email": "sohel.chowdhury@yahoo.com",
                    "role": "client",
                    "name": "Sohel Chowdhury",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 12,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1955-06-16T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 12,
                        "name": "Feni",
                        "country_name": "Bangladesh",
                        "population": 705768,
                        "weather_type": "rainy"
                    }
                }
            },
            {
                "comment_id": 215,
                "user_id": 4,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "Youre a wizard. This is world-class.",
                "upvote_count": 0,
                "user": {
                    "user_id": 4,
                    "username": "sabina_khatun",
                    "email": "sabina_khatun@yahoo.com",
                    "role": "client",
                    "name": "Sabina Khatun",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 24,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1972-12-27T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 24,
                        "name": "Jhenaidah",
                        "country_name": "Bangladesh",
                        "population": 126379,
                        "weather_type": "rainy"
                    }
                }
            },
            {
                "comment_id": 239,
                "user_id": 10,
                "post_id": 39,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "This is a work of art. This is picture perfect.",
                "upvote_count": 0,
                "user": {
                    "user_id": 10,
                    "username": "momin.mahmud",
                    "email": "momin.mahmud@yahoo.com",
                    "role": "client",
                    "name": "Momin Mahmud",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 8,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1997-03-02T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 8,
                        "name": "Sylhet",
                        "country_name": "Bangladesh",
                        "population": 3482659,
                        "weather_type": "rainy"
                    }
                }
            }
        ],
        "reacts": [
            {
                "user_id": 1,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 3,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 4,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 7,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 10,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            }
        ]
    },
    {
        "post_id": 40,
        "user_id": 10,
        "posting_date": "2023-09-10T08:51:02.000Z",
        "description": "At the heart of the bustling square, a fountain danced with cascading water, a symbol of life and vitality. At the edge of the canyon, I gazed down at the sheer drop, feeling both exhilarated and humbled by natures grandeur. The symphony of nature surrounded me as I hiked through the dense forest, the melody of birdsong in the air.",
        "image_url": "https://www.hillwalktours.com/wp-content/uploads/2019/08/Wicklow_Way_Hiking_Tour_08.jpg",
        "user": {
            "user_id": 10,
            "username": "momin.mahmud",
            "email": "momin.mahmud@yahoo.com",
            "role": "client",
            "name": "Momin Mahmud",
            "bio": "Hey! I am using Tripify",
            "city_id": 8,
            "facebook_url": "https://www.facebook.com/leomessi",
            "twitter_url": "https://twitter.com/imessi",
            "instagram_url": "https://www.instagram.com/leomessi",
            "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
            "dob": "1997-03-02T18:00:00.000Z",
            "registration_date": "2023-09-10T08:50:26.000Z",
            "status": "active",
            "created_on": "2023-09-10T08:50:26.000Z",
            "last_updated_on": "2023-09-10T08:50:26.000Z",
            "city": {
                "city_id": 8,
                "name": "Sylhet",
                "country_name": "Bangladesh",
                "population": 3482659,
                "weather_type": "rainy"
            }
        },
        "comments": [
            {
                "comment_id": 171,
                "user_id": 8,
                "post_id": 40,
                "commenting_date": "2023-09-10T08:51:02.000Z",
                "text": "This is world-changing. Youre a true artist.",
                "upvote_count": 0,
                "user": {
                    "user_id": 8,
                    "username": "tahmina_ali",
                    "email": "tahmina_ali@yahoo.com",
                    "role": "client",
                    "name": "Tahmina Ali",
                    "bio": "Hey! I am using Tripify",
                    "city_id": 21,
                    "facebook_url": "https://www.facebook.com/leomessi",
                    "twitter_url": "https://twitter.com/imessi",
                    "instagram_url": "https://www.instagram.com/leomessi",
                    "profile_picture": "https://avatars.dicebear.com/api/avataaars/avatar.svg",
                    "dob": "1964-10-18T18:00:00.000Z",
                    "registration_date": "2023-09-10T08:50:26.000Z",
                    "status": "active",
                    "created_on": "2023-09-10T08:50:26.000Z",
                    "last_updated_on": "2023-09-10T08:50:26.000Z",
                    "city": {
                        "city_id": 21,
                        "name": "Savar",
                        "country_name": "Bangladesh",
                        "population": 160242,
                        "weather_type": "sunny"
                    }
                }
            }
        ],
        "reacts": [
            {
                "user_id": 1,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 5,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 6,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 7,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            },
            {
                "user_id": 9,
                "react_type": "like",
                "reacting_date": "2023-09-10T08:51:03.000Z"
            }
        ]
    }
]
```
# Stat

## a. Get Stat of Hotels

Endpoint URL:    
```
GET
```
```
/api/v1/stat/hotel
```  
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "hotel_id": 1,
        "total_revenue": 102207,
        "favorite_count": 1,
        "hotel": {
            "hotel_id": 1,
            "name": "Quaint Villa Hotel",
            "address": "48 Lakeview Drive Bhola , Bangladesh",
            "city_id": 25,
            "description": "A Exquisitely Rustic hotel in Bhola.",
            "image_url": "dummy.jpg",
            "price_per_day": 4867,
            "phone": "019157054121",
            "email": "quaintvillahotel@gmail.com",
            "has_wifi": 1,
            "has_parking": 1,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 25,
                "name": "Bhola",
                "country_name": "Bangladesh",
                "population": 183113,
                "weather_type": "sunny"
            }
        }
    },
    {
        "hotel_id": 5,
        "total_revenue": 74888,
        "favorite_count": 0,
        "hotel": {
            "hotel_id": 5,
            "name": "Glorious Hideaway Hotel",
            "address": "18 Beach Road Dinajpur , Bangladesh",
            "city_id": 17,
            "description": "A Extravagantly Glorious hotel in Dinajpur.",
            "image_url": "dummy.jpg",
            "price_per_day": 3256,
            "phone": "015238514617",
            "email": "glorioushideawayhotel@gmail.com",
            "has_wifi": 0,
            "has_parking": 0,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 17,
                "name": "Dinajpur",
                "country_name": "Bangladesh",
                "population": 204874,
                "weather_type": "cold"
            }
        }
    },
    {
        "hotel_id": 37,
        "total_revenue": 32104,
        "favorite_count": 1,
        "hotel": {
            "hotel_id": 37,
            "name": "Modern Palace Hotel",
            "address": "29 Ocean Drive Tangail , Bangladesh",
            "city_id": 29,
            "description": "A Uniquely Boutique hotel in Tangail.",
            "image_url": "dummy.jpg",
            "price_per_day": 4013,
            "phone": "011504484489",
            "email": "modernpalacehotel@outlook.com",
            "has_wifi": 1,
            "has_parking": 0,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 29,
                "name": "Tangail",
                "country_name": "Bangladesh",
                "population": 160937,
                "weather_type": "rainy"
            }
        }
    },
    {
        "hotel_id": 23,
        "total_revenue": 29625,
        "favorite_count": 0,
        "hotel": {
            "hotel_id": 23,
            "name": "Seaside Retreat Hotel",
            "address": "39 Lakeview Drive Pabna , Bangladesh",
            "city_id": 14,
            "description": "A Majestically Cozy hotel in Pabna.",
            "image_url": "dummy.jpg",
            "price_per_day": 1975,
            "phone": "019769742786",
            "email": "seasideretreathotel@gmail.com",
            "has_wifi": 1,
            "has_parking": 1,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 14,
                "name": "Pabna",
                "country_name": "Bangladesh",
                "population": 389918,
                "weather_type": "sunny"
            }
        }
    },
    {
        "hotel_id": 8,
        "total_revenue": 21450,
        "favorite_count": 0,
        "hotel": {
            "hotel_id": 8,
            "name": "Charming Resort Hotel",
            "address": "33 Sunset Boulevard Bandarban , Bangladesh",
            "city_id": 24,
            "description": "A Majestically Spectacular hotel in Bandarban.",
            "image_url": "dummy.jpg",
            "price_per_day": 4290,
            "phone": "018711754651",
            "email": "charmingresorthotel@yahoo.com",
            "has_wifi": 0,
            "has_parking": 0,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 24,
                "name": "Bandarban",
                "country_name": "Bangladesh",
                "population": 126379,
                "weather_type": "rainy"
            }
        }
    },
    {
        "hotel_id": 24,
        "total_revenue": 16640,
        "favorite_count": 2,
        "hotel": {
            "hotel_id": 24,
            "name": "Glorious Cottage Hotel",
            "address": "39 Park Avenue Manikganj , Bangladesh",
            "city_id": 26,
            "description": "A Uniquely Glorious hotel in Manikganj.",
            "image_url": "dummy.jpg",
            "price_per_day": 1040,
            "phone": "015053009336",
            "email": "gloriouscottagehotel@gmail.com",
            "has_wifi": 0,
            "has_parking": 0,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 26,
                "name": "Manikganj",
                "country_name": "Bangladesh",
                "population": 160093,
                "weather_type": "rainy"
            }
        }
    },
    {
        "hotel_id": 28,
        "total_revenue": 12696,
        "favorite_count": 0,
        "hotel": {
            "hotel_id": 28,
            "name": "Rustic Sanctuary Hotel",
            "address": "54 Riverfront Bhola , Bangladesh",
            "city_id": 25,
            "description": "A Exceptionally Spectacular hotel in Bhola.",
            "image_url": "dummy.jpg",
            "price_per_day": 3174,
            "phone": "017479789959",
            "email": "rusticsanctuaryhotel@gmail.com",
            "has_wifi": 0,
            "has_parking": 0,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 25,
                "name": "Bhola",
                "country_name": "Bangladesh",
                "population": 183113,
                "weather_type": "sunny"
            }
        }
    },
    {
        "hotel_id": 25,
        "total_revenue": 6965,
        "favorite_count": 0,
        "hotel": {
            "hotel_id": 25,
            "name": "Elegant Lodge Hotel",
            "address": "64 Beach Road Sylhet , Bangladesh",
            "city_id": 8,
            "description": "A Gracefully Elegant hotel in Sylhet.",
            "image_url": "dummy.jpg",
            "price_per_day": 1393,
            "phone": "015316556115",
            "email": "elegantlodgehotel@yahoo.com",
            "has_wifi": 0,
            "has_parking": 1,
            "has_gym": 0,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 8,
                "name": "Sylhet",
                "country_name": "Bangladesh",
                "population": 3482659,
                "weather_type": "rainy"
            }
        }
    },
    {
        "hotel_id": 2,
        "total_revenue": 6314,
        "favorite_count": 1,
        "hotel": {
            "hotel_id": 2,
            "name": "Elegant Cottage Hotel",
            "address": "40 Beach Road Narsingdi , Bangladesh",
            "city_id": 12,
            "description": "A Majestically Rustic hotel in Narsingdi.",
            "image_url": "dummy.jpg",
            "price_per_day": 902,
            "phone": "014489813442",
            "email": "elegantcottagehotel@gmail.com",
            "has_wifi": 1,
            "has_parking": 1,
            "has_gym": 1,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 12,
                "name": "Narsingdi",
                "country_name": "Bangladesh",
                "population": 705768,
                "weather_type": "rainy"
            }
        }
    },
    {
        "hotel_id": 30,
        "total_revenue": 4115,
        "favorite_count": 0,
        "hotel": {
            "hotel_id": 30,
            "name": "Charming Castle Hotel",
            "address": "67 Harbor View Narsingdi , Bangladesh",
            "city_id": 22,
            "description": "A Serenely Cozy hotel in Narsingdi.",
            "image_url": "dummy.jpg",
            "price_per_day": 823,
            "phone": "018449479335",
            "email": "charmingcastlehotel@gmail.com",
            "has_wifi": 0,
            "has_parking": 0,
            "has_gym": 1,
            "creator_user_id": 0,
            "created_on": "2023-08-03T07:32:22.000Z",
            "last_updated_on": "2023-08-03T07:32:22.000Z",
            "city": {
                "city_id": 22,
                "name": "Narsingdi",
                "country_name": "Bangladesh",
                "population": 705768,
                "weather_type": "cold"
            }
        }
    }
]
```

# Chat

## a. Get Chat Response

Endpoint URL:    
```
GET
```
```
/api/v1/chat?user_text=Hi, how are you doing? I need a help, i wanna have a vacation trip to Coxs Bazar, choose me hotels which have wifi and parking facilities, also get me some restaurants with reservation prices no less than 500. Also make sure that the reservation prices dont exceed 2000, While choosing hotels, also make sure that the hotel's price per day is within 5000. Now please suggest me how to build my trip.
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "queries": {
        "city_names": [
            "Coxs Bazar"
        ],
        "hotel": {
            "min_price": "",
            "max_price": "5000",
            "has_parking": "1",
            "has_wifi": "1",
            "has_gym": ""
        },
        "restaurant": {
            "min_price": "500",
            "max_price": "2000"
        }
    },
    "hotels": [
        {
            "hotel_id": 267,
            "name": "Hotel Sea Crown",
            "address": "33 Mountain Street Coxs Bazar , Bangladesh",
            "city_id": 27,
            "description": "A Serenely Boutique hotel in Coxs Bazar.",
            "image_url": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/36/a3/58/international-suite.jpg?w=1500&h=1000&s=1",
            "price_per_day": 3878,
            "phone": "016037659712",
            "email": "hotel_sea@gmail.com",
            "has_wifi": 1,
            "has_parking": 1,
            "has_gym": 1,
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:48.000Z",
            "last_updated_on": "2023-09-07T18:46:48.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 2,
                "rating_3": 2,
                "rating_4": 0,
                "rating_5": 1,
                "rating_avg": 3
            },
            "images": [
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/8a/ca/29/hotel-sea-crown.jpg?w=1500&h=1000&s=1",
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/be/3d/ac/sea-front-deluxe-supreme.jpg?w=1500&h=1000&s=1",
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/be/3d/98/sea-front-deluxe-supreme.jpg?w=1500&h=1000&s=1",
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/be/3d/92/sea-front-deluxe-supreme.jpg?w=1500&h=1000&s=1"
            ]
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 189,
            "name": "Coral Station",
            "reservation_price": 790,
            "address": "37 Riverfront",
            "city_id": 27,
            "description": "A restaurant serving Uniquely Cozy Mexican Seafood.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Seafood,Barbecue",
            "contact": "015663602673",
            "email": "coral_station@outlook.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 0,
                "rating_3": 0,
                "rating_4": 1,
                "rating_5": 1,
                "rating_avg": 4.5
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/24/79/79/00/coral-station-is-a-restaurant.jpg"
            ]
        },
        {
            "restaurant_id": 198,
            "name": "Sun Dancer Cafe & Restaurant",
            "reservation_price": 1340,
            "address": "19 Gourmet Street",
            "city_id": 27,
            "description": "A restaurant serving Delightfully Gourmet Mediterranean Pizza.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Cafe",
            "contact": "017343724432",
            "email": "sun.dancer@gmail.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 0,
                "rating_3": 0,
                "rating_4": 2,
                "rating_5": 0,
                "rating_avg": 4
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/12/07/a0/43/20171129-153836-largejpg.jpg"
            ]
        },
        {
            "restaurant_id": 191,
            "name": "Poushee Restaurant",
            "reservation_price": 1820,
            "address": "84 Culinary Avenue",
            "city_id": 27,
            "description": "A restaurant serving Savoringly Quaint Thai Sushi.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Asian,Bangladeshi",
            "contact": "012979962112",
            "email": "poushee.restaurant@yahoo.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 1,
                "rating_3": 0,
                "rating_4": 1,
                "rating_5": 1,
                "rating_avg": 3.67
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/15/1a/77/84/front-view.jpg"
            ]
        },
        {
            "restaurant_id": 193,
            "name": "Jhaubon Restaurant",
            "reservation_price": 660,
            "address": "44 Food Court",
            "city_id": 27,
            "description": "A restaurant serving Tastefully Fusion Greek Curry.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Seafood,Asian",
            "contact": "011459544378",
            "email": "jhaubon_restaurant@gmail.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 0,
                "rating_3": 1,
                "rating_4": 1,
                "rating_5": 0,
                "rating_avg": 3.5
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-p/0d/7b/ac/69/img-20161029-122925-largejpg.jpg"
            ]
        },
        {
            "restaurant_id": 197,
            "name": "Salt Bistro And Cafe",
            "reservation_price": 1170,
            "address": "44 Food Court",
            "city_id": 27,
            "description": "A restaurant serving Tastefully Cozy Spanish Biryani.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Cafe,Seafood",
            "contact": "016777374192",
            "email": "salt.bistro@gmail.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 0,
                "rating_3": 1,
                "rating_4": 1,
                "rating_5": 0,
                "rating_avg": 3.5
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/17/b2/9d/00/let-our-coffee-fuel-your.jpg"
            ]
        },
        {
            "restaurant_id": 190,
            "name": "Palongki Inani",
            "reservation_price": 1820,
            "address": "56 Culinary Avenue",
            "city_id": 27,
            "description": "A restaurant serving Uniquely Delicious Thai Burger.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Bangladeshi,Seafood",
            "contact": "014132327365",
            "email": "palongki.inani@yahoo.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 2,
                "rating_3": 0,
                "rating_4": 1,
                "rating_5": 1,
                "rating_avg": 3.25
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/27/a9/51/54/palongki-inani-sea-front.jpg"
            ]
        },
        {
            "restaurant_id": 192,
            "name": "Mermaid Cafe",
            "reservation_price": 1000,
            "address": "14 Riverfront",
            "city_id": 27,
            "description": "A restaurant serving Passionately Savory Japanese Tacos.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Seafood,Asian",
            "contact": "012436956754",
            "email": "mermaid.cafe@gmail.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 1,
                "rating_3": 1,
                "rating_4": 0,
                "rating_5": 0,
                "rating_avg": 2.5
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/0d/e3/a4/96/mermaid-cafe.jpg"
            ]
        },
        {
            "restaurant_id": 194,
            "name": "Mermaid Beach Resort",
            "reservation_price": 1490,
            "address": "77 Food Court",
            "city_id": 27,
            "description": "A restaurant serving Tastefully Savory Spanish Pizza.",
            "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg",
            "cuisine_type": "Seafood,Barbecue",
            "contact": "011743947692",
            "email": "mermaid.beach@outlook.com",
            "creator_user_id": 0,
            "created_on": "2023-09-07T18:46:51.000Z",
            "last_updated_on": "2023-09-07T18:46:51.000Z",
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "rating_info": {
                "rating_1": 0,
                "rating_2": 0,
                "rating_3": 0,
                "rating_4": 0,
                "rating_5": 0,
                "rating_avg": 2.5
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/18/16/75/e5/juice-bar.jpg"
            ]
        }
    ],
    "destinations": [
        {
            "destination_id": 26,
            "name": "Coxs Bazar Beach",
            "address": "Coxs Bazar",
            "city_id": 27,
            "latitude": 21.4272,
            "longitude": 91.9758,
            "description": "Coxs Bazar Beach is one of the longest natural sea beaches in the world.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 3,
                    "price": 350,
                    "activity": {
                        "activity_id": 3,
                        "name": "Snorkeling",
                        "category": "Adventure",
                        "description": "Discover the underwater world and vibrant marine life through snorkeling.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 10,
                        "max_age": 50,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://fthmb.tqn.com/XtDX5UROYmPakUeif3ahefihJoI=/1500x1050/filters:fill(auto,1)/SnorkelingWithKids_Getty-56effe365f9b5867a1c4bfb4.jpg",
                            "https://www.crystalsandsonsiestakey.com/wp-content/uploads/2020/08/siesta-key-snorkeling.jpg",
                            "https://diveukhurghada.co.uk/wp-content/uploads/2020/02/Snorkelling-1.jpg",
                            "https://www.sandals.com/blog/content/images/2019/04/3_islandroutes_38-Adv-Eco.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 6,
                    "price": 400,
                    "activity": {
                        "activity_id": 6,
                        "name": "Wildlife Safari",
                        "category": "Adventure",
                        "description": "Embark on a thrilling wildlife safari and spot exotic animals.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 18,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.ngorongorocratertanzania.org/wp-content/uploads/2020/10/5-Days-Best-of-Tanzania-Wildlife-Safari.jpg",
                            "https://www.expertafrica.com/images/background-image/d8aaade7bbcd42d4a0a39588bbf4aa7d-1600.jpg",
                            "https://www.serengetiparktanzania.com/wp-content/uploads/2020/11/7-Days-Tanzania-Wildlife-Safaris.jpg",
                            "https://www.expertafrica.com/images/background-image/01a037ba6e6b403a8c6cfe4d64a249f0-1600.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 7,
                    "price": 50,
                    "activity": {
                        "activity_id": 7,
                        "name": "Nature Walks",
                        "category": "Adventure",
                        "description": "Take peaceful walks in nature and enjoy the tranquility it offers.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 65,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.naturalhealth365.com/wp-content/uploads/2020/04/nature-scaled.jpeg",
                            "https://www.atlmentalhealth.com/wp-content/uploads/2021/01/nature-walk.jpg",
                            "http://images.unsplash.com/photo-1559544948-da38a2615cb7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9",
                            "https://yogafeststatecollege.com/wp-content/uploads/2017/09/Nature-Walk-900px.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://beachbaby.net/wp-content/uploads/2018/04/Coxs-Bazar-Bangladesh-worlds-longest-beach.jpg",
                "https://3.bp.blogspot.com/-vgl7OZUili0/VfVWye1UrtI/AAAAAAAAAPg/YiS7cffX_20/s1600/cox.jpg",
                "https://2.bp.blogspot.com/-gfsfxUcDZWI/Tk10NT_htMI/AAAAAAAAA5k/nATzESSx_4s/s1600/Cox%2527s_Bazar_boats03.jpg",
                "https://i2.wp.com/besttoppers.com/wp-content/uploads/2011/07/Cox%E2%80%99s-Bazar-Bangladesh.jpg"
            ]
        },
        {
            "destination_id": 27,
            "name": "Inani Beach",
            "address": "Ukhia, Coxs Bazar",
            "city_id": 27,
            "latitude": 21.4527,
            "longitude": 92.0181,
            "description": "Inani Beach is known for its golden sands, clear waters, and coral reefs.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 8,
                    "price": 50,
                    "activity": {
                        "activity_id": 8,
                        "name": "Beach Relaxation",
                        "category": "Relaxation",
                        "description": "Relax and unwind on the beautiful sandy beaches with crystal clear waters.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 5,
                        "max_age": 75,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://i.pinimg.com/originals/63/d6/7a/63d67a8d785fb71f5227748bf1d8be8e.jpg",
                            "https://i.ytimg.com/vi/JXdl15owpME/maxresdefault.jpg",
                            "https://cdn.wallpapersafari.com/88/36/uHoe0w.jpg",
                            "http://i.ytimg.com/vi/Sa_VJceQBuE/maxresdefault.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 9,
                    "price": 200,
                    "activity": {
                        "activity_id": 9,
                        "name": "Water Sports",
                        "category": "Adventure",
                        "description": "Indulge in various water sports activities like jet skiing, parasailing, and more.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 16,
                        "max_age": 55,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://nomadparadise.com/wp-content/uploads/2020/08/water-sports-flyboard-flying.jpg",
                            "https://www.tripsavvy.com/thmb/3sYPZPdIbNedmJj501qXWO7mCeE=/1261x835/filters:no_upscale():max_bytes(150000):strip_icc()/KorisRamos-56a34e515f9b58b7d0d16646.jpg",
                            "https://multimedia.andalucia.org/media/80B4B346BD45484497680DC1229FE4F7/img/C43F415C44C0474A85D70F0F5BEE8CAC/CA_Tarifa_Playa_Valdevaqueros_11.jpg?responsive",
                            "https://hellscanyon.tours/wp-content/uploads/2021/06/RiverAdventuresInc-73025-Water-Sports-Summer-image1-scaled.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 20,
                    "price": 50,
                    "activity": {
                        "activity_id": 20,
                        "name": "Scuba Diving",
                        "category": "Adventure",
                        "description": "Dive into the ocean depths and explore the wonders of marine life.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 16,
                        "max_age": 55,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://blog.pickyourtrail.com/wp-content/uploads/2014/06/scuba-diving-phuket-with-aussie-divers.jpg",
                            "https://www.haqqitours.com/wp-content/uploads/2020/07/Diving.jpg",
                            "https://www.amorgos-diving.com/wp-content/uploads/2021/03/adc-3-scaled.jpeg",
                            "http://3.bp.blogspot.com/-UuJ03gD--FI/UAd78REK3PI/AAAAAAAAAFQ/3GNRb_6E9iU/s1600/scuba-diving-certification.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "http://1.bp.blogspot.com/-wlnvtF35UEw/T-qr_bfihwI/AAAAAAAABAQ/vMaeQJEz-1U/s1600/Inani_Main.jpg",
                "https://i.ytimg.com/vi/eFrr7jWJ9q8/maxresdefault.jpg",
                "https://i.ytimg.com/vi/TYUHayqwjVo/maxresdefault.jpg",
                "https://media-cdn.tripadvisor.com/media/photo-s/03/69/db/a7/sunset-at-inani-beach.jpg"
            ]
        },
        {
            "destination_id": 28,
            "name": "Himchari National Park",
            "address": "Coxs Bazar",
            "city_id": 27,
            "latitude": 21.4325,
            "longitude": 91.9628,
            "description": "Himchari National Park offers a blend of lush forests, waterfalls, and wildlife.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 26,
                    "price": 300,
                    "activity": {
                        "activity_id": 26,
                        "name": "Cooking Classes",
                        "category": "Cuisine",
                        "description": "Learn to cook the local dishes from expert chefs in cooking classes.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 65,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.tasteofhome.com/wp-content/uploads/2017/12/shutterstock_633405500.jpg",
                            "https://i0.wp.com/www.onegreenplanet.org/wp-content/uploads/2018/01/cooking-class.jpg?fit=1200%2C750&ssl=1",
                            "https://twincitieskidsclub.com/wp-content/uploads/2020/12/AdobeStock_262111171-1068x712.jpeg",
                            "https://www.tripsavvy.com/thmb/X2QVmOEdtVKzrV004s0nSHpv520=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-143073620-57c4a8cb3df78cc16eca2488.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 28,
                    "price": 50,
                    "activity": {
                        "activity_id": 28,
                        "name": "Sailing Adventure",
                        "category": "Adventure",
                        "description": "Embark on a sailing adventure and explore the coastline from the sea.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 16,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://lirp-cdn.multiscreensite.com/87e050cf/dms3rep/multi/opt/C275+-+spin+LARGE-1920w.jpg",
                            "https://www.atlasandboots.com/wp-content/uploads/2017/10/adventure-sailing-holidays-gadventures-cuba.jpg",
                            "https://www.travelonline.com/fiji/tours/south-sea-cruises-t2/seaspray-sailing/seaspray-sailing-47155.jpg",
                            "https://www.visitagnes1770.com.au/wp-content/uploads/2020/02/sail1770one-1.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 34,
                    "price": 350,
                    "activity": {
                        "activity_id": 34,
                        "name": "Cave Exploration",
                        "category": "Adventure",
                        "description": "Explore the mysterious caves and marvel at their natural beauty.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 14,
                        "max_age": 70,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://bloximages.chicago2.vip.townnews.com/poststar.com/content/tncms/assets/v3/editorial/a/4f/a4f6ad2e-4129-11e5-9eed-2782d3ad6b80/55cba09a2e333.image.jpg?resize=1200%2C766",
                            "https://img.jakpost.net/c/2018/07/10/2018_07_10_49018_1531210327._large.jpg",
                            "http://bcbstwelltuned.com/wp-content/uploads/2017/06/Spelunking-e1497553737173.jpg",
                            "https://assets3.thrillist.com/v1/image/2774746/size/gn-gift_guide_variable_c.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://dailyasianage.com/library/1565978597_4.jpg",
                "https://i.pinimg.com/originals/8c/2d/47/8c2d4789c4342bfbe87a70f4ecf91b39.jpg",
                "https://www.musafir.com.bd/images/places/Himchari-National-Park.jpg",
                "https://dailyasianage.com/library/1634331855_2.jpg"
            ]
        },
        {
            "destination_id": 29,
            "name": "Aggmeda Khyang",
            "address": "Ramu, Coxs Bazar",
            "city_id": 27,
            "latitude": 21.3872,
            "longitude": 92.0905,
            "description": "Aggmeda Khyang is a Buddhist monastery known for its intricate wood carvings.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 11,
                    "price": 300,
                    "activity": {
                        "activity_id": 11,
                        "name": "Local Food Tasting",
                        "category": "Cuisine",
                        "description": "Taste a variety of delicious local dishes and savor the flavors.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 70,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://media.gettyimages.com/photos/thailand-bangkok-khao-san-road-group-of-friends-tasting-local-food-on-picture-id962627038",
                            "https://www.alderleyedge.com/img/w/720/h/480/s/749f78cdfdac582c4c6172a0fa1457c6.jpg",
                            "http://www.stylemotivation.com/wp-content/uploads/2019/05/201811518262645.jpg",
                            "https://res.cloudinary.com/northernthaiescape/image/upload/e_improve,w_1000/v1568344303/Food%20Tasting/20190806_194618_ddr7no.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 29,
                    "price": 100,
                    "activity": {
                        "activity_id": 29,
                        "name": "Educational Visit to Museum",
                        "category": "Education",
                        "description": "Discover the art, history, and culture of the region in museums.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 80,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.leisureopportunities.co.uk/images/HIGH14780_419927.jpg",
                            "https://icom.museum/wp-content/uploads/2020/07/ICOM_Voices_W-Maderbacher_IMG2-1024x683.jpeg",
                            "https://magazine.tcu.edu/wp-content/uploads/2017/08/SUM17-AM-Syllabus_Amon-Carter_2_C-1024x768.jpg",
                            "https://educulture.info/wp-content/uploads/2018/09/museum-education-erasmus-course.jpeg"
                        ]
                    }
                },
                {
                    "activity_id": 32,
                    "price": 300,
                    "activity": {
                        "activity_id": 32,
                        "name": "Zip Lining",
                        "category": "Adventure",
                        "description": "Feel the adrenaline rush with an exciting zip-lining adventure.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.choicehotels.com/cms/images/choice-hotels/pace/hero-explore-zip-lining-locations-ziplining/hero-explore-zip-lining-locations-ziplining.jpg",
                            "https://grandcanyonwest.com/wp-content/uploads/6434962_ImageLargeWidth.jpg",
                            "https://content.tripster.com/travelguide/wp-content/uploads/2014/06/rsz_guy_on_zipline_w_view_4e7132c3-cc8a-4804-b654-d9acb2039105.jpg",
                            "https://www.newyorkupstate.com/resizer/PhTXPDD6qIWHNhxupy8ZC_keHds=/1200x0/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.newyorkupstate.com/home/nyup-media/width2048/img/outdoors/photo/2015/06/13/zip-lining-at-hunter-mountain-in-the-catskills-7d227ecd15cd18be.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "http://offroadbangladesh.com/wp-content/uploads/2015/02/Aggmeda-Khyang-Monastery1.jpg",
                "https://dailyasianage.com/library/1584119397maxresdefault.jpg",
                "https://dailyasianage.com/library/1584119445_1.jpg",
                "https://dailyasianage.com/library/1584119397101985961.jpg"
            ]
        },
        {
            "destination_id": 30,
            "name": "Ramu Beach",
            "address": "Ramu, Coxs Bazar",
            "city_id": 27,
            "latitude": 21.3756,
            "longitude": 92.1644,
            "description": "Ramu Beach offers a serene and less crowded beach experience.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 11,
                    "price": 300,
                    "activity": {
                        "activity_id": 11,
                        "name": "Local Food Tasting",
                        "category": "Cuisine",
                        "description": "Taste a variety of delicious local dishes and savor the flavors.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 70,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://media.gettyimages.com/photos/thailand-bangkok-khao-san-road-group-of-friends-tasting-local-food-on-picture-id962627038",
                            "https://www.alderleyedge.com/img/w/720/h/480/s/749f78cdfdac582c4c6172a0fa1457c6.jpg",
                            "http://www.stylemotivation.com/wp-content/uploads/2019/05/201811518262645.jpg",
                            "https://res.cloudinary.com/northernthaiescape/image/upload/e_improve,w_1000/v1568344303/Food%20Tasting/20190806_194618_ddr7no.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 29,
                    "price": 200,
                    "activity": {
                        "activity_id": 29,
                        "name": "Educational Visit to Museum",
                        "category": "Education",
                        "description": "Discover the art, history, and culture of the region in museums.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 80,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.leisureopportunities.co.uk/images/HIGH14780_419927.jpg",
                            "https://icom.museum/wp-content/uploads/2020/07/ICOM_Voices_W-Maderbacher_IMG2-1024x683.jpeg",
                            "https://magazine.tcu.edu/wp-content/uploads/2017/08/SUM17-AM-Syllabus_Amon-Carter_2_C-1024x768.jpg",
                            "https://educulture.info/wp-content/uploads/2018/09/museum-education-erasmus-course.jpeg"
                        ]
                    }
                },
                {
                    "activity_id": 32,
                    "price": 400,
                    "activity": {
                        "activity_id": 32,
                        "name": "Zip Lining",
                        "category": "Adventure",
                        "description": "Feel the adrenaline rush with an exciting zip-lining adventure.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.choicehotels.com/cms/images/choice-hotels/pace/hero-explore-zip-lining-locations-ziplining/hero-explore-zip-lining-locations-ziplining.jpg",
                            "https://grandcanyonwest.com/wp-content/uploads/6434962_ImageLargeWidth.jpg",
                            "https://content.tripster.com/travelguide/wp-content/uploads/2014/06/rsz_guy_on_zipline_w_view_4e7132c3-cc8a-4804-b654-d9acb2039105.jpg",
                            "https://www.newyorkupstate.com/resizer/PhTXPDD6qIWHNhxupy8ZC_keHds=/1200x0/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.newyorkupstate.com/home/nyup-media/width2048/img/outdoors/photo/2015/06/13/zip-lining-at-hunter-mountain-in-the-catskills-7d227ecd15cd18be.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "http://3.bp.blogspot.com/-ym4madDfH5o/TnR-M4JPjXI/AAAAAAAAA9M/LOYagQozv3k/s1600/Ramu1.jpg",
                "https://i.ytimg.com/vi/yjLQ1lOTuBI/maxresdefault.jpg",
                "https://i.ytimg.com/vi/keuUZYN_Wuk/maxresdefault.jpg",
                "https://i.ytimg.com/vi/iEHQa3G0kyY/maxresdefault.jpg"
            ]
        },
        {
            "destination_id": 31,
            "name": "Himchari National Park",
            "address": "Coxs Bazar",
            "city_id": 27,
            "latitude": 21.4325,
            "longitude": 91.9628,
            "description": "Himchari National Park offers a blend of lush forests, waterfalls, and wildlife.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 30,
                    "price": 500,
                    "activity": {
                        "activity_id": 30,
                        "name": "Paragliding",
                        "category": "Adventure",
                        "description": "Experience the thrill of paragliding with an experienced pilot.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 16,
                        "max_age": 55,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://img.redbull.com/images/c_crop,x_69,y_0,h_3546,w_5319/c_fill,w_1500,h_1000/q_auto,f_auto/redbullcom/2016/10/04/1331821774506_1/jack-pimblett-paragliding-in-catalonia",
                            "https://baliparaglidingtours.com/wp-content/uploads/2019/02/15501112109924941-1.jpg",
                            "https://www.visittnt.com/blog/wp-content/uploads/2018/05/shilong-paragliding.jpg",
                            "https://i0.wp.com/www.webgranth.com/wp-content/uploads/2014/07/HD-Paragliding-Wallpaper.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 31,
                    "price": 150,
                    "activity": {
                        "activity_id": 31,
                        "name": "Fruit Picking",
                        "category": "Cuisine",
                        "description": "Enjoy the fun of picking fresh fruits and tasting them at orchards.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 5,
                        "max_age": 75,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://cdn6.dissolve.com/p/D943_21_508/D943_21_508_1200.jpg",
                            "https://www.raisingedmonton.com/wp-content/uploads/2017/07/Depositphotos_84554786_xl-2015.jpg",
                            "https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/03/14/13/apple-pickers-getty.jpg",
                            "https://static.toiimg.com/photo/49933894/.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 34,
                    "price": 300,
                    "activity": {
                        "activity_id": 34,
                        "name": "Cave Exploration",
                        "category": "Adventure",
                        "description": "Explore the mysterious caves and marvel at their natural beauty.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 14,
                        "max_age": 70,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://bloximages.chicago2.vip.townnews.com/poststar.com/content/tncms/assets/v3/editorial/a/4f/a4f6ad2e-4129-11e5-9eed-2782d3ad6b80/55cba09a2e333.image.jpg?resize=1200%2C766",
                            "https://img.jakpost.net/c/2018/07/10/2018_07_10_49018_1531210327._large.jpg",
                            "http://bcbstwelltuned.com/wp-content/uploads/2017/06/Spelunking-e1497553737173.jpg",
                            "https://assets3.thrillist.com/v1/image/2774746/size/gn-gift_guide_variable_c.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://dailyasianage.com/library/1565978597_4.jpg",
                "https://i.pinimg.com/originals/8c/2d/47/8c2d4789c4342bfbe87a70f4ecf91b39.jpg",
                "https://www.musafir.com.bd/images/places/Himchari-National-Park.jpg",
                "https://dailyasianage.com/library/1634331855_2.jpg"
            ]
        },
        {
            "destination_id": 32,
            "name": "Dulahazra Safari Park",
            "address": "Chakaria, Coxs Bazar",
            "city_id": 27,
            "latitude": 21.7697,
            "longitude": 91.8432,
            "description": "Dulahazra Safari Park is home to various wildlife species in their natural habitats.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 13,
                    "price": 100,
                    "activity": {
                        "activity_id": 13,
                        "name": "Art and Craft Workshop",
                        "category": "Culture",
                        "description": "Participate in traditional art and craft workshops and create unique souvenirs.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 75,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.trendz4friend.com/wp-content/uploads/2021/06/artclasses1.jpg",
                            "https://bk.asia-city.com/sites/default/files/u142691/mha_artcraft.jpg",
                            "https://clubfleurieu.com/wp-content/uploads/2017/03/art-craft-classes-foto.jpg",
                            "https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/sites/88463/images/W159ISlZR9uV6bX8LJvA_Creative_Crafting_Club_Class.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 15,
                    "price": 350,
                    "activity": {
                        "activity_id": 15,
                        "name": "Yoga Retreat",
                        "category": "Relaxation",
                        "description": "Rejuvenate your mind and body with a peaceful yoga retreat.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 20,
                        "max_age": 70,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://bookretreats.com/blog/wp-content/uploads/2020/11/1000_1603815965.jpg",
                            "https://magazine.bluekarmasecrets.com/wp-content/uploads/2019/10/retreatbox4.jpg",
                            "https://retreatmehappy.com/wp-content/uploads/2019/10/Yoga-Retreat-e1574557062145.jpg",
                            "https://breathingtravel.com/wp-content/uploads/2020/05/Yoga-retreat-Australia.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 16,
                    "price": 150,
                    "activity": {
                        "activity_id": 16,
                        "name": "Hot Air Balloon Ride",
                        "category": "Adventure",
                        "description": "Experience the thrill of a hot air balloon ride with stunning aerial views.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://media.breitbart.com/media/2023/08/Nick-Meleski-Hot-Air-Balloon-640x480.jpg",
                            "https://utahballoonflights.com/wp-content/uploads/2022/02/IMG_8011-769x1024.jpg",
                            "https://static.tripzilla.com/thumb/3/4/197940_800x.jpg",
                            "https://thumbs.dreamstime.com/b/air-balloons-smack-air-around-rocks-turkey-cappadocia-hot-air-balloon-ride-208326100.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://media-cdn.tripadvisor.com/media/photo-s/16/42/01/e5/late-spring-view-of-dulahazra.jpg",
                "https://media-cdn.tripadvisor.com/media/photo-s/12/e7/3b/4f/ziraf.jpg",
                "https://media-cdn.tripadvisor.com/media/photo-s/12/e7/3b/52/dianosoure.jpg",
                "https://media-cdn.tripadvisor.com/media/photo-s/0f/56/d2/69/dulahazra-safari-park.jpg"
            ]
        },
        {
            "destination_id": 33,
            "name": "Ramu Buddhist Village",
            "address": "Ramu, Coxs Bazar",
            "city_id": 27,
            "latitude": 21.3641,
            "longitude": 92.1709,
            "description": "Ramu Buddhist Village is known for its numerous monasteries and Buddhist relics.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 10,
                    "price": 300,
                    "activity": {
                        "activity_id": 10,
                        "name": "Sunset Cruise",
                        "category": "Adventure",
                        "description": "Enjoy the mesmerizing view of the sunset while on a cruise.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 10,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://i0.wp.com/bloggeratlarge.com/wp-content/uploads/2020/02/Sunset-cruise-ship.jpg",
                            "https://www.best.mu/wp-content/uploads/2017/10/Sunset-Cruise-1_800x800.jpg",
                            "https://www.mauiboattrips.com/wp-content/uploads/2020/02/sunset-private-cruise-hero-header.jpg",
                            "http://tampabaydatenightguide.com/wp-content/uploads/sites/2/2018/05/starlite-1024x576.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 29,
                    "price": 350,
                    "activity": {
                        "activity_id": 29,
                        "name": "Educational Visit to Museum",
                        "category": "Education",
                        "description": "Discover the art, history, and culture of the region in museums.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 80,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.leisureopportunities.co.uk/images/HIGH14780_419927.jpg",
                            "https://icom.museum/wp-content/uploads/2020/07/ICOM_Voices_W-Maderbacher_IMG2-1024x683.jpeg",
                            "https://magazine.tcu.edu/wp-content/uploads/2017/08/SUM17-AM-Syllabus_Amon-Carter_2_C-1024x768.jpg",
                            "https://educulture.info/wp-content/uploads/2018/09/museum-education-erasmus-course.jpeg"
                        ]
                    }
                },
                {
                    "activity_id": 30,
                    "price": 350,
                    "activity": {
                        "activity_id": 30,
                        "name": "Paragliding",
                        "category": "Adventure",
                        "description": "Experience the thrill of paragliding with an experienced pilot.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 16,
                        "max_age": 55,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://img.redbull.com/images/c_crop,x_69,y_0,h_3546,w_5319/c_fill,w_1500,h_1000/q_auto,f_auto/redbullcom/2016/10/04/1331821774506_1/jack-pimblett-paragliding-in-catalonia",
                            "https://baliparaglidingtours.com/wp-content/uploads/2019/02/15501112109924941-1.jpg",
                            "https://www.visittnt.com/blog/wp-content/uploads/2018/05/shilong-paragliding.jpg",
                            "https://i0.wp.com/www.webgranth.com/wp-content/uploads/2014/07/HD-Paragliding-Wallpaper.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://i1.wp.com/whatson.guide/wp-content/uploads/2018/10/maxresdefault.jpg?fit=1280%2C720&ssl=1",
                "https://thumbs.dreamstime.com/b/ramu-buddhist-temple-place-bandarban-district-chittagong-bangladesh-most-beautiful-place-bagladesh-coxbazar-ramu-262464142.jpg",
                "http://1.bp.blogspot.com/-SaSGaPp18AI/VrGVshhbMvI/AAAAAAAABgY/8OfGMkGKENw/s1600/Bouddha%2BTemple%2B2.jpg",
                "https://www.lrbtravelteam.com/wp-content/uploads/2020/10/Ramu-Buddhist-Bihar-..png"
            ]
        },
        {
            "destination_id": 34,
            "name": "Adinath Temple",
            "address": "Maheshkhali Island, Coxs Bazar",
            "city_id": 27,
            "latitude": 21.5726,
            "longitude": 92.0205,
            "description": "Adinath Temple is an ancient Hindu temple on Maheshkhali Island.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 3,
                    "price": 200,
                    "activity": {
                        "activity_id": 3,
                        "name": "Snorkeling",
                        "category": "Adventure",
                        "description": "Discover the underwater world and vibrant marine life through snorkeling.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 10,
                        "max_age": 50,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://fthmb.tqn.com/XtDX5UROYmPakUeif3ahefihJoI=/1500x1050/filters:fill(auto,1)/SnorkelingWithKids_Getty-56effe365f9b5867a1c4bfb4.jpg",
                            "https://www.crystalsandsonsiestakey.com/wp-content/uploads/2020/08/siesta-key-snorkeling.jpg",
                            "https://diveukhurghada.co.uk/wp-content/uploads/2020/02/Snorkelling-1.jpg",
                            "https://www.sandals.com/blog/content/images/2019/04/3_islandroutes_38-Adv-Eco.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 6,
                    "price": 300,
                    "activity": {
                        "activity_id": 6,
                        "name": "Wildlife Safari",
                        "category": "Adventure",
                        "description": "Embark on a thrilling wildlife safari and spot exotic animals.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 18,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.ngorongorocratertanzania.org/wp-content/uploads/2020/10/5-Days-Best-of-Tanzania-Wildlife-Safari.jpg",
                            "https://www.expertafrica.com/images/background-image/d8aaade7bbcd42d4a0a39588bbf4aa7d-1600.jpg",
                            "https://www.serengetiparktanzania.com/wp-content/uploads/2020/11/7-Days-Tanzania-Wildlife-Safaris.jpg",
                            "https://www.expertafrica.com/images/background-image/01a037ba6e6b403a8c6cfe4d64a249f0-1600.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 26,
                    "price": 350,
                    "activity": {
                        "activity_id": 26,
                        "name": "Cooking Classes",
                        "category": "Cuisine",
                        "description": "Learn to cook the local dishes from expert chefs in cooking classes.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 12,
                        "max_age": 65,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://www.tasteofhome.com/wp-content/uploads/2017/12/shutterstock_633405500.jpg",
                            "https://i0.wp.com/www.onegreenplanet.org/wp-content/uploads/2018/01/cooking-class.jpg?fit=1200%2C750&ssl=1",
                            "https://twincitieskidsclub.com/wp-content/uploads/2020/12/AdobeStock_262111171-1068x712.jpeg",
                            "https://www.tripsavvy.com/thmb/X2QVmOEdtVKzrV004s0nSHpv520=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-143073620-57c4a8cb3df78cc16eca2488.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://thumbs.dreamstime.com/b/adinath-temple-ranakpur-india-16174784.jpg",
                "https://i.pinimg.com/originals/f2/b9/a2/f2b9a258ca12636daf90c5f497947e16.jpg",
                "http://cdn.findmessages.com/images/2016/06/2422-adinath-jain-temple-in-khajuraho.jpg",
                "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_754855867_20200219151348_20200219151409.jpg"
            ]
        },
        {
            "destination_id": 35,
            "name": "Kolatoli Beach",
            "address": "Coxs Bazar",
            "city_id": 27,
            "latitude": 21.4153,
            "longitude": 91.9833,
            "description": "Kolatoli Beach is a popular spot for water sports and beachside entertainment.",
            "image_url": "https://www.citytravelerbd.com/wp-content/uploads/2020/01/Ahsan_Manzil-Front_View.jpg",
            "created_on": "2023-09-07T18:46:38.000Z",
            "last_updated_on": "2023-09-07T18:46:38.000Z",
            "creator_user_id": 0,
            "activities": [
                {
                    "activity_id": 17,
                    "price": 100,
                    "activity": {
                        "activity_id": 17,
                        "name": "Local Market Shopping",
                        "category": "Cuisine",
                        "description": "Explore the vibrant local markets and shop for unique handicrafts.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 80,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://trulocal.imgix.net/shared/media/blog/56/image.png?h=700&fit=max&auto=format,compress",
                            "https://www.holidify.com/images/cmsuploads/compressed/27217455627_bde73bce85_b_20190716095410.jpg",
                            "https://www.thespruceeats.com/thmb/cw-Ee_rFSGcWsoAF1sPzYgB0L0s=/1148x0/filters:no_upscale():max_bytes(150000):strip_icc()/Union-Square-Farmers-Market-579cacea3df78c32761d9711.jpg",
                            "https://cleanfoodcrush.com/wp-content/uploads/2016/07/shop-at-local-markets-1024x683.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 19,
                    "price": 300,
                    "activity": {
                        "activity_id": 19,
                        "name": "Kayaking Adventure",
                        "category": "Adventure",
                        "description": "Paddle through the adventurous waters on a kayaking expedition.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 14,
                        "max_age": 60,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://assets.thrillexperiences.com.au/content/product-img/kayaking-adventure-for-two-11.jpg",
                            "https://www.telegraph.co.uk/content/dam/Wellbeing/Spark/Voltarol/female-kayaking-xlarge.jpg",
                            "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_720,f_auto/w_80,x_15,y_15,g_south_west,l_klook_water/activities/ycfhmscbsclejxwavtjn/RainforestKayakingAdventureinSarawak.jpg",
                            "https://a.rgbimg.com/cache1v3dl0/users/l/lu/lusi/600/ocPR7QM.jpg"
                        ]
                    }
                },
                {
                    "activity_id": 36,
                    "price": 150,
                    "activity": {
                        "activity_id": 36,
                        "name": "Local Music and Dance",
                        "category": "Culture",
                        "description": "Experience the local music and dance performances showcasing traditions.",
                        "image_url": "https://cdn.getyourguide.com/img/tour/5cb3c36a97f0d.jpeg/148.jpg",
                        "min_age": 8,
                        "max_age": 70,
                        "creator_user_id": 0,
                        "created_on": "2023-09-07T18:46:44.000Z",
                        "last_updated_on": "2023-09-07T18:46:44.000Z",
                        "images": [
                            "https://st3.depositphotos.com/1591375/12954/i/950/depositphotos_129543948-stock-photo-local-dancers-and-musicians-perform.jpg",
                            "https://i.ytimg.com/vi/dzfrX40zHAc/maxresdefault.jpg",
                            "https://i0.wp.com/www.tusktravel.com/blog/wp-content/uploads/2021/03/Nepal-Folk-Dance.jpg?w=800&ssl=1",
                            "http://ww4.hdnux.com/photos/57/14/10/12370475/3/920x920.jpg"
                        ]
                    }
                }
            ],
            "city": {
                "city_id": 27,
                "name": "Coxs Bazar",
                "country_name": "Bangladesh",
                "population": 249000,
                "weather_type": "sunny"
            },
            "images": [
                "https://i.pinimg.com/originals/25/4d/7f/254d7f68523959996a18488168ebc62b.jpg",
                "https://4.bp.blogspot.com/-f86CbsOMDQ8/WAHn3r3ldFI/AAAAAAAAAC4/4uQpAjgWzCI_qYiOSZTslpm7mOeej4RiACLcB/s640/Kolatoli-beach.jpg",
                "https://i.pinimg.com/originals/30/90/23/3090233b35b24271fd5a2ff70e4b90c2.jpg",
                "http://offroadbangladesh.com/wp-content/uploads/2015/02/Saint-Martin-6-1024x685.jpg"
            ]
        }
    ]
}
```
