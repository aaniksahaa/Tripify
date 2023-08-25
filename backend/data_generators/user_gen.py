import random
import json
from datetime import datetime, timedelta
from data.helper_globals import first_names, last_names
from config import user_count
import string


base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + '/data/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file('cities.json')

city_count = len(cities)

def generate_random_password(length):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(length))

def generate_random_user():
    
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    full_name = f"{first_name} {last_name}"
    username = first_name.lower() + random.choice(['_','.']) + last_name.lower()
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
        "dob": dob.strftime('%Y-%m-%d')
    }

def generate_random_users():

    unique_usernames = []

    users = []

    while(len(users) < user_count):
        random_user = generate_random_user()
        if(random_user['username'] in unique_usernames): # clash
            print('clash')
            continue
        users.append(random_user)
        unique_usernames.append(random_user['username'])

    formatted_users = json.dumps(users, indent=2)

    file_path = base_path + '/data/users.json' 
    with open(file_path, 'w') as file:
        file.write(formatted_users)

    print(user_count,'users successfully generated and written to ',file_path)

#generate_random_users()