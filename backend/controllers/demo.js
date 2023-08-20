const oracledb = require('oracledb')

const db = require('../db/db')

const getDemo = async (payload) => {
    
    const trip_id = payload.trip_id;

    console.log(trip_id)
    
    const sql = `SELECT trip_id AS "trip_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id", name AS "name", description AS "description", image_url AS "image_url", total_price AS "total_price", start_date AS "start_date", end_date AS "end_date" FROM TRIPS WHERE trip_id = :trip_id`;
    const sql2 = `SELECT DESTINATION_ID AS "destination_id", ACTIVITY_ID AS "activity_id", TENTATIVE_DATE AS "tentative_date" FROM CONTAINS WHERE TRIP_ID = :trip_id `;
    const sql3 = `SELECT HOTEL_ID AS "hotel_id", CHECKIN_DATE AS "checkin_date", CHECKOUT_DATE AS "checkout_date" FROM RESIDENCEIN WHERE TRIP_ID = :trip_id`;
    const sql4 = `SELECT RESTAURANT_ID AS "restaurant_id" FROM MEALSIN WHERE TRIP_ID = :trip_id` ;

    const binds = {
      trip_id : trip_id
    }

    try{
      const result = (await db.execute(sql, binds, db.options)).rows[0];
      const contains_result = await db.execute(sql2, binds, db.options);
      const hotels_result = await db.execute(sql3, binds, db.options);
      const restaurant_result = await db.execute(sql4, binds, db.options);

      result.contains = contains_result.rows;
      result.hotels = hotels_result.rows;
      result.restaurants = restaurant_result.rows;
      //console.log(result.rows)
      return result;
    }
    catch(err){
      console.log(err)
    }
}

module.exports = {getDemo}
