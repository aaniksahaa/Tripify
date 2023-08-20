const oracledb = require('oracledb')

const db = require('../db/db');
const { getSingleHotel } = require('./hotel');
const { getSingleRestaurant } = require('./restaurant');
const { getSingleUser } = require('./user');
const { getUserIdofGuide } = require('./guide');
const { getSingleCity } = require('./city');

// Helper Functions

const formatDate = (input) => {
    s = "TO_DATE(" + input + " ,'YYYY-MM-DD')";
    return s;
} 

const generateAddTrip_sql_binds = (trip) => {

    console.log(trip)

    const hotelBinds = [];
    const hotelValues = [];

    let cnt = 0;

    for (const hotel of trip.hotels) {

        const { hotel_id, checkin_date, checkout_date } = hotel;

        hotelBinds.push(`:hotel_id_${cnt}`);
        hotelValues.push(hotel_id);
        hotelBinds.push(formatDate(`:checkin_date_${cnt}`));
        hotelValues.push(checkin_date);
        hotelBinds.push(formatDate(`:checkout_date_${cnt}`));
        hotelValues.push(checkout_date);

        cnt++;

    }

    let hotelsQuery = `HotelDatesList( `;

    for(let i=0; i<cnt; i++)
    {
        hotelsQuery += `HotelDates( ${hotelBinds.slice(3*i,3*i+3).join(' , ')} ) `
        if(i < cnt-1)
        {
            hotelsQuery += ', '
        }
    }

    hotelsQuery += ' )'

    // Generate the RestaurantList bind variable
    const restaurantBinds = [];
    const restaurantValues = [];

    cnt = 0;

    for (const restaurant of trip.restaurants) {

        restaurantBinds.push(`:restaurant_id_${cnt}`);
        restaurantValues.push(restaurant.restaurant_id);

        cnt++;
    }

    const restaurantsQuery = `RestaurantList( ${restaurantBinds.join(' , ')} )`;

    // Generate the GuideList bind variable
    const guideBinds = [];
    const guideValues = [];

    cnt = 0;

    for (const guide of trip.guides) {

        guideBinds.push(`:guide_id_${cnt}`);
        guideValues.push(guide.guide_id);

        cnt++;
    }

    const guidesQuery = `GuideList( ${guideBinds.join(' , ')} )`;


    // Generate the DestinationActivitiesList bind variable

    const containBinds = [];
    const containValues = [];

    cnt = 0;

    for (const contain of trip.contains) {

        const { destination_id, activity_id, tentative_date } = contain;

        containBinds.push(`:destination_id_${cnt}`);
        containValues.push(destination_id);
        containBinds.push(`:activity_id_${cnt}`);
        containValues.push(activity_id);
        containBinds.push(formatDate(`:tentative_date_${cnt}`));
        containValues.push(tentative_date);

        cnt++;
    }

    let containsQuery = `DestinationActivitiesList( `;

    for(let i=0; i<cnt; i++)
    {
        containsQuery += `DestinationActivity( ${containBinds.slice(3*i,3*i+3).join(' , ')}  ) `;
        if(i < cnt-1)
        {
            containsQuery += ', ';
        }
    }

    containsQuery += ' )'

    // Final SQL query with bind variables
    const sql = `
    DECLARE
    l_hotels HotelDatesList := ${hotelsQuery};
    l_restaurants RestaurantList := ${restaurantsQuery};
    l_contains DestinationActivitiesList := ${containsQuery};
    l_guides GuideList := ${guidesQuery};
    p_trip_id NUMBER;
    BEGIN
    AddTrip(:from_city_id, :to_city_id, :name, :description, :image_url, TO_DATE(:start_date, 'YYYY-MM-DD'), TO_DATE(:end_date, 'YYYY-MM-DD'), :creator_user_id, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id );
    :trip_id := p_trip_id;
    END;
    `;

    //console.log(sql);

    const binds = {
        from_city_id: trip.from_city_id,
        to_city_id: trip.to_city_id,
        name: trip.name,
        description: trip.description,
        image_url: trip.image_url,
        start_date: trip.start_date,
        end_date: trip.end_date,
        ...hotelValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no);
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`hotel_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`checkin_date_${entry_no}`] = value;
            }
            else{
                obj[`checkout_date_${entry_no}`] = value;
            }
            return obj;
        }, {}),
        ...restaurantValues.reduce((obj, value, index) => {
            obj[`restaurant_id_${index}`] = value;
            return obj;
        }, {}),
        ...guideValues.reduce((obj, value, index) => {
            obj[`guide_id_${index}`] = value;
            return obj;
        }, {}),
        ...containValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no); 
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`destination_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`activity_id_${entry_no}`] = value;
            }
            else{
                obj[`tentative_date_${entry_no}`] = value;
            }
            return obj;
        }, {}),
        creator_user_id: trip.creator_user_id,
        trip_id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }
    };

    return { sql, binds };
}

