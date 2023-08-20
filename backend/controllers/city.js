const oracledb = require('oracledb');
const db = require('../db/db');

const getSingleCity = async (payload) => {
    
    const city_id = payload.city_id;

    const sql = `
        SELECT city_id AS "city_id", name AS "name", country_name AS "country_name", population AS "population", weather_type AS "weather_type"
        FROM Cities
        WHERE city_id = :city_id 
    `;

    const binds = {
        city_id: city_id
    };

    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length === 0) {
            console.log('Invalid city_id');
            return null;
        }
        return result[0];
    } catch (err) {
        console.log(err);
    }
};

const getCities = async (payload) => {
    console.log(payload);

    // Default attributes
    page = 1;
    per_page = 10;
    orderby = 'city_id';
    ordertype = 'asc';

    const attributes = ["city_id", "name", "country_name", "population", "weather_type"];
    const ordertypes = ["asc", "desc"];

    binds = {};

    sql = `
    SELECT city_id AS "city_id", name AS "name", country_name AS "country_name", population AS "population", weather_type AS "weather_type"
    FROM Cities
    WHERE city_id > 0
    `;

    if (payload.name !== undefined && payload.name !== '') {
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(name) LIKE '%' || :name || '%' `;
        binds.name = name;
    }
    if (payload.country_name !== undefined && payload.country_name !== '') {
        const country_name = payload.country_name.trim().toLowerCase();
        sql += `AND LOWER(country_name) LIKE '%' || :country_name || '%' `;
        binds.country_name = country_name;
    }
    if (payload.population_min !== undefined && payload.population_min !== '') {
        const population_min = parseInt(payload.population_min);
        if (!isNaN(population_min)) {
            sql += `AND population >= :population_min `;
            binds.population_min = population_min;
        }
    }
    if (payload.population_max !== undefined && payload.population_max !== '') {
        const population_max = parseInt(payload.population_max);
        if (!isNaN(population_max)) {
            sql += `AND population <= :population_max `;
            binds.population_max = population_max;
        }
    }
    if (payload.weather_type !== undefined && payload.weather_type !== '') {
        const weather_type = payload.weather_type.trim().toLowerCase();
        if (['sunny', 'rainy', 'cold', 'snowy'].includes(weather_type)) {
            sql += `AND weather_type = :weather_type `;
            binds.weather_type = weather_type;
        }
    }
    // Continue adding filters for other attributes as needed

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
        FETCH NEXT :per_page ROWS ONLY
    `;

    binds.offset = offset;
    binds.per_page = per_page;

    try {
        console.log(sql);
        const result = (await db.execute(sql, binds, db.options)).rows;
        return result;
    } catch (err) {
        console.log(err);
    }
};

const createCity = async (payload) => {
    const sql = `
        DECLARE
            l_id NUMBER;
        BEGIN
            INSERT INTO Cities (name, country_name, population, weather_type)
            VALUES (:name, :country_name, :population, :weather_type)
            RETURNING city_id INTO l_id;
            :city_id := l_id;
        END;
    `;

    const binds = {
        name: payload.name,
        country_name: payload.country_name,
        population: payload.population,
        weather_type: payload.weather_type,
        city_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };

    try {
        const result1 = await db.execute(sql, binds, db.options);
        const city_id = result1.outBinds.city_id;
        console.log("Id of inserted city =", city_id);
        const payload = { city_id: city_id };
        const result = await getSingleCity(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const updateCity = async (payload) => {
    if (payload.city_id === undefined) {
        console.log('City id not given in req.body');
        return null;
    }

    const sql = `
        UPDATE Cities
        SET name = :name,
            country_name = :country_name,
            population = :population,
            weather_type = :weather_type
        WHERE city_id = :city_id
    `;

    const binds = {
        city_id: payload.city_id,
        name: payload.name,
        country_name: payload.country_name,
        population: payload.population,
        weather_type: payload.weather_type
    };

    city_id = payload.city_id;

    try {
        const result1 = await db.execute(sql, binds, db.options);
        console.log(city_id);
        const payload = { city_id: city_id };
        const result = await getSingleCity(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const deleteCity = async (payload) => {
    const sql = `
        DELETE FROM Cities
        WHERE city_id = :city_id
    `;

    const binds = {
        city_id: payload.city_id
    };

    const city = await getSingleCity(payload)
    console.log(sql)
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_city = await getSingleCity(payload)
    if(deleted_city === null){
        console.log('Successfully Deleted')
    }
    else{
        console.log('Could not be deleted')
    }
    return city
};

module.exports = { getSingleCity, getCities, createCity, updateCity, deleteCity };
