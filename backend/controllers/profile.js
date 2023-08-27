
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
const { getPosts } = require('./post');

const getCounts = async(payload) => {

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

    sql = `
    SELECT COUNT(DISTINCT F1.FOLLOWER_ID) AS "follower_count", COUNT(DISTINCT F2.FOLLOWEE_ID) AS "followee_count", COUNT(DISTINCT P.POST_ID) AS "post_count", COUNT(DISTINCT R.REVIEW_ID) AS "review_count"
    FROM USERS U LEFT OUTER JOIN FOLLOWS F1 
    ON U.USER_ID = F1.FOLLOWEE_ID
    LEFT OUTER JOIN FOLLOWS F2
    ON U.USER_ID = F2.FOLLOWER_ID
    LEFT OUTER JOIN POSTS P
    ON U.USER_ID = P.USER_ID
    LEFT OUTER JOIN REVIEWS R 
    ON U.USER_ID = R.USER_ID
    WHERE U.USER_ID = :user_id
    `
    binds = {
        user_id: user_id
    }
    const counts = (await db.execute(sql, binds, db.options)).rows;
    if(counts.length == 0)
    {
        return null;
    }
    return counts[0]


}

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
        //user.follows = follows_result

        //user.followee_count = follows_result.length

        sql = `
        SELECT follower_id AS "follower_id", since_date AS "since_date"
        FROM FOLLOWS
        WHERE followee_id = :user_id
        `
        binds = {
            user_id: user_id
        }
        const followed_by_result = (await db.execute(sql, binds, db.options)).rows;
        //user.followed_by = followed_by_result
        //user.follower_count = followed_by_result.length

        counts = await getCounts({user_id: user_id})

        console.log(counts)

        user = {
            ...user,
            ...counts
        };

        console.log(user)

        user.hotels_created = await getHotels({ creator_user_id: user_id, page: page, per_page: per_page });
        user.restaurants_created = await getRestaurants({ creator_user_id: user_id, page: page, per_page: per_page });
        user.trips_created = await getTrips({ creator_user_id: user_id, page: page, per_page: per_page });
        user.reviews_created = await getReviews({ user_id: user_id, page: page, per_page: per_page });
        user.flights_created = await getFlights({ creator_user_id: user_id, page: page, per_page: per_page });
        user.trip_bookings_created = await getTripBookings({ user_id: user_id, is_private: 0, page: page, per_page: per_page });
        user.activities_created = await getActivities({ creator_user_id: user_id, page: page, per_page: per_page });
        user.destinations_created = await getDestinations({ creator_user_id: user_id, page: page, per_page: per_page });
        user.posts_created = await getPosts({ user_id: user_id, page: page, per_page: per_page });
        
        return user;
    }
    catch(err) {
        console.log(err);
    }
};

module.exports = { getSingleUserProfile }