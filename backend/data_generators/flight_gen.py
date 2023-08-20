import random
import datetime
import json
from data.cities import cities
from config import flight_count

adjectives = ['Royal', 'National', 'Global', 'International', 'Elite', 'Premium', 'Luxury']
nouns = ['Airlines', 'Airways', 'Flights', 'Aviation']
flights = []

def generate_random_date():
    return  datetime.date.today() + datetime.timedelta(days=random.randint(1, 30))

def generate_random_flight():
    from_city_id, to_city_id = random.sample(range(1, len(cities)+1), 2)
    flight_id = len(flights) + 1
    airline_name = f"{random.choice(adjectives)} {random.choice(nouns)} Airlines"
    departure_date = generate_random_date()
    return_date = departure_date + datetime.timedelta(days=random.randint(1, 7))
    price = random.randint(3000, 20000)
    seat_class = random.choice(["Economy", "Business", "First"])
    flight_duration = random.randint(20, 120)
    booking_url = "booking.com"

    return {
        "flight_id": flight_id,
        "from_city_id": from_city_id,
        "to_city_id": to_city_id,
        "airline_name": airline_name,
        "departure_date": departure_date.strftime('%Y-%m-%d'),
        "return_date": return_date.strftime('%Y-%m-%d'),
        "price": price,
        "seat_class": seat_class,
        "flight_duration": flight_duration,
        "booking_url": booking_url
    }

# Generate random flights with unique from_city_id and to_city_id

for _ in range(flight_count):
    flights.append(generate_random_flight())

formatted = json.dumps(flights, indent=2)

file_path = './data_generators/data/flights.py' 
with open(file_path, 'w') as file:
    file.write('flights = ')
    file.write(formatted)

print(flight_count)
