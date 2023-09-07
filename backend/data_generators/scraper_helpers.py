import requests
import json 

BING_IMAGE_SEARCH_APIKEY = "683351e6d6msh5280d130f8100c4p1b86d2jsn83e8d30556e0"
base_path = './backend/data_generators'

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

def get_images(bing_image_search_api_response, max_images = 100, max_size_in_kb = 1000):
    
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
