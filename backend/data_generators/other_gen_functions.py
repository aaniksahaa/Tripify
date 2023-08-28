import random
from config import user_count

def get_follow_sql():
    sql = "\n\n"

    for i in range(1,user_count+1):
        cnt = random.randint(user_count/2,user_count)
        people = random.sample(range(1,user_count+1),cnt)
        for j in people:
            sql += f"INSERT INTO Follows (follower_id, followee_id) VALUES ({i}, {j});\n"
    sql += "\n\n"
    return sql 

#print(get_follow_sql())