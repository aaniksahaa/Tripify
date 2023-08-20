import random 
import json 

from data.destinations import destinations
from data.activities import activities

activities_by_destination = [
    {'destination_id': 1, 'activity_ids': [1, 4, 6]},  # Ahsan Manzil
    {'destination_id': 2, 'activity_ids': [8, 9, 20]},  # Cox's Bazar
    {'destination_id': 3, 'activity_ids': [3, 6, 7]},  # Sundarbans Mangrove Forest
    {'destination_id': 4, 'activity_ids': [10, 12, 45]},  # Srimangal
    {'destination_id': 5, 'activity_ids': [8, 9, 20]},  # Saint Martin's Island
    {'destination_id': 6, 'activity_ids': [2, 5, 36]},  # Sajek Valley
    {'destination_id': 7, 'activity_ids': [4, 5, 44]},  # Lalbagh Fort
    {'destination_id': 8, 'activity_ids': [8, 21, 45]},  # Kuakata
    {'destination_id': 9, 'activity_ids': [2, 5, 15]},  # Ratargul Swamp Forest
    {'destination_id': 10, 'activity_ids': [3, 7, 15]},  # Jaflong
    {'destination_id': 11, 'activity_ids': [2, 6, 36]},  # Rangamati Hill Tracts
    {'destination_id': 12, 'activity_ids': [25, 29, 45]},  # Jamuna Future Park
    {'destination_id': 13, 'activity_ids': [4, 15, 18]},  # Lalbagh Kella Mosque
    {'destination_id': 14, 'activity_ids': [7, 14, 31]},  # Sagor Dighi
    {'destination_id': 15, 'activity_ids': [8, 9, 25]},  # Ruposhi Bangla Hotel
    {'destination_id': 16, 'activity_ids': [29, 30, 31]},  # Rangpur Museum
    {'destination_id': 17, 'activity_ids': [28, 30, 34]},  # Bangabandhu Sheikh Mujibur Rahman Novo Theatre
    {'destination_id': 18, 'activity_ids': [2, 9, 12]},  # Shah Amanat Bridge
    {'destination_id': 19, 'activity_ids': [8, 9, 20]},  # Cox's Bazar Marine Aquarium
    {'destination_id': 20, 'activity_ids': [3, 6, 34]},  # Sundarbans Tiger Reserve
    {'destination_id': 21, 'activity_ids': [8, 9, 20]},  # Inani Beach
    {'destination_id': 22, 'activity_ids': [1, 2, 3]},  # Kaptai Lake
    {'destination_id': 23, 'activity_ids': [24, 25, 28]},  # Shalban Vihara
    {'destination_id': 24, 'activity_ids': [2, 5, 33]},  # Ratargul Swamp Forest
    {'destination_id': 25, 'activity_ids': [8, 9, 20]},  # Kuakata Sea Beach
    {'destination_id': 26, 'activity_ids': [3, 6, 7]},  # Sundarbans National Park
    {'destination_id': 27, 'activity_ids': [8, 9, 20]},  # Saint Martin's Island
    {'destination_id': 28, 'activity_ids': [26, 28, 34]},  # Lawachara National Park
    {'destination_id': 29, 'activity_ids': [11, 29, 32]},  # Rangamati Hanging Bridge
    {'destination_id': 30, 'activity_ids': [11, 29, 32]},  # Kantaji Temple
    {'destination_id': 31, 'activity_ids': [30, 31, 34]},  # Mahasthangarh
    {'destination_id': 32, 'activity_ids': [13, 15, 16]},  # Nilgiri Hills
    {'destination_id': 33, 'activity_ids': [10, 29, 30]},  # Bichanakandi
    {'destination_id': 34, 'activity_ids': [3, 6, 26]},  # Sundarbans Wildlife Sanctuary
    {'destination_id': 35, 'activity_ids': [17, 19, 36]},  # Jatiya Sangsad Bhaban
    {'destination_id': 36, 'activity_ids': [17, 19, 36]},  # Biswakosh Bhaban
    {'destination_id': 37, 'activity_ids': [3, 6, 7]},  # Sonargaon
    {'destination_id': 38, 'activity_ids': [11, 29, 32]},  # Birishiri
    {'destination_id': 39, 'activity_ids': [13, 15, 16]},  # Bangladesh National Museum
    {'destination_id': 40, 'activity_ids': [8, 9, 20]},  # Chittagong Ethnological Museum
    {'destination_id': 41, 'activity_ids': [30, 31, 34]},  # Kantajew Temple
    {'destination_id': 42, 'activity_ids': [13, 15, 16]},  # Srimangal Tea Gardens
    {'destination_id': 43, 'activity_ids': [3, 6, 7]},  # Nijhum Dwip
    {'destination_id': 44, 'activity_ids': [13, 15, 16]},  # Mainamati Ruins
    {'destination_id': 45, 'activity_ids': [11, 29, 32]},  # Chera Dwip
    {'destination_id': 46, 'activity_ids': [3, 6, 7]},  # Sompur Mahabihar
    {'destination_id': 47, 'activity_ids': [17, 19, 36]},  # Lalmai Hills
    {'destination_id': 48, 'activity_ids': [8, 9, 20]},  # Kaptai National Park
    {'destination_id': 49, 'activity_ids': [3, 6, 7]},  # Baklai Waterfall
    {'destination_id': 50, 'activity_ids': [26, 28, 34]},  # Ramsagar National Park
    {'destination_id': 51, 'activity_ids': [21, 22, 24]},  # Ishwardi Upazila
    {'destination_id': 52, 'activity_ids': [26, 28, 34]},  # Charanpur Reserve Forest
    {'destination_id': 53, 'activity_ids': [10, 11, 49]},  # Shilaidaha Kuthibari
    {'destination_id': 54, 'activity_ids': [18, 19, 25]},  # Bangabandhu Bridge
    {'destination_id': 55, 'activity_ids': [13, 15, 16]},  # Bir Muktijoddha Sirajul Islam Public Library
    {'destination_id': 56, 'activity_ids': [11, 29, 32]},  # Shambhuganj Upazila
    {'destination_id': 57, 'activity_ids': [28, 30, 34]},  # Bhawal National Park
    {'destination_id': 58, 'activity_ids': [10, 11, 49]},  # Chandni Ghat
    {'destination_id': 59, 'activity_ids': [37, 38, 43]},  # Fantasy Kingdom
    {'destination_id': 60, 'activity_ids': [38, 39, 48]},  # Bheramara Upazila
    {'destination_id': 61, 'activity_ids': [30, 31, 34]},  # Shaheed Minar, Jessore
    {'destination_id': 62, 'activity_ids': [13, 15, 16]},  # Jadu Nibash Palace
    {'destination_id': 63, 'activity_ids': [13, 15, 16]},  # Jamuna Future Park, Tangail
    {'destination_id': 64, 'activity_ids': [26, 28, 34]},  # Birulia Bridge
    {'destination_id': 65, 'activity_ids': [41, 42, 43]},  # Zia Park
    {'destination_id': 66, 'activity_ids': [26, 28, 34]},  # Bhairab Upazila
    {'destination_id': 67, 'activity_ids': [38, 39, 48]},  # Narsingdi Town Hall
    {'destination_id': 68, 'activity_ids': [49, 50]},  # Meghna River
    {'destination_id': 69, 'activity_ids': [49, 50]},  # Fulkuri River View
    {'destination_id': 70, 'activity_ids': [26, 28, 34]},  # Charbhadrasan Bridge
    {'destination_id': 71, 'activity_ids': [30, 31, 34]},  # Charvadrason Zamindar Bari
    {'destination_id': 72, 'activity_ids': [10, 11, 49]},  # Dhalchar
    {'destination_id': 73, 'activity_ids': [13, 15, 16]},  # Monpura Island
    {'destination_id': 74, 'activity_ids': [17, 19, 36]},  # Char Kukri-Mukri
    {'destination_id': 75, 'activity_ids': [17, 19, 36]},  # Atiya Jami Mosque
    {'destination_id': 76, 'activity_ids': [13, 15, 16]},  # Elenga Resort
    {'destination_id': 77, 'activity_ids': [28, 30, 34]},  # Manikganj Museum
    {'destination_id': 78, 'activity_ids': [10, 11, 49]},  # Hajiganj Fort
    {'destination_id': 79, 'activity_ids': [3, 6, 7]},  # Lohagara Upazila
    {'destination_id': 80, 'activity_ids': [17, 19, 36]},  # Chandpur Shilpakala Academy
]

provides = []

cnt = 0

for x in activities_by_destination:
    d = x['destination_id']
    for a in x['activity_ids']:
        if(a > len(activities)):
            continue
        entry = {}
        entry['destination_id'] = d 
        entry['activity_id'] = a 
        entry['price'] = 50*random.randint(1,10)
        entry['is_available'] = 1
        provides.append(entry)
        cnt = cnt + 1

formatted = json.dumps(provides, indent=2)


file_path = './data_generators/data/provides.py' 
with open(file_path, 'w') as file:
    file.write('provides = ')
    file.write(formatted)

print(cnt)