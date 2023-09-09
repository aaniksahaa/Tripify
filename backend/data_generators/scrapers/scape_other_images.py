from scraper_helpers import *

trip_images_filename = 'scraped_data/trip_images.json'

trip_search_strings = [
    "sea beach",
    "mountain hike",
    "countryside landscape",
    "wildlife safari",
    "adventure activities",
    "island paradise",
    "camping under the stars",
    "tropical rainforest"
]


def scrape_trip_images(max_trip_cnt):
    trip_images = []
    cnt = 0
    for s in trip_search_strings:
        s += ' vacation tour'
        if cnt > max_trip_cnt :
            break
        images = get_bing_image_search_api_response(s)
        obj = {}
        obj['images'] = images
        obj['title'] = s
        trip_images.append(obj)
        cnt += 1
        print('\n\n', cnt, ' trips done\n\n')
        write_to_json_file(trip_images,trip_images_filename)
    write_to_json_file(trip_images,trip_images_filename)
    return trip_images

scrape_trip_images(max_trip_cnt=100)

