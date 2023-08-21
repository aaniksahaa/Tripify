from data.reviews import reviews

sql = ""

for r in reviews:

    sql += f"""

DECLARE
    l_id NUMBER;
BEGIN
    INSERT INTO Reviews (user_id, description, rating, image_url)
    VALUES ({r['user_id']}, '{r['description']}', {r['rating']}, '{r['image_url']}')
    RETURNING review_id INTO l_id;
    INSERT INTO {r['object_type']}Reviews(review_id, {r['object_type']}_id) VALUES(l_id, {r['object_id']});
END;
/

    """

print(sql)