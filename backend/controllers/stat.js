const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleHotel } = require('./hotel');
const { getSqlPaginationAndOrdering } = require('./global_helpers');
const { getSingleRestaurant } = require('./restaurant');
const { getSingleTrip } = require('./trip');

const getObject = async (payload) => {
    obejct_type = payload.object_type
    let object = null
    if(object_type == 'hotel')
    {
        object = await getSingleHotel({hotel_id: payload.object_id})
    }
    else if(object_type == 'restaurant')
    {
        object = await getSingleRestaurant({restaurant_id: payload.object_id})
    }
    if(object_type == 'trip')
    {
        object = await getSingleTrip({trip_id: payload.object_id})
    }

    return object

}

const getStat = async (payload) => {

    // Default attributes
    page = 1;
    per_page = 3;
    orderby = '\"total_bookings\"';
    ordertype = 'desc';
    object_type = 'hotel';

    attributes = ['\"total_revenue\"', '\"total_bookings\"', '\"rating_avg\"']
    
    sql_hotel = `
    SELECT H.HOTEL_ID AS "object_id", NVL(SUM( TB.IS_PAID * H.PRICE_PER_DAY * (R.CHECKOUT_DATE - R.CHECKIN_DATE)),0) AS "total_revenue", COUNT(DISTINCT CONCAT(TB.USER_ID, TB.TRIP_ID)) AS "total_bookings", GET_AVG_RATING('hotel',H.HOTEL_ID) "rating_avg"
    FROM TRIPBOOKINGS TB FULL OUTER JOIN TRIPS T
    ON (TB.TRIP_ID = T.TRIP_ID)
    FULL OUTER JOIN RESIDENCEIN R
    ON (T.TRIP_ID = R.TRIP_ID)
    FULL OUTER JOIN HOTELS H 
    ON (R.HOTEL_ID = H.HOTEL_ID)
    FULL OUTER JOIN FAVORITES F 
    ON (H.HOTEL_ID = F.OBJECT_ID AND F.OBJECT_TYPE = 'hotel')
    WHERE H.HOTEL_ID IS NOT NULL   
    GROUP BY H.HOTEL_ID
    `

    sql_restaurant = `
    SELECT R.RESTAURANT_ID AS "object_id", NVL(SUM(R.RESERVATION_PRICE*TB.IS_PAID),0) AS "total_revenue", COUNT(DISTINCT CONCAT(TB.USER_ID, TB.TRIP_ID)) AS "total_bookings", GET_AVG_RATING('restaurant',R.RESTAURANT_ID) "rating_avg"
    FROM TRIPBOOKINGS TB FULL OUTER JOIN TRIPS T
    ON (TB.TRIP_ID = T.TRIP_ID)
    FULL OUTER JOIN MEALSIN M
    ON (T.TRIP_ID = M.TRIP_ID)
    FULL OUTER JOIN RESTAURANTS R 
    ON (M.RESTAURANT_ID = R.RESTAURANT_ID)
    FULL OUTER JOIN FAVORITES F 
    ON (R.RESTAURANT_ID = F.OBJECT_ID AND F.OBJECT_TYPE = 'restaurant') 
    WHERE R.RESTAURANT_ID IS NOT NULL  
    GROUP BY R.RESTAURANT_ID
    `

    sql_trip = `
    SELECT T.TRIP_ID AS "object_id", NVL(SUM(T.TOTAL_PRICE * TB.IS_PAID),0) AS "total_revenue", COUNT(DISTINCT CONCAT(TB.USER_ID, TB.TRIP_ID)) AS "total_bookings", GET_AVG_RATING('trip',T.TRIP_ID) "rating_avg"
    FROM TRIPBOOKINGS TB FULL OUTER JOIN TRIPS T
    ON (TB.TRIP_ID = T.TRIP_ID)
    FULL OUTER JOIN FAVORITES F 
    ON (T.TRIP_ID = F.OBJECT_ID AND F.OBJECT_TYPE = 'trip')  
    WHERE T.TRIP_ID IS NOT NULL 
    GROUP BY T.TRIP_ID
    `

    sql = ""

    if (payload.object_type !== undefined && payload.object_type !== '') {
        object_type = payload.object_type.trim().toLowerCase()
    }

    if(object_type == 'hotel')
    {
        sql += sql_hotel
    }
    else if(object_type == 'restaurant')
    {
        sql += sql_restaurant
    }
    else if(object_type == 'trip')
    {
        sql += sql_trip
    }

    if(payload.orderby !== undefined && payload.orderby.trim().toLowerCase() == 'rating')
    {
        payload.orderby = 'rating_avg'
    }

    payload.orderby = '\"' + payload.orderby + '\"'

    sql += await getSqlPaginationAndOrdering(payload, attributes, page, per_page, orderby, ordertype)


    try{

        console.log(sql)

        const result = await db.execute(sql,{},db.options)

        let stat = result.rows

        console.log(stat)

        let result_objects = []

        for(let stat_object of stat){
            console.log(stat_object)
            let object = await getObject({object_type: payload.object_type, object_id: stat_object.object_id})
            console.log(object)
            object.total_revenue = stat_object.total_revenue
            object.total_bookings = stat_object.total_bookings
            object.rating_avg = stat_object.rating_avg
            result_objects.push(object)
            //stat_hotel.hotel = await getSingleHotel({hotel_id : stat_hotel.hotel_id})
        }

        return result_objects
    }
    catch(err){
        console.log(err)
        throw err
    }

}