const generateUpdateTrip_sql_binds = (trip) => {

    console.log(trip)

    const hotelBinds = [];
    const hotelValues = [];

    let cnt = 0;

    for (const hotel of trip.hotels) {

        const { hotel_id, checkin_date, checkout_date } = hotel;

        hotelBinds.push(`:hotel_id_${cnt}`);
        hotelValues.push(hotel_id);
        hotelBinds.push(formatDate(`:checkin_date_${cnt}`));
        hotelValues.push(checkin_date);
        hotelBinds.push(formatDate(`:checkout_date_${cnt}`));
        hotelValues.push(checkout_date);

        cnt++;

    }

    let hotelsQuery = `HotelDatesList( `;

    for(let i=0; i<cnt; i++)
    {
        hotelsQuery += `HotelDates( ${hotelBinds.slice(3*i,3*i+3).join(' , ')} ) `
        if(i < cnt-1)
        {
            hotelsQuery += ', '
        }
    }

    hotelsQuery += ' )'

    // Generate the RestaurantList bind variable
    const restaurantBinds = [];
    const restaurantValues = [];

    cnt = 0;

    for (const restaurant of trip.restaurants) {

        restaurantBinds.push(`:restaurant_id_${cnt}`);
        restaurantValues.push(restaurant.restaurant_id);

        cnt++;
    }

    const restaurantsQuery = `RestaurantList( ${restaurantBinds.join(' , ')} )`;

    // Generate the GuideList bind variable
    const guideBinds = [];
    const guideValues = [];

    cnt = 0;

    for (const guide of trip.guides) {

        guideBinds.push(`:guide_id_${cnt}`);
        guideValues.push(guide.guide_id);

        cnt++;
    }

    const guidesQuery = `GuideList( ${guideBinds.join(' , ')} )`;


    // Generate the DestinationActivitiesList bind variable

    const containBinds = [];
    const containValues = [];

    cnt = 0;

    for (const contain of trip.contains) {

        const { destination_id, activity_id, tentative_date } = contain;

        containBinds.push(`:destination_id_${cnt}`);
        containValues.push(destination_id);
        containBinds.push(`:activity_id_${cnt}`);
        containValues.push(activity_id);
        containBinds.push(formatDate(`:tentative_date_${cnt}`));
        containValues.push(tentative_date);

        cnt++;
    }

    let containsQuery = `DestinationActivitiesList( `;

    for(let i=0; i<cnt; i++)
    {
        containsQuery += `DestinationActivity( ${containBinds.slice(3*i,3*i+3).join(' , ')}  ) `;
        if(i < cnt-1)
        {
            containsQuery += ', ';
        }
    }

    containsQuery += ' )'

    // Final SQL query with bind variables
    const sql = `
    DECLARE
    l_hotels HotelDatesList := ${hotelsQuery};
    l_restaurants RestaurantList := ${restaurantsQuery};
    l_contains DestinationActivitiesList := ${containsQuery};
    l_guides GuideList := ${guidesQuery};
    BEGIN
    UpdateTrip(:trip_id, :from_city_id, :to_city_id, :name, :description, :image_url, TO_DATE(:start_date, 'YYYY-MM-DD'), TO_DATE(:end_date, 'YYYY-MM-DD'), l_contains, l_hotels, l_restaurants, l_guides );
    END;
    `;

    //console.log(sql);

    const binds = {
        trip_id: trip.trip_id,
        from_city_id: trip.from_city_id,
        to_city_id: trip.to_city_id,
        name: trip.name,
        description: trip.description,
        image_url: trip.image_url,
        start_date: trip.start_date,
        end_date: trip.end_date,
        ...hotelValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no);
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`hotel_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`checkin_date_${entry_no}`] = value;
            }
            else{
                obj[`checkout_date_${entry_no}`] = value;
            }
            return obj;
        }, {}),
        ...restaurantValues.reduce((obj, value, index) => {
            obj[`restaurant_id_${index}`] = value;
            return obj;
        }, {}),
        ...guideValues.reduce((obj, value, index) => {
            obj[`guide_id_${index}`] = value;
            return obj;
        }, {}),
        ...containValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no); 
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`destination_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`activity_id_${entry_no}`] = value;
            }
            else{
                obj[`tentative_date_${entry_no}`] = value;
            }
            return obj;
        }, {})
    };

    return { sql, binds };
}

// get a Single Trip from trip_id

const getSingleTrip = async (payload) => {
    const trip_id = payload.trip_id;
    console.log(trip_id)
    const sql = `
    SELECT trip_id AS "trip_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id", (SELECT name FROM CITIES WHERE city_id = from_city_id ) AS "from_city_name", (SELECT name FROM CITIES WHERE city_id = to_city_id ) AS "to_city_name", name AS "name", description AS "description", image_url AS "image_url", total_price AS "total_price", start_date AS "start_date", end_date AS "end_date" 
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on", deleted_on AS "deleted_on"
    FROM TRIPS 
    WHERE trip_id = :trip_id AND deleted_on IS NULL
    `;
    const binds = {
      trip_id : trip_id
    }
    try{
       const result = (await db.execute(sql, binds, db.options)).rows;
       if(result.length > 0){
            return result[0];
       }
       else{
            return null;
       }
    }
    catch(err){
       console.log(err)
    }
}

const getSingleTripDetails = async (payload) => {
    
    const trip_id = payload.trip_id;

    console.log(trip_id)
    
    const sql = `
    SELECT trip_id AS "trip_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id", (SELECT name FROM CITIES WHERE city_id = from_city_id ) AS "from_city_name", (SELECT name FROM CITIES WHERE city_id = to_city_id ) AS "to_city_name", name AS "name", description AS "description", image_url AS "image_url", total_price AS "total_price", start_date AS "start_date", end_date AS "end_date" 
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on", deleted_on AS "deleted_on"
    FROM TRIPS 
    WHERE trip_id = :trip_id AND deleted_on IS NULL
    `;

    const sql2 = `SELECT DISTINCT C.DESTINATION_ID AS "destination_id", D.NAME AS "destination_name", C.ACTIVITY_ID AS "activity_id", A.NAME AS "activity_name", P.PRICE AS "price", C.TENTATIVE_DATE AS "tentative_date" 
    FROM CONTAINS C JOIN DESTINATIONS D
    ON ( C.DESTINATION_ID = D.DESTINATION_ID )
    JOIN ACTIVITIES A
    ON ( C.ACTIVITY_ID = A.ACTIVITY_ID )
    JOIN PROVIDES P 
    ON ( C.DESTINATION_ID = P.DESTINATION_ID  AND C.ACTIVITY_ID = P.ACTIVITY_ID )
    WHERE TRIP_ID = :trip_id 
    `;

    const sql3 = `SELECT HOTEL_ID AS "hotel_id", CHECKIN_DATE AS "checkin_date", CHECKOUT_DATE AS "checkout_date" 
    FROM RESIDENCEIN 
    WHERE TRIP_ID = :trip_id
    `;

    const sql4 = `SELECT RESTAURANT_ID AS "restaurant_id" 
    FROM MEALSIN 
    WHERE TRIP_ID = :trip_id
    `;

    const sql5 = `SELECT GUIDE_ID AS "guide_id"
    FROM TRIPGUIDES
    WHERE TRIP_ID = :trip_id
    `;

    const binds = {
      trip_id : trip_id
    }

    try{
      const result1 = (await db.execute(sql, binds, db.options)).rows;
      if(result1.length == 0){
          return null;
      }
      const result = result1[0]
      const contains_result = (await db.execute(sql2, binds, db.options)).rows;
      hotels_result = (await db.execute(sql3, binds, db.options)).rows;
      for(let trip_hotel of hotels_result)
      {
            trip_hotel.hotel = await getSingleHotel({ hotel_id : trip_hotel.hotel_id })
      }
      const restaurants_result = (await db.execute(sql4, binds, db.options)).rows;
      for(let trip_restaurant of restaurants_result)
      {
            trip_restaurant.restaurant = await getSingleRestaurant({ restaurant_id : trip_restaurant.restaurant_id })
      }
      const guides_result = (await db.execute(sql5, binds, db.options)).rows;
      for(let trip_guide of guides_result)
      {
            guide_user_id = (await getUserIdofGuide({ guide_id : trip_guide.guide_id })).user_id
            console.log(guide_user_id)
            trip_guide.guide = await getSingleUser({ user_id : guide_user_id })
      } 
      result.contains = contains_result;
      result.hotels = hotels_result;
      result.restaurants = restaurants_result;
      result.guides = guides_result;
      //console.log(result.rows)
      return result;
    }
    catch(err){
      console.log(err)
    }
}

