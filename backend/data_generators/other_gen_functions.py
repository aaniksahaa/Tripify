import random
from config import user_count, trip_count, comment_count, post_count

# Predefined array of short comment sentences
comment_sentences = [
    "Great shot!",
    "I love this!",
    "Absolutely stunning.",
    "Wow, just wow.",
    "Fantastic composition!",
    "You have a great eye for detail.",
    "Beautiful colors!",
    "This is amazing.",
    "Impressive work!",
    "I'm speechless.",
    "Incredible!",
    "Such a cool capture.",
    "This is pure art.",
    "Well done!",
    "I'm in awe.",
    "You nailed it!",
    "This is breathtaking.",
    "You've outdone yourself.",
    "I can't stop looking at this.",
    "Perfect timing!",
    "Absolutely mesmerizing.",
    "This deserves more likes.",
    "You're so talented!",
    "I'm blown away.",
    "This is just magical.",
    "You've captured the moment perfectly.",
    "Absolutely fantastic!",
    "I'm loving this.",
    "Bravo!",
    "You're on fire!",
    "This made my day.",
    "This is epic.",
    "I'm impressed.",
    "You have a gift.",
    "This is pure gold.",
    "You've got skills!",
    "This is world-class.",
    "You've got the eye for this.",
    "I'm loving your feed.",
    "This is top-notch.",
    "I can't get enough of your photos.",
    "This is legendary.",
    "You're on a roll!",
    "This is pure perfection.",
    "I'm in love with this.",
    "You're a true artist.",
    "This is simply awesome.",
    "You've got an amazing talent.",
    "This is next level.",
    "You're killing it!",
    "This is a masterpiece.",
    "You've got the magic touch.",
    "This is exceptional.",
    "You're making magic here.",
    "This is outstanding.",
    "You've got the golden touch.",
    "This is picture perfect.",
    "You're a genius!",
    "This is legendary.",
    "You're an inspiration.",
    "This is one for the books.",
    "You're making waves!",
    "This is a work of art.",
    "You're a wizard.",
    "This is genius.",
    "You're a legend.",
    "This is world-changing.",
    "You're on a whole other level.",
    "This is history in the making.",
    "You're a game-changer.",
    "This is iconic.",
    "You're a force to be reckoned with.",
    "This is unforgettable.",
    "You're a true innovator.",
    "This is pure genius.",
    "You're a trailblazer.",
    "This is a game-changer.",
    "You're a pioneer.",
    "This is revolutionary.",
    "You're changing the game.",
    "This is a breakthrough.",
    "You're redefining the industry.",
    "This is a paradigm shift.",
    "You're setting the bar high.",
    "This is groundbreaking.",
    "You're making history.",
    "This is a milestone.",
    "You're shaping the future.",
    "This is a game-plan.",
    "You're leading the way.",
    "This is trailblazing.",
    "You're pushing boundaries.",
    "This is a turning point.",
    "You're a trendsetter.",
    "This is pioneering.",
    "You're a visionary.",
    "This is innovative.",
    "You're a leader.",
    "This is transformative.",
    "You're ahead of the curve.",
    "This is a revelation.",
    "You're making waves.",
    "This is a triumph.",
    "You're changing the world.",
    "This is monumental.",
    "You're a game-changer.",
    "This is a breakthrough.",
    "You're a pioneer.",
    "This is revolutionary.",
    "You're redefining the industry.",
    "This is a paradigm shift.",
    "You're setting the bar high."
]


def get_follow_sql():
    sql = "\n\n"

    for i in range(1,user_count+1):
        cnt = random.randint(user_count//4,user_count//2)
        people = random.sample(range(1,user_count+1),cnt)
        for j in people:
            if(i == j):
                continue
            sql += f"INSERT INTO Follows (follower_id, followee_id) VALUES ({i}, {j});\n"
    sql += "\n\n"
    return sql 

#print(get_follow_sql())

def get_tripbooking_sql():
    sql = "\n\n"
    for user_id in range(1, user_count + 1):
        num_trips = random.randint(trip_count//4, trip_count//2)
        selected_trips = random.sample(range(1, trip_count + 1), num_trips)
        for trip_id in selected_trips:
            has_paid = random.randint(1,3)
            if(has_paid == 1):
                sql += f"INSERT INTO TripBookings ( user_id, trip_id, is_paid, payment_method, transaction_id, payment_date) VALUES ( {user_id}, {trip_id}, 1, 'Credit Card', 'TXN123456', TO_DATE(SYSDATE));\n"
            else:
                sql += f"INSERT INTO TripBookings (user_id, trip_id) VALUES ({user_id}, {trip_id});\n"
        
        # for _ in range(num_trips):
        #     print('here')
        #     trip_id = random.randint(1, trip_count)
        #     sql += f"INSERT INTO TripBookings (user_id, trip_id) VALUES ({user_id}, {trip_id});\n"
    
    sql += "\n\n"
    return sql

#print(get_tripbooking_sql())

def get_comment_sql():
    sql = "\n\n"
    for _ in range(comment_count):
        user_id = random.randint(1,user_count)
        post_id = random.randint(1,post_count)
        selected_sentences = random.sample(comment_sentences, random.randint(1, 3))
        comment = ' '.join(selected_sentences).replace('\'','')
        sql += f"INSERT INTO Comments ( user_id, post_id, text) VALUES ({user_id}, {post_id},'{comment}');\n"
    sql += "\n\n"
    return sql

#print(get_comment_sql())

def get_react_sql():
    sql = "\n\n"
    for i in range(1,user_count+1):
        cnt = random.randint(0,post_count-1)
        posts = random.sample(range(1,post_count),cnt)
        for p in posts:
            sql += f"INSERT INTO REACTS(USER_ID,POST_ID) VALUES({i},{p});\n"
    sql += "\n\n"
    return sql 

#print(get_react_sql())