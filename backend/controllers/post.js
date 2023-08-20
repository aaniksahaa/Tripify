const oracledb = require('oracledb')
const db = require('../db/db');
const { getComments } = require('./comment');

const getSinglePost = async (payload) => {

    console.log('getSinglePost', payload)

    const post_id = payload.post_id;

    const sql = `
        SELECT post_id AS "post_id", user_id AS "user_id", posting_date AS "posting_date",
            description AS "description", image_url AS "image_url"
        FROM Posts 
        WHERE post_id = :post_id
    `;

    const binds = {
        post_id: post_id
    };

    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        if(result.length == 0){
            return null
        } 
        return result[0];
    } catch (err) {
        console.log(err);
        throw err
    }
};

const getSinglePostDetails = async (payload) => {

    console.log('getSinglePostDetails', payload)

    const post_id = payload.post_id;

    try {
        const post = await getSinglePost({post_id: post_id})
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
        return post;
    } catch (err) {
        console.log(err);
        throw err
    }
};

const getPosts = async (payload) => {

    console.log('getPosts', payload)

    // Default attributes
    let page = 1;
    let per_page = 10;
    let orderby = 'posting_date';
    let ordertype = 'desc';

    const attributes = ["user_id", "posting_date"];
    const ordertypes = ["asc", "desc"];

    binds = {};

    let sql = `
        SELECT post_id AS "post_id", user_id AS "user_id", posting_date AS "posting_date",
            description AS "description", image_url AS "image_url"
        FROM Posts
        WHERE post_id > 0 `;

    if (payload.user_id !== undefined && payload.user_id !== '') {
        const user_id = parseInt(payload.user_id);
        if (!isNaN(user_id)) {
        sql += `AND user_id = :user_id `;
        binds.user_id = user_id;
        }
    }

    if (payload.posting_date !== undefined && payload.posting_date !== '') {
        const posting_date = new Date(payload.posting_date);
        if (!isNaN(posting_date)) {
        sql += `AND posting_date >= :posting_date `;
        binds.posting_date = new Date(posting_date);
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
        const result = await db.execute(sql, binds, db.options);
        posts = result.rows;

        for(let post of posts)
        {

            post_id = post.post_id

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

    } catch (err) {
        console.log(err);
        throw err;
    }
};

const createPost = async (payload) => {

    console.log('createPost', payload)

    const sql = `
        DECLARE
        l_id NUMBER;
        BEGIN
        INSERT INTO Posts (user_id, description, image_url)
        VALUES (:user_id, :description, :image_url)
        RETURNING post_id INTO l_id;
        :post_id := l_id;
        END;
    `;

    const binds = {
        user_id: payload.user_id,
        description: payload.description,
        image_url: payload.image_url,
        post_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };

    try {
        const result1 = await db.execute(sql, binds, db.options);
        const post_id = result1.outBinds.post_id;
        console.log("Id of inserted post = ", post_id);

        const payload = { post_id: post_id };
        const result = await getSinglePost(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

const updatePost = async (payload) => {

    const sql = `
    UPDATE Posts
    SET description = :description,
        image_url = :image_url
    WHERE post_id = :post_id
    `;

    const binds = {
        post_id: payload.post_id,
        description: payload.description,
        image_url: payload.image_url
    };

    post_id = payload.post_id

    try {
        const result1 = await db.execute(sql, binds, db.options);
        console.log(post_id);
        const payload = { post_id: post_id };
        const result = await getSinglePost(payload);
        console.log(result);
        return result;
    } catch (err) { 
        console.log(err);
        throw err;
    }
};
  
const deletePost = async (payload) => {
    const sql = `
        DELETE FROM Posts
        WHERE post_id = :post_id
    `;
    const binds = {
        post_id: payload.post_id
    };
    const post = await getSinglePost(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_post = await getSinglePost(payload);
    if (deleted_post === null) {
        console.log('Successfully Deleted');
    } else {
        console.log('Could not be deleted');
    }
    return post;
};

const handleReact = async (payload) => {

    console.log("handleReact" , payload)

    sql = `
    DELETE FROM REACTS
    WHERE user_id = :user_id AND post_id = :post_id
    `
    binds = {
        post_id: payload.post_id,
        user_id: payload.user_id
    }
    // removing previous react
    await db.execute(sql, binds, db.options);

    sql = `
    INSERT INTO REACTS(post_id, user_id, react_type)
    VALUES(:post_id, :user_id, :react_type )
    `
    binds = {
        post_id: payload.post_id,
        user_id: payload.user_id,
        react_type: payload.react_type
    }

    try{

        await db.execute(sql, binds, db.options);

        sql = `
        SELECT user_id AS "user_id", post_id AS "post_id", react_type AS "react_type", reacting_date as "reacting_date"
        FROM REACTS
        WHERE user_id = :user_id AND post_id = :post_id
        `
        binds = {
            post_id: payload.post_id,
            user_id: payload.user_id
        }

        result = await db.execute(sql, binds, db.options);

        if(result)
        {
            return result.rows[0]
        }
        else
        {
            return null
        }

    }
    catch(err){
        console.log(err)
        throw(err)
    }

}

const handleRemoveReact = async (payload) => {

    console.log("handleRemoveReact" , payload)

    sql = `
    SELECT user_id AS "user_id", post_id AS "post_id", react_type AS "react_type", reacting_date as "reacting_date"
    FROM REACTS
    WHERE user_id = :user_id AND post_id = :post_id
    `
    binds = {
        post_id: payload.post_id,
        user_id: payload.user_id
    }

    try{

        result = await db.execute(sql, binds, db.options);

        sql = `
        DELETE FROM REACTS
        WHERE user_id = :user_id AND post_id = :post_id
        `
        binds = {
            post_id: payload.post_id,
            user_id: payload.user_id
        }
        // removing the react
        await db.execute(sql, binds, db.options);

        if(result)
        {
            return result.rows[0]
        }
        else
        {
            return null
        }

    }
    catch(err){
        console.log(err)
        throw(err)
    }

}


module.exports = { getSinglePost, getSinglePostDetails, getPosts, createPost, updatePost, deletePost, handleReact, handleRemoveReact };

