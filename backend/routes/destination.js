const express = require('express');
const { validationResult } = require('express-validator');
const {
    getSingleDestination,
    getDestinations,
    createDestination,
    updateDestination,
    deleteDestination,
} = require('../controllers/destination');

const router = express.Router();

router.get('/:destination_id', async (req, res, next) => {
    try {
        const destination = await getSingleDestination(req.params);
        console.log(destination);
        res.json(destination);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req, res, next) => {
    try {
        const destinations = await getDestinations(req.query);
        console.log(destinations);
        res.json(destinations);
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
        const destination = await createDestination(req.body);
        res.json(destination);
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
        const destination = await updateDestination(req.body);
        res.json(destination);
    } catch (error) {
        next(error);
    }
});

router.delete('/:destination_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }
    try {
        const destination = await deleteDestination(req.params);
        res.json(destination);
    } catch (error) {
        next(error);
    }
});

module.exports = router;
