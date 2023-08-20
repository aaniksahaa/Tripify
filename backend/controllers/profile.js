
const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleCity } = require('./city');
const { getHotels } = require('./hotel');
const { getRestaurants } = require('./restaurant');
const { getReviews } = require('./review');
const { getFlights } = require('./flight');
const { getActivities } = require('./activity');
const { getDestinations } = require('./destination');
const { getTrips } = require('./trip');
const { getTripBookings } = require('./tripbooking');
const { getSingleUser } = require('./user');

const getSingleUserProfile = async (payload) => {

    page = 1
    per_page = 3

    console.log('getSingleUserProfile', payload)
    user_id = 0
    
    if (payload.user_id !== undefined && payload.user_id !== '') {
        user_id = parseInt(payload.user_id);
        if (isNaN(user_id)) {
            console.log('Invalid user_id given')
            return null
        }
    }
    else
    {
        console.log('User_id not given')
        return null
    }
    console.log(user_id)

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

    try {
        let user = await getSingleUser({ user_id: user_id })
        sql = `
        SELECT followee_id AS "followee_id", since_date AS "since_date"
        FROM FOLLOWS
        WHERE follower_id = :user_id
        `
        binds = {
            user_id: user_id
        }
        const follows_result = (await db.execute(sql, binds, db.options)).rows;
        user.follows = follows_result
        sql = `
        SELECT follower_id AS "follower_id", since_date AS "since_date"
        FROM FOLLOWS
        WHERE followee_id = :user_id
        `
        binds = {
            user_id: user_id
        }
        const followed_by_result = (await db.execute(sql, binds, db.options)).rows;
        user.followed_by = followed_by_result
        console.log(user)

        user.hotels_created = await getHotels({ creator_user_id: user_id, page: page, per_page: per_page });
        user.restaurants_created = await getRestaurants({ creator_user_id: user_id, page: page, per_page: per_page });
        user.trips_created = await getTrips({ creator_user_id: user_id, page: page, per_page: per_page });
        user.reviews_created = await getReviews({ user_id: user_id, page: page, per_page: per_page });
        user.flights_created = await getFlights({ creator_user_id: user_id, page: page, per_page: per_page });
        user.trip_bookings_created = await getTripBookings({ user_id: user_id, is_private: 0, page: page, per_page: per_page });
        user.activities_created = await getActivities({ creator_user_id: user_id, page: page, per_page: per_page });
        user.destinations_created = await getDestinations({ creator_user_id: user_id, page: page, per_page: per_page });

        return user;
    }
    catch(err) {
        console.log(err);
    }
};

module.exports = { getSingleUserProfile }