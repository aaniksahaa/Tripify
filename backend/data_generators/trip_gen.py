import random
import json
from datetime import datetime, timedelta
from data.destinations import destinations
from data.activities import activities
from data.cities import cities
from data.provides import provides
from config import hotel_count, restaurant_count, guide_count, trip_count

import json

base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + '/data/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

destinations = read_json_file('destinations.json')
activities = read_json_file('activities.json')

city_count = len(cities)
activity_count = len(activities)
destination_count = len(destinations)
provides_count = len(provides)

def generate_trip_name():
    name_options = [
        "Adventure Expedition",
        "Tropical Getaway",
        "Cultural Discovery",
        "Wilderness Retreat",
        "Urban Exploration",
        "Relaxation Retreat",
        "Historical Journey",
        "Eco-Friendly Escape",
        "Mountainous Adventure",
        "Coastal Odyssey"
    ]
    return random.choice(name_options)

def generate_trip_description():
    description_options = [
        "Embark on a thrilling journey of discovery and relaxation, exploring both natures wonders and vibrant city life.",
        "Experience the magic of diverse cultures, breathtaking landscapes, and unforgettable moments on this unique trip.",
        "Indulge in the perfect blend of adventure and tranquility, creating memories that will last a lifetime.",
        "Discover hidden gems, savor local cuisines, and immerse yourself in the rich history of each destination.",
        "Unwind in luxurious accommodations, surrounded by picturesque scenery that promises both serenity and excitement.",
        "Get ready for an eco-friendly escapade, where youll connect with nature and support sustainable tourism.",
        "Venture into the heart of untouched wilderness, where every step unveils new surprises and untold stories.",
        "This is the ultimate getaway, where every day brings a new opportunity for exploration and wonder.",
        "Embark on a journey of self-discovery and rejuvenation, leaving behind the worries of everyday life.",
        "Explore majestic mountains, relax on pristine beaches, and create cherished memories with fellow travelers."
    ]
    return random.choice(description_options)

def generate_trip_data():
    from_city_id = random.randint(1, city_count)
    to_city_id = random.randint(1, city_count)
    name = generate_trip_name()
    description = generate_trip_description()
    image_url = "dummy.jpg"
    
    today = datetime.today()
    days_before = random.randint(5, 10)
    days_after = random.randint(5, 10)
    
    start_date = (today - timedelta(days=days_before))
    end_date = (today + timedelta(days=days_after))
    
    pro = []
    pro_ids = random.sample(range(1,provides_count-1),random.randint(1,3))

    contains = []
    for id in pro_ids:
        contains.append({
            "destination_id": provides[id]["destination_id"],
            "activity_id": provides[id]["activity_id"],
            "tentative_date": (start_date + timedelta(random.randint(1,3))).strftime("%Y-%m-%d")
        })
    # for _ in range(random.randint(1, 3)):
    #     contains.append({
    #         "destination_id": random.randint(1, destination_count),
    #         "activity_id": random.randint(1, activity_count),
    #         "tentative_date": (start_date + timedelta(random.randint(1,3))).strftime("%Y-%m-%d")
    #     })
    
    hotels = []
    for _ in range(random.randint(1, 2)):
        hotels.append({
            "hotel_id": random.randint(1, hotel_count),
            "checkin_date": (start_date + timedelta(random.randint(1,3))).strftime("%Y-%m-%d"),
            "checkout_date": (start_date + timedelta(random.randint(5,7))).strftime("%Y-%m-%d")
        })
    
    restaurants = []
    res_ids = random.sample(range(1,restaurant_count),random.randint(1,5))
    for id in res_ids:
        restaurants.append({"restaurant_id": id})

    guides = []
    guide_ids = random.sample(range(1,guide_count+1),random.randint(1,2))
    for id in guide_ids:
        guides.append({"guide_id": id})
    
    trip_data = {
        "from_city_id": from_city_id,
        "to_city_id": to_city_id,
        "name": name,
        "description": description,
        "image_url": image_url,
        "start_date": start_date.strftime("%Y-%m-%d"),
        "end_date": end_date.strftime("%Y-%m-%d"),
        "contains": contains,
        "hotels": hotels,
        "restaurants": restaurants,
        "guides": guides
    }
    
    return trip_data

def generate_random_trips():

    trips = []

    for _ in range(trip_count):
        trips.append(generate_trip_data())

    formatted_users = json.dumps(trips, indent=2)

    file_path = base_path + '/data/trips.json' 
    with open(file_path, 'w') as file:
        file.write(formatted_users)

    print(trip_count,'trips successfully generated and written to ',file_path)

#generate_random_trips()