import requests
import json 
import os
import datetime
from cities import cities

BING_IMAGE_SEARCH_APIKEY = "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0"
base_path = './backend/data_generators'

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

def scrape_all_activity_images():
    write_to_file_after_each = 30
    raw_activitys = read_json_file(raw_activity_filename)
    already_scraped_data = read_json_file(activity_images_filename)
    already_done = 0
    for i in range(len(already_scraped_data)):
        if(True):
            already_done += 1
        else:
            break
    if(already_done == len(raw_activitys)):
        print('\n\nImages of all activitys already scraped.\n\n')
        return
    start_index = already_done
    print('\n\nStarting scraping activity images from activity_id = ',raw_activitys[start_index]['activity_id'],end='\n\n')
    arr = []
    for i in range(start_index):
        arr.append(already_scraped_data[i])

    for index in range(start_index,len(raw_activitys)):
        d = raw_activitys[index]
        search_string = d['name'] + ', ' + d['address'] + ', Bangladesh'
        print(search_string)
        data = get_bing_image_search_api_response(d['name'])
        data['activity_id'] = d['activity_id']
        data['activity_name'] = d['name']
        nice_print(data)
        arr.append(data)
        if(index%write_to_file_after_each == 0):
            print('\n\n\nWriting Progress to File...\n\n\n')
            write_to_json_file(arr,activity_images_filename)
    write_to_json_file(arr,activity_images_filename)
    return arr

scrape_all_activity_images()