const router = require('express').Router()
const { body, validationResult } = require('express-validator')
const { getTripSuggestion, getGeneralChatResponse } = require('../controllers/chat')

router.get('/general', async (req,res,next) => {
    console.log(req.query)
    try{
        const response = await getGeneralChatResponse(req.query)
        console.log(response)
        res.json(response)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.get('/trip-suggestion', async (req,res,next) => {
    console.log(req.query)
    try{
        const response = await getTripSuggestion(req.query)
        console.log(response)
        res.json(response)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

module.exports = router