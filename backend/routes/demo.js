const express = require('express');
const router = express.Router();
const { getDemo } = require('../controllers/demo')

router.get('/', async (req,res,next) => {
    try{
        data = await getDemo(req.body)
        console.log(data)
        res.json(data)
    }
    catch(err){
        console.log(err)
    }
})

module.exports = router;