import requests
import json 
import os
import datetime

base_path = './backend/data_generators'

city_filename = '/data/cities.json'

raw_destination_filename = '/scrapers/prereq/raw_destinations.json'
destination_images_filename = '/scrapers/scraped_data/destination_images.json'

raw_activity_filename = '/scrapers/prereq/raw_activities.json'
activity_images_filename = '/scrapers/scraped_data/activity_images.json'

def read_json_file(filename):
    json_file_path = base_path + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

cities = read_json_file(city_filename)

def write_to_json_file(json_object, filename):

    json_file_path = base_path + filename

    with open(json_file_path, 'w') as json_file:
        json.dump(json_object, json_file, indent=4)

    print(f"JSON file written at: {json_file_path}")

def nice_print(json_object):
    print(json.dumps(json_object, indent=4))

def initialize_json_file(filename):
    empty_json = []
    write_to_json_file(empty_json,filename)

def get_images(bing_image_search_api_response, max_images, max_size_in_kb):

    data = bing_image_search_api_response

    data = data['value']

    images = []

    max_size_in_bytes = 1000*max_size_in_kb

    for i in range(len(data)):
        url = data[i]['contentUrl']
        if(url is None):
            continue
        if(int(data[i]['contentSize'].split()[0]) > max_size_in_bytes):
            continue
        if("'" in url):
            continue
        if(len(url) > 295):
            continue
        #print('accepting',i)
        images.append(url)
        if(len(images) == max_images):
            break
    
    return images

def generate_scraped_destinations(max_images, max_size_in_kb):
    raw_destinations = read_json_file(raw_destination_filename)
    destination_images = read_json_file(destination_images_filename)
    scraped_destinations = []
    for i in range(len(raw_destinations)):
        api_response = destination_images[i]
        this_destination_images = get_images(api_response,max_images,max_size_in_kb)
        scraped_destination = raw_destinations[i]
        scraped_destination['images'] = this_destination_images
        #nice_print(scraped_destination)
        scraped_destinations.append(scraped_destination)

    formatted = json.dumps(scraped_destinations, indent=2)

    file_path = base_path + '/data/destinations.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(len(scraped_destinations),'destinations successfully generated and written to ',file_path)


def generate_scraped_activities(max_images, max_size_in_kb):
    raw_activities = read_json_file(raw_activity_filename)
    activity_images = read_json_file(activity_images_filename)
    scraped_activities = []
    for i in range(len(raw_activities)):
        api_response = activity_images[i]
        this_activity_images = get_images(api_response,max_images,max_size_in_kb)
        scraped_activity = raw_activities[i]
        scraped_activity['images'] = this_activity_images
        #nice_print(scraped_activity)
        scraped_activities.append(scraped_activity)

    formatted = json.dumps(scraped_activities, indent=2)

    file_path = base_path + '/data/activities.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(len(scraped_activities),'activities successfully generated and written to ',file_path)


#generate_scraped_destinations(max_images=4,max_size_in_kb=250)
#generate_scraped_activities(max_images=4,max_size_in_kb=250)