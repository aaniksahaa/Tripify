const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleCity, getCities, createCity, updateCity, deleteCity } = require('../controllers/city');
const router = express.Router();

router.get('/:city_id', async (req, res, next) => {
    try {
        const city = await getSingleCity(req.params);
        console.log(city);
        res.json(city);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req,res,next) => {
    try{
        const cities = await getCities(req.query)
        console.log(cities)
        res.json(cities)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.post('/', async (req, res, next) => {
    const result = validationResult(req);
    console.log(req.body);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }
    try {
        const city = await createCity(req.body);
        res.json(city);
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
        const city = await updateCity(req.body);
        res.json(city);
    } catch (error) {
        next(error);
    }
});

router.delete('/:city_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }
    try {
        const city = await deleteCity(req.params);
        res.json(city);
    } catch (error) {
        next(error);
    }
});

module.exports = router;
