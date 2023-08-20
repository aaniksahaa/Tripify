const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleUser } = require('./user');

const getSingleComment = async (payload) => {

    const comment_id = payload.comment_id;

    console.log(comment_id);

    const sql = `
    SELECT comment_id AS "comment_id", user_id AS "user_id", post_id AS "post_id", commenting_date AS "commenting_date", text AS "text", upvote_count AS "upvote_count"
    FROM Comments
    WHERE comment_id = :comment_id
    `;

    const binds = {
        comment_id: comment_id
    };

    try {
        result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length === 0) {
            console.log('Invalid comment_id');
            return null;
        }
        const comment = result[0];
        comment.user = await getSingleUser({ user_id: comment.user_id });
        return comment;
    } catch (err) {
        console.log(err);
    }
};

const getComments = async (payload) => {
    console.log(payload);

    // Default attributes
    page = 1;
    per_page = 10;
    orderby = 'commenting_date';
    ordertype = 'desc';

    const attributes = ["comment_id", "user_id", "post_id", "commenting_date", "text", "upvote_count"];
    const ordertypes = ["asc", "desc"];

    const binds = {};

    sql = `
    SELECT comment_id AS "comment_id", user_id AS "user_id", post_id AS "post_id", commenting_date AS "commenting_date", text AS "text", upvote_count AS "upvote_count"
    FROM Comments
    WHERE comment_id > 0 `;

    if (payload.user_id !== undefined && payload.user_id !== '') {
        user_id = parseInt(payload.user_id);
        if (!isNaN(user_id)) {
            sql += `AND user_id = :user_id `;
            binds.user_id = user_id;
        }
    }

    if (payload.post_id !== undefined && payload.post_id !== '') {
        post_id = parseInt(payload.post_id);
        if (!isNaN(post_id)) {
            sql += `AND post_id = :post_id `;
            binds.post_id = post_id;
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
        comments_result = (await db.execute(sql, binds, db.options)).rows;
        for (let comment of comments_result) {
            comment.user = await getSingleUser({ user_id: comment.user_id });
        }
        console.log(comments_result)
        return comments_result;
    } catch (err) {
        console.log(err);
    }
};

const createComment = async (payload) => {
    console.log(payload);
    sql = `
    DECLARE
        l_id NUMBER;
    BEGIN
        INSERT INTO Comments (user_id, post_id, text)
        VALUES (:user_id, :post_id, :text)
        RETURNING comment_id INTO l_id;
        :comment_id := l_id;
    END;
    `;
    binds = {
        user_id: payload.user_id,
        post_id: payload.post_id,
        text: payload.text,
        comment_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };

    try {
        const result1 = await db.execute(sql, binds, db.options);
        const comment_id = result1.outBinds.comment_id;
        console.log("Id of inserted comment = ", comment_id);

        const payload = { comment_id: comment_id };
        const result = await getSingleComment(payload);
        console.log(result);
        return result; 
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const updateComment = async (payload) => {
    console.log(payload);
    if (payload.comment_id === undefined) {
        console.log('Comment id not given in req.body');
        return null;
    }
    const sql = `
    UPDATE Comments
    SET text = :text
    WHERE comment_id = :comment_id
    `;
    const binds = {
        comment_id: payload.comment_id,
        text: payload.text
    };

    comment_id = payload.comment_id

    try {
        console.log(sql);
        const result1 = await db.execute(sql, binds, db.options);
        console.log(comment_id);
        const payload = { comment_id: comment_id };
        const result = await getSingleComment(payload);
        console.log(result);
        return result;
    } catch (err) {
        console.log(err);
        next(err);
    }
};

const deleteComment = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM Comments
    WHERE comment_id = :comment_id
    `;
    const binds = {
        comment_id: payload.comment_id
    };
    const comment = await getSingleComment(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);

    if (result1 !== undefined && result1.rowsAffected > 0) {
        console.log('Successfully Deleted');
    } else {
        console.log('Could not be deleted');
    }
    return comment;
};

module.exports = { getSingleComment, getComments, createComment, updateComment, deleteComment };
