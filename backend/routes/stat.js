const express = require('express');
const { getStat, getPriceDistribution } = require('../controllers/stat');
const router = express.Router();

router.get('/', async (req,res,next) => {
    try{
        const stat = await getStat(req.query);
        console.log(stat)
        res.json(stat)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.get('/prices', async (req,res,next) => {
    try{
        const price_distribution = await getPriceDistribution(req.query);
        console.log(price_distribution)
        res.json(price_distribution)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

module.exports = router;