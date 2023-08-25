import random
import json 
from config import hotel_count

base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + '/data/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file('cities.json')

adjectives = [
    "Luxurious", "Charming", "Elegant", "Cozy", "Modern", "Boutique",
    "Seaside", "Rustic", "Quaint", "Spectacular", "Elevated", "Glorious"
]
nouns = [
    "Resort", "Inn", "Lodge", "Retreat", "Palace", "Manor", "Oasis", "Mansion",
    "Hideaway", "Villa", "Cottage", "Castle", "Sanctuary"
]
adverbs = [
    "Exceptionally", "Exquisitely", "Majestically", "Serenely", "Uniquely",
    "Wonderfully", "Enchantingly", "Extravagantly", "Gracefully", "Magically"
]
streets = [
    "Main Street", "Beach Road", "Lakeview Drive", "Park Avenue", "Mountain Street",
    "Harbor View", "Riverfront", "Garden Lane", "Sunset Boulevard", "Ocean Drive"
]

mails = ["gmail","yahoo","outlook"]

hotels = []

def generate_random_hotel():

    hotel_id = len(hotels) + 1
    price_per_day = random.randint(800, 5000)
    name = f"{random.choice(adjectives)} {random.choice(nouns)} Hotel"
    email = f"{name.replace(' ', '').lower()}@{random.choice(mails)}.com"
    city_id = random.randint(1,30)
    city = cities[city_id-1]

    return {
        "hotel_id": hotel_id,
        "name": name,
        "address": f"{random.randint(1, 100)} {random.choice(streets)} {cities[city_id-1]['name']} , Bangladesh",
        "city_id": city_id,
        "description": f"A {random.choice(adverbs)} {random.choice(adjectives)} hotel in {cities[city_id-1]['name']}.",
        "image_url": "dummy.jpg",
        "price_per_day": price_per_day,
        "phone": f"01{random.randint(100, 999)}{random.randint(100, 999)}{random.randint(1000, 9999)}",
        "email": email,
        "has_wifi": random.choice([0, 1]),
        "has_parking": random.choice([0, 1]),
        "has_gym": random.choice([0, 1]),
        "images":["dummy.jpg"]
    }

def generate_random_hotels():

    hotels = []

    for i in range(hotel_count):
        hotels.append(generate_random_hotel())

    formatted = json.dumps(hotels, indent=2)

    file_path = base_path + '/data/hotels.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(hotel_count,'hotels successfully generated and written to ',file_path)

#generate_random_hotels()