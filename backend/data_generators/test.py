
import json 
from data.activities import activities

print(activities)

base_path = './backend/data_generators'
raw_activities_filename = 'prereq/raw_activities.json'

def nice_print(json_object):
    print(json.dumps(json_object, indent=4))

formatted = json.dumps(activities, indent=2)
print(formatted)
file_path = base_path + '/scrapers/' + raw_activities_filename
with open(file_path, 'w') as file:
    file.write(formatted)

print('written to', file_path)