import json

from other_gen_functions import get_follow_sql, get_comment_sql, get_tripbooking_sql, get_react_sql

base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + '/data/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file('cities.json')
hotels = read_json_file('hotels.json')
restaurants = read_json_file('restaurants.json')
reviews = read_json_file('reviews.json')
destinations = read_json_file('destinations.json')
activities = read_json_file('activities.json')
flights = read_json_file('flights.json')
trips = read_json_file('trips.json')
users = read_json_file('users.json')
provides = read_json_file('provides.json')
posts = read_json_file('posts.json')


sql = ""

seq_tables = ['user', 'destination', 'activity', 'trip', 'hotel', 'city', 'flight', 'restaurant', 'review', 'post', 'comment', 'notification', 'message', 'group']

# sql += "\n---Dropping previous sequences...\n\n"

# for t in seq_tables:
#     sql += f"DROP SEQUENCE {t}_seq;\n"

# sql += "\n---Creating new sequences...\n\n"

# for t in seq_tables:
#     sql += f"CREATE SEQUENCE {t}_seq START WITH 1 INCREMENT BY 1 NOCACHE;\n"

sql += "\n---Deleting previous entries...\n\n"

tables_to_be_modified = ['Users','Guides','Cities', 'Destinations', 'Activities', 'Hotels', 'Flights', 'Restaurants', 'Flights', 'Provides', 'Trips', 'Reviews', 'Posts', 'Comments', 'Reacts']

for t in tables_to_be_modified:
    sql += f"DELETE FROM {t};\n"


sql += "\n-- Insert Dummy City for inserting Admin\n\n" 

sql += "INSERT INTO Cities (city_id, name, country_name, population, weather_type) VALUES (0, 'Dummy', 'Dummy', 0, 'sunny');\n"

sql += "\n-- Insert Global Admin User ( user_id = 0 )\n\n"

sql += "INSERT INTO Users ( user_id, username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 0, 'admin', 'admin@gmail.com', MY_HASH_PASSWORD('admin'), 'admin', 'Oppenheimer', 'I am from Andromida', 0, 'facebook.com/opp', 'twitter.com/opp', 'instagram.com/opp', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"

    

sql += "\n---Cities\n\n"

for c in cities:
    s = f"INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('{c['name']}', '{c['country_name']}', {c['population']}, '{c['weather_type']}');"
    sql += s 
    sql += "\n"

sql += "\n---Users\n\n"

sql += "INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'aaniksahaa', 'abc@gmail.com', MY_HASH_PASSWORD('123'), 'client', 'Anik Saha', 'Little Coder', 1, 'facebook.com/abc', 'twitter.com/abc', 'instagram.com/abc', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"
sql += "INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'jab3r', 'xyz@gmail.com', MY_HASH_PASSWORD('456'), 'client', 'Jaber Ahmed Deeder', 'Pro Coder', 1, 'facebook.com/xyz', 'twitter.com/xyz', 'instagram.com/xyz', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"

sql += "\n\n"

for u in users:
    s = f"INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( '{u['username']}', '{u['email']}', MY_HASH_PASSWORD('{u['password']}'), '{u['name']}', {u['city_id']} , TO_DATE('{u['dob']}','YYYY-MM-DD'));"
    sql += s
    sql += '\n'

sql += "\n---Guides\n\n"

sql += "INSERT INTO Guides (user_id) VALUES (1);\n"
sql += "INSERT INTO Guides (user_id) VALUES (2);\n"

sql += "\n---Follows\n\n"

sql += get_follow_sql()

sql += "\n\n"

sql += "\n---Destinations\n\n"

destination_id = 1
for d in destinations:
    s = f"INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('{d['name']}', '{d['address']}', {d['city_id']}, {d['latitude']}, {d['longitude']}, '{d['description']}', '{destinations[0]['images'][0]}');\n"
    for url in d['images']:
      s += f"INSERT INTO ImageCart(image_url, object_type, object_id) VALUES('{url}','destination',{destination_id});\n"
    s += '\n'
    sql += s
    destination_id += 1

sql += "\n---Activities\n\n"

activity_id = 1
for a in activities:
    s = f"INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('{a['name']}', '{a['category']}', '{a['description']}', '{activities[0]['images'][0]}', {a['min_age']}, {a['max_age']});\n"
    for url in a['images']:
      s += f"INSERT INTO ImageCart(image_url, object_type, object_id) VALUES('{url}','activity',{activity_id});\n"
    s += '\n'
    sql += s
    activity_id += 1

sql += "\n---Hotels\n\n"

hotel_id = 1
for h in hotels:
    s = f"INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('{h['name']}', '{h['address']}', {h['city_id']}, '{h['description']}', '{hotels[0]['images'][0]}', {h['price_per_day']}, '{h['phone']}', '{h['email']}', {h['has_wifi']}, {h['has_parking']}, {h['has_gym']});\n"
    for url in h['images']:
      s += f"INSERT INTO ImageCart(image_url, object_type, object_id) VALUES('{url}','hotel',{hotel_id});\n"
    s += '\n'
    sql += s
    hotel_id += 1
        
        

