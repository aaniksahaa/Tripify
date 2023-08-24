from flight_gen import generate_random_flights
from user_gen import generate_random_users
from review_gen import generate_random_reviews
from trip_gen import generate_random_trips
from provides_gen import generate_provides
from scrapers.scraped_destination_activities_gen import generate_scraped_activities, generate_scraped_destinations
from scrapers.scraped_hotel_gen import generate_scraped_hotels
from scrapers.scraped_restaurant_gen import generate_scraped_restaurants

print('\n\n\nWelcome\n\nMaster Generator Starting...\n\n')

generate_random_flights()
generate_random_users()
generate_random_reviews()
generate_random_trips()
generate_provides()
generate_scraped_destinations(max_images=4,max_size_in_kb=250)
generate_scraped_activities(max_images=4,max_size_in_kb=250)
generate_scraped_hotels(max_hotels_from_each_city=10,image_width=1500,image_height=1000)
generate_scraped_restaurants(max_restaurants_from_each_city=10,image_width=1500,image_height=1000)

print('\n\nAll data successfully generated. Now run sqlgen.py\n\n\n')