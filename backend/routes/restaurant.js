const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleRestaurant, getRestaurants, createRestaurant, updateRestaurant, deleteRestaurant } = require('../controllers/restaurant');
const router = express.Router();

router.get('/:restaurant_id', async (req, res, next) => {
    try {
        const restaurant = await getSingleRestaurant(req.params);
        console.log(restaurant);
        res.json(restaurant);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req, res, next) => {
    try {
        const restaurants = await getRestaurants(req.query);
        //console.log(restaurants);
        res.json(restaurants);
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
        const restaurant = await createRestaurant(req.body);
        res.json(restaurant);
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
        const restaurant = await updateRestaurant(req.body);
        res.json(restaurant);
    } catch (error) {
        next(error);
    }
});

router.delete('/:restaurant_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }
    try {
        const restaurant = await deleteRestaurant(req.params);
        res.json(restaurant);
    } catch (error) {
        next(error);
    }
});

module.exports = router;