sql += "\n---Flights\n\n"

for f in flights:
    s = f"INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES ({f['from_city_id']}, {f['to_city_id']}, '{f['airline_name']}', TO_DATE('{f['departure_date']}', 'YYYY-MM-DD'), TO_DATE('{f['return_date']}', 'YYYY-MM-DD'), {f['price']}, '{f['seat_class']}', {f['flight_duration']}, '{f['booking_url']}');"
    sql += s
    sql += "\n"

sql += "\n---Restaurants\n\n"

restaurant_id = 1
for r in restaurants:
    s = f"INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('{r['name']}', {r['reservation_price']}, '{r['address']}', {r['city_id']}, '{r['description']}', '{restaurants[0]['images'][0]}', '{r['cuisine_type']}', '{r['contact']}', '{r['email']}');\n"
    for url in r['images']:
      s += f"INSERT INTO ImageCart(image_url, object_type, object_id) VALUES('{url}','restaurant',{restaurant_id});\n"
    s += '\n'
    sql += s
    restaurant_id += 1

sql += "\n---Provides\n\n"

for p in provides:
    s = f"INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES ({p['destination_id']}, {p['activity_id']}, {p['price']}, {p['is_available']});"
    sql += s
    sql += "\n"


def get_sql_from_trip(data):

    # Extract data and format it for PL/SQL
    from_city_id = data["from_city_id"]
    to_city_id = data["to_city_id"]
    name = data["name"]
    description = data["description"]
    image_url = data["image_url"]
    start_date = data["start_date"]
    end_date = data["end_date"]

    # Extract and format contains data
    contains_list = [
        f"DestinationActivity({entry['destination_id']}, {entry['activity_id']}, TO_DATE('{entry['tentative_date']}', 'YYYY-MM-DD'))"
        for entry in data["contains"]
    ]
    contains_str = ",\n".join(contains_list)

    # Extract and format hotels data
    hotels_list = [
        f"HotelDates({entry['hotel_id']}, TO_DATE('{entry['checkin_date']}', 'YYYY-MM-DD'), TO_DATE('{entry['checkout_date']}', 'YYYY-MM-DD'))"
        for entry in data["hotels"]
    ]
    hotels_str = ",\n".join(hotels_list)

    # Extract and format restaurants data
    restaurants_list = [str(entry["restaurant_id"]) for entry in data["restaurants"]]
    restaurants_str = ", ".join(restaurants_list)

    # Extract and format guides data
    guides_list = [str(entry["guide_id"]) for entry in data["guides"]]
    guides_str = ", ".join(guides_list)

    # Generate PL/SQL code
    plsql_code = f'''
DECLARE
l_hotels HotelDatesList := HotelDatesList(
    {hotels_str}
);
l_restaurants RestaurantList := RestaurantList({restaurants_str});
l_contains DestinationActivitiesList := DestinationActivitiesList(
    {contains_str}
);
l_guides GuideList := GuideList({guides_str});
p_trip_id NUMBER;
BEGIN
AddTrip({from_city_id}, {to_city_id}, '{name}', '{description}', '{image_url}', TO_DATE('{start_date}', 'YYYY-MM-DD'), TO_DATE('{end_date}', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);

DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/
    '''

    return plsql_code

for trip in trips:
    sql += '\n'
    sql += get_sql_from_trip(trip)
    sql += '\n'

review_id = 1
for r in reviews:
    s = f"INSERT INTO Reviews (user_id, description, rating, image_url) VALUES ({r['user_id']}, '{r['description']}', {r['rating']}, '{r['image_url']}');\n"
    s += f"INSERT INTO {r['object_type']}Reviews(review_id, {r['object_type']}_id) VALUES({review_id}, {r['object_id']});\n\n"
    sql += s 
    review_id += 1

sql += get_tripbooking_sql()

sql += "\n---Posts\n\n"

for p in posts:
    sql += f"INSERT INTO POSTS(USER_ID,DESCRIPTION,IMAGE_URL) VALUES({p['user_id']},'{p['description']}','{p['image_url']}');\n\n"

sql += '\n\n'

sql += get_comment_sql()

sql += get_react_sql()

sql += "\n\nDELETE FROM NOTIFICATIONS;\n\n"

sql += """

DROP SEQUENCE notification_seq;
CREATE SEQUENCE notification_seq START WITH 1 INCREMENT BY 1 NOCACHE;

"""

sql += "\n--Update User Images\n\n"
for u in users:
    sql += f"UPDATE USERS SET PROFILE_PICTURE = '{u['profile_picture']}' WHERE USER_ID = {u['user_id']};\n"

sql += "\n\n"

sql += "\n\nSELECT * FROM USERS;\n\n"

file_path = base_path + '/sql/large_insert.sql' 
with open(file_path, 'w', encoding='utf-8', errors='ignore') as file:
    file.write(sql)

print(sql)