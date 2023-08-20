const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleFlight, getFlights, createFlight, updateFlight, deleteFlight } = require('../controllers/flight');

const router = express.Router();

router.get('/:flight_id', async (req, res, next) => {
  try {
    const flight = await getSingleFlight(req.params);
    console.log(flight);
    res.json(flight);
  } catch (err) {
    console.log(err);
    next(err);
  }
});

router.get('/', async (req, res, next) => {
  try {
    const flights = await getFlights(req.query);
    console.log(flights);
    res.json(flights);
  } catch (err) {
    console.log(err);
    next(err);
  }
});

router.post('/', async (req, res, next) => {
  const result = validationResult(req);
  console.log(req.body);
  if (result.isEmpty() === false) {
    return res.send({ errors: result.array() });
  }
  try {
    req.body.creator_user_id = req.user ? req.user.user_id : 1;
    const flight = await createFlight(req.body);
    res.json(flight);
  } catch (error) {
    next(error);
  }
});

router.put('/', async (req, res, next) => {
  const result = validationResult(req);
  if (result.isEmpty() === false) {
    return res.send({ errors: result.array() });
  }
  try {
    const flight = await updateFlight(req.body);
    res.json(flight);
  } catch (error) {
    next(error);
  }
});

router.delete('/:flight_id', async (req, res, next) => {
  const result = validationResult(req);
  if (result.isEmpty() === false) {
    return res.send({ errors: result.array() });
  }
  try {
    const flight = await deleteFlight(req.params);
    res.json(flight);
  } catch (error) {
    next(error);
  }
});

module.exports = router;
