import random
import json
from datetime import datetime, timedelta
from data.names import first_names, last_names
from data.cities import cities
from config import user_count
import string

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

users = []

for _ in range(user_count):
    users.append(generate_random_user())

formatted_users = json.dumps(users, indent=2)

file_path = './data_generators/data/users.py' 
with open(file_path, 'w') as file:
    file.write('users = ')
    file.write(formatted_users)

print(user_count)