function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}

const getTrips = async (payload) => {
    console.log(payload);

    // Default attributes
    let page = 1;
    let per_page = 10;
    let orderby = 'trip_id';
    let ordertype = 'asc';

    const attributes = ["trip_id", "from_city_id", "to_city_id", "name", "description", "image_url", "total_price", "start_date", "end_date", "creator_user_id"];
    const ordertypes = ["asc", "desc"];

    const binds = {};

    let sql = `
    SELECT trip_id AS "trip_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id", (SELECT name FROM CITIES WHERE city_id = from_city_id ) AS "from_city_name", (SELECT name FROM CITIES WHERE city_id = to_city_id ) AS "to_city_name", name AS "name", description AS "description", image_url AS "image_url", total_price AS "total_price", start_date AS "start_date", end_date AS "end_date" 
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on", deleted_on AS "deleted_on"
    FROM TRIPS 
    WHERE trip_id > 0 `;

    if (payload.from_city_id !== undefined && payload.from_city_id !== '') {
        // to prevent sql injection
        ids = payload.from_city_id.trim().replace(' ', '').split(',');
        console.log(ids);
        actual_ids = [];
        str = '(';
        cnt = 0;
        for (let id of ids) {
          if (isNumber(id)) {
            console.log(id);
            actual_ids.push(id);
            cnt++;
          }
        }
        for (let i = 0; i < cnt; i++) {
          str += actual_ids[i];
          if (i < cnt - 1) {
            str += ',';
          }
        }
        str += ')';
        if (cnt > 0) {
          console.log(str);
          sql += `AND FROM_CITY_ID IN ${str} `;
        }
      }
    
      if (payload.to_city_id !== undefined && payload.to_city_id !== '') {
        // to prevent sql injection
        ids = payload.to_city_id.trim().replace(' ', '').split(',');
        console.log(ids);
        actual_ids = [];
        str = '(';
        cnt = 0;
        for (let id of ids) {
          if (isNumber(id)) {
            console.log(id);
            actual_ids.push(id);
            cnt++;
          }
        }
        for (let i = 0; i < cnt; i++) {
          str += actual_ids[i];
          if (i < cnt - 1) {
            str += ',';
          }
        }
        str += ')';
        if (cnt > 0) {
          console.log(str);
          sql += `AND TO_CITY_ID IN ${str} `;
        }
    }

    if (payload.name !== undefined && payload.name !== '') {
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(NAME) LIKE '%' || :name || '%' `;
        binds.name = name;
    }
    if (payload.price_min !== undefined && payload.price_min !== '') {
        const total_price_min = parseFloat(payload.price_min);
        if (!isNaN(total_price_min)) {
            sql += `AND TOTAL_PRICE >= :total_price_min `;
            binds.total_price_min = total_price_min;
        }
    }
    if (payload.price_max !== undefined && payload.price_max !== '') {
        const total_price_max = parseFloat(payload.price_max);
        if (!isNaN(total_price_max)) {
            sql += `AND TOTAL_PRICE <= :total_price_max `;
            binds.total_price_max = total_price_max;
        }
    }
    if (payload.start_date !== undefined && payload.start_date !== '') {
        const start_date = new Date(payload.start_date);
        if (!isNaN(start_date)) {
            sql += `AND START_DATE >= :start_date `;
            binds.start_date = new Date(start_date);
        }
    }
    if (payload.end_date !== undefined && payload.end_date !== '') {
        const end_date = new Date(payload.end_date);
        if (!isNaN(end_date)) {
            sql += `AND END_DATE <= :end_date `;
            binds.end_date = new Date(end_date);
        }
    }
    if (payload.creator_user_id !== undefined && payload.creator_user_id !== '') {
        const creator_user_id = parseInt(payload.creator_user_id);
        if (!isNaN(creator_user_id)) {
            sql += `AND CREATOR_USER_ID = :creator_user_id `;
            binds.creator_user_id = creator_user_id;
        }
    }
    if (payload.page !== undefined && payload.page !== '') {
        const in_page = parseInt(payload.page);
        if (!isNaN(in_page)) {
            page = in_page;
        }
    }
    if (payload.per_page !== undefined && payload.per_page !== '') {
        const in_per_page = parseInt(payload.per_page);
        if (!isNaN(in_per_page)) {
            per_page = in_per_page;
        }
    }
    if (payload.orderby !== undefined && payload.orderby !== '') {
        const in_orderby = payload.orderby.trim().toLowerCase();
        if (attributes.includes(in_orderby)) {
            orderby = in_orderby;
        }
    }
    if (payload.ordertype !== undefined && payload.ordertype !== '') {
        const in_ordertype = payload.ordertype.trim().toLowerCase();
        if (ordertypes.includes(in_ordertype)) {
            ordertype = in_ordertype;
        }
    }

    offset = (page - 1) * per_page;

    sql += `
    ORDER BY ${orderby} ${ordertype}
    OFFSET :offset ROWS
    FETCH NEXT :per_page ROWS ONLY `;

    binds.offset = offset;
    binds.per_page = per_page;

    try {
        console.log(sql);
        const result = await db.execute(sql, binds, db.options);
        return result.rows;
    } catch (err) {
        console.log(err);
    }
}

const createTrip = async (payload) => {

    console.log(payload)

    //const data = await // database calls or other api calls here

    const {sql, binds} = generateAddTrip_sql_binds(payload);

    // const sql = `
    // INSERT INTO MEALSIN VALUES(9,4)
    // `
    console.log(sql)
    console.log(binds)

    //return (await db.execute(sql, binds, db.options)).rows;
    try{
        const result1 = await db.execute(sql, binds, db.options);
        const trip_id = result1.outBinds.trip_id;
        console.log(trip_id);
        const payload = { trip_id : trip_id }
        const result = await getSingleTripDetails(payload)
        console.log(result.name)
        return result
    }
    catch(err){
        console.log(err)
        throw err;
    }
}

const updateTrip = async (payload) => {

    console.log(payload)

    //const data = await // database calls or other api calls here

    const {sql, binds} = generateUpdateTrip_sql_binds(payload);

    // const sql = `
    // INSERT INTO MEALSIN VALUES(9,4)
    // `
    console.log(sql)
    console.log(binds)

    trip_id = payload.trip_id

    //return (await db.execute(sql, binds, db.options)).rows;
    try{
        const result1 = await db.execute(sql, binds, db.options);
        console.log(trip_id);
        const payload = { trip_id : trip_id }
        const result = await getSingleTripDetails(payload)
        console.log(result.name)
        return result
    }
    catch(err){
        console.log(err)
        throw err
    }
}

// Soft Deletion of Trip
const deleteTrip = async (payload) => {
    console.log(payload)
    const sql = `
    UPDATE TRIPS
    SET deleted_on = CURRENT_DATE
    WHERE trip_id = :trip_id
    `
    const binds = {
        trip_id : payload.trip_id
    }

    const trip = await getSingleTrip(payload)
    console.log(sql)
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_trip = await getSingleTrip(payload)
    if(deleted_trip === null){
        console.log('Successfully Deleted')
    }
    else{
        console.log('Could not be deleted')
    }
    return trip
}

const deleteTripPermanent = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM TRIPS
    WHERE trip_id = :trip_id
    `;
    const binds = {
        trip_id: payload.trip_id
    };

    const trip = await getSingleTrip(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_trip = await getSingleTrip(payload);

    if (deleted_trip === null) {
        const message = { trip_id: payload.trip_id, status: 'permanently deleted' };
        console.log('Permanently Deleted');
        return message;
    } else {
        console.log('Could not be deleted');
    }

    return trip;
}

module.exports = { getSingleTripDetails, getSingleTrip, getTrips, createTrip, updateTrip, deleteTrip, deleteTripPermanent }