const getPriceDistribution = async (payload) => {

    object_type = 'hotel';

    range_hotel = 1000;
    range_restaurant = 100;
    range_trip = 20000;

    sql_hotel = `
    SELECT ${range_hotel}*TRUNC(PRICE_PER_DAY/${range_hotel}) || ' - ' || ${range_hotel}*(1+TRUNC(PRICE_PER_DAY/${range_hotel})) AS "price_range", COUNT(*) AS "count"
    FROM HOTELS
    GROUP BY TRUNC(PRICE_PER_DAY/${range_hotel})
    ORDER BY TRUNC(PRICE_PER_DAY/${range_hotel})
    `

    sql_restaurant = `
    SELECT ${range_restaurant}*TRUNC(RESERVATION_PRICE/${range_restaurant}) || ' - ' || ${range_restaurant}*(1+TRUNC(RESERVATION_PRICE/${range_restaurant})) AS "price_range", COUNT(*) AS "count"
    FROM RESTAURANTS
    GROUP BY TRUNC(RESERVATION_PRICE/${range_restaurant})
    ORDER BY TRUNC(RESERVATION_PRICE/${range_restaurant})
    `

    sql_trip = `
    SELECT ${range_trip}*TRUNC(TOTAL_PRICE/${range_trip}) || ' - ' || ${range_trip}*(1+TRUNC(TOTAL_PRICE/${range_trip})) AS "price_range", COUNT(*) AS "count"
    FROM TRIPS
    GROUP BY TRUNC(TOTAL_PRICE/${range_trip})
    ORDER BY TRUNC(TOTAL_PRICE/${range_trip})
    `

    sql = ""

    if (payload.object_type !== undefined && payload.object_type !== '') {
        object_type = payload.object_type.trim().toLowerCase()
    }

    if(object_type == 'hotel')
    {
        sql += sql_hotel
    }
    else if(object_type == 'restaurant')
    {
        sql += sql_restaurant
    }
    else if(object_type == 'trip')
    {
        sql += sql_trip
    }

    try{
        const result = await db.execute(sql,{},db.options)

        let price_distribution = result.rows

        return price_distribution
    }
    catch(err){
        console.log(err)
        throw err
    }

}

module.exports = {getStat, getPriceDistribution}