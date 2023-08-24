import requests
import json 
import os
import datetime
from cities import cities

base_path = './backend/data_generators'

raw_destination_filename = 'prereq/raw_destinations.json'
destination_images_filename = 'scraped_data/destination_images.json'

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

def get_images(bing_image_search_api_response, max_images, max_size_in_kb):

    data = bing_image_search_api_response

    data = data['value']

    images = []

    max_size_in_bytes = 1000*max_size_in_kb

    for i in range(len(data)):
        if(data[i]['contentUrl'] is None):
            continue
        else:
            if(int(data[i]['contentSize'].split()[0]) > max_size_in_bytes):
                continue
            else:
                #print('accepting',i)
                images.append(data[i]['contentUrl'])
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
        nice_print(scraped_destination)
        scraped_destinations.append(scraped_destination)

    formatted = json.dumps(scraped_destinations, indent=2)

    file_path = base_path + '/data/destinations.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(len(scraped_destinations),'destinations successfully generated and written to ',file_path)

generate_scraped_destinations(4,800)