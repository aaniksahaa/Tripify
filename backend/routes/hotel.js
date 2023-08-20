const express = require('express');
const { validationResult } = require('express-validator')
const { getSingleHotel, getHotels, createHotel, updateHotel, deleteHotel } = require('../controllers/hotel');
const router = express.Router();

router.get('/:hotel_id', async (req,res,next) => {
    try{
        const hotel = await getSingleHotel(req.params)
        console.log(hotel)
        res.json(hotel)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.get('/', async (req,res,next) => {
    try{
        const hotels = await getHotels(req.query)
        console.log(hotels)
        res.json(hotels)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.post('/', async (req, res, next) => {
    const result = validationResult(req)
    console.log(req.body)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }
    try { 
        req.body.creator_user_id = req.user ? req.user.user_id : 1;
        const hotel = await createHotel(req.body)
        res.json(hotel)
    }
    catch(error) {
        console.log(error)
        next(error)
    }
})

router.put('/', async (req,res,next) => {
    const result = validationResult(req)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }
    try {
        const hotel = await updateHotel(req.body)
        res.json(hotel);
    }
    catch(error) {
        console.log(error)
        next(error)
    }
})

router.delete('/:hotel_id', async(req, res, next)=> {
    const result = validationResult(req)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }
    try {
        const hotel = await deleteHotel(req.params)
        res.json(hotel)
    }
    catch(error) {
        console.log(error)
        next(error)
    }
})

module.exports = router;