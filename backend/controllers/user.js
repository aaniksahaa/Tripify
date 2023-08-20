const oracledb = require('oracledb');
const db = require('../db/db');
const { getSingleCity } = require('./city');
 
const getHashedPassword = async (password) => {

    console.log('getHashedPassword from ', password )

    sql = `
    BEGIN
         :hashed_password := MY_HASH_PASSWORD(:password);
    END;
    `
    binds = {
        password: password,
        hashed_password: { type: oracledb.STRING, dir: oracledb.BIND_OUT }
    }

    const hash_result = await db.execute(sql, binds, db.options);
    console.log(hash_result)
    const hashed_password = hash_result.outBinds.hashed_password;

    console.log(hashed_password)

    return hashed_password
}

const getSingleUser = async (payload) => {
    //console.log(payload)
    const user_id = payload.user_id;
    console.log("User_id to be fetched = ", user_id);
    const sql = `
    SELECT user_id AS "user_id", username AS "username", email AS "email", role AS "role", name AS "name", bio AS "bio", city_id AS "city_id", facebook_url AS "facebook_url", twitter_url AS "twitter_url", instagram_url AS "instagram_url", profile_picture AS "profile_picture", dob AS "dob", registration_date AS "registration_date", status AS "status"
    , created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Users
    WHERE user_id = :user_id AND deleted_on IS NULL
    `;
    const binds = {
        user_id: user_id
    };
    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        if (result.length == 0) {
            console.log('Invalid user_id');
            return null;
        }
        const user = result[0];
        user.city = await getSingleCity({ city_id: user.city_id });
        return user;
    }
    catch(err) {
        console.log(err);
    }
};

const getSingleUserByUsername = async (payload) => {
    //console.log(payload)
    const username = payload.username;
    console.log("username to be fetched = ", username);
    const sql = `
    SELECT user_id AS "user_id", username AS "username", email AS "email", role AS "role", name AS "name", bio AS "bio", city_id AS "city_id", facebook_url AS "facebook_url", twitter_url AS "twitter_url", instagram_url AS "instagram_url", profile_picture AS "profile_picture", dob AS "dob", registration_date AS "registration_date", status AS "status"
    , created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Users
    WHERE username = :username AND deleted_on IS NULL
    `;
    const binds = {
        username: username
    };
    try {
        const result = (await db.execute(sql, binds, db.options)).rows;
        console.log(result)
        if (result.length == 0) {
            console.log('Invalid username');
            return null;
        }
        const user = result[0];
        user.city = await getSingleCity({ city_id: user.city_id });
        return user;
    }
    catch(err) {
        console.log(err);
    }
};

function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}

const getUsers = async (payload) => {

    console.log(payload);

    // Default attributes
    page = 1;
    per_page = 10;
    orderby = 'user_id';
    ordertype = 'asc';

    const attributes = ["user_id", "role", "name", "city_id", "status"];
    const ordertypes = ["asc", "desc"];

    binds = {};

    sql = `
    SELECT user_id AS "user_id", username AS "username", email AS "email", role AS "role", name AS "name", bio AS "bio", city_id AS "city_id", facebook_url AS "facebook_url", twitter_url AS "twitter_url", instagram_url AS "instagram_url", profile_picture AS "profile_picture", dob AS "dob", registration_date AS "registration_date", status AS "status"
    , created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Users
    WHERE user_id > 0 AND deleted_on IS NULL `;

    if (payload.role !== undefined && payload.role !== '') {
        const role = payload.role.trim().toLowerCase();
        sql += `AND LOWER(ROLE) LIKE '%' || :role || '%' `;
        binds.role = role;
    }
    if (payload.name !== undefined && payload.name !== '') {
        const name = payload.name.trim().toLowerCase();
        sql += `AND LOWER(NAME) LIKE '%' || :name || '%' `;
        binds.name = name;
    }
    if (payload.city_id !== undefined && payload.city_id !== '') {
        // To prevent SQL injection
        ids = payload.city_id.trim().replace(' ', '').split(',');
        console.log(ids);
        actual_ids = [];
        str = "(";
        cnt = 0;
        for (let id of ids) {
            if (isNumber(id)) {
                console.log(id);
                actual_ids.push(id);
                cnt++;
            }
        }
        for (let i = 0; i < cnt; i++) {
            str += actual_ids[i];
            if (i < cnt - 1) {
                str += ',';
            }
        }
        str += ')';
        if (cnt > 0) {
            console.log(str);
            sql += `AND CITY_ID IN ${str} `;
        }
    }
    if (payload.status !== undefined && payload.status !== '') {
        const status = payload.status.trim().toLowerCase();
        if(['active','inactive'].includes(status))
        {
            sql += `AND LOWER(STATUS) = :status `;
            binds.status = status;
        }
    }

    if (payload.min_age !== undefined && payload.min_age !== '') {
        const min_age = parseInt(payload.min_age);
        if (!isNaN(min_age)) {
            sql += `AND FLOOR(MONTHS_BETWEEN(CURRENT_DATE, dob) / 12) >= :min_age `;
            binds.min_age = min_age;
        }
    }

    if (payload.max_age !== undefined && payload.max_age !== '') {
        const max_age = parseInt(payload.max_age);
        if (!isNaN(max_age)) {
            sql += `AND FLOOR(MONTHS_BETWEEN(CURRENT_DATE, dob) / 12) <= :max_age `;
            binds.max_age = max_age;
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
        result = (await db.execute(sql, binds, db.options)).rows;
        return result;
    } catch (err) {
        console.log(err);
    }
};

const createUser = async (payload) => {

    console.log(payload);

    const hashed_password = await getHashedPassword(payload.password);

    sql = `
    DECLARE
        l_id NUMBER;
    BEGIN
        INSERT INTO Users ( username, email, password_hash, name, dob)
        VALUES ( :username, :email, :password_hash, :name, TO_DATE(:dob,'YYYY-MM-DD'))
        RETURNING user_id INTO l_id;
        :user_id := l_id;
    END;
    `;
    binds = {
        username: payload.username,
        email: payload.email,
        password_hash: hashed_password,
        name: payload.name,
        dob: payload.dob,
        user_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }
    };

    try { 
        const result1 = await db.execute(sql, binds, db.options);
        const user_id = result1.outBinds.user_id;
        console.log("Id of inserted user = ", user_id);
        const payload = { user_id: user_id };
        const result = await getSingleUser(payload);
        console.log(result);
        return result;
    }
    catch(err) {
        console.log(err);
    }
};

const updateUser = async (payload) => {

    console.log('updateUser ', payload);

    hashed_password = 'dummy'

    if(payload.password !== undefined)
    {
        hashed_password = await getHashedPassword(payload.password);
    }
    
    sql = `
    UPDATE Users
    SET username = :username,
        email = :email,
        role = :role,
        name = :name,
        bio = :bio,
        city_id = :city_id,
        facebook_url = :facebook_url,
        twitter_url = :twitter_url,
        instagram_url = :instagram_url,
        profile_picture = :profile_picture,
        dob = TO_DATE(:dob,'YYYY-MM-DD'),
        last_updated_on = CURRENT_DATE`
    if(payload.password !== undefined)
    {
        sql += `,
        password_hash = :password_hash
        `
    }
    sql += `
    WHERE user_id = :user_id
    `;
    console.log(payload.user_id)
    binds = {
        user_id: payload.user_id,
        username: payload.username,
        email: payload.email,
        role: payload.role,
        name: payload.name,
        bio: payload.bio,
        city_id: payload.city_id,
        facebook_url: payload.facebook_url,
        twitter_url: payload.twitter_url,
        instagram_url: payload.instagram_url,
        profile_picture: payload.profile_picture,
        dob: payload.dob
    };

    if(payload.password !== undefined)
    {
        binds.password_hash = hashed_password
    }

    user_id = payload.user_id;
    role = payload.role;

    try {
        console.log(sql);
        console.log(binds)
        const result1 = await db.execute(sql, binds, db.options);
        console.log(user_id);

        sql = `
        DELETE FROM GUIDES
        WHERE USER_ID = :user_id
        `
        binds = {
            user_id: user_id
        }
        await db.execute(sql, binds, db.options);

        console.log(role)

        if(role.trim().toLowerCase().includes('guide'))
        {
            console.log('making guide , user_id = ', user_id)
            sql = `
            INSERT INTO GUIDES(user_id)
            VALUES(:user_id)
            `
            binds = {
                user_id: user_id
            }
            await db.execute(sql, binds, db.options);
        }

        const payload = { user_id: user_id };
        const result = await getSingleUser(payload);
        console.log(result);
        return result;
    }
    catch(err) {
        console.log(err);
    }
};

const deleteUser = async (payload) => {
    console.log(payload);
    const sql = `
    UPDATE Users
    SET deleted_on = CURRENT_DATE
    WHERE user_id = :user_id
    `;
    const binds = {
        user_id: payload.user_id
    };
    const user = await getSingleUser(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_user = await getSingleUser(payload);
    if (deleted_user === null) {
        console.log('Successfully Deleted');
    }
    else {
        console.log('Could not be deleted');
    }
    return user;
};

const deleteUserPermanent = async (payload) => {
    console.log(payload);
    const sql = `
    DELETE FROM Users
    WHERE user_id = :user_id
    `;
    const binds = {
        user_id: payload.user_id
    };
    const user = await getSingleUser(payload);
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_user = await getSingleUser(payload);
    if (deleted_user === null) {
        message = { user_id : payload.user_id , status : 'permanently deleted'}
        console.log('Permanently Deleted');
        return message
    }
    else {
        console.log('Could not be deleted');
    }
    return user;
};


const handleFollow = async (payload) => {

    console.log("handleFollow" , payload)

    follower_id = payload.follower_id
    followee_id = payload.followee_id

    sql = `
    INSERT INTO FOLLOWS(follower_id, followee_id)
    VALUES(:follower_id, :followee_id)
    `
    binds = {
        follower_id: follower_id,
        followee_id: followee_id
    }

    await db.execute(sql, binds, db.options);

    sql = `
    SELECT follower_id AS "follower_id", followee_id AS "followee_id", since_date AS "since_date"
    FROM FOLLOWS
    WHERE follower_id = :follower_id AND followee_id = :followee_id   
    `

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

const handleUnFollow = async (payload) => {

    console.log("handleUnFollow" , payload)

    follower_id = payload.follower_id
    followee_id = payload.followee_id

    sql = `
    DELETE FROM FOLLOWS
    WHERE follower_id = :follower_id AND followee_id = :followee_id
    `
    binds = {
        follower_id: follower_id,
        followee_id: followee_id
    }

    await db.execute(sql, binds, db.options);

    sql = `
    SELECT follower_id AS "follower_id", followee_id AS "followee_id", since_date AS "since_date"
    FROM FOLLOWS
    WHERE follower_id = :follower_id AND followee_id = :followee_id   
    `

    result = await db.execute(sql, binds, db.options);

    if(result.rows.length === 0)
    {
        ret = binds 
        ret.message = 'unfollowed'
        return ret
    }
    else
    {
        return null
    }

}

const handleFavorite = async (payload) => {

    console.log("handleFavorite" , payload)

    sql = `
    INSERT INTO FAVORITES(user_id, object_type, object_id)
    VALUES( :user_id, :object_type, :object_id )
    `
    binds = {
        user_id: payload.user_id,
        object_type: payload.object_type,
        object_id: payload.object_id
    }

    try{

        await db.execute(sql, binds, db.options);

        sql = `
        SELECT user_id AS "user_id", object_type AS "object_type", object_id AS "object_id", added_on AS "added_on"
        FROM FAVORITES
        WHERE user_id = :user_id AND object_type = :object_type AND object_id = :object_id   
        `

        result = await db.execute(sql, binds, db.options);

        return result.rows[0]

    }
    catch(err){
        console.log(err)
        throw err;
    }   

}

const handleRemoveFavorite = async (payload) => {

    console.log("handleFavorite" , payload)

    sql = `
    SELECT user_id AS "user_id", object_type AS "object_type", object_id AS "object_id", added_on AS "added_on"
    FROM FAVORITES
    WHERE user_id = :user_id AND object_type = :object_type AND object_id = :object_id   
    `

    sql2 = `
    DELETE FROM FAVORITES
    WHERE user_id = :user_id AND object_type = :object_type AND object_id = :object_id   
    `
    binds = {
        user_id: payload.user_id,
        object_type: payload.object_type,
        object_id: payload.object_id
    }

    try{

        const favorite = (await db.execute(sql, binds, db.options)).rows[0];

        const result = await db.execute(sql2, binds, db.options);

        if(result.rowsAffected > 0){
            console.log('Successfully Deleted')
        }
        else{
            console.log('Could not be deleted')
        }

        return favorite

    }
    catch(err){
        console.log(err)
        throw err;
    }   

}


module.exports = { getSingleUser, getSingleUserByUsername, getUsers, createUser, updateUser, deleteUser, deleteUserPermanent, handleFollow, handleUnFollow, handleFavorite, handleRemoveFavorite };
