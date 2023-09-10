import random
import json
from datetime import datetime, timedelta
from data.helper_globals import first_names, last_names, male_full_names, female_full_names
from config import user_count
import string

from scraper_helpers import *


base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file('/data/cities.json')
user_images_api_responses = read_json_file('/scrapers/scraped_data/user_images.json')

male_user_images_api_responses = []
female_user_images_api_responses = []

male_user_images_api_responses.append(user_images_api_responses[0])
female_user_images_api_responses.append(user_images_api_responses[1])

city_count = len(cities)

def generate_random_password(length):
    #characters = string.ascii_letters + string.digits
    #return ''.join(random.choice(characters) for _ in range(length))
    dummy_passwords = ['abc','123','xyz']
    return random.choice(dummy_passwords)

def generate_random_user(male_user_image_urls, female_user_image_urls):

    # first_name = random.choice(first_names)
    # last_name = random.choice(last_names)

    full_name = ""
    gender = ""
    profile_picture = ""

    g = random.choice(range(1,11))

    if(g < 7):
        full_name = random.choice(male_full_names)
        gender = "male"
        profile_picture = random.choice(male_user_image_urls)
    else:
        full_name = random.choice(female_full_names)
        gender = "female"
        profile_picture = random.choice(female_user_image_urls)

    username = random.choice(['_','.']).join(full_name.lower().split(' '))
    email = username + '@' + random.choice(['gmail','yahoo']) + '.com'
    password = generate_random_password(random.randint(8,12))
    dob = datetime.now() - timedelta(days=random.randint(365 * 12, 365 * 80))
    city_id = random.randint(1,city_count)

    return {
        "username": username,
        "email": email,
        "password": password,  # In a real application, this should be hashed
        "name": full_name,
        "city_id": city_id,
        "dob": dob.strftime('%Y-%m-%d'),
        "gender": gender,
        "profile_picture": profile_picture
    }

def generate_random_users(max_size_in_kb=250):

    male_user_image_urls = []
    female_user_image_urls = []

    for r in male_user_images_api_responses:
        male_user_image_urls += get_images(r['images'],max_images=100,max_size_in_kb=max_size_in_kb)
    
    for r in female_user_images_api_responses:
        female_user_image_urls += get_images(r['images'],max_images=100,max_size_in_kb=max_size_in_kb)
    
    male_user_image_urls = [url for url in male_user_image_urls if ('pinimg' not in url) and ('getaka' not in url)]
    female_user_image_urls = [url for url in female_user_image_urls if ('pinimg' not in url) and ('getaka' not in url)]

    unique_usernames = []

    users = []

    while(len(users) < user_count):
        random_user = generate_random_user(male_user_image_urls, female_user_image_urls)
        if(random_user['username'] in unique_usernames): # clash
            print('clash')
            continue
        random_user['user_id'] = len(users) + 3
        users.append(random_user)
        unique_usernames.append(random_user['username'])

    formatted_users = json.dumps(users, indent=2)

    file_path = base_path + '/data/users.json' 
    with open(file_path, 'w') as file:
        file.write(formatted_users)

    print(user_count,'users successfully generated and written to ',file_path)

generate_random_users()