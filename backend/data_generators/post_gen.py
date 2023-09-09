import random
import json
from datetime import datetime, timedelta
from config import post_count, user_count

from scraper_helpers import *

import json

base_path = './backend/data_generators'

def read_json_file(filename):
    json_file_path = base_path + filename
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)
    return data

trip_images_api_responses = read_json_file('/scrapers/scraped_data/trip_images.json')
trip_image_urls = []
for r in trip_images_api_responses:
    trip_image_urls += get_images(r['images'],max_images=100,max_size_in_kb=600)
#print(len(trip_image_urls))


# Predefined array of complex sentences
complex_sentences = [
    "After a long hike through the dense forest, I reached a magnificent waterfall cascading down the rocks.",
    "Exploring the ancient ruins, I couldn't help but marvel at the intricate carvings and architecture of a bygone era.",
    "As the sun dipped below the horizon, the sky painted a vivid canvas of oranges and purples, creating a mesmerizing sunset.",
    "Wandering through the bustling markets, I immersed myself in the vibrant colors, unique scents, and lively atmosphere.",
    "The quaint little cafe on the corner served the most delectable pastries, each bite a burst of flavors and textures.",
    "Perched on a hilltop, the medieval castle offered panoramic views of the picturesque countryside below.",
    "In the heart of the city, a hidden gem of a garden provided a peaceful sanctuary amidst the urban chaos.",
    "Stepping into the grand cathedral, the soaring arches and ornate stained glass windows left me in awe of human craftsmanship.",
    "Navigating the narrow alleyways of the old town, I stumbled upon a charming bookshop filled with literary treasures.",
    "The scent of blooming flowers and the chirping of birds welcomed me as I strolled through the botanical gardens.",
    "Embarking on a boat tour, I sailed along the serene river, the water gently lapping against the sides of the boat.",
    "Beneath the surface of the clear blue sea, a vibrant world of corals and marine life unfolded before my eyes.",
    "High in the mountains, the air was crisp and invigorating, and the snow-capped peaks stretched out as far as the eye could see.",
    "At the heart of the bustling city, a lively square buzzed with street performers, vendors, and locals going about their day.",
    "The centuries-old oak tree stood as a silent witness to the passage of time, its branches reaching out in all directions.",
    "In the midst of a lively festival, the streets were alive with music, dancing, and the joyous laughter of people celebrating.",
    "Climbing to the hilltop viewpoint, I watched as the first rays of sunlight painted the landscape in golden hues.",
    "Exploring the ancient catacombs, I marveled at the intricate network of tunnels that lay hidden beneath the city.",
    "The scent of freshly baked bread wafted through the air as I stepped into the charming village bakery.",
    "Beneath the star-studded sky, I lay on the grass, the universe above a tapestry of wonder and mystery.",
    "Strolling along the cobblestone streets, I admired the well-preserved architecture of the historic district.",
    "The sound of waves crashing against the shore provided a soothing backdrop to my evening by the beach.",
    "In the heart of the rainforest, the air was thick with humidity, and every step was a symphony of life.",
    "At the top of the mountain, I felt a sense of accomplishment as I looked out over the sprawling landscape below.",
    "The local market was a kaleidoscope of colors, with stalls overflowing with fresh produce and handmade crafts.",
    "Inside the art gallery, each painting told a story, and I found myself lost in the brushstrokes and colors.",
    "The ancient fortress loomed over the city, a testament to the strategic importance it held in times past.",
    "Cruising along the coastline, the salty breeze in my hair, I marveled at the rugged beauty of the cliffs.",
    "In the heart of wine country, the vineyards stretched out in neat rows, a testament to generations of craftsmanship.",
    "The symphony of nature surrounded me as I hiked through the dense forest, the melody of birdsong in the air.",
    "At the edge of the canyon, I gazed down at the sheer drop, feeling both exhilarated and humbled by nature's grandeur.",
    "The aroma of exotic spices filled the air as I wandered through the bustling market, a feast for the senses.",
    "At the historic battlefield, I imagined the courage and sacrifice of those who had fought for their beliefs.",
    "As I stepped into the ancient temple, a sense of reverence washed over me, connecting me to centuries of worship.",
    "On the cobalt blue waters, dolphins danced in the waves, a playful reminder of the wonders of marine life.",
    "Beneath the ancient olive trees, I found a sense of serenity, a feeling of time standing still in the grove.",
    "The city skyline at night was a tapestry of lights, each one a testament to the vibrant energy of urban life.",
    "In the heart of the desert, the sand dunes stretched out in every direction, a sea of golden waves.",
    "The laughter of children echoed through the narrow streets, a reminder of the universal joy that transcends borders.",
    "Perched on the cliffs, the medieval castle seemed to defy gravity, a marvel of engineering and architecture.",
    "As I gazed at the waterfall, the sheer power and beauty of nature left me in silent awe.",
    "Wandering through the historic district, I could almost hear the echoes of footsteps from centuries past.",
    "In the heart of the city, the bustling markets were a treasure trove of unique finds and local craftsmanship.",
    "At the edge of the ancient forest, I felt a sense of wonder at the untouched wilderness stretching out before me.",
    "The vibrant colors of the market stalls created a kaleidoscope of hues, each one a testament to the local craftsmanship.",
    "As the sun set over the ocean, painting the sky in shades of pink and gold, I felt a sense of peace wash over me.",
    "Among the ancient ruins, I could almost hear the whispers of history, the stories of those who came before.",
    "In the heart of the city, the historic architecture was a testament to the rich tapestry of cultures that shaped it.",
    "As I explored the hidden alleyways, I stumbled upon a charming courtyard, a tranquil oasis amidst the urban hustle.",
    "Beneath the forest canopy, the air was cool and refreshing, and the sound of rustling leaves was a symphony of nature.",
    "The scent of blooming flowers filled the air, a sweet perfume that seemed to dance on the breeze.",
    "As I stood at the edge of the cliff, the vastness of the canyon stretched out before me, a testament to the power of nature.",
    "In the heart of the ancient city, the stone pathways echoed with the footsteps of countless generations that came before.",
    "At the heart of the bustling square, a fountain danced with cascading water, a symbol of life and vitality.",
    "As I explored the narrow passageways, I discovered hidden courtyards and secret gardens, each one a world of its own.",
    "Beneath the starry night sky, I felt a sense of wonder at the vastness of the universe, a reminder of our place in it.",
]


def get_random_description():
    # Randomly select sentences for the two paragraphs
    paragraph_one = random.sample(complex_sentences, 2)
    paragraph_two = random.sample(complex_sentences, 3)

    # Join the selected sentences into paragraphs
    paragraph_one_text = ' '.join(paragraph_one)
    paragraph_two_text = ' '.join(paragraph_two)

    # Print the travel post

    post = paragraph_two_text

    post = post.replace('\'','')

    return post


def generate_random_posts():

    posts = []

    for _ in range(post_count):
        post = {
            'user_id': random.randint(1,user_count),
            'description': get_random_description(),
            'image_url': random.choice(trip_image_urls)
        }
        posts.append(post)

    formatted_posts = json.dumps(posts, indent=2)

    file_path = base_path + '/data/posts.json' 
    with open(file_path, 'w') as file:
        file.write(formatted_posts)

    print(post_count,'posts successfully generated and written to ',file_path)

#generate_random_posts()