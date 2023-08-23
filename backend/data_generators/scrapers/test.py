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


def get_location_details_of_city(city_name, country_name):

    url = "https://tripadvisor16.p.rapidapi.com/api/v1/hotels/searchLocation"

    search_string = city_name + " , " + country_name

    querystring = {"query":search_string}

    headers = {
        "X-RapidAPI-Key": "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0",
        "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring)

    return response.json()

def scrape_locations_of_all_cities(start_index):
    arr = []
    already_scraped_data = read_json_file(location_filename)
    start_index = min(start_index,len(already_scraped_data))
    for i in range(start_index):
        arr.append(already_scraped_data[i])
    for index in range(start_index,len(cities)):
        print(index,end='\n\n')
        c = cities[index]
        data = get_location_details_of_city(c['name'],c['country_name'])
        data['city_id'] = c['city_id']
        print(data,end='\n\n')
        arr.append(data)
        write_to_json_file(arr,location_filename)
    return arr

def initialize_json_file(filename):
    empty_json = []
    write_to_json_file(empty_json,filename)

def get_hotels_of_city(city_id):

    city_locations = read_json_file(location_filename)

    geoId = city_locations[city_id-1]['data'][0]['geoId'].split(';')[1]

    print(city_id)
    print(cities[city_id-1]['name'])
    print(geoId,end='\n\n')

    today = datetime.datetime.now()
    check_in_date = today + datetime.timedelta(days=7)
    check_out_date = check_in_date + datetime.timedelta(days=1)
    
    check_in_date_str = check_in_date.strftime('%Y-%m-%d')
    check_out_date_str = check_out_date.strftime('%Y-%m-%d')

    print(check_in_date_str)
    print(check_out_date_str)

    url = "https://tripadvisor16.p.rapidapi.com/api/v1/hotels/searchHotels"

    querystring = {
        "geoId": geoId,
        "checkIn": check_in_date_str,
        "checkOut": check_out_date_str,
        "pageNumber": "1",
        "currencyCode": "BDT"
    }

    headers = {
        "X-RapidAPI-Key": "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0",
        "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring)

    return response.json()

def scrape_hotels_of_all_cities(already_done):
    start_index = already_done
    arr = []
    already_scraped_data = read_json_file(hotel_filename)
    start_index = min(start_index,len(already_scraped_data))
    for i in range(start_index):
        arr.append(already_scraped_data[i])
    for index in range(start_index,len(cities)):
        print(index,end='\n\n')
        c = cities[index]
        data = get_hotels_of_city(c['city_id'])
        data['city_id'] = c['city_id']
        print(data,end='\n\n')
        arr.append(data)
        write_to_json_file(arr,hotel_filename)
    return arr

#scrape_locations_of_all_cities(start_index=33)

#get_hotels_of_city(30)

scrape_hotels_of_all_cities(already_done=8)
