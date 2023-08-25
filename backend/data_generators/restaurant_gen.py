import random
import json 
from config import restaurant_count

base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + '/data/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file('cities.json')

city_count = len(cities)

adjectives = [
    "Delicious", "Exquisite", "Gourmet", "Charming", "Cozy", "Fusion",
    "Seaside", "Savory", "Authentic", "Elegant", "Rustic", "Quaint"
]
nouns = [
    "Bistro", "Cafe", "Brasserie", "Eatery", "Kitchen", "Diner", "Grill",
    "Steakhouse", "Osteria", "Tavern", "Bakery", "Pizzeria"
]
adverbs = [
    "Delightfully", "Exquisitely", "Authentically", "Savoringly", "Uniquely",
    "Wonderfully", "Enchantingly", "Elegantly", "Tastefully", "Passionately"
]
streets = [
    "Main Street", "Food Court", "Lakeview Drive", "Culinary Avenue", "Restaurant Row",
    "Gourmet Street", "Riverfront", "Cafeteria Lane", "Dining Boulevard", "Foodie Street"
]
cuisines = [
    "Italian", "Chinese", "Indian", "Thai", "Mexican", "Japanese",
    "Mediterranean", "French", "Greek", "Spanish", "Bangladeshi"
]
food_types = [
    "Seafood", "Steak", "Sushi", "Pizza", "Burger", "Curry",
    "Pasta", "Dim Sum", "Kebab", "Tacos", "Biryani"
]
mails = ["gmail","yahoo","outlook"]

restaurants = []

def generate_random_restaurant():
    restaurant_id = len(restaurants) + 1
    reservation_price_per_person = random.randint(50, 500)
    name = f"{random.choice(adjectives)} {random.choice(nouns)} {random.choice(food_types)} Restaurant"
    email = f"{name.replace(' ', '').lower()}@{random.choice(mails)}.com"
    city_id = random.randint(1,city_count)
    #city = cities[city_id-1]

    return {
        "restaurant_id": restaurant_id,
        "name": name,
        "reservation_price": reservation_price_per_person,
        "address": f"{random.randint(1, 100)} {random.choice(streets)}",
        "city_id": city_id,
        "description": f"A restaurant serving {random.choice(adverbs)} {random.choice(adjectives)} {random.choice(cuisines)} {random.choice(food_types)}.",
        "image_url": "dummy.jpg",
        "cuisine_type": random.choice(cuisines),
        "contact": f"01{random.randint(100, 999)}{random.randint(100, 999)}{random.randint(1000, 9999)}",
        "email": email,
        "images": ["dummy.jpg"]
    }

def generate_random_restaurants():
    for i in range(restaurant_count):
        restaurants.append(generate_random_restaurant())

    formatted = json.dumps(restaurants, indent=2)

    file_path = base_path + '/data/restaurants.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(restaurant_count,'restaurants successfully generated and written to ',file_path)

#generate_random_restaurants()