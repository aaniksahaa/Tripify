const oracledb = require('oracledb')

const db = require('../db/db');

function isNumber(str) {
    return /^\d+(\.\d+)?$/.test(str);
}

const getSqlPaginationAndOrdering = async (payload, ordering_attributes, page, per_page, orderby, ordertype) => {

  const ordertypes = ['asc','desc']

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
        if (ordering_attributes.includes(in_orderby)) {
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

    sql = `
        ORDER BY ${orderby} ${ordertype}
        OFFSET ${offset} ROWS
        FETCH NEXT ${per_page} ROWS ONLY
    `;

    return sql
}

const getRatingInfoFromObject = async (payload) => {
    
    const object_type = payload.object_type
    const object_id = payload.object_id;

    console.log('at getRatingInfoFromObject',object_type,object_id)

    if(!isNumber(object_id))
    {
        return null
    }
    
    sql = `
    SELECT `
    for(let i=1;i<=5;i++)
    {
        sql += `GET_RATING_COUNT(:object_type,${object_id},${i}) AS "rating_${i}", `
    }
    sql += `GET_AVG_RATING(:object_type,${object_id}) AS "rating_avg" FROM DUAL`
    
    const binds = {
      object_type: object_type
    }

    try{
      result = (await db.execute(sql, binds, db.options)).rows;
      if(result.length == 0){
        console.log('Invalid object_id')
        return null
      }
      rating_info = result[0]
      return rating_info;
    }
    catch(err){
      console.log(err)
      throw err;
    }
}

const getImagesFromObject = async (payload) => {
    
    const object_type = payload.object_type
    const object_id = payload.object_id;

    console.log('at getImagesFromObject',object_type,object_id)

    if(!isNumber(object_id))
    {
        return null
    }
    
    sql = `
    SELECT IMAGE_URL as "image_url"
    FROM IMAGECART
    WHERE OBJECT_TYPE = :object_type AND OBJECT_ID = ${object_id}
    `
    
    const binds = {
      object_type: object_type
    }

    try{
      result = (await db.execute(sql, binds, db.options)).rows;
      if(result.length == 0){
        console.log('Invalid object_id')
        return null
      }
      images = []
      for(let i=0;i<result.length;i++)
      {
        images.push(result[i]['image_url'])
      }
      return images;
    }
    catch(err){
      console.log(err)
      throw err;
    }
}

const deleteImagesFromObject = async (payload) => {
    
    const object_type = payload.object_type
    const object_id = payload.object_id;

    console.log('at deleteImagesFromObject',object_type,object_id)

    if(!isNumber(object_id))
    {
        return null
    }
    
    sql = `
    DELETE
    FROM IMAGECART
    WHERE OBJECT_TYPE = :object_type AND OBJECT_ID = ${object_id}
    `
    
    const binds = {
      object_type: object_type
    }

    try{
      await db.execute(sql, binds, db.options);
    }
    catch(err){
      console.log(err)
      throw err;
    }
}

const insertImagesForObject = async (payload) => {
    
    const object_type = payload.object_type
    const object_id = payload.object_id;

    console.log('at insertImagesForObject',object_type,object_id)

    if(!isNumber(object_id))
    {
        return null
    }

    "INSERT INTO ImageCart(image_url, object_type, object_id) VALUES('{url}','restaurant',{restaurant_id});\n"
    
    images = payload.images

    try{
        for(let url of images)
        {
            sql = `INSERT INTO ImageCart(image_url, object_type, object_id)
                VALUES('${url}',:object_type,${object_id})`
            const binds = {
                object_type: object_type
            }
            await db.execute(sql, binds, db.options);
        }
    }
    catch(err){
      console.log(err)
      throw err;
    }
}

module.exports = { getSqlPaginationAndOrdering, getRatingInfoFromObject, getImagesFromObject, deleteImagesFromObject, insertImagesForObject}