import requests
import json 
import os
import datetime
from cities import cities

base_path = './backend/data_generators'
location_filename = 'city_locations.json'
hotel_filename = 'city_hotels.json'
restaurant_filename = 'city_restaurants.json'
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

def initialize_json_file(filename):
    empty_json = []
    write_to_json_file(empty_json,filename)

def get_location_details_of_city(city_id):

    url = "https://tripadvisor16.p.rapidapi.com/api/v1/hotels/searchLocation"

    city_name = cities[city_id-1]['name']
    country_name = cities[city_id-1]['country_name']

    print('\n\nScraping Location Details for: \n\n')
    print('city_id = ',city_id)
    print('city_name = ',cities[city_id-1]['name'])
    print('country_name = ',cities[city_id-1]['country_name'],end='\n\n')

    search_string = city_name + " , " + country_name

    querystring = {"query":search_string}

    headers = {
        "X-RapidAPI-Key": "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0",
        "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring)

    return response.json()

def scrape_locations_of_all_cities():
    already_scraped_data = read_json_file(location_filename)
    already_done = 0
    for i in range(len(already_scraped_data)):
        if(already_scraped_data[i]['status'] == True and already_scraped_data[i]['message'] == 'Success'):
            already_done += 1
        else:
            break
    if(already_done == len(cities)):
        print('\n\nLocations of all cities already scraped.\n\n')
        return
    start_index = already_done
    print('\n\nStarting scraping location from city_id = ',cities[start_index]['city_id'],end='\n\n')
    arr = []
    for i in range(start_index):
        arr.append(already_scraped_data[i])
    for index in range(start_index,len(cities)):
        print(index,end='\n\n')
        c = cities[index]
        data = get_location_details_of_city(c['city_id'])
        data['city_id'] = c['city_id']
        data['city_name'] = c['name']
        print(data,end='\n\n')
        arr.append(data)
        write_to_json_file(arr,location_filename)
    return arr

def update_location_of_one_city(city_id):
    c = cities[city_id-1]
    data = get_location_details_of_city(c['city_id'])
    data['city_id'] = c['city_id']
    data['city_name'] = c['name']
    print(data,end='\n\n')
    already_scraped_data = read_json_file(location_filename)
    already_scraped_data[city_id-1] = data
    write_to_json_file(already_scraped_data,location_filename)

def get_hotels_of_city(city_id):

    city_locations = read_json_file(location_filename)

    geoId_str = city_locations[city_id-1]['data'][0]['geoId']

    split_str = geoId_str.split(';')

    geoId = ""

    if(len(split_str)>1):
        geoId = split_str[1]
    else:
        geoId = split_str[0]

    print('\n\nScraping Hotels for: \n\n')
    print('city_id = ',city_id)
    print('city_name = ',cities[city_id-1]['name'])
    print('geoId = ',geoId,end='\n\n')

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

def scrape_hotels_of_all_cities():
    already_scraped_data = read_json_file(hotel_filename)
    already_done = 0
    for i in range(len(already_scraped_data)):
        if(already_scraped_data[i]['status'] == True and already_scraped_data[i]['message'] == 'Success'):
            already_done += 1
        else:
            break
    if(already_done == len(cities)):
        print('\n\nHotels of all cities already scraped.\n\n')
        return
    start_index = already_done
    print('\n\nStarting scraping hotels from city_id = ',cities[start_index]['city_id'],end='\n\n')
    arr = []
    for i in range(start_index):
        arr.append(already_scraped_data[i])
    for index in range(start_index,len(cities)):
        c = cities[index]
        data = get_hotels_of_city(c['city_id'])
        data['city_id'] = c['city_id']
        data['city_name'] = c['name']
        print(data,end='\n\n')
        arr.append(data)
        write_to_json_file(arr,hotel_filename)
    return arr

def update_hotel_of_one_city(city_id):
    update_location_of_one_city(city_id)
    c = cities[city_id-1]
    data = get_hotels_of_city(city_id)
    data['city_id'] = c['city_id']
    data['city_name'] = c['name']
    print(data,end='\n\n')
    already_scraped_data = read_json_file(hotel_filename)
    already_scraped_data[city_id-1] = data
    write_to_json_file(already_scraped_data,hotel_filename)

def get_restaurants_of_city(city_id):

    city_locations = read_json_file(location_filename)

    geoId_str = city_locations[city_id-1]['data'][0]['geoId']

    split_str = geoId_str.split(';')

    geoId = ""

    if(len(split_str)>1):
        geoId = split_str[1]
    else:
        geoId = split_str[0]

    ## handling cities where hotel location_ids and restaurant locations_ids mismatch
    
    if(city_id == 12):
        geoId = "736254"

    print('\n\nScraping Restaurants for: \n\n')
    print('city_id = ',city_id)
    print('city_name = ',cities[city_id-1]['name'])
    print('geoId = ',geoId,end='\n\n')

    url = "https://tripadvisor16.p.rapidapi.com/api/v1/restaurant/searchRestaurants"

    querystring = {
        "locationId": geoId
    }

    headers = {
        "X-RapidAPI-Key": "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0",
        "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring)

    return response.json()

def scrape_restaurants_of_all_cities():
    already_scraped_data = read_json_file(restaurant_filename)
    already_done = 0
    for i in range(len(already_scraped_data)):
        if(already_scraped_data[i]['status'] == True and already_scraped_data[i]['message'] == 'Success'):
            already_done += 1
        else:
            break
    if(already_done == len(cities)):
        print('\n\nRestaurants of all cities already scraped.\n\n')
        return
    start_index = already_done
    print('\n\nStarting scraping restaurants from city_id = ',cities[start_index]['city_id'],end='\n\n')
    arr = []
    for i in range(start_index):
        arr.append(already_scraped_data[i])
    for index in range(start_index,len(cities)):
        c = cities[index]
        data = get_restaurants_of_city(c['city_id'])
        if(data['status'] == False):
            print(data)
            print('\n\nSorry Error occured midway..')
            print('\n\nAll Progresses are saved\n\n')
            break
        data['city_id'] = c['city_id']
        data['city_name'] = c['name']
        print(data,end='\n\n')
        arr.append(data)
        write_to_json_file(arr,restaurant_filename)
    return arr

def update_restaurant_of_one_city(city_id):
    c = cities[city_id-1]
    data = get_restaurants_of_city(city_id)
    data['city_id'] = c['city_id']
    data['city_name'] = c['name']
    print(data,end='\n\n')
    already_scraped_data = read_json_file(restaurant_filename)
    already_scraped_data[city_id-1] = data
    write_to_json_file(already_scraped_data,restaurant_filename)

#scrape_hotels_of_all_cities()
#scrape_restaurants_of_all_cities()


