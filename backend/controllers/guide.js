const oracledb = require('oracledb');
const db = require('../db/db');

const getUserIdofGuide = async (payload) => {

    guide_id = payload.guide_id

    const sql = `
    SELECT user_id as "user_id"
    FROM GUIDES
    WHERE guide_id = :guide_id
    `
    const binds = {
        guide_id : guide_id
    }

    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length === 0) {
            console.log('Invalid guide_id');
            return null;
        }
        return result[0];
    } catch (err) {
        console.log(err);
    }

}

module.exports = {getUserIdofGuide}