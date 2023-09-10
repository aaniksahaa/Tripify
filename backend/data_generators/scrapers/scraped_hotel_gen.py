import requests
import json 
import os
import datetime
import random

base_path = './backend/data_generators'

city_filename = '/data/cities.json'

hotel_filename = '/scrapers/scraped_data/city_hotels.json'

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

def read_json_file(filename):
    json_file_path = base_path + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file(city_filename)

def generate_email_from_title(title):
    arr = title.lower().split()
    if(len(arr) > 2):
        arr = arr[:2]
    email = random.choice(['.','_']).join(arr) + '@'
    email += random.choice(mails)
    email += '.com'
    return email

def generate_scraped_hotels(max_hotels_from_each_city, image_width, image_height):
    city_hotels = read_json_file(hotel_filename)
    scraped_hotels = []
    for i in range(len(cities)):
        city_id = i+1
        this_city_hotels = city_hotels[i]['data']['data']
        cnt = 0
        for hotel in this_city_hotels:
            title = hotel['title']
            title = title.strip()
            title = title.replace('\'','')
            if(len(title.split('.')) > 1):
                title = title.split('.')[1].strip()
            if(hotel['priceForDisplay'] is None):
                price = 2500
            else:
                price = hotel['priceForDisplay'].replace('BDT\u00a0','').replace(',','')
                price = int(price)
            image_urls = []
            for photo in hotel['cardPhotos']:
                url = photo['sizes']['urlTemplate'].replace('{width}',str(image_width)).replace('{height}',str(image_height))
                image_urls.append(url)

            if(len(image_urls) < 4):
                continue
            
            email = generate_email_from_title(title)
            scraped_hotel = {
                "hotel_id": len(scraped_hotels) + 1,
                "name": title,
                "address": f"{random.choice(streets)}, {cities[city_id-1]['name']}",
                "city_id": city_id,
                "description": f"A {random.choice(adverbs)} {random.choice(adjectives)} hotel in {cities[city_id-1]['name']}.",
                "image_url": "dummy.jpg",
                "price_per_day": price,
                "phone": f"01{random.randint(100, 999)}{random.randint(100, 999)}{random.randint(1000, 9999)}",
                "email": email,
                "has_wifi": random.choice([0, 1]),
                "has_parking": random.choice([0, 1]),
                "has_gym": random.choice([0, 1]),
                "images":image_urls
            }
            #print(scraped_hotel,end='\n\n')
            scraped_hotels.append(scraped_hotel)
            cnt += 1
            if(cnt == max_hotels_from_each_city):
                break

    formatted = json.dumps(scraped_hotels, indent=2)

    file_path = base_path + '/data/hotels.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(len(scraped_hotels),'hotels successfully generated and written to ',file_path)


#generate_scraped_hotels(max_hotels_from_each_city=10,image_width=1500,image_height=1000)