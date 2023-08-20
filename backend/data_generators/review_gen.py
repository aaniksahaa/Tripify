import random
import json
from config import review_count, trip_count, hotel_count, restaurant_count, user_count

def generate_trip_review():
    activities = [
        "exploring", "discovering", "immersing", "indulging", "adventuring",
        "enjoying", "relaxing", "savoring", "experiencing", "unwinding"
    ]
    opinions = [
        "charming", "exquisite", "captivating", "enchanting", "breathtaking",
        "spectacular", "delightful", "amazing", "inspiring", "unforgettable"
    ]
    hotels = [
        "luxurious hotels", "quaint inns", "boutique lodges", "seaside resorts",
        "mountain retreats", "urban getaways", "cosy bed and breakfasts",
        "chic accommodations", "historic manors", "modern hostels"
    ]
    restaurants = [
        "gourmet restaurants", "local eateries", "street food stalls",
        "seaside cafes", "rustic bistros", "ethnic cuisine spots",
        "fusion food trucks", "farm-to-table diners", "urban food markets",
        "hidden gems"
    ]
    tour_guides = [
        "knowledgeable guides", "enthusiastic storytellers", "expert locals",
        "cultural connoisseurs", "history buffs", "adventure enthusiasts",
        "passionate explorers", "insightful companions", "charming hosts",
        "friendly insiders"
    ]
    
    activity = random.choice(activities)
    opinion = random.choice(opinions)
    hotel = random.choice(hotels)
    restaurant = random.choice(restaurants)
    tour_guide = random.choice(tour_guides)
    
    templates = [
        f"During my {opinion} trip, I had the pleasure of {activity} diverse landscapes. The {restaurant} we dined at was exceptional, and the {tour_guide} made every moment unforgettable.",
        f"From {activity} breathtaking sights to savoring exquisite cuisines at {restaurant}, my {opinion} trip was enriched by a {tour_guide} who shared fascinating insights.",
        f"Unwinding in {hotel} and {activity} the surroundings, I cherished the culinary delights at {restaurant}. Our {tour_guide} brought unique perspectives to every experience.",
        f"Through {activity} local culture, I marveled at {opinion} scenes. The {tour_guide}'s passion and knowledge added depth to my journey, as did the delectable offerings at {restaurant}.",
        f"Each day was filled with {activity} captivating landscapes. I felt secure at {hotel} and enjoyed memorable meals at {restaurant}, while our {tour_guide} infused the trip with cultural richness.",
    ]
    
    trip_review = random.choice(templates)
    
    return trip_review

def generate_hotel_review():

    components = [
        "Efficient management ensured a smooth stay.",
        "Top-notch security enhanced our peace of mind.",
        "Attentive staff created a welcoming experience.",
        "Modern gym facilities ensured a satisfying workout.",
        "Convenient parking arrangements added to our comfort.",
        "Fast WiFi contributed to a connected stay.",
        "Timely wake-up calls assisted our daily schedule.",
        "Exceptional breakfast options set a positive tone.",
    ]
    
    hotel_review = " ".join(random.sample(components, random.randint(3, 5)))
    
    return hotel_review

def generate_restaurant_review():

    components = [
        "Delicious dishes delighted our taste buds.",
        "Attentive service created a memorable dining experience.",
        "Charming ambiance added to the overall enjoyment.",
        "Varied menu options satisfied different palates.",
        "Convenient location enhanced our dining convenience.",
        "Fast service contributed to a seamless meal.",
        "Presentation of dishes was visually appealing.",
        "Unique flavors and culinary creativity impressed us.",
    ]
    
    restaurant_review = " ".join(random.sample(components, random.randint(3, 5)))
    
    return restaurant_review

def generate_review():
    review = {}
    types = ['trip','hotel','restaurant']
    type = random.choice(types)
    description = ""
    rating = random.randint(3,5)
    image_url = "dummy.jpg"
    if(type == 'trip'):
        description = generate_trip_review()
        object_id = random.randint(1,trip_count)
    if(type == 'hotel'):
        description = generate_hotel_review()
        object_id = random.randint(1,hotel_count)
    if(type == 'restaurant'):
        description = generate_restaurant_review()
        object_id = random.randint(1,restaurant_count)

    user_id = random.randint(1,user_count)
    
    review["user_id"] = user_id
    review["description"] = description
    review["rating"] = rating
    review["image_url"] = image_url
    review["object_type"] = type
    review["object_id"] = object_id
    
    return review

reviews = []

for i in range(review_count):
    review = generate_review()
    reviews.append(review)

formatted = json.dumps(reviews, indent=2)

file_path = './data_generators/data/reviews.py' 
with open(file_path, 'w') as file:
    file.write('reviews = ')
    file.write(formatted)

print(review_count)
