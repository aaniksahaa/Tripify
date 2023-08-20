const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleCity } = require('./city');

const getSingleRestaurant = async (payload) => {

    const restaurant_id = payload.restaurant_id;

    console.log(restaurant_id);

    const sql = `
    SELECT restaurant_id AS "restaurant_id", name AS "name", reservation_price AS "reservation_price", address AS "address", city_id AS "city_id", description AS "description", image_url AS "image_url", cuisine_type AS "cuisine_type", contact AS "contact", email AS "email"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Restaurants
    WHERE restaurant_id = :restaurant_id
    `;

    const binds = {
        restaurant_id: restaurant_id,
    };

    try {
        result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length == 0) {
            console.log('Invalid restaurant_id');
            return null;
        }
        restaurant = result[0]
        restaurant.city = await getSingleCity({ city_id : restaurant.city_id })
        return restaurant;
    } catch (err) {
        console.log(err);
    }
};
function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}
const getRestaurants = async (payload) => {

    console.log(payload);

    // Default attributes
    page = 1;
    per_page = 10;
    orderby = 'restaurant_id';
    ordertype = 'asc';

    const attributes = ["restaurant_id", "name", "reservation_price", "address", "city_id", "description", "image_url", "cuisine_type", "contact", "email"];
    const ordertypes = ["asc", "desc"];

    binds = {};

    sql = `
    SELECT restaurant_id AS "restaurant_id", name AS "name", reservation_price AS "reservation_price", address AS "address", city_id AS "city_id", description AS "description", image_url AS "image_url", cuisine_type AS "cuisine_type", contact AS "contact", email AS "email"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Restaurants
    WHERE restaurant_id > 0 `;

    if (payload.name !== undefined && payload.name !== '') {
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(name) LIKE '%' || :name || '%' `;
        binds.name = name;
    }
    if (payload.address !== undefined && payload.address !== '') {
        const address = payload.address.trim().toLowerCase();
        sql += `AND LOWER(address) LIKE '%' || :address || '%' `;
        binds.address = address;
    }
    if (payload.city_id !== undefined && payload.city_id !== '') {
        // To prevent SQL injection
        ids = payload.city_id.trim().replace(' ', '').split(',');
        console.log(ids);
        actual_ids = [];
        str = "(";
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
            sql += `AND city_id IN ${str} `;
        }
    }
    if (payload.min_price !== undefined && payload.min_price !== '') {
        min_reservation_price = parseInt(payload.min_price);
        console.log(min_reservation_price)
        if (!isNaN(min_reservation_price)) {
            sql += `AND reservation_price >= :min_reservation_price `;
            binds.min_reservation_price = min_reservation_price;
        }
    }
    if (payload.max_price !== undefined && payload.max_price !== '') {
        max_reservation_price = parseInt(payload.max_price);
        console.log(max_reservation_price)
        if (!isNaN(max_reservation_price)) {
            sql += `AND reservation_price <= :max_reservation_price `;
            binds.max_reservation_price = max_reservation_price;
        }
    }
    if (payload.cuisine_type !== undefined && payload.cuisine_type !== '') {
        const cuisine_type = payload.cuisine_type.trim().toLowerCase();
        sql += `AND LOWER(cuisine_type) LIKE '%' || :cuisine_type || '%' `;
        binds.cuisine_type = cuisine_type;
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
        in_orderby = payload.orderby.trim().toLowerCase();
        if(in_orderby === 'price')
        {
            in_orderby = 'reservation_price'
        }
        console.log(in_orderby);
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
        result = (await db.execute(sql, binds, db.options)).rows;
        for (let restaurant of result) {
            restaurant.city = await getSingleCity({ city_id: restaurant.city_id });
        }
        return result;
    } catch (err) {
        console.log(err);
    }
};

const createRestaurant = async (payload) => {
    console.log(payload);
    const sql = `
    DECLARE
        l_id NUMBER;
    BEGIN
        INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email, creator_user_id)
        VALUES (:name, :reservation_price, :address, :city_id, :description, :image_url, :cuisine_type, :contact, :email, :creator_user_id)
        RETURNING restaurant_id INTO l_id;
        :restaurant_id := l_id;
    END;
    `;
    const binds = {
        name: payload.name,
        reservation_price: payload.reservation_price,
        address: payload.address,
        city_id: payload.city_id,
        description: payload.description,
        image_url: payload.image_url,
        cuisine_type: payload.cuisine_type,
        contact: payload.contact,
        email: payload.email,
        creator_user_id: payload.creator_user_id,
        restaurant_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT },
    };
    try {
        const result1 = await db.execute(sql, binds, db.options);
        const restaurant_id = result1.outBinds.restaurant_id;
        console.log('Id of inserted restaurant = ', restaurant_id);
        const payload = { restaurant_id: restaurant_id };
        const result = await getSingleRestaurant(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const updateRestaurant = async (payload) => {
    console.log(payload);
    if (payload.restaurant_id === undefined) {
        console.log('Restaurant id not given in req.body');
        return null;
    }
    const sql = `
    UPDATE Restaurants
    SET name = :name,
        reservation_price = :reservation_price,
        address = :address,
        city_id = :city_id,
        description = :description,
        image_url = :image_url,
        cuisine_type = :cuisine_type,
        contact = :contact,
        email = :email,
        last_updated_on = CURRENT_DATE
    WHERE restaurant_id = :restaurant_id
    `;
    const binds = {
        restaurant_id: payload.restaurant_id,
        name: payload.name,
        reservation_price: payload.reservation_price,
        address: payload.address,
        city_id: payload.city_id,
        description: payload.description,
        image_url: payload.image_url,
        cuisine_type: payload.cuisine_type,
        contact: payload.contact,
        email: payload.email,
    };

    restaurant_id = payload.restaurant_id;

    try {
        console.log(sql);
        const result1 = await db.execute(sql, binds, db.options);
        console.log(restaurant_id);
        const payload = { restaurant_id: restaurant_id };
        const result = await getSingleRestaurant(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const deleteRestaurant = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM RESTAURANTS
    WHERE restaurant_id = :restaurant_id
    `;
    const binds = {
        restaurant_id: payload.restaurant_id,
    };
    const restaurant = await getSingleRestaurant(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_restaurant = await getSingleRestaurant(payload);
    if (deleted_restaurant === null) {
        console.log('Successfully Deleted');
    } else {
        console.log('Could not be deleted');
    }
    return restaurant;
};

module.exports = {
    getSingleRestaurant,
    getRestaurants,
    createRestaurant,
    updateRestaurant,
    deleteRestaurant,
};
