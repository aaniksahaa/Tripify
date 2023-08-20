const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleUser } = require('./user');
const { getSingleHotel } = require('./hotel');
const { getSingleRestaurant } = require('./restaurant');
const { getSingleTrip } = require('./trip');

const getObjectFromReviewId = async (payload) => {
    review_id = payload.review_id
    console.log("review_id = ", review_id)
    types = ['trip','hotel','restaurant']
    result = []
    object_id = null
    object_type = null
    for(let type of types)
    {
        sql = `
        SELECT ${type}_id AS "${type}_id"
        FROM ${type}Reviews
        WHERE review_id = :review_id
        `
        binds = {
            review_id: review_id
        }
        result = (await db.execute(sql, binds, db.options)).rows;
        console.log(type, result)
        if (result.length > 0) {
            object_type = type
            attribute = type + '_id'
            object_id = result[0][attribute]
            break
        }
    }
    object = {}
    object.object_id = object_id
    object.object_type = object_type
    if(object_type == 'hotel'){
        object.object = await getSingleHotel({ hotel_id: object_id })
    }
    else if(object_type == 'trip'){
        object.object = await getSingleTrip({ trip_id: object_id })
    }
    if(object_type == 'restaurant'){
        object.object = await getSingleRestaurant({ restaurant_id: object_id })
    }
    return object
}

const getSingleReview = async (payload) => {

    const review_id = payload.review_id;

    console.log(review_id);

    const sql = `
    SELECT review_id AS "review_id", user_id AS "user_id", posting_date AS "posting_date", description AS "description", rating AS "rating", image_url AS "image_url", upvote_count AS "upvote_count"
    FROM Reviews
    WHERE review_id = :review_id
    `;

    const binds = {
        review_id: review_id
    };

    try {
        result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length === 0) {
            console.log('Invalid review_id');
            return null;
        }
        const review = result[0];
        review.object = await getObjectFromReviewId({ review_id: review.review_id })
        review.user = await getSingleUser({ user_id: review.user_id });
        return review;
    } catch (err) {
        console.log(err);
    }
};

const getReviews = async (payload) => {
    console.log(payload);

    // Default attributes
    page = 1;
    per_page = 10;
    orderby = 'posting_date';
    ordertype = 'desc';

    const attributes = ["review_id", "user_id", "posting_date", "description", "rating", "image_url", "upvote_count"];
    const ordertypes = ["asc", "desc"];

    const binds = {};

    sql = `
    SELECT review_id AS "review_id", user_id AS "user_id", posting_date AS "posting_date", description AS "description", rating AS "rating", image_url AS "image_url", upvote_count AS "upvote_count"
    FROM Reviews
    WHERE review_id > 0 `;

    if (payload.user_id !== undefined && payload.user_id !== '') {
        user_id = parseInt(payload.user_id);
        if (!isNaN(user_id)) {
            sql += `AND user_id = :user_id `;
            binds.user_id = user_id;
        }
    }

    if (payload.rating_min !== undefined && payload.rating_min !== '') {
        rating_min = parseFloat(payload.rating_min);
        if (!isNaN(rating_min) && rating_min >= 0 && rating_min <= 5) {
            sql += `AND rating >= :rating_min `;
            binds.rating_min = rating_min;
        }
    }

    if (payload.rating_max !== undefined && payload.rating_max !== '') {
        rating_max = parseFloat(payload.rating_max);
        if (!isNaN(rating_max) && rating_max >= 0 && rating_max <= 5) {
            sql += `AND rating <= :rating_max `;
            binds.rating_max = rating_max;
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

    offset = (page - 1) * per_page;

    sql += `
    ORDER BY ${orderby} ${ordertype}
    OFFSET :offset ROWS
    FETCH NEXT :per_page ROWS ONLY `;

    binds.offset = offset;
    binds.per_page = per_page;

    try {
        console.log(sql);
        reviews_result = (await db.execute(sql, binds, db.options)).rows;
        for(let review of reviews_result) {
            review.object = await getObjectFromReviewId({ review_id: review.review_id })
            review.user = await getSingleUser({ user_id: review.user_id });
        }
        console.log(reviews_result)
        return reviews_result;
    } catch (err) {
        console.log(err);
    }
};

const createReview = async (payload) => {
    console.log(payload);
    sql = `
    DECLARE
        l_id NUMBER;
    BEGIN
        INSERT INTO Reviews (user_id, description, rating, image_url)
        VALUES (:user_id, :description, :rating, :image_url)
        RETURNING review_id INTO l_id;
        :review_id := l_id;
    END;
    `;
    binds = {
        user_id: payload.user_id,
        description: payload.description,
        rating: payload.rating,
        image_url: payload.image_url,
        review_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };

    object_type = payload.object_type.trim().toLowerCase()
    object_id = payload.object_id

    try {
        const result1 = await db.execute(sql, binds, db.options);
        const review_id = result1.outBinds.review_id;
        console.log("Id of inserted review = ", review_id);

        if(['trip','hotel','restaurant'].includes(object_type))
        {
            sql = `
            INSERT INTO ${object_type}Reviews(review_id, ${object_type}_id)
            VALUES(:review_id, :object_id)
            `
            binds = {
                review_id: review_id,
                object_id: object_id
            }
            await db.execute(sql, binds, db.options);
        }

        const payload = { review_id: review_id };
        const result = await getSingleReview(payload);
        console.log(result);
        return result; 
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const updateReview = async (payload) => {
    console.log(payload);
    if (payload.review_id === undefined) {
        console.log('Review id not given in req.body');
        return null;
    }
    const sql = `
    UPDATE Reviews
    SET description = :description,
        rating = :rating,
        image_url = :image_url
    WHERE review_id = :review_id
    `;
    const binds = {
        review_id: payload.review_id,
        description: payload.description,
        rating: payload.rating,
        image_url: payload.image_url
    };

    review_id = payload.review_id

    try {
        console.log(sql);
        const result1 = await db.execute(sql, binds, db.options);
        console.log(review_id);
        const payload = { review_id: review_id };
        const result = await getSingleReview(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const deleteReview = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM Reviews
    WHERE review_id = :review_id
    `;
    const binds = {
        review_id: payload.review_id
    };
    const review = await getSingleReview(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_review = await getSingleReview(payload);
    if (deleted_review === null) {
        console.log('Successfully Deleted');
    } else {
        console.log('Could not be deleted');
    }
    return review;
};

module.exports = { getSingleReview, getReviews, createReview, updateReview, deleteReview };
