const router = require('express').Router()
const { body, validationResult } = require('express-validator')
const { getChat } = require('../controllers/chat')

router.get('/', async (req,res,next) => {
    console.log(req.query)
    try{
        const response = await getChat(req.query)
        console.log(response)
        res.json(response)
    }
    catch(err){
        next(err)
    }
})

module.exports = router