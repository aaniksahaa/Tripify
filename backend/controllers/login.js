const oracledb = require('oracledb');
const db = require('../db/db');

const jwt = require('jsonwebtoken');
const { getSingleUserByUsername } = require('./user');

const getToken = async (payload) => {

    console.log('login.js getToken',payload)

    sql = `
    BEGIN
        :is_valid_credentials := CHECK_CREDENTIALS( :username, :password );
    END;
    `
    binds = {
        username: payload.username,
        password: payload.password,
        is_valid_credentials: { type: oracledb.STRING, dir: oracledb.BIND_OUT }
    }

    const result = await db.execute(sql, binds, db.options);
    console.log(result)
    const is_valid_credentials = result.outBinds.is_valid_credentials;

    console.log(is_valid_credentials)

    if(is_valid_credentials === 0) return null   
    
    const user = await getSingleUserByUsername({ username : payload.username })

    const accessToken = jwt.sign({ username: payload.username, id: user.user_id }, process.env.SECRET);
    return {user,accessToken}
}
module.exports = {getToken}