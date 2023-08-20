const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleCity } = require('./city');
const { getSingleActivity } = require('./activity');

const getActivitiesFromDestinationId = async (payload) => {

    const destination_id = payload.destination_id;

    console.log(destination_id);

    const sql = `
    SELECT ACTIVITY_ID AS "activity_id", PRICE AS "price"
    FROM PROVIDES
    WHERE DESTINATION_ID = :destination_id AND IS_AVAILABLE = 1
    `

    const binds = {
        destination_id: destination_id
    };

    activities_result = (await db.execute(sql, binds, db.options)).rows;
    for(let destination_activity of activities_result)
    {
        destination_activity.activity = await getSingleActivity({ activity_id : destination_activity.activity_id })
    }

    return activities_result;

}

const getSingleDestination = async (payload) => {

    const destination_id = payload.destination_id;

    console.log(destination_id);

    const sql = `
    SELECT destination_id AS "destination_id",
           name AS "name",
           address AS "address",
           city_id AS "city_id",
           latitude AS "latitude",
           longitude AS "longitude",
           description AS "description",
           image_url AS "image_url",
           created_on AS "created_on",
           last_updated_on AS "last_updated_on",
           creator_user_id AS "creator_user_id"
    FROM Destinations
    WHERE destination_id = :destination_id
    `;

    const sql2 = `
    SELECT ACTIVITY_ID AS "activity_id"
    FROM PROVIDES
    WHERE DESTINATION_ID = :destination_id
    `

    const binds = {
        destination_id: destination_id
    };

    try {
        result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length == 0) {
            console.log('Invalid destination_id');
            return null;
        }
        const destination = result[0];
        destination.activities = await getActivitiesFromDestinationId({ destination_id: destination.destination_id})
        destination.city = await getSingleCity({ city_id: destination.city_id });
        return destination;
    } catch (err) {
        console.log(err);
    }
};

function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}

const getDestinations = async (payload) => {

    console.log(payload);

    // default attributes
    page = 1;
    per_page = 10;
    orderby = 'destination_id';
    ordertype = 'asc';

    const attributes = [
        "destination_id",
        "name",
        "address",
        "city_id",
        "latitude",
        "longitude",
        "description",
        "image_url",
    ];
    const ordertypes = ["asc", "desc"];

    const binds = {};
    let sql = `
    SELECT destination_id AS "destination_id",
           name AS "name",
           address AS "address",
           city_id AS "city_id",
           latitude AS "latitude",
           longitude AS "longitude",
           description AS "description",
           image_url AS "image_url",
           created_on AS "created_on",
           last_updated_on AS "last_updated_on",
           creator_user_id AS "creator_user_id"
    FROM Destinations
    WHERE destination_id > 0 `;

    if (payload.name !== undefined && payload.name !== '') {
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(NAME) LIKE '%' || :name || '%' `;
        binds.name = name;
    }
    if (payload.address !== undefined && payload.address !== '') {
        const address = payload.address.trim().toLowerCase();
        sql += `AND LOWER(ADDRESS) LIKE '%' || :address || '%' `;
        binds.address = address;
    }
    if (payload.city_id !== undefined && payload.city_id !== '') {
        // to prevent SQL injection
        const ids = payload.city_id.trim().replace(' ', '').split(',');
        console.log(ids);
        const actual_ids = [];
        let str = "(";
        let cnt = 0;
        for (const id of ids) {
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
            sql += `AND CITY_ID IN ${str} `;
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

    const offset = (page - 1) * per_page;
    sql += `
    ORDER BY ${orderby} ${ordertype}
    OFFSET :offset ROWS
    FETCH NEXT :per_page ROWS ONLY `;

    binds.offset = offset;
    binds.per_page = per_page;

    try {
        console.log(sql);
        const result = (await db.execute(sql, binds, db.options)).rows;
        for (const destination of result) {
            destination.activities = await getActivitiesFromDestinationId({ destination_id: destination.destination_id})
            destination.city = await getSingleCity({ city_id: destination.city_id });
        }
        return result;
    } catch (err) {
        console.log(err);
    }
};

const createDestination = async (payload) => {
    console.log(payload);
    const sql = `
    DECLARE
        l_id NUMBER;
    BEGIN
        INSERT INTO Destinations (
            name,
            address,
            city_id,
            latitude,
            longitude,
            description,
            image_url,
            creator_user_id
        )
        VALUES (
            :name,
            :address,
            :city_id,
            :latitude,
            :longitude,
            :description,
            :image_url,
            :creator_user_id
        )
        RETURNING destination_id INTO l_id;
        :destination_id := l_id;
    END;
    `;
    const binds = {
        name: payload.name,
        address: payload.address,
        city_id: payload.city_id,
        latitude: payload.latitude,
        longitude: payload.longitude,
        description: payload.description,
        image_url: payload.image_url,
        creator_user_id: payload.creator_user_id,
        destination_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT },
    };

    activities = payload.activities

    try {
        const result1 = await db.execute(sql, binds, db.options);
        const destination_id = result1.outBinds.destination_id;
        console.log("Id of inserted destination = ", destination_id);

        for(let activity of activities)
        {
            const sql = `
            INSERT INTO PROVIDES(destination_id, activity_id, price)
            VALUES(:destination_id, :activity_id, :price)
            `
            const binds = {
                destination_id: destination_id,
                activity_id: activity.activity_id,
                price: activity.price
            }

            await db.execute(sql, binds, db.options);
        }

        const payload = { destination_id: destination_id };
        const result = await getSingleDestination(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const updateDestination = async (payload) => {
    console.log(payload);
    if (payload.destination_id === undefined) {
        console.log('Destination id not given in req.body');
        return null;
    }
    sql = `
    UPDATE Destinations
    SET name = :name,
        address = :address,
        city_id = :city_id,
        latitude = :latitude,
        longitude = :longitude,
        description = :description,
        image_url = :image_url,
        last_updated_on = CURRENT_DATE
    WHERE destination_id = :destination_id
    `;
    binds = {
        destination_id: payload.destination_id,
        name: payload.name,
        address: payload.address,
        city_id: payload.city_id,
        latitude: payload.latitude,
        longitude: payload.longitude,
        description: payload.description,
        image_url: payload.image_url,
    };

    const destination_id = payload.destination_id;
    activities = payload.activities

    try {
        console.log(sql);
        const result1 = await db.execute(sql, binds, db.options);
        console.log(destination_id);
        
        // delete currently existing activities

        sql = `
        DELETE FROM PROVIDES
        WHERE DESTINATION_ID = :destination_id
        `
        binds = {
            destination_id: destination_id
        }

        await db.execute(sql, binds, db.options);

        // insert new activities

        for(let activity of activities)
        {
            sql = `
            INSERT INTO PROVIDES(destination_id, activity_id, price)
            VALUES(:destination_id, :activity_id, :price)
            `
            binds = {
                destination_id: destination_id,
                activity_id: activity.activity_id,
                price: activity.price
            }

            await db.execute(sql, binds, db.options);
        }

        const payload = { destination_id: destination_id };
        const result = await getSingleDestination(payload);
        console.log(result);
        return result;

    } catch (err) {
        console.log(err);
        next(err);
    }
};

const deleteDestination = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM Destinations
    WHERE destination_id = :destination_id
    `;
    const binds = {
        destination_id: payload.destination_id,
    };
    const destination = await getSingleDestination(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_destination = await getSingleDestination(payload);
    if (deleted_destination === null) {
        console.log('Successfully Deleted');
    } else {
        console.log('Could not be deleted');
    }
    return destination;
};

module.exports = {
    getSingleDestination,
    getDestinations,
    createDestination,
    updateDestination,
    deleteDestination,
};
