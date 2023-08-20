const oracledb = require('oracledb')

const db = require('../db/db');
const { getSingleCity } = require('./city');

const getSingleHotel = async (payload) => {
    
    const hotel_id = payload.hotel_id;

    console.log(hotel_id)
    
    const sql = `
    SELECT hotel_id AS "hotel_id", name AS "name", address AS "address", city_id AS "city_id", description AS "description", image_url AS "image_url", price_per_day AS "price_per_day", phone AS "phone", email AS "email", has_wifi AS "has_wifi", has_parking AS "has_parking", has_gym AS "has_gym"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on" 
    FROM Hotels 
    WHERE hotel_id = :hotel_id 
    `;
    
    const binds = {
      hotel_id : hotel_id
    }

    try{
      result = (await db.execute(sql, binds, db.options)).rows;
      if(result.length == 0){
        console.log('Invalid hotel_id')
        return null
      }
      hotel = result[0]
      hotel.city = await getSingleCity({ city_id : hotel.city_id })
      return hotel;
    }
    catch(err){
      console.log(err)
      throw err;
    }
}

function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}

const getHotels = async (payload) => {

    console.log(payload)

    // deafult attributes

    page = 1
    per_page = 10
    orderby = 'hotel_id'
    ordertype = 'asc'

    const attributes = ["hotel_id", "name", "address", "city_id", "description", "image_url", "price_per_day", "phone", "email", "has_wifi", "has_parking", "has_gym"];
    const ordertypes = ["asc","desc"]

    binds = {}

    sql = `
    SELECT hotel_id AS "hotel_id", name AS "name", address AS "address", city_id AS "city_id", description AS "description", image_url AS "image_url", price_per_day AS "price_per_day", phone AS "phone", email AS "email", has_wifi AS "has_wifi", has_parking AS "has_parking", has_gym AS "has_gym"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on" 
    FROM Hotels 
    WHERE hotel_id>0 `;

    if(payload.name !== undefined && payload.name !== ''){
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(NAME) LIKE '%' || :name || '%' `;
        binds.name = name
    }
    if(payload.address !== undefined && payload.address !== ''){
        const address = payload.address.trim().toLowerCase();
        sql += `AND LOWER(ADDRESS) LIKE '%' || :address || '%' `;
        binds.address = address
    }
    if(payload.city_id !== undefined && payload.city_id !== ''){
        // to prevent sql injection
        ids = payload.city_id.trim().replace(' ','').split(',')
        console.log(ids)
        actual_ids = []
        str = "("
        cnt = 0
        for(let id of ids){
            if(isNumber(id)){
                console.log(id)
                actual_ids.push(id)
                cnt++;
            }
        }
        for(let i=0; i<cnt; i++)
        {
            str += actual_ids[i];
            if(i < cnt-1){
                str += ','
            }
        }
        str += ')'
        if(cnt > 0){
            console.log(str)
            sql += `AND CITY_ID IN ${str} `;
        }
    }
    if(payload.min_price !== undefined && payload.min_price !== ''){
        min_price = parseInt(payload.min_price)
        if(!isNaN(min_price)){
            sql += `AND PRICE_PER_DAY >= :min_price `;
            binds.min_price = min_price
        }
    }
    if(payload.max_price !== undefined && payload.max_price !== ''){
        max_price = parseInt(payload.max_price)
        if(!isNaN(max_price)){
            sql += `AND PRICE_PER_DAY <= :max_price `;
            binds.max_price = max_price
        }
    }
    if(payload.has_wifi !== undefined && payload.has_wifi !== ''){
        has_wifi = parseInt(payload.has_wifi)
        console.log(has_wifi)
        if(!isNaN(has_wifi) && (has_wifi == 0 || has_wifi == 1)){
            sql += `AND HAS_WIFI = :has_wifi `;
            binds.has_wifi = payload.has_wifi
        }
    }
    if(payload.has_parking !== undefined && payload.has_parking !== ''){
        has_parking = parseInt(payload.has_parking)
        if(!isNaN(has_parking) && (has_parking == 0 || has_parking == 1)){
            sql += `AND HAS_PARKING = :has_parking `;
            binds.has_parking = payload.has_parking
        }
    }
    if(payload.has_gym !== undefined && payload.has_gym !== ''){
        has_gym = parseInt(payload.has_gym)
        if(!isNaN(has_gym) && (has_gym == 0 || has_gym == 1)){
            sql += `AND HAS_GYM = :has_gym `;
            binds.has_gym = payload.has_gym
        }
    }
    if (payload.creator_user_id !== undefined && payload.creator_user_id !== '') {
        const creator_user_id = parseInt(payload.creator_user_id);
        if (!isNaN(creator_user_id)) {
          sql += `AND CREATOR_USER_ID = :creator_user_id `;
          binds.creator_user_id = creator_user_id;
        }
    }      
    if(payload.page !== undefined && payload.page !== ''){
        const in_page = parseInt(payload.page);
        if(!isNaN(in_page)){
            page = in_page
        }
    }
    if(payload.per_page !== undefined && payload.per_page !== ''){
        const in_per_page = parseInt(payload.per_page);
        if(!isNaN(in_per_page)){
            per_page = in_per_page
        }
    }
    if(payload.orderby !== undefined && payload.orderby !== ''){
        const in_orderby = payload.orderby.trim().toLowerCase();
        console.log(in_orderby)
        if(attributes.includes(in_orderby)){
            orderby = in_orderby
        }
    }
    if(payload.ordertype !== undefined && payload.ordertype !== ''){
        const in_ordertype = payload.ordertype.trim().toLowerCase();
        if(ordertypes.includes(in_ordertype)){
            ordertype = in_ordertype
        }
    }

    offset = (page-1)*per_page

    sql += `
    ORDER BY ${orderby} ${ordertype}
    OFFSET :offset ROWS
    FETCH NEXT :per_page ROWS ONLY `

    binds.offset = offset
    binds.per_page = per_page

    try{
        console.log(sql)
        result = (await db.execute(sql, binds, db.options)).rows;
        for(let hotel of result)
        {
            hotel.city = await getSingleCity({ city_id : hotel.city_id })
        }
        return result;
    }
    catch(err){
        console.log(err)
        throw err;
    }
}

const createHotel = async (payload) => {
    console.log(payload)
    const sql = `
    DECLARE
        l_id NUMBER;
    BEGIN
        INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym, creator_user_id )
        VALUES (:name, :address, :city_id , :description, :image_url, :price_per_day , :phone , :email , :has_wifi, :has_parking, :has_gym, :creator_user_id )
        RETURNING hotel_id INTO l_id;
        :hotel_id := l_id;
    END;
    `
    const binds = {
        name: payload.name,
        address: payload.address,
        city_id: payload.city_id,
        description: payload.description,
        image_url: payload.image_url,
        price_per_day: payload.price_per_day,
        phone: payload.phone,
        email: payload.email,
        has_wifi: payload.has_wifi,
        has_parking: payload.has_parking,
        has_gym: payload.has_gym,
        creator_user_id: payload.creator_user_id,
        hotel_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };
    try{ 
        const result1 = await db.execute(sql, binds, db.options);
        const hotel_id = result1.outBinds.hotel_id;
        console.log("Id of inserted hotel = ", hotel_id);
        const payload = { hotel_id : hotel_id }
        const result = await getSingleHotel(payload)
        console.log(result)
        return result
    }
    catch(err){
        console.log(err)
        throw err;
    }
}

const updateHotel = async (payload) => {
    console.log(payload)
    if(payload.hotel_id === undefined){
        console.log('Hotel id not given in req.body')
        return null
    }
    const sql = `
    UPDATE Hotels
    SET name = :name,
        address = :address,
        city_id = :city_id,
        description = :description,
        image_url = :image_url,
        price_per_day = :price_per_day,
        phone = :phone,
        email = :email,
        has_wifi = :has_wifi,
        has_parking = :has_parking,
        has_gym = :has_gym,
        last_updated_on = CURRENT_DATE
    WHERE hotel_id = :hotel_id
    `
    const binds = {
        hotel_id: payload.hotel_id,
        name: payload.name,
        address: payload.address,
        city_id: payload.city_id,
        description: payload.description,
        image_url: payload.image_url,
        price_per_day: payload.price_per_day,
        phone: payload.phone,
        email: payload.email,
        has_wifi: payload.has_wifi,
        has_parking: payload.has_parking,
        has_gym: payload.has_gym
    };

    hotel_id = payload.hotel_id

    try{ 
        console.log(sql)
        const result1 = await db.execute(sql, binds, db.options);
        console.log(hotel_id)
        const payload = { hotel_id : hotel_id }
        const result = await getSingleHotel(payload)
        console.log(result)
        return result
    }
    catch(err){
        console.log(err)
        throw err;
    }
}

const deleteHotel = async (payload) => {
    console.log(payload)
    const sql = `
    DELETE FROM HOTELS
    WHERE hotel_id = :hotel_id
    `
    const binds = {
        hotel_id : payload.hotel_id
    }
    const hotel = await getSingleHotel(payload)
    console.log(sql)
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_hotel = await getSingleHotel(payload)
    if(deleted_hotel === null){
        console.log('Successfully Deleted')
    }
    else{
        console.log('Could not be deleted')
    }
    return hotel
}

module.exports = {getSingleHotel, getHotels, createHotel, updateHotel, deleteHotel }
