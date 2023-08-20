const oracledb = require('oracledb');
const db = require('../db/db');

function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}

const getSingleActivity = async (payload) => {
    const activity_id = payload.activity_id;
    const sql = `
    SELECT activity_id AS "activity_id", name AS "name", category AS "category", description AS "description", image_url AS "image_url", min_age AS "min_age", max_age AS "max_age"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Activities
    WHERE activity_id = :activity_id
    `;
    const binds = {
        activity_id: activity_id
    };
    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length === 0) {
            console.log('Invalid activity_id');
            return null;
        }
        return result[0];
    } catch (err) {
        console.log(err);
    }
};

const getActivities = async (payload) => {
    // Default attributes
    page = 1;
    per_page = 10;
    orderby = 'activity_id';
    ordertype = 'asc';

    const attributes = ["activity_id", "name", "category", "description", "image_url", "min_age", "max_age"];
    const ordertypes = ["asc", "desc"];

    const binds = {};

    sql = `
    SELECT activity_id AS "activity_id", name AS "name", category AS "category", description AS "description", image_url AS "image_url", min_age AS "min_age", max_age AS "max_age"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Activities
    WHERE activity_id > 0
    `;

    if (payload.name !== undefined && payload.name !== '') {
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(name) LIKE '%' || :name || '%' `;
        binds.name = name;
    }

    if (payload.category !== undefined && payload.category !== '') {
        const category = payload.category.trim().toLowerCase();
        sql += `AND LOWER(category) LIKE '%' || :category || '%' `;
        binds.category = category;
    }

    if (payload.age !== undefined && payload.age !== '') {
        const age = parseInt(payload.age);
        if (!isNaN(age)) {
            sql += `AND :age >= min_age AND :age <= max_age `;
            binds.age = age;
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

    const offset = (page - 1) * per_page;

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

const createActivity = async (payload) => {
    console.log(payload);
    const sql = `
        INSERT INTO Activities (name, category, description, image_url, min_age, max_age, creator_user_id)
        VALUES (:name, :category, :description, :image_url, :min_age, :max_age, :creator_user_id)
        RETURNING activity_id INTO :activity_id
    `;
    const binds = {
        name: payload.name,
        category: payload.category,
        description: payload.description,
        image_url: payload.image_url,
        min_age: payload.min_age,
        max_age: payload.max_age,
        creator_user_id: payload.creator_user_id,
        activity_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };
    try {
        const result1 = await db.execute(sql, binds, db.options);
        const activity_id = result1.outBinds.activity_id[0];
        console.log('Id of inserted activity = ', activity_id);
        const payload = { activity_id: activity_id };
        const result = await getSingleActivity(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
    }
};

const updateActivity = async (payload) => {
    console.log(payload);
    if (payload.activity_id === undefined) {
        console.log('Activity id not given in req.body');
        return null;
    }
    const sql = `
        UPDATE Activities
        SET name = :name,
            category = :category,
            description = :description,
            image_url = :image_url,
            min_age = :min_age,
            max_age = :max_age
        WHERE activity_id = :activity_id
    `;
    const binds = {
        activity_id: payload.activity_id,
        name: payload.name,
        category: payload.category,
        description: payload.description,
        image_url: payload.image_url,
        min_age: payload.min_age,
        max_age: payload.max_age
    };

    activity_id = payload.activity_id

    try {
        console.log(sql);
        await db.execute(sql, binds, db.options);
        const payload = { activity_id: activity_id };
        const result = await getSingleActivity(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
    }
};

const deleteActivity = async (payload) => {
    console.log(payload);
    const sql = `
        DELETE FROM Activities
        WHERE activity_id = :activity_id
    `;
    const binds = {
        activity_id: payload.activity_id
    };
    const activity = await getSingleActivity(payload);
    console.log(sql);
    await db.execute(sql, binds, db.options);
    console.log('Successfully Deleted');
    return activity;
};

module.exports = { getSingleActivity, getActivities, createActivity, updateActivity, deleteActivity };
