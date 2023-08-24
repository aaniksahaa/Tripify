import requests
import json 
import os
import datetime
import random

base_path = './backend/data_generators'

city_filename = '/data/cities.json'

restaurant_filename = '/scrapers/scraped_data/city_restaurants.json'

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

def generate_scraped_restaurants(max_restaurants_from_each_city,image_width, image_height):
    city_restaurants = read_json_file(restaurant_filename)
    scraped_restaurants = []
    dummy_restaurant_image = "https://media-cdn.tripadvisor.com/media/photo-s/1a/50/53/9d/elements-global-dining.jpg"
    for i in range(len(cities)):
        city_id = i+1
        this_city_restaurants = city_restaurants[i]['data']['data']
        cnt = 0
        for restaurant in this_city_restaurants:
            title = restaurant['name']
            title = title.strip()
            title = title.replace('\'','')
            if(len(title.split('.')) > 1):
                title = title.split('.')[1].strip()
            image_urls = []
            hero_url = restaurant['heroImgUrl']
            if(len(hero_url) == 0):
                hero_url = dummy_restaurant_image
            image_urls.append(hero_url)
            email = generate_email_from_title(title)

            cuisine_types = 'Chinese'

            if(len(restaurant['establishmentTypeAndCuisineTags'])>0):
                cuisine_types = ','.join(restaurant['establishmentTypeAndCuisineTags'])
            
            if(len(title) == 0):
                title = 'Elegant Food Castle'

            scraped_restaurant = {
                "restaurant_id": len(scraped_restaurants) + 1,
                "name": title,
                "reservation_price": 10*random.randint(5, 200),
                "address": f"{random.randint(1, 100)} {random.choice(streets)}",
                "city_id": city_id,
                "description": f"A restaurant serving {random.choice(adverbs)} {random.choice(adjectives)} {random.choice(cuisines)} {random.choice(food_types)}.",
                "image_url": "dummy.jpg",
                "cuisine_type": cuisine_types,
                "contact": f"01{random.randint(100, 999)}{random.randint(100, 999)}{random.randint(1000, 9999)}",
                "email": email,
                "images": image_urls
            }
            #print(scraped_restaurant,end='\n\n')
            scraped_restaurants.append(scraped_restaurant)
            cnt += 1
            if(cnt == max_restaurants_from_each_city):
                break

    formatted = json.dumps(scraped_restaurants, indent=2)

    file_path = base_path + '/data/restaurants.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(len(scraped_restaurants),'restaurants successfully generated and written to ',file_path)


#generate_scraped_restaurants(max_restaurants_from_each_city=10,image_width=1500,image_height=1000)