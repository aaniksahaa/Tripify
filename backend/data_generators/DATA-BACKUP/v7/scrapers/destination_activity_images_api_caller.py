import requests
import json 
import os
import datetime
from cities import cities

BING_IMAGE_SEARCH_APIKEY = "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0"
base_path = './backend/data_generators'

raw_destination_filename = 'prereq/raw_destinations.json'
destination_images_filename = 'scraped_data/destination_images.json'

raw_activity_filename = 'prereq/raw_activities.json'
activity_images_filename = 'scraped_data/activity_images.json'

def read_json_file(filename):
    json_file_path = base_path + '/scrapers/' + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

def write_to_json_file(json_object, filename):

    json_file_path = base_path + '/scrapers/' + filename

    with open(json_file_path, 'w') as json_file:
        json.dump(json_object, json_file, indent=4)

    print(f"JSON file written at: {json_file_path}")

def nice_print(json_object):
    print(json.dumps(json_object, indent=4))

def initialize_json_file(filename):
    empty_json = []
    write_to_json_file(empty_json,filename)

def get_bing_image_search_api_response(title):
    
    url = "https://bing-image-search1.p.rapidapi.com/images/search"

    querystring = {"q":title}

    headers = {
        "X-RapidAPI-Key": BING_IMAGE_SEARCH_APIKEY,
        "X-RapidAPI-Host": "bing-image-search1.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring)

    return response.json()

def scrape_all_destination_images():
    write_to_file_after_each = 30
    raw_destinations = read_json_file(raw_destination_filename)
    already_scraped_data = read_json_file(destination_images_filename)
    already_done = 0
    for i in range(len(already_scraped_data)):
        if(True):
            already_done += 1
        else:
            break
    if(already_done == len(raw_destinations)):
        print('\n\nImages of all destinations already scraped.\n\n')
        return
    start_index = already_done
    print('\n\nStarting scraping destination images from destination_id = ',raw_destinations[start_index]['destination_id'],end='\n\n')
    arr = []
    for i in range(start_index):
        arr.append(already_scraped_data[i])

    for index in range(start_index,len(raw_destinations)):
        d = raw_destinations[index]
        search_string = d['name'] + ', ' + d['address'] + ', Bangladesh'
        print(search_string)
        data = get_bing_image_search_api_response(search_string)
        data['destination_id'] = d['destination_id']
        data['destination_name'] = d['name']
        nice_print(data)
        arr.append(data)
        if(index%write_to_file_after_each == 0):
            print('\n\n\nWriting Progress to File...\n\n\n')
            write_to_json_file(arr,destination_images_filename)
    write_to_json_file(arr,destination_images_filename)
    return arr

def scrape_all_activity_images():
    write_to_file_after_each = 10
    raw_activities = read_json_file(raw_activity_filename)
    already_scraped_data = read_json_file(activity_images_filename)
    already_done = 0
    for i in range(len(already_scraped_data)):
        if(True):
            already_done += 1
        else:
            break
    if(already_done == len(raw_activities)):
        print('\n\nImages of all activities already scraped.\n\n')
        return
    start_index = already_done
    print('\n\nStarting scraping activity images from activity_id = ',raw_activities[start_index]['activity_id'],end='\n\n')
    arr = []
    for i in range(start_index):
        arr.append(already_scraped_data[i])

    for index in range(start_index,len(raw_activities)):
        a = raw_activities[index]
        search_string = a['name']
        print(search_string)
        data = get_bing_image_search_api_response(search_string)
        data['activity_id'] = a['activity_id']
        data['activity_name'] = a['name']
        nice_print(data)
        arr.append(data)
        if(index%write_to_file_after_each == 0):
            print('\n\n\nWriting Progress to File...\n\n\n')
            write_to_json_file(arr,activity_images_filename)
    write_to_json_file(arr,activity_images_filename)
    return arr

#scrape_all_destination_images()
#scrape_all_activity_images()