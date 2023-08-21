import random
import json
from datetime import datetime, timedelta
from data.destinations import destinations
from data.activities import activities
from data.cities import cities
from config import hotel_count, restaurant_count, guide_count

city_count = len(cities)
activity_count = len(activities)
destination_count = len(destinations)

nouns = ["Adventure", "Journey", "Excursion", "Exploration", "Odyssey", "Tour", "Getaway"]
adjectives = ["Amazing", "Incredible", "Thrilling", "Memorable", "Enchanting", "Fantastic", "Unforgettable"]
formats = ["{adj} {noun}", "{adj} {noun} to {dest}", "{dest} {noun}", "Discover {dest} - {adj} {noun}"]

def generate_trip_name():
    adj = random.choice(adjectives)
    noun = random.choice(nouns)
    dest = random.choice(destinations)
    name_format = random.choice(formats)
    trip_name = name_format.format(adj=adj, noun=noun, dest=dest)
    return trip_name

def generate_trip_description():
    patterns = [
        "Join us for a {adj} journey that promises to be {adj2} and {adj3}.",
        "Embark on an {adj} adventure of a lifetime, filled with {noun} and {adj2} experiences.",
        "Experience the {adj} charm of {dest} on this {adj2} {noun}.",
        "Discover the {adj} beauty of {dest} while enjoying {activity} and {activity2}.",
        "This {adj} trip offers a blend of {activity}, {activity2}, and {activity3}, making it truly {adj2}."
    ]
    
    adj = random.choice(adjectives)
    adj2 = random.choice(adjectives)
    adj3 = random.choice(adjectives)
    noun = random.choice(nouns)
    dest = random.choice(destinations)
    activity = random.choice(activities)
    activity2 = random.choice(activities)
    activity3 = random.choice(activities)
    description = random.choice(patterns).format(adj=adj, adj2=adj2, adj3=adj3, noun=noun, dest=dest, activity=activity, activity2=activity2, activity3=activity3)
    return description

def generate_trip_data():
    from_city_id = random.randint(1, city_count)
    to_city_id = random.randint(1, city_count)
    name = generate_trip_name()
    description = generate_trip_description()
    image_url = "dummy.jpg"
    
    today = datetime.today()
    days_before = random.randint(5, 10)
    days_after = random.randint(5, 10)
    
    start_date = (today - timedelta(days=days_before)).strftime("%Y-%m-%d")
    end_date = (today + timedelta(days=days_after)).strftime("%Y-%m-%d")
    
    # Rest of the code remains the same...

trip1 = generate_trip_data()

print(trip1)
