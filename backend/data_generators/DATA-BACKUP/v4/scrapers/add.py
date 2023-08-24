import requests
import json 
import os
import datetime
from cities import cities

base_path = './backend/data_generators'
location_filename = 'city_locations.json'
hotel_filename = 'city_hotels.json'
filenames = [location_filename]

def read_json_file(filename):
    json_file_path = base_path + '/scrapers/scraped_data/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

def write_to_json_file(json_object, filename):

    json_file_path = base_path + '/scrapers/scraped_data/' + filename

    with open(json_file_path, 'w') as json_file:
        json.dump(json_object, json_file, indent=4)

    print(f"JSON file written at: {json_file_path}")

def add_city_names_to_city_hotels():
    city_hotels = read_json_file(hotel_filename)
    for city_hotel in city_hotels:
        city_id = city_hotel['city_id']
        city_hotel['city_name'] = cities[city_id-1]['name']
    write_to_json_file(city_hotels,'updated_city_hotels.json')

def add_city_names_to_city_locations():
    city_locations = read_json_file(location_filename)
    for city_location in city_locations:
        city_id = city_location['city_id']
        city_location['city_name'] = cities[city_id-1]['name']
    write_to_json_file(city_locations,'updated_city_locations.json')

# add_city_names_to_city_locations()
