import random
import json
from config import review_count, trip_count, hotel_count, restaurant_count, user_count

base_path = './backend/data_generators'

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
        f"Through {activity} local culture, I marveled at {opinion} scenes. The {tour_guide}s passion and knowledge added depth to my journey, as did the delectable offerings at {restaurant}.",
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
        "Stunning views from the room made our stay memorable.",
        "Luxurious amenities provided a pampering experience.",
        "Central location made it easy to explore the city.",
        "Spa services helped us relax and rejuvenate.",
        "In-room dining service was prompt and delicious.",
        "Efficient room service maintained the tidiness of our room.",
        "Beautifully designed interiors created a pleasant ambiance.",
        "Friendly concierge was always ready to offer helpful recommendations.",
        "Quiet and peaceful environment ensured a restful sleep.",
        "Variety of on-site restaurants catered to all our culinary preferences.",
        "Complimentary shuttle service made transportation hassle-free.",
        "Thoughtful turndown service added a personalized touch.",
        "Kids play area and activities kept our children entertained.",
        "Eco-friendly initiatives made us feel good about our choice of stay.",
        "Conference and meeting facilities were well-equipped for business travelers.",
        "Artfully landscaped gardens provided a refreshing outdoor space.",
        "Efficient check-in and check-out process saved us valuable time.",
        "Attention to allergen-free requests showed a high level of care.",
        "Cultural and local decor elements gave the hotel a unique charm.",
        "Availability of pet-friendly services made traveling with our furry friend convenient.",
        "Regular housekeeping maintained a clean and organized environment.",
        "Prompt and helpful responses from the front desk improved our overall experience.",
    ]
    
    hotel_review = " ".join(random.sample(components, random.randint(3, 5)))
    
    return hotel_review

def generate_restaurant_review():

    components = [
        "Exquisite flavors danced on our tongues.",
        "Aromatic spices elevated every dish.",
        "Friendly staff went above and beyond to serve us.",
        "Rich textures and layers delighted our senses.",
        "Inventive plating made each dish a work of art.",
        "The menu catered to a wide range of preferences.",
        "Fresh ingredients shined in every bite.",
        "A harmonious blend of flavors left us in awe.",
        "The culinary journey took us on a global adventure.",
        "An abundance of options made choosing a joy.",
        "Skillful cooking techniques were evident in every bite.",
        "Elegant decor created a sophisticated atmosphere.",
        "Mouthwatering aromas greeted us at the entrance.",
        "The meal was a symphony of tastes and textures.",
        "A balance of classic and innovative dishes impressed us.",
        "Thoughtful attention to dietary needs was appreciated.",
        "Indulgent desserts provided a perfect ending.",
        "Passionate chefs showcased their dedication on every plate.",
        "A fusion of cuisines offered a delightful surprise.",
        "Every dish told a unique and delicious story."
    ]
    
    restaurant_review = " ".join(random.sample(components, random.randint(3, 5)))
    restaurant_review = restaurant_review.replace('\'','')
    return restaurant_review

def generate_review():
    review = {}
    types = ['trip','hotel','restaurant']
    indicator = random.randint(0,4)
    type = types[indicator//2]
    description = ""
    rating = random.randint(1,4)
    image_url = "dummy.jpg"
    if(type == 'trip'):
        description = generate_trip_review()
        object_id = random.randint(1,trip_count)
        rating = random.randint(1,5)
    if(type == 'hotel'):
        description = generate_hotel_review()
        object_id = random.randint(1,hotel_count)
        if(object_id <= 10):
            rating = random.randint(4,5)
    if(type == 'restaurant'):
        description = generate_restaurant_review()
        object_id = random.randint(1,restaurant_count)
        if(object_id <= 10):
            rating = random.randint(4,5)

    user_id = random.randint(1,user_count)
    
    review["user_id"] = user_id
    review["description"] = description
    review["rating"] = rating
    review["image_url"] = image_url
    review["object_type"] = type
    review["object_id"] = object_id
    
    return review

def generate_random_reviews():

    reviews = []

    for i in range(review_count):
        review = generate_review()
        reviews.append(review)

    formatted = json.dumps(reviews, indent=2)

    file_path = base_path + '/data/reviews.json' 
    with open(file_path, 'w') as file:
        file.write(formatted)

    print(review_count,'reviews successfully generated and written to ',file_path)

#generate_random_reviews()