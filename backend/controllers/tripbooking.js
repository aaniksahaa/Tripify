const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleUser } = require('./user');
const { getSingleTrip } = require('./trip');

const getSingleTripBooking = async (payload) => {

    const user_id = payload.user_id;
    const trip_id = payload.trip_id;

    const sql = `
    SELECT user_id AS "user_id", trip_id AS "trip_id", booking_date AS "booking_date", is_paid AS "is_paid",
           is_processed AS "is_processed", is_completed AS "is_completed", payment_method AS "payment_method",
           transaction_id AS "transaction_id", payment_date AS "payment_date", completion_date AS "completion_date",
           is_private AS "is_private", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM TripBookings
    WHERE user_id = :user_id AND trip_id = :trip_id AND deleted_on IS NULL
    `;

    const binds = {
        user_id: user_id,
        trip_id: trip_id
    };

    try {
        const result = await db.execute(sql, binds, db.options);
        if (result.rows.length === 0) {
            console.log('Invalid user_id and trip_id combination');
            return null;
        }
        const tripBooking = result.rows[0];
        tripBooking.user = await getSingleUser({ user_id: tripBooking.user_id });
        tripBooking.trip = await getSingleTrip({ trip_id: tripBooking.trip_id });
        return tripBooking;
    } catch (err) {
        console.log(err);
    }
};

const getTripBookingsFromUserId = async (payload) => {

    const user_id = payload.user_id;

    const sql = `
    SELECT user_id AS "user_id", trip_id AS "trip_id", booking_date AS "booking_date", is_paid AS "is_paid",
           is_processed AS "is_processed", is_completed AS "is_completed", payment_method AS "payment_method",
           transaction_id AS "transaction_id", payment_date AS "payment_date", completion_date AS "completion_date",
           is_private AS "is_private", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM TripBookings
    WHERE user_id = :user_id AND deleted_on IS NULL
    `;

    console.log(sql)

    const binds = {
        user_id: user_id
    };

    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length === 0) {
            console.log('No trip for this user_id');
            return null;
        }
        for(let tripBooking of result)
        {
            tripBooking.user = await getSingleUser({ user_id: tripBooking.user_id });
            tripBooking.trip = await getSingleTrip({ trip_id: tripBooking.trip_id });
        }
        return result;
    } catch (err) {
        console.log(err);
    }
};

const getTripBookings = async (payload) => {
    console.log(payload);

    // Default attributes
    let page = 1;
    let per_page = 10;
    let orderby = 'user_id';
    let ordertype = 'asc';

    const attributes = ["user_id", "trip_id", "booking_date", "is_paid", "is_processed", "is_completed", "payment_method", "transaction_id", "payment_date", "completion_date", "is_private"];
    const ordertypes = ["asc", "desc"];

    const binds = {};

    let sql = `
    SELECT user_id AS "user_id", trip_id AS "trip_id", booking_date AS "booking_date", is_paid AS "is_paid", is_processed AS "is_processed", is_completed AS "is_completed", payment_method AS "payment_method", transaction_id AS "transaction_id", payment_date AS "payment_date", completion_date AS "completion_date", is_private AS "is_private", created_on AS "created_on", last_updated_on AS "last_updated_on" 
    FROM TripBookings 
    WHERE user_id > 0 AND trip_id > 0 `;

    if (payload.user_id !== undefined && payload.user_id !== '') {
        const user_id = parseInt(payload.user_id);
        if (!isNaN(user_id) && user_id > 0) {
            sql += `AND USER_ID = :user_id `;
            binds.user_id = user_id;
        }
    }
    
    if (payload.trip_id !== undefined && payload.trip_id !== '') {
        const trip_id = parseInt(payload.trip_id);
        if (!isNaN(trip_id) && trip_id > 0) {
            sql += `AND TRIP_ID = :trip_id `;
            binds.trip_id = trip_id;
        }
    }    

    if (payload.is_paid !== undefined && payload.is_paid !== '') {
        const is_paid = parseInt(payload.is_paid);
        if (!isNaN(is_paid) && (is_paid === 0 || is_paid === 1)) {
            sql += `AND IS_PAID = :is_paid `;
            binds.is_paid = is_paid;
        }
    }
    if (payload.is_processed !== undefined && payload.is_processed !== '') {
        const is_processed = parseInt(payload.is_processed);
        if (!isNaN(is_processed) && (is_processed === 0 || is_processed === 1)) {
            sql += `AND IS_PROCESSED = :is_processed `;
            binds.is_processed = is_processed;
        }
    }
    if (payload.is_completed !== undefined && payload.is_completed !== '') {
        const is_completed = parseInt(payload.is_completed);
        if (!isNaN(is_completed) && (is_completed === 0 || is_completed === 1)) {
            sql += `AND IS_COMPLETED = :is_completed `;
            binds.is_completed = is_completed;
        }
    }
    if (payload.is_private !== undefined && payload.is_private !== '') {
        const is_private = parseInt(payload.is_private);
        if (!isNaN(is_private) && (is_private === 0 || is_private === 1)) {
            sql += `AND IS_PRIVATE = :is_private `;
            binds.is_private = is_private;
        }
    }
    if (payload.payment_method !== undefined && payload.payment_method !== '') {
        const payment_method = payload.payment_method.trim().toLowerCase();
        sql += `AND LOWER(PAYMENT_METHOD) LIKE '%' || :payment_method || '%' `;
        binds.payment_method = payment_method;
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
        for (let booking of result.rows) {
            booking.trip = await getSingleTrip({ trip_id: booking.trip_id });
            booking.user = await getSingleUser({ user_id: booking.user_id });
        }
        return result.rows;
    } catch (err) {
        console.log(err);
    }
}

const createTripBooking = async (payload) => {

    const user_id = payload.user_id;
    const trip_id = payload.trip_id;
    is_private = 0

    if(payload.is_private !== undefined)
    {
        is_private = payload.is_private
    }

    const sql = `
    DECLARE
        l_user_id NUMBER := :user_id;
        l_trip_id NUMBER := :trip_id;
        l_is_private NUMBER := :is_private;
    BEGIN
        INSERT INTO TripBookings (user_id, trip_id, is_private)
        VALUES (l_user_id, l_trip_id, l_is_private);
    END;
    `;

    const binds = {
        user_id: user_id,
        trip_id: trip_id, 
        is_private: is_private
    };

    try {
        await db.execute(sql, binds, db.options);
        const tripBooking = await getSingleTripBooking({ user_id: user_id, trip_id: trip_id });
        if(tripBooking)
        {
            console.log('TripBooking created successfully');
        }
        return tripBooking;
    } catch (err) {
        console.log(err);
        throw err
    }
};

const paymentTripBooking = async (payload) => {
    console.log("paymentTripBooking", payload)
    
    const sql = `
    UPDATE TripBookings
    SET is_paid = 1,
        payment_method = :payment_method,
        transaction_id = :transaction_id,
        payment_date = CURRENT_DATE,
        last_updated_on = CURRENT_DATE
    WHERE user_id = :user_id AND trip_id = :trip_id
    `
    const binds = {
        user_id: payload.user_id,
        trip_id: payload.trip_id,
        payment_method: payload.payment_method,
        transaction_id: payload.transaction_id
    };

    user_id = payload.user_id
    trip_id = payload.trip_id

    try{ 
        console.log(sql)
        const result1 = await db.execute(sql, binds, db.options);
        if(result1 === undefined || result1.rowsAffected == 0)
        {
            console.log('Not Updated...')
        }
        else
        {
            console.log("user_id = ", user_id, "trip_id = ", trip_id, " , payment confirmed...")
        }
        const payload = { user_id: user_id, trip_id: trip_id }
        const result = await getSingleTripBooking(payload)
        console.log(result)
        return result
    }
    catch(err){
        console.log(err);
        throw err;
    }
}

const processTripBooking = async (payload) => {

    console.log('processTripBooking', payload)
    
    const sql = `
    UPDATE TripBookings
    SET is_processed = 1,
        last_updated_on = CURRENT_DATE
    WHERE user_id = :user_id AND trip_id = :trip_id
    `
    const binds = {
        user_id: payload.user_id,
        trip_id: payload.trip_id
    };

    user_id = payload.user_id
    trip_id = payload.trip_id

    try{ 
        console.log(sql)
        const result1 = await db.execute(sql, binds, db.options);
        if(result1 === undefined || result1.rowsAffected == 0)
        {
            console.log('Not Updated...')
        }
        else
        {
            console.log("user_id = ", user_id, "trip_id = ", trip_id, " , processing confirmed...")
        }
        const payload = { user_id: user_id, trip_id: trip_id }
        const result = await getSingleTripBooking(payload)
        console.log(result)
        return result
    }
    catch(err){
        console.log(err);
        throw err;
    }
}

const completeTripBooking = async (payload) => {
    console.log('completeTripBooking', payload)
    
    const sql = `
    UPDATE TripBookings
    SET is_completed = 1,
        completion_date = CURRENT_DATE,
        last_updated_on = CURRENT_DATE
    WHERE user_id = :user_id AND trip_id = :trip_id
    `
    const binds = {
        user_id: payload.user_id,
        trip_id: payload.trip_id
    };

    user_id = payload.user_id
    trip_id = payload.trip_id

    try{ 
        console.log(sql)
        const result1 = await db.execute(sql, binds, db.options);
        if(result1 === undefined || result1.rowsAffected == 0)
        {
            console.log('Not Updated...')
        }
        else
        {
            console.log("user_id = ", user_id, "trip_id = ", trip_id, " , tripbooking completed...")
        }
        const payload = { user_id: user_id, trip_id: trip_id }
        const result = await getSingleTripBooking(payload)
        console.log(result)
        return result
    }
    catch(err){
        console.log(err)
        throw err;
    }
}

// Soft Deletion of Trip
const deleteTripBooking = async (payload) => {
    console.log(payload)
    const sql = `
    UPDATE TRIPBOOKINGS
    SET deleted_on = CURRENT_DATE
    WHERE user_id = :user_id AND trip_id = :trip_id
    `
    const binds = {
        user_id: payload.user_id,
        trip_id: payload.trip_id
    };

    const tripbooking = await getSingleTripBooking(payload)
    console.log(sql)
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_tripbooking = await getSingleTripBooking(payload)
    if(deleted_tripbooking === null){
        console.log('Successfully Deleted')
    }
    else{
        console.log('Could not be deleted')
    }
    return tripbooking
}

const deleteTripBookingPermanent = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM TRIPBOOKINGS
    WHERE user_id = :user_id AND trip_id = :trip_id
    `;
    const binds = {
        user_id: payload.user_id,
        trip_id: payload.trip_id
    };

    const tripbooking = await getSingleTripBooking(payload)
    console.log(sql)
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_tripbooking = await getSingleTripBooking(payload)

    if (deleted_tripbooking === null) {
        const message = { user_id: payload.user_id, trip_id: payload.trip_id, status: 'permanently deleted' };
        console.log('Permanently Deleted');
        return message;
    } else {
        console.log('Could not be deleted');
    }

    return tripbooking;
}

module.exports = { getSingleTripBooking, getTripBookingsFromUserId, getTripBookings, createTripBooking, paymentTripBooking, processTripBooking, completeTripBooking, deleteTripBooking, deleteTripBookingPermanent };
