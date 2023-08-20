from data.users import users
sql = ""

for u in users:
    s = f"INSERT INTO Users ( username, email, password_hash, name, city_id, dob) VALUES ( '{u['username']}', '{u['email']}', MY_HASH_PASSWORD('{u['password']}'), '{u['name']}', {u['city_id']} , TO_DATE('{u['dob']}','YYYY-MM-DD'));"
    sql += s
    sql += '\n'

print(sql)