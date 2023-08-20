from data.activities import activities
from data.destinations import destinations
from data.cities import cities
from data.hotels import hotels
from data.restaurants import restaurants
from data.provides import provides
from data.names import first_names
from data.names import last_names

for d in destinations:
    print(str(d['destination_id']) + " - " + d['name'])

for a in activities: 
    print(str(a['activity_id']) + " - " + a['name'])