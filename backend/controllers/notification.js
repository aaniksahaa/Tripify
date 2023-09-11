const oracledb = require('oracledb');
const db = require('../db/db');
const { getSqlPaginationAndOrdering } = require('./global_helpers');

const getNotifications = async (payload) => {

    console.log('getNotifications', payload)

    let page = 1;
    let per_page = 10;
    let orderby = 'notifying_date';
    let ordertype = 'desc';

    const attributes = ["user_id", "notifying_date"];
    const ordertypes = ["asc", "desc"];

    binds = {};

    let sql = `
    SELECT NOTIFICATION_ID AS "notification_id", USER_ID AS "user_id", NOTIFYING_DATE AS "notifying_date", TEXT AS "text", IS_READ AS "is_read"
    FROM NOTIFICATIONS
    WHERE NOTIFICATION_ID > 0 `;

    let sql2 = `
    UPDATE NOTIFICATIONS
    SET IS_READ = 1
    WHERE NOTIFICATION_ID > 0 `

    if (payload.user_id !== undefined && payload.user_id !== '') {
        const user_id = parseInt(payload.user_id);
        if (!isNaN(user_id)) {
        sql += `AND user_id = :user_id `;
        sql2 += `AND user_id = :user_id `;
        binds.user_id = user_id;
        }
    }

    if (payload.notifying_date !== undefined && payload.notifying_date !== '') {
        const notifying_date = new Date(payload.notifying_date);
        if (!isNaN(notifying_date)) {
        sql += `AND notifying_date >= :notifying_date `;
        sql2 += `AND notifying_date >= :notifying_date `;
        binds.notifying_date = new Date(notifying_date);
        }
    }

    if(payload.is_read !== undefined && payload.is_read !== ''){
        is_read = parseInt(payload.is_read)
        if(!isNaN(is_read) && (is_read == 0 || is_read == 1)){
            sql += `AND is_read = ${is_read} `
        }
    }

    sql += await getSqlPaginationAndOrdering(payload, attributes, page, per_page, orderby, ordertype)

    try {
        //console.log(sql)
        const result = await db.execute(sql, binds, db.options);
        notifications = result.rows;

        await db.execute(sql2, binds, db.options);

        return notifications;

    } catch (err) {
        console.log(err);
        throw err;
    }
};

module.exports = {getNotifications}