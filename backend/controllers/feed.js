const oracledb = require('oracledb')
const db = require('../db/db');
const { getPosts } = require('./post');
const { getComments } = require('./comment');
const { getSingleUser } = require('./user');

const getFollowees = async(payload) => {

    sql = `
    SELECT followee_id AS "followee_id"
    FROM FOLLOWS
    WHERE FOLLOWER_ID = :follower_id
    `
    binds = {
        follower_id: payload.user_id
    }
    try{
        const result = (await db.execute(sql,binds,db.options)).rows
        return result
    }
    catch(err)
    {
        console.log(err)
        throw err;
    }
}

const getFeed = async(payload) => {

    try{

        const followees = await getFollowees(payload)

        if(followees.length == 0)
        {
            const posts = await getPosts({})
            return posts
        }

        // Default attributes
        let page = 1;
        let per_page = 10;
        let orderby = 'posting_date';
        let ordertype = 'desc';

        const attributes = ["user_id", "posting_date"];
        const ordertypes = ["asc", "desc"];

        binds = {};

        sql = `
        SELECT post_id AS "post_id", user_id AS "user_id", posting_date AS "posting_date",
            description AS "description", image_url AS "image_url"
        FROM Posts
        WHERE post_id > 0 `;

        user_ids = [0]

        for(let followee of followees){
            user_ids.push(followee.followee_id)
        }

        console.log(user_ids)

        sql2 = sql
        sql += `AND user_id IN (${user_ids.join(',')})`
        sql2 += `AND user_id NOT IN (${user_ids.join(',')})`

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

        sql2 += `
            ORDER BY ${orderby} ${ordertype}
            OFFSET :offset ROWS
            FETCH NEXT :per_page ROWS ONLY
        `;

        binds.offset = offset;
        binds.per_page = per_page;

        const result = await db.execute(sql, binds, db.options);
        followed_posts = result.rows;

        console.log(followed_posts)

        non_followed_posts = []

        // In case followed posts aren't enough to populate the feed

        if(followed_posts.length < per_page){

            binds.per_page = per_page - followed_posts.length

            const result2 = await db.execute(sql2, binds, db.options);

            non_followed_posts = result2.rows;
        }

        const posts = followed_posts.concat(non_followed_posts)

        for(let post of posts)
        {

            post_id = post.post_id

            post.user = await getSingleUser({user_id: post.user_id})
            post.comments = await getComments({post_id: post_id})

            sql = `
            SELECT user_id AS "user_id", react_type AS "react_type", reacting_date AS "reacting_date"
            FROM REACTS
            WHERE POST_ID = :post_id
            `
            binds = {
                post_id: post_id
            }

            post.reacts = (await db.execute(sql,binds,db.options)).rows
        }

        return posts
        

    }
    catch(err)
    {
        console.log(err)
        throw err
    }

}

module.exports = {getFeed}