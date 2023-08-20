const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleCity } = require('./city');
const db = require('../db/db');
const router = express.Router();

const getSingleFlight = async (payload) => {

  const flight_id = payload.flight_id;

  console.log(flight_id);

  const sql = `
    SELECT flight_id AS "flight_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id",
    airline_name AS "airline_name", departure_date AS "departure_date", return_date AS "return_date",
    price AS "price", seat_class AS "seat_class", flight_duration AS "flight_duration",
    booking_url AS "booking_url"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Flights
    WHERE flight_id = :flight_id
  `;

  const binds = {
    flight_id: flight_id,
  };

  try {
    result = (await db.execute(sql, binds, db.options)).rows;
    if (result.length == 0) {
      console.log('Invalid flight_id');
      return null;
    }
    flight = result[0];
    flight.from_city = await getSingleCity({ city_id: flight.from_city_id });
    flight.to_city = await getSingleCity({ city_id: flight.to_city_id });
    return flight;
  } catch (err) {
    console.log(err);
  }
};

function isNumber(str) {
  return /^\d+(\.\d+)?$/.test(str);
}

const getFlights = async (payload) => {
  console.log(payload);

  // default attributes
  page = 1;
  per_page = 10;
  orderby = 'flight_id';
  ordertype = 'asc';

  const attributes = [
    'flight_id',
    'from_city_id',
    'to_city_id',
    'airline_name',
    'departure_date',
    'return_date',
    'price',
    'seat_class',
    'flight_duration',
    'booking_url',
    'created_on',
    'last_updated_on',
  ];
  const ordertypes = ['asc', 'desc'];

  binds = {};

  sql = `
    SELECT flight_id AS "flight_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id",
    airline_name AS "airline_name", departure_date AS "departure_date", return_date AS "return_date",
    price AS "price", seat_class AS "seat_class", flight_duration AS "flight_duration",
    booking_url AS "booking_url"
    , creator_user_id AS "creator_user_id", created_on AS "created_on", last_updated_on AS "last_updated_on"
    FROM Flights
    WHERE flight_id > 0
  `;

  if (payload.from_city_id !== undefined && payload.from_city_id !== '') {
    // to prevent sql injection
    ids = payload.from_city_id.trim().replace(' ', '').split(',');
    console.log(ids);
    actual_ids = [];
    str = '(';
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
      sql += `AND FROM_CITY_ID IN ${str} `;
    }
  }

  if (payload.to_city_id !== undefined && payload.to_city_id !== '') {
    // to prevent sql injection
    ids = payload.to_city_id.trim().replace(' ', '').split(',');
    console.log(ids);
    actual_ids = [];
    str = '(';
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
      sql += `AND TO_CITY_ID IN ${str} `;
    }
  }

  if (payload.airline_name !== undefined && payload.airline_name !== '') {
    const airline_name = payload.airline_name.trim().toLowerCase();
    sql += `AND LOWER(AIRLINE_NAME) LIKE '%' || :airline_name || '%' `;
    binds.airline_name = airline_name;
  }

  if (payload.min_price !== undefined && payload.min_price !== '') {
    min_price = parseInt(payload.min_price);
    if (!isNaN(min_price)) {
      sql += `AND PRICE >= :min_price `;
      binds.min_price = min_price;
    }
  }

  if (payload.max_price !== undefined && payload.max_price !== '') {
    max_price = parseInt(payload.max_price);
    if (!isNaN(max_price)) {
      sql += `AND PRICE <= :max_price `;
      binds.max_price = max_price;
    }
  }

  if (payload.seat_class !== undefined && payload.seat_class !== '') {
    const seat_class = payload.seat_class.trim().toLowerCase();
    sql += `AND LOWER(SEAT_CLASS) = :seat_class `;
    binds.seat_class = seat_class;
  }

  if (payload.min_duration !== undefined && payload.min_duration !== '') {
    min_flight_duration = parseInt(payload.min_duration);
    if (!isNaN(min_flight_duration)) {
      sql += `AND FLIGHT_DURATION >= :min_flight_duration `;
      binds.min_flight_duration = min_flight_duration;
    }
  }

  if (payload.max_duration !== undefined && payload.max_duration !== '') {
    max_flight_duration = parseInt(payload.max_duration);
    if (!isNaN(max_flight_duration)) {
      sql += `AND FLIGHT_DURATION <= :max_flight_duration `;
      binds.max_flight_duration = max_flight_duration;
    }
  }

  if (payload.departure_date !== undefined && payload.departure_date !== '') {
    const departure_date = new Date(payload.departure_date);
    if (!isNaN(departure_date.getTime())) {
      sql += `AND DEPARTURE_DATE >= :departure_date `;
      binds.departure_date = departure_date;
    }
  }

  if (payload.return_date !== undefined && payload.return_date !== '') {
    const return_date = new Date(payload.return_date);
    if (!isNaN(return_date.getTime())) {
      sql += `AND RETURN_DATE <= :return_date `;
      binds.return_date = return_date;
    }
  }

  if (payload.creator_user_id !== undefined && payload.creator_user_id !== '') {
    const creator_user_id = parseInt(payload.creator_user_id);
    if (!isNaN(creator_user_id)) {
      sql += `AND CREATOR_USER_ID = :creator_user_id `;
      binds.creator_user_id = creator_user_id;
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
    FETCH NEXT :per_page ROWS ONLY
  `;

  binds.offset = offset;
  binds.per_page = per_page;

  try {
    console.log(sql);
    result = (await db.execute(sql, binds, db.options)).rows;
    for (let flight of result) {
      flight.from_city = await getSingleCity({ city_id: flight.from_city_id });
      flight.to_city = await getSingleCity({ city_id: flight.to_city_id });
    }
    return result;
  } catch (err) {
    console.log(err);
  }
};

const createFlight = async (payload) => {
  console.log(payload);
  const sql = `
    DECLARE
      l_id NUMBER;
    BEGIN
      INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price,
        seat_class, flight_duration, booking_url, creator_user_id)
      VALUES (:from_city_id, :to_city_id, :airline_name, :departure_date, :return_date, :price,
        :seat_class, :flight_duration, :booking_url, :creator_user_id)
      RETURNING flight_id INTO l_id;
      :flight_id := l_id;
    END;
  `;

  const binds = {
    from_city_id: payload.from_city_id,
    to_city_id: payload.to_city_id,
    airline_name: payload.airline_name,
    departure_date: new Date(payload.departure_date),
    return_date: new Date(payload.return_date),
    price: payload.price,
    seat_class: payload.seat_class,
    flight_duration: payload.flight_duration,
    booking_url: payload.booking_url,
    creator_user_id: payload.creator_user_id,
    flight_id: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT },
  };

  try {
    const result1 = await db.execute(sql, binds, db.options);
    const flight_id = result1.outBinds.flight_id;
    console.log('Id of inserted flight = ', flight_id);
    const payload = { flight_id: flight_id };
    const result = await getSingleFlight(payload);
    console.log(result);
    return result;
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const updateFlight = async (payload) => {
  console.log(payload);
  if (payload.flight_id === undefined) {
    console.log('Flight id not given in req.body');
    return null;
  }

  const sql = `
    UPDATE Flights
    SET from_city_id = :from_city_id,
      to_city_id = :to_city_id,
      airline_name = :airline_name,
      departure_date = :departure_date,
      return_date = :return_date,
      price = :price,
      seat_class = :seat_class,
      flight_duration = :flight_duration,
      booking_url = :booking_url,
      last_updated_on = CURRENT_DATE
    WHERE flight_id = :flight_id
  `;

  const binds = {
    flight_id: payload.flight_id,
    from_city_id: payload.from_city_id,
    to_city_id: payload.to_city_id,
    airline_name: payload.airline_name,
    departure_date: payload.departure_date,
    return_date: payload.return_date,
    price: payload.price,
    seat_class: payload.seat_class,
    flight_duration: payload.flight_duration,
    booking_url: payload.booking_url,
  };

  flight_id = payload.flight_id;

  try {
    console.log(sql);
    const result1 = await db.execute(sql, binds, db.options);
    console.log(flight_id);
    const payload = { flight_id: flight_id };
    const result = await getSingleFlight(payload);
    console.log(result);
    return result;
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const deleteFlight = async (payload) => {
  console.log(payload);
  const sql = `
    DELETE FROM Flights
    WHERE flight_id = :flight_id
  `;

  const binds = {
    flight_id: payload.flight_id,
  };

  const flight = await getSingleFlight(payload);
  console.log(sql);
  const result1 = await db.execute(sql, binds, db.options);
  const deleted_flight = await getSingleFlight(payload);
  if (deleted_flight === null) {
    console.log('Successfully Deleted');
  } else {
    console.log('Could not be deleted');
  }
  return flight;
};

module.exports = { getSingleFlight, getFlights, createFlight, updateFlight, deleteFlight };
