const express = require('express');
const { getStatHotels } = require('../controllers/stat');
const router = express.Router();

router.get('/hotel', async (req,res,next) => {
    try{
        const stat = await getStatHotels();
        res.json(stat)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

module.exports = router;