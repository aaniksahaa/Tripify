const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleHotel } = require('./hotel');

const getStatHotels = async (payload) => {
    
    sql = `
    SELECT H.HOTEL_ID AS "hotel_id", SUM( H.PRICE_PER_DAY * (R.CHECKOUT_DATE - R.CHECKIN_DATE)) AS "total_revenue",
    COUNT(DISTINCT F.USER_ID) AS "favorite_count"
    FROM TRIPBOOKINGS TB LEFT OUTER JOIN TRIPS T
    ON (TB.TRIP_ID = T.TRIP_ID)
    LEFT OUTER JOIN RESIDENCEIN R
    ON (T.TRIP_ID = R.TRIP_ID)
    LEFT OUTER JOIN HOTELS H 
    ON (R.HOTEL_ID = H.HOTEL_ID)
    LEFT OUTER JOIN FAVORITES F 
    ON (H.HOTEL_ID = F.OBJECT_ID AND F.OBJECT_TYPE = 'hotel')   
    GROUP BY H.HOTEL_ID
    ORDER BY SUM( H.PRICE_PER_DAY * (R.CHECKOUT_DATE - R.CHECKIN_DATE)) DESC
    `
    try{
        const result = await db.execute(sql,{},db.options)

        stat_hotels = result.rows

        for(let stat_hotel of stat_hotels){
            stat_hotel.hotel = await getSingleHotel({hotel_id : stat_hotel.hotel_id})
        }

        return stat_hotels
    }
    catch(err){
        console.log(err)
        throw err
    }

}

module.exports = {getStatHotels}